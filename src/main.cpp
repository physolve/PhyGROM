#include "grom.h"

int main(int argc, char *argv[]) {
    QGuiApplication::setAttribute(Qt::AA_DisableHighDpiScaling);
    Grom app(argc, argv);
    int ret;
    try {
        ret = app.exec();
    } catch (const std::bad_alloc &) {
        return EXIT_FAILURE;
    }

    return ret;
}
