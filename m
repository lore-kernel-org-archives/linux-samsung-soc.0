From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/3] ARM: S3C24XX: Fix indentation of dma-s3c2443
Date: Sun, 4 Mar 2012 18:43:24 +0100
Message-ID: <201203041843.24907.heiko@sntech.de>
References: <201203041842.35420.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:34091 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754457Ab2CDRnc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Mar 2012 12:43:32 -0500
In-Reply-To: <201203041842.35420.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Spaces seem to have slipped in at some point in the past.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/dma-s3c2443.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/dma-s3c2443.c b/arch/arm/mach-s3c24xx/dma-s3c2443.c
index 1422451..d9e1b3b 100644
--- a/arch/arm/mach-s3c24xx/dma-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/dma-s3c2443.c
@@ -71,11 +71,11 @@ static struct s3c24xx_dma_map __initdata s3c2443_dma_mappings[] = {
 		.name		= "uart1",
 		.channels	= MAP(S3C2443_DMAREQSEL_UART1_0),
 	},
-      	[DMACH_UART2] = {
+	[DMACH_UART2] = {
 		.name		= "uart2",
 		.channels	= MAP(S3C2443_DMAREQSEL_UART2_0),
 	},
-      	[DMACH_UART3] = {
+	[DMACH_UART3] = {
 		.name		= "uart3",
 		.channels	= MAP(S3C2443_DMAREQSEL_UART3_0),
 	},
@@ -87,11 +87,11 @@ static struct s3c24xx_dma_map __initdata s3c2443_dma_mappings[] = {
 		.name		= "uart1",
 		.channels	= MAP(S3C2443_DMAREQSEL_UART1_1),
 	},
-      	[DMACH_UART2_SRC2] = {
+	[DMACH_UART2_SRC2] = {
 		.name		= "uart2",
 		.channels	= MAP(S3C2443_DMAREQSEL_UART2_1),
 	},
-      	[DMACH_UART3_SRC2] = {
+	[DMACH_UART3_SRC2] = {
 		.name		= "uart3",
 		.channels	= MAP(S3C2443_DMAREQSEL_UART3_1),
 	},
-- 
1.7.2.3
