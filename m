From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH RE-SEND 2/2] ARM: Update number of VIC for S5P6442 and S5PC100
Date: Fri, 18 Feb 2011 11:05:53 +0900
Message-ID: <1297994753-22246-3-git-send-email-kgene.kim@samsung.com>
References: <1297994753-22246-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52158 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207Ab1BRCfV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Feb 2011 21:35:21 -0500
In-Reply-To: <1297994753-22246-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>

Update the number of VIC to handle the 3 VICs of the
S5P6442 and S5PC100.

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/common/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/common/Kconfig b/arch/arm/common/Kconfig
index 9099604..ea5ee4d 100644
--- a/arch/arm/common/Kconfig
+++ b/arch/arm/common/Kconfig
@@ -7,6 +7,7 @@ config ARM_VIC
 config ARM_VIC_NR
 	int
 	default 4 if ARCH_S5PV210
+	default 3 if ARCH_S5P6442 || ARCH_S5PC100
 	default 2
 	depends on ARM_VIC
 	help
-- 
1.7.1
