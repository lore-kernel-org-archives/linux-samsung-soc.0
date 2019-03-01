From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 03/15] ARM: exynos: fix a leaked reference by addingmissing of_node_put
Date: Fri, 1 Mar 2019 16:56:44 +0800
Message-ID: <1551430616-42014-3-git-send-email-wen.yang99@zte.com.cn>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: liviu.dudau@arm.com
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kgene@kernel.org, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, michal.simek@xilinx.com, afaerber@suse.de, manivannan.sadhasivam@linaro.org, dinguyen@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, yuenn@google.com, brendanhiggins@google.com, openbmc@lists.ozlabs.org, xuwei5@hisilicon.com, maxime.ripard@bootlin.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com, horms@verge.net.au, magnus.damm@gmail.comlinux
List-Id: linux-samsung-soc@vger.kernel.org

The call to of_get_next_child returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
./arch/arm/mach-exynos/firmware.c:201:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 193, but without a corresponding object release within this function.
./arch/arm/mach-exynos/firmware.c:204:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 193, but without a corresponding object release within this function.
./arch/arm/mach-exynos/suspend.c:642:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 634, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/mach-exynos/firmware.c | 1 +
 arch/arm/mach-exynos/suspend.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
index d602e3b..2eaf2db 100644
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@ -196,6 +196,7 @@ bool __init exynos_secure_firmware_available(void)
 		return false;
 
 	addr = of_get_address(nd, 0, NULL, NULL);
+	of_node_put(nd);
 	if (!addr) {
 		pr_err("%s: No address specified.\n", __func__);
 		return false;
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 0850505..9afb0c6 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -639,8 +639,10 @@ void __init exynos_pm_init(void)
 
 	if (WARN_ON(!of_find_property(np, "interrupt-controller", NULL))) {
 		pr_warn("Outdated DT detected, suspend/resume will NOT work\n");
+		of_node_put(np);
 		return;
 	}
+	of_node_put(np);
 
 	pm_data = (const struct exynos_pm_data *) match->data;
 
-- 
2.9.5
