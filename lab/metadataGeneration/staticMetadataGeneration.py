for i in range(100):
    with open(f"build/{i + 1}.json", "w") as _file:
        _file.write(
            f"""{{
    "name": "ColorCoin #{ i + 1 }",
    "description": "Unique NFTs with color-changing system with every trade. ", 
    "image": ""  
}}"""
        )
