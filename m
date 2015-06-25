From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 2/3] mfd: Remove MFD_CROS_EC depends on X86 || ARM
Date: Thu, 25 Jun 2015 02:20:43 +0200
Message-ID: <1435191645-6022-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43997 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754460AbbFYAVk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jun 2015 20:21:40 -0400
In-Reply-To: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

A dependency on X86 || ARM for MFD_CROS_EC was added to fix the warning:

(MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct dependencies (X86 || ARM)

This happened because CHROME_PLATFORMS had a dependency on X86 || ARM but
that dependency was removed since there isn't a reason why the option can
not be selected on other architectures. So now the above warning will not
happen and the MFD_CROS_EC dependency can be removed since is not needed.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

 drivers/mfd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d3235e6f1953..653815950aa2 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -94,7 +94,6 @@ config MFD_AXP20X
 
 config MFD_CROS_EC
 	tristate "ChromeOS Embedded Controller"
-	depends on X86 || ARM
 	select MFD_CORE
 	select CHROME_PLATFORMS
 	select CROS_EC_PROTO
-- 
2.1.4
