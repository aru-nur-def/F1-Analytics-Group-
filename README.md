Company - F1 Analytics Group

F1 Analytics Group — аналитическая компания, специализирующаяся на спортивной статистике и визуализации данных.  
Наша цель — раскрывать ключевые тенденции в Формуле 1 и предоставлять инсайты для команд, медиа и фанатов.

Project Overview
Этот проект посвящён анализу исторических данных Формулы 1 за период с 1950 по 2020 год.  
Основные направления аналитики: Количество гонок и участников по сезонам, победы пилотов и конструкторов, рейтинг и эффективность команд, влияние автодромов на результаты гонок, динамика развития чемпионата.

Он содержит 14 связанных таблиц:
- 'drivers' — гонщики (имена, национальности, даты рождения);
- 'races' — гонки (сезоны, даты, место проведения);
- 'results' — результаты гонок (позиции пилотов, очки, статусы);
- 'constructors' — команды (названия, национальности);
- 'constructor_results' — результаты команд;
- 'constructor_standings' — итоговые таблицы конструкторов;
- 'driver_standings' — итоговые таблицы пилотов;
- 'lap_times' — времена прохождения кругов;
- 'pit_stops' — данные о пит-стопах;
- 'circuits' — автодромы (локация, страна);
- 'status' — причины схода из гонки;
- 'qualifying' — квалификационные результаты;
- 'sprint_results' — результаты спринтов;
- 'seasons' — список сезонов.
<img width="404" height="439" alt="image" src="https://github.com/user-attachments/assets/43049de6-36c4-4d7e-86f3-c903e58d8ef8" />

Общий размер: 703 451 строк.

Tools & Resources
MySQL — база данных;
Python (pandas, mysql-connector, SQLAlchemy) — выполнение запросов и анализ;
Apache Superset — визуализация аналитики;
GitHub — хранение кода и документации.

Instructions
   bash
   git clone https://github.com/aru-nur-def/F1-Analytics-Group-.git
   Dataset
   Используемый датасет: [Formula 1 World Championship (1950–2020)] (https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020).




