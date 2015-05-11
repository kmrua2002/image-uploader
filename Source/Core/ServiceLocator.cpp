#include "ServiceLocator.h"

#include "Core/LocalFileCache.h"
#include "Core/HistoryManager.h"

class ServiceLocatorPrivate{
public:
    ServiceLocatorPrivate() {
        engineList_ = nullptr;
        programWindow_ = nullptr;
        uploadErrorHandler_ = nullptr;
        logger_ = nullptr;
    }
    CUploadEngineList_Base* engineList_;
    CHistoryManager historyManager;
    IProgramWindow* programWindow_;
    IUploadErrorHandler* uploadErrorHandler_;
    ILogger* logger_;
    IDialogProvider* dialogProvider_;
};

ServiceLocator::ServiceLocator() : d_ptr(new ServiceLocatorPrivate()){
}

void ServiceLocator::setEngineList(CUploadEngineList_Base* engineList) {
    d_ptr->engineList_ = engineList;
}

CUploadEngineList_Base* ServiceLocator::engineList() {
    return d_ptr->engineList_;
}

LocalFileCache* ServiceLocator::localFileCache() {
    return LocalFileCache::instance();
}

CHistoryManager* ServiceLocator::historyManager() {
    return &d_ptr->historyManager;
}

IProgramWindow* ServiceLocator::programWindow() {
    return d_ptr->programWindow_;
}

IUploadErrorHandler* ServiceLocator::uploadErrorHandler() {
    return d_ptr->uploadErrorHandler_;
}

void ServiceLocator::setUploadErrorHandler(IUploadErrorHandler* errorHandler) {
    d_ptr->uploadErrorHandler_ = errorHandler;
}

ILogger* ServiceLocator::logger() {
    return  d_ptr->logger_;
}

void ServiceLocator::setLogger(ILogger* logger) {
    d_ptr->logger_ = logger;
}

IDialogProvider* ServiceLocator::dialogProvider() {
    return d_ptr->dialogProvider_;
}

void ServiceLocator::setDialogProvider(IDialogProvider* dialogProvider) {
    d_ptr->dialogProvider_ = dialogProvider;
}

void ServiceLocator::setProgramWindow(IProgramWindow* window) {
    d_ptr->programWindow_ = window;
}