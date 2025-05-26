Summary of Netflix Dataset Analysis Project
Objective
The project aimed to analyze the Netflix dataset to uncover insights about content distribution, ratings, directors, actors, and production trends over the years.

Dataset Overview
Source: netflix_titles.csv containing 8,807 entries and 12 columns.

Columns:
show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description.

Key Findings
Content Types

Movies: Dominated the dataset with significantly higher counts compared to TV shows.

TV Shows: Represented a smaller portion of the content.

Missing Values

Directors: 2,634 missing entries (replaced with "director not found").

Cast: 825 missing entries (replaced with "No cast specified").

Country: 831 missing entries.

Ratings Distribution

Most Common Ratings:

TV-MA (3,207 titles)

TV-14 (2,160 titles)

R (799 titles)

Visualization: Pie chart highlighted the dominance of mature-rated content.

Top Directors

Rajiv Chilaka, Jan Suter, Raúl Campos, and Suhas Kadav were among the top directors with the most content.

Visualization: Bar chart displayed the top 5 directors (excluding missing entries).

Top Actors

Anupam Kher, Rupa Bhimani, Takahiro Sakurai, and Julie Tejwani were the most frequent actors.

Visualization: Horizontal bar chart showcased the top 5 actors.

Production Trends (2000–2021)

Movies: Peaked in 2017–2018 (~767 titles/year), then declined.

TV Shows: Steady growth, peaking in 2020 (436 titles).

Visualization: Line graph illustrated the trend for both content types.

Duration Analysis

Movies: Typically measured in minutes (e.g., "90 min").

TV Shows: Measured in seasons (e.g., "2 Seasons").

Visualizations
Pie Chart: Ratings distribution.

Bar Charts: Top directors and actors.

Line Graph: Content production trends over time.

Count Plot: Movies vs. TV shows comparison.

Tools Used
Python Libraries:

pandas for data manipulation.

plotly.express and seaborn for visualizations.

matplotlib for additional plotting.

Conclusion
The analysis revealed Netflix's strong focus on movies, particularly mature-rated content, with increasing investment in TV shows in recent years. The dataset also highlighted gaps in metadata (e.g., missing director/cast information) and showcased key contributors like Rajiv Chilaka and Anupam Kher. Trends suggest a shift toward TV shows post-2015, likely reflecting changing viewer preferences.

Recommendations:

Address missing data for deeper insights.

Explore genre-specific trends (listed_in column) for targeted content strategy.

Investigate the decline in movie productions post-2018.

Project Impact: Provides actionable insights for content strategists and data-driven decision-making at Netflix.
