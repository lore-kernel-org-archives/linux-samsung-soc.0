From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/3] platform/chrome: Don't make CHROME_PLATFORMS depends on X86 || ARM
Date: Thu, 25 Jun 2015 02:20:42 +0200
Message-ID: <1435191645-6022-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43992 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754445AbbFYAVi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jun 2015 20:21:38 -0400
In-Reply-To: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The Chrome platform support depends on X86 || ARM because there are
only Chromebooks using those architectures. But only some drivers
depend on a given architecture, and the ones that do already have
a dependency on their specific Kconfig symbol entries.

An option is to also make CHROME_PLATFORMS depends on || COMPILE_TEST
but is more future proof to remove the dependency and let the drivers
be built in all architectures if possible to have more build coverage.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

 drivers/platform/chrome/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index cb1329919527..3271cd1abe7c 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -4,7 +4,6 @@
 
 menuconfig CHROME_PLATFORMS
 	bool "Platform support for Chrome hardware"
-	depends on X86 || ARM
 	---help---
 	  Say Y here to get to see options for platform support for
 	  various Chromebooks and Chromeboxes. This option alone does
-- 
2.1.4
