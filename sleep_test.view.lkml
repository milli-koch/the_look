view: sleep_test {
  derived_table: {
    sql: select sleep(700) as sleep ;;
  }

  dimension: sleep {}
}
