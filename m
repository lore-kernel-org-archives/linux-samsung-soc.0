From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 1/8] platform: Increase platform name size
Date: Fri, 26 Jul 2013 19:06:45 +0530
Message-ID: <1374845812-7803-2-git-send-email-padma.v@samsung.com>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54594 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755201Ab3GZNes (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 09:34:48 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQJ007J8PPR45R0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Jul 2013 22:34:47 +0900 (KST)
In-reply-to: <1374845812-7803-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, abrestic@chromium.org, tomasz.figa@gmail.com

This patch increases the platform name size from 20 to 30.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 include/linux/mod_devicetable.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index b62d4af..f67b5d5 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -478,7 +478,7 @@ struct dmi_system_id {
 #define DMI_MATCH(a, b)	{ .slot = a, .substr = b }
 #define DMI_EXACT_MATCH(a, b)	{ .slot = a, .substr = b, .exact_match = 1 }
 
-#define PLATFORM_NAME_SIZE	20
+#define PLATFORM_NAME_SIZE	30
 #define PLATFORM_MODULE_PREFIX	"platform:"
 
 struct platform_device_id {
-- 
1.7.4.4
