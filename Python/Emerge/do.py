# coding=utf-8
# Originally developed by AquarHEAD, licensed under Creative Commons BY-NC-SA 3.0, visit http://creativecommons.org/licenses/by-nc-sa/3.0/
# any questions, ideas, please contact me at AquarHEAD@gmail.com
# Thanks for using

from xlrd import *
from xlwt import *
from tempfile import *
import glob
 
names = []
cols = [u'姓名']
infiles = glob.glob('*.xls')
outfile = Workbook()

def find_all_cols():
    for num_inf in range(len(infiles)):
        now_inf = open_workbook(infiles[num_inf])
        now_ins = now_inf.sheet_by_index(0)
        now_row = 1
        for now_col in range(now_ins.ncols):
            rowname = now_ins.cell_value(now_row, now_col)
            if (cols.count(rowname) == 0):
                cols.append(rowname)

def find_all_names():
    for num_inf in range(len(infiles)):
        now_inf = open_workbook(infiles[num_inf])
        now_ins = now_inf.sheet_by_index(0)
        for now_col in range(now_ins.ncols):
            if (now_ins.cell_value(1, now_col) == cols[0]):
                break
        for now_row in range(2,now_ins.nrows):
            now_name = now_ins.cell_value(now_row, now_col)
            if (names.count(now_name) == 0):
                names.append(now_name)

def add_data():
    now_outrow = 0
    for num_name in range(len(names)):
        now_name = names[num_name]
        outsheet.write(now_outrow, 0, now_name)
        for each in range(1, len(cols)):
            outsheet.write(now_outrow, each, cols[each])
        for num_inf in range(len(infiles)):
            now_inf = open_workbook(infiles[num_inf])
            now_ins = now_inf.sheet_by_index(0)
            now_outrow += 1
            outsheet.write(now_outrow, 0, now_ins.cell_value(0, 0))
            now_inrow = 1
            for name_col in range(now_ins.ncols):
                if (now_ins.cell_value(now_inrow, name_col) == cols[0]):
                    break
            now_incol = name_col
            for now_inrow in range(2, now_ins.nrows):
                if (now_ins.cell_value(now_inrow, now_incol) == now_name):
                    break
            if (now_ins.cell_value(now_inrow, now_incol) == now_name):
                for now_incol in range(now_ins.ncols):
                    colname = now_ins.cell_value(1, now_incol)
                    cellvalue = now_ins.cell_value(now_inrow, now_incol)
                    if (colname != cols[0]):
                        outsheet.write(now_outrow, cols.index(colname), cellvalue)
        now_outrow += 2


find_all_cols()
find_all_names()

outfile.add_sheet('Analysis')
outsheet = outfile.get_sheet(0)

add_data()

outfile.save(u'个人成绩分析.xls')
outfile.save(TemporaryFile())
