From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH v2 01/10] mfd: cros_ec: Fix the comment on cros_ec_remove()
Date: Wed, 18 Jun 2014 11:13:58 -0700
Message-ID: <1403115247-8853-2-git-send-email-dianders@chromium.org>
References: <1403115247-8853-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403115247-8853-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, swarren@wwwdotorg.org, olof@lixom.net, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, sjg@chromium.org, Wolfram Sang <wsa@the-dreams.de>, broonie@kernel.org, Doug Anderson <dianders@chromium.org>, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Bill Richardson <wfrichar@chromium.org>

This comment was incorrect, so update it.

Signed-off-by: Bill Richardson <wfrichar@chromium.org>
Signed-off-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Doug Anderson <dianders@chromium.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
Changes in v2: None

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
