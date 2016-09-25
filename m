From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] PM / devfreq: event: Remove unnecessary NULL test for to_devfreq_event(dev)
Date: Sun, 25 Sep 2016 20:16:28 +0800
Message-ID: <1474805788-30702-1-git-send-email-axel.lin@ingics.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:36125 "EHLO
        mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965809AbcIYMQj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 25 Sep 2016 08:16:39 -0400
Received: by mail-pa0-f67.google.com with SMTP id my20so7383254pab.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Sep 2016 05:16:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

to_devfreq_event(dev) never returns NULL.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/devfreq/devfreq-event.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/devfreq-event.c b/drivers/devfreq/devfreq-event.c
index 9aea2c7..d0ae087 100644
--- a/drivers/devfreq/devfreq-event.c
+++ b/drivers/devfreq/devfreq-event.c
@@ -442,7 +442,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 {
 	struct devfreq_event_dev *edev = to_devfreq_event(dev);
 
-	if (!edev || !edev->desc)
+	if (!edev->desc)
 		return -EINVAL;
 
 	return sprintf(buf, "%s\n", edev->desc->name);
@@ -454,7 +454,7 @@ static ssize_t enable_count_show(struct device *dev,
 {
 	struct devfreq_event_dev *edev = to_devfreq_event(dev);
 
-	if (!edev || !edev->desc)
+	if (!edev->desc)
 		return -EINVAL;
 
 	return sprintf(buf, "%d\n", edev->enable_count);
-- 
2.7.4
