"""Create 100 metadata json files with custom names"""

for i in range(100):
    with open(f"{i + 1}.json", "w", encoding="utf-8") as _file:
        _file.write(
            f"""{{
    "name": "ColorCoin #{ i + 1 }",
    "description": "Unique NFTs with color-changing system with every trade. ",
    "image": ""
}}"""
        )
