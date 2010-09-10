From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/2] ARM: Update number of VIC for S5P6442 and S5PC100
Date: Fri, 10 Sep 2010 21:03:13 +0900
Message-ID: <1284120193-23291-3-git-send-email-kgene.kim@samsung.com>
References: <1284120193-23291-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:33738 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752623Ab0IJMR1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 08:17:27 -0400
In-Reply-To: <1284120193-23291-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk@arm.linux.org.uk>

Update the number of IVC to handle the 3 VICs of the
S5P6442 and S5PC100.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Russell King <rmk@arm.linux.org.uk>
---
 arch/arm/common/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/common/Kconfig b/arch/arm/common/Kconfig
index 0ac3d81..6480685 100644
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
1.6.2.5
