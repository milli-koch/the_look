- dashboard: daf
  title: daf
  layout: newspaper
  elements:
  - name: adf
    title: adf
    merged_queries:
    - model: thelook
      explore: order_items
      type: table
      fields: [order_items.id, order_items.total_sale_price]
      sorts: [order_items.total_sale_price desc]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
    - model: thelook
      explore: order_items
      type: table
      fields: [order_items.id, order_items.count]
      sorts: [order_items.count desc]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: order_items.id
        source_field_name: order_items.id
    type: table
    total: true
    row: 0
    col: 0
    width: 16
    height: 9
