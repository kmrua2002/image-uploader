/*

    Image Uploader -  free application for uploading images/files to the Internet

    Copyright 2007-2015 Sergey Svistunov (zenden2k@gmail.com)

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

*/

#ifndef IU_FUNC_HISTORY_MANAGER_H
#define IU_FUNC_HISTORY_MANAGER_H

#pragma once

#include <string>
#include <vector>
#include "Core/Utils/CoreTypes.h"

struct HistoryItem
{
	std::string localFilePath;
	std::string directUrl;
	std::string viewUrl;
	std::string thumbUrl;
	std::string serverName;
	time_t timeStamp;
	int64_t uploadFileSize;
	HistoryItem() {
		timeStamp = 0;
		uploadFileSize = 0;
	}
};

class SimpleXmlNode;
class CHistoryReader_impl;

class CHistorySession
{
	public:
		CHistorySession(const std::string& filename, const std::string& sessionId);
		bool AddItem(const HistoryItem& ht);

		int entriesCount() const;
		HistoryItem entry(const int index) const;
		std::string serverName() const;
		time_t timeStamp() const;
		void loadFromXml(SimpleXmlNode& sessionNode);
	private:
		std::string m_historyXmlFileName;
		std::string m_sessId;
		time_t m_timeStamp;
		std::string m_serverName;
		std::vector<HistoryItem> m_entries;
};

class CHistoryManager
{
	public:
		CHistoryManager();
		virtual ~CHistoryManager();
		void setHistoryFileName(const std::string& filepath, const std::string& nameprefix);
		std_tr::shared_ptr<CHistorySession> newSession();
		std::string makeFileName() const;

	private:
		std::string m_historyFilePath;
		std::string m_historyFileNamePrefix;
};

class CHistoryReader
{
	public:
		CHistoryReader();
		virtual ~CHistoryReader();
		bool loadFromFile(const std::string& filename);
		int getSessionCount() const;
		CHistorySession* getSession(const int index);
	private:
        DISALLOW_COPY_AND_ASSIGN(CHistoryReader);
		CHistoryReader_impl* _impl;
};
#endif
