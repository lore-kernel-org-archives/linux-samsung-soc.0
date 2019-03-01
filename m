From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 11/15] ARM: versatile: fix a leaked reference by addingmissing of_node_put
Date: Fri, 1 Mar 2019 16:56:52 +0800
Message-ID: <1551430616-42014-11-git-send-email-wen.yang99@zte.com.cn>
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
./arch/arm/mach-versatile/versatile_dt.c:315:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 302, but without a corresponding object release within this function.
./arch/arm/mach-versatile/versatile_dt.c:320:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 302, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/mach-versatile/versatile_dt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/versatile_dt.c b/arch/arm/mach-versatile/versatile_dt.c
index e9d6068..028463a 100644
--- a/arch/arm/mach-versatile/versatile_dt.c
+++ b/arch/arm/mach-versatile/versatile_dt.c
@@ -312,12 +312,12 @@ static void __init versatile_dt_pci_init(void)
 		 * driver had it so we will keep it.
 		 */
 		writel(1, versatile_sys_base + VERSATILE_SYS_PCICTL_OFFSET);
-		return;
+		goto out_put_node;
 	}
 
 	newprop = kzalloc(sizeof(*newprop), GFP_KERNEL);
 	if (!newprop)
-		return;
+		goto out_put_node;
 
 	newprop->name = kstrdup("status", GFP_KERNEL);
 	newprop->value = kstrdup("disabled", GFP_KERNEL);
@@ -325,6 +325,9 @@ static void __init versatile_dt_pci_init(void)
 	of_update_property(np, newprop);
 
 	pr_info("Not plugged into PCI backplane!\n");
+
+out_put_node:
+	of_node_put(np);
 }
 
 static void __init versatile_dt_init(void)
-- 
2.9.5
