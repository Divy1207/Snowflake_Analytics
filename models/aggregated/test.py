def model(dbt, session):
    dbt.config(materialized="table")
    
    orders_df = dbt.source("analytics", "orders")
    
    from snowflake.snowpark.functions import when, col

    orders_df = orders_df.withColumn(
        "order_status",
        when(col("o_orderstatus") == "P", "Pending")
        .when(col("o_orderstatus") == "O", "Completed")
        .when(col("o_orderstatus") == "F", "Failed")
        .otherwise("Unknown")
    )

    result_df = orders_df.groupBy("order_status").count().withColumnRenamed("count", "total_status_count")

    return result_df
