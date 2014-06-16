From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 01/10] mfd: cros_ec: Fix the comment on cros_ec_remove()
Date: Mon, 16 Jun 2014 14:39:51 -0700
Message-ID: <1402954800-28215-2-git-send-email-dianders@chromium.org>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f74.google.com ([209.85.213.74]:35214 "EHLO
	mail-yh0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbaFPVkT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jun 2014 17:40:19 -0400
Received: by mail-yh0-f74.google.com with SMTP id b6so903045yha.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jun 2014 14:40:18 -0700 (PDT)
In-Reply-To: <1402954800-28215-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, Doug Anderson <dianders@chromium.org>, sameo@linux.intel.com, linux-kernel@vger.kernel.org

From: Bill Richardson <wfrichar@chromium.org>

This comment was incorrect, so update it.

Signed-off-by: Bill Richardson <wfrichar@chromium.org>
Signed-off-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 include/linux/mfd/cros_ec.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
index 887ef4f..7e9fe6e 100644
--- a/include/linux/mfd/cros_ec.h
+++ b/include/linux/mfd/cros_ec.h
@@ -148,8 +148,7 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
 /**
  * cros_ec_remove - Remove a ChromeOS EC
  *
- * Call this to deregister a ChromeOS EC. After this you should call
- * cros_ec_free().
+ * Call this to deregister a ChromeOS EC, then clean up any private data.
  *
  * @ec_dev: Device to register
  * @return 0 if ok, -ve on error
-- 
2.0.0.526.g5318336
