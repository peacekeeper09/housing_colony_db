import tkinter as tk
import mysql.connector
from tkinter import ttk

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="PEACE12345@",
  database="housing_colony"
)

mycursor = mydb.cursor()


root = tk.Tk()
root.title("Database GUI")


mycursor.execute("SHOW TABLES")
tables = mycursor.fetchall()


table_label = tk.Label(root, text="Select Table:")
table_label.pack(pady=10)


table_var = tk.StringVar(root)
table_dropdown = ttk.Combobox(root, textvariable=table_var, values=tables)
table_dropdown.pack(pady=10)


def show_table():
    # Clear the previous table (if any)
    for widget in root.winfo_children():
        if isinstance(widget, tk.Frame):
            widget.destroy()
    

    table_name = table_var.get()
    

    mycursor.execute("SELECT * FROM {}".format(table_name))
    rows = mycursor.fetchall()
    

    mycursor.execute("SHOW COLUMNS FROM {}".format(table_name))
    columns = mycursor.fetchall()
    column_names = [column[0] for column in columns]
    

    table_frame = tk.Frame(root)
    table_frame.pack(pady=10)
    

    for i, column_name in enumerate(column_names):
        header_label = tk.Label(table_frame, text=column_name, font="bold")
        header_label.grid(row=0, column=i, padx=5, pady=5)
    

    for i, row in enumerate(rows):
        for j, value in enumerate(row):
            cell_label = tk.Label(table_frame, text=value)
            cell_label.grid(row=i+1, column=j, padx=5, pady=5)
    

show_table_button = tk.Button(root, text="Show Table", command=show_table)
show_table_button.pack()

root.mainloop()
