From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: S5P: Fix end address in memory resource information for
 UART devices
Date: Wed, 09 Feb 2011 13:07:44 +0530
Message-ID: <1297237064-30794-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53552 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261Ab1BIHjU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Feb 2011 02:39:20 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGC005ZGALH2K40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Feb 2011 16:39:17 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGC00HB1ALDDY@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Feb 2011 16:39:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linaro-dev@lists.linaro.org
Cc: nicolas.pitre@linaro.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, patches@linaro.org

For S5P platforms, the end address in memory resource information for UART
devices is one byte more than the intended value. Fix this by reducing the
end address by one byte.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/plat-s5p/dev-uart.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/plat-s5p/dev-uart.c b/arch/arm/plat-s5p/dev-uart.c
index 6a73428..afaf87f 100644
--- a/arch/arm/plat-s5p/dev-uart.c
+++ b/arch/arm/plat-s5p/dev-uart.c
@@ -28,7 +28,7 @@
 static struct resource s5p_uart0_resource[] = {
 	[0] = {
 		.start	= S5P_PA_UART0,
-		.end	= S5P_PA_UART0 + S5P_SZ_UART,
+		.end	= S5P_PA_UART0 + S5P_SZ_UART - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
@@ -51,7 +51,7 @@ static struct resource s5p_uart0_resource[] = {
 static struct resource s5p_uart1_resource[] = {
 	[0] = {
 		.start	= S5P_PA_UART1,
-		.end	= S5P_PA_UART1 + S5P_SZ_UART,
+		.end	= S5P_PA_UART1 + S5P_SZ_UART - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
@@ -74,7 +74,7 @@ static struct resource s5p_uart1_resource[] = {
 static struct resource s5p_uart2_resource[] = {
 	[0] = {
 		.start	= S5P_PA_UART2,
-		.end	= S5P_PA_UART2 + S5P_SZ_UART,
+		.end	= S5P_PA_UART2 + S5P_SZ_UART - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
@@ -98,7 +98,7 @@ static struct resource s5p_uart3_resource[] = {
 #if CONFIG_SERIAL_SAMSUNG_UARTS > 3
 	[0] = {
 		.start	= S5P_PA_UART3,
-		.end	= S5P_PA_UART3 + S5P_SZ_UART,
+		.end	= S5P_PA_UART3 + S5P_SZ_UART - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
@@ -123,7 +123,7 @@ static struct resource s5p_uart4_resource[] = {
 #if CONFIG_SERIAL_SAMSUNG_UARTS > 4
 	[0] = {
 		.start	= S5P_PA_UART4,
-		.end	= S5P_PA_UART4 + S5P_SZ_UART,
+		.end	= S5P_PA_UART4 + S5P_SZ_UART - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
@@ -148,7 +148,7 @@ static struct resource s5p_uart5_resource[] = {
 #if CONFIG_SERIAL_SAMSUNG_UARTS > 5
 	[0] = {
 		.start	= S5P_PA_UART5,
-		.end	= S5P_PA_UART5 + S5P_SZ_UART,
+		.end	= S5P_PA_UART5 + S5P_SZ_UART - 1,
 		.flags	= IORESOURCE_MEM,
 	},
 	[1] = {
-- 
1.6.6.rc2
