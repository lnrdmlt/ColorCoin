"""Create 100 svg files with with different hues"""

for i in range(360):
    with open(f"{i}.svg", "w", encoding="utf-8") as f:
        f.write(
            f"""<svg
    width="200"
    height="300"
    xmlns="http://www.w3.org/2000/svg">
        <rect width="200" height="300" x="0" y="0" fill="hsl({i}, 30%, 70%)" />
</svg>"""
        )
