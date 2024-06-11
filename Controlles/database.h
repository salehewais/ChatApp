#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QQmlEngine>

class database : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit database(QObject *parent = nullptr);

signals:

};

#endif // DATABASE_H
