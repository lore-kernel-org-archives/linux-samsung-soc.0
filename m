From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: [PATCH 2/2] ARM: Only allow PM_SLEEP with CPUs which support suspend
Date: Sat, 02 Apr 2011 10:21:07 +0100
Message-ID: <E1Q5x11-0001Z0-45@rmk-PC.arm.linux.org.uk>
References: <20110402091904.GH8482@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:49581 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755394Ab1DBJVN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Apr 2011 05:21:13 -0400
In-Reply-To: <20110402091904.GH8482@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Offering CONFIG_PM_SLEEP for CPUs which do not support suspend leads to
build errors, so only set CONFIG_ARCH_SUSPEND_POSSIBLE if we have a CPU
selected which supports suspend.

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 arch/arm/Kconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 5b9f78b..9954c9b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2012,6 +2012,8 @@ source "kernel/power/Kconfig"
 
 config ARCH_SUSPEND_POSSIBLE
 	depends on !ARCH_S5P64X0 && !ARCH_S5P6442
+	depends on CPU_ARM920T || CPU_ARM926T || CPU_SA1100 || \
+		CPU_V6 || CPU_V6K || CPU_V7 || CPU_XSC3 || CPU_XSCALE
 	def_bool y
 
 endmenu
-- 
1.7.4
