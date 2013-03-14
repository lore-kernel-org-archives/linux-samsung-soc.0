From: Alexander Graf <agraf@suse.de>
Subject: [PATCH 3/3] ARM: EXYNOS5250: Register architected timers
Date: Thu, 14 Mar 2013 01:59:02 +0100
Message-ID: <1363222742-15220-4-git-send-email-agraf@suse.de>
References: <1363222742-15220-1-git-send-email-agraf@suse.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40499 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756535Ab3CNA7H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 20:59:07 -0400
In-Reply-To: <1363222742-15220-1-git-send-email-agraf@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, Kukjin Kim <kgene.kim@samsung.com>

When running on an exynos 5250 SoC, we don't initialize the architected
timers. The chip however supports architected timers.

When we don't initialize them, KVM will try to access them and run into
NULL pointer dereferences attempting to do so.

This patch is really more of a hack than a real fix, but does get me
working with KVM on Arndale.

Signed-off-by: Alexander Graf <agraf@suse.de>
---
 arch/arm/mach-exynos/mct.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index c9d6650..eefb8af 100644
--- a/arch/arm/mach-exynos/mct.c
+++ b/arch/arm/mach-exynos/mct.c
@@ -482,4 +482,8 @@ void __init exynos4_timer_init(void)
 	exynos4_timer_resources();
 	exynos4_clocksource_init();
 	exynos4_clockevent_init();
+
+	if (soc_is_exynos5250()) {
+		arch_timer_of_register();
+	}
 }
-- 
1.7.10.4
