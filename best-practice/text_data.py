import pandas as pd

product_category = "A"
print("This item is from product category: '%s'." % product_category)

quantities = [500, 600]
print("We currently have %d available units of this item." % quantities[0])

stock_share_price_list = [40.50, 60.35]
print("The stock costs $%.2f per share." % stock_share_price_list[1])

s = "Price per unit"
s1 = s.replace("Price", "Cost")
print(s1)
print(s1.startswith("Cost"))

s2 = "Mr. John Doe"
print(s2.upper())
print(s2.lower())
print(s2.title())

operational_kpis = pd.Series(["employee satisfaction rating", "employee churn rate"])
print(operational_kpis)
print(operational_kpis.str.lstrip("employee "))
house_prices = pd.Series(["$400,000", "$500,000", "$600,000"])
print(house_prices.str.contains("$"))
