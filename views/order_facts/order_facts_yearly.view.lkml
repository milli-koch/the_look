view: order_facts_yearly {
  derived_table: {
    sql: select extract(year from created_at) as time
    from demo_db.orders
    group by 1;;
    datagroup_trigger: the_look_default_datagroup
    indexes: ["time"]
  }
}
