From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH RE-SEND 1/2] ARM: Update number of VIC for S5PV210
Date: Fri, 18 Feb 2011 11:05:52 +0900
Message-ID: <1297994753-22246-2-git-send-email-kgene.kim@samsung.com>
References: <1297994753-22246-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:52163 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753859Ab1BRCfW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Feb 2011 21:35:22 -0500
In-Reply-To: <1297994753-22246-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kyungmin Park <kyungmin.park@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>

From: Kyungmin Park <kyungmin.park@samsung.com>

S5PV210 SoC have 4 VICs. It requires for suspend and resume.

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/common/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/common/Kconfig b/arch/arm/common/Kconfig
index 778655f..9099604 100644
--- a/arch/arm/common/Kconfig
+++ b/arch/arm/common/Kconfig
@@ -6,6 +6,7 @@ config ARM_VIC
 
 config ARM_VIC_NR
 	int
+	default 4 if ARCH_S5PV210
 	default 2
 	depends on ARM_VIC
 	help
-- 
1.7.1
