From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 10/15] ARM: sunxi: fix a leaked reference by addingmissing of_node_put
Date: Fri, 1 Mar 2019 16:56:51 +0800
Message-ID: <1551430616-42014-10-git-send-email-wen.yang99@zte.com.cn>
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
./arch/arm/mach-sunxi/platsmp.c:55:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 46, but without a corresponding object release within this function.
./arch/arm/mach-sunxi/platsmp.c:138:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 129, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/mach-sunxi/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-sunxi/platsmp.c b/arch/arm/mach-sunxi/platsmp.c
index 8fb5088..c842209 100644
--- a/arch/arm/mach-sunxi/platsmp.c
+++ b/arch/arm/mach-sunxi/platsmp.c
@@ -50,6 +50,7 @@ static void __init sun6i_smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	prcm_membase = of_iomap(node, 0);
+	of_node_put(node);
 	if (!prcm_membase) {
 		pr_err("Couldn't map A31 PRCM registers\n");
 		return;
@@ -63,6 +64,7 @@ static void __init sun6i_smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	cpucfg_membase = of_iomap(node, 0);
+	of_node_put(node);
 	if (!cpucfg_membase)
 		pr_err("Couldn't map A31 CPU config registers\n");
 
-- 
2.9.5
