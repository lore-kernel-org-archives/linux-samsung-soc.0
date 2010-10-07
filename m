From: Jongsun Han <jongsun.han@samsung.com>
Subject: [PATCH 1/3] ARM: S5P: Add GPIO2 memory map definition
Date: Thu,  7 Oct 2010 20:24:56 +0900
Message-ID: <1286450698-12029-2-git-send-email-jongsun.han@samsung.com>
References: <1286450698-12029-1-git-send-email-jongsun.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:44330 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755170Ab0JGLeq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 07:34:46 -0400
In-Reply-To: <1286450698-12029-1-git-send-email-jongsun.han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Jongsun Han <jongsun.han@samsung.com>

This patch adds GPIO2 memory map definition for external interrupts

Signed-off by: Jongsun Han <jongsun.han@samsung.com>
---
 arch/arm/plat-s5p/include/plat/map-s5p.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat-s5p/include/plat/map-s5p.h
index c833f3f..907b708 100644
--- a/arch/arm/plat-s5p/include/plat/map-s5p.h
+++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
@@ -15,6 +15,7 @@
 
 #define S5P_VA_CHIPID		S3C_ADDR(0x00700000)
 #define S5P_VA_GPIO		S3C_ADDR(0x00500000)
+#define S5P_VA_GPIO2		S3C_ADDR(0x00510000)
 #define S5P_VA_SYSTIMER		S3C_ADDR(0x01200000)
 #define S5P_VA_SROMC		S3C_ADDR(0x01100000)
 #define S5P_VA_SYSRAM		S3C_ADDR(0x01180000)
-- 
1.6.3.3
