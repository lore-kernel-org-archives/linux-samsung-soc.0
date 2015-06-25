From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 3/3] mfd: Remove MFD_CROS_EC_SPI depends on OF
Date: Thu, 25 Jun 2015 02:20:44 +0200
Message-ID: <1435191645-6022-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:44004 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbbFYAVl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jun 2015 20:21:41 -0400
In-Reply-To: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The ChromeOS EC SPI transport driver has a dependency on OF because it
uses some OF helpers from the <linux/of.h> header. But there isn't a
need for an explicit dependency since the header has stub functions if
CONFIG_OF is not defined.

Also, MFD_CROS_EC_SPI already depends on MFD_CROS_EC which in turn has
a dependency on OF so in practice can't be selected without CONFIG_OF.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

---

 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 653815950aa2..3f68dd251ce8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -115,7 +115,7 @@ config MFD_CROS_EC_I2C
 
 config MFD_CROS_EC_SPI
 	tristate "ChromeOS Embedded Controller (SPI)"
-	depends on MFD_CROS_EC && CROS_EC_PROTO && SPI && OF
+	depends on MFD_CROS_EC && CROS_EC_PROTO && SPI
 
 	---help---
 	  If you say Y here, you get support for talking to the ChromeOS EC
-- 
2.1.4
