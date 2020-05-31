#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->quickWidget->setSource(QUrl::fromLocalFile(":/HomePage.qml"));
}

MainWindow::~MainWindow()
{
    delete ui;
}

