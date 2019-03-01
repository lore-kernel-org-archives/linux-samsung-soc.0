From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH 04/15] ARM: hisi: fix a leaked reference by addingmissing of_node_put
Date: Fri, 1 Mar 2019 16:56:45 +0800
Message-ID: <1551430616-42014-4-git-send-email-wen.yang99@zte.com.cn>
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
./arch/arm/mach-hisi/platsmp.c:74:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
./arch/arm/mach-hisi/platsmp.c:78:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 66, but without a corresponding object release within this function.
./arch/arm/mach-hisi/platmcpm.c:337:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 275, but without a corresponding object release within this function.
./arch/arm/mach-hisi/platmcpm.c:347:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 275, but without a corresponding object release within this function.
./arch/arm/mach-hisi/platmcpm.c:337:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 284, but without a corresponding object release within this function.
./arch/arm/mach-hisi/platmcpm.c:347:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 284, but without a corresponding object release within this function.
./arch/arm/mach-hisi/platmcpm.c:337:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 287, but without a corresponding object release within this function.
./arch/arm/mach-hisi/platmcpm.c:347:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 287, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/mach-hisi/platmcpm.c | 12 ++++++++++--
 arch/arm/mach-hisi/platsmp.c  |  7 +++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-hisi/platmcpm.c b/arch/arm/mach-hisi/platmcpm.c
index f66815c..695423c 100644
--- a/arch/arm/mach-hisi/platmcpm.c
+++ b/arch/arm/mach-hisi/platmcpm.c
@@ -277,6 +277,7 @@ static int __init hip04_smp_init(void)
 		goto err;
 	ret = of_property_read_u32_array(np, "boot-method",
 					 &hip04_boot_method[0], 4);
+	of_node_put(np);
 	if (ret)
 		goto err;
 
@@ -285,12 +286,14 @@ static int __init hip04_smp_init(void)
 	if (!np_sctl)
 		goto err;
 	np_fab = of_find_compatible_node(NULL, NULL, "hisilicon,hip04-fabric");
-	if (!np_fab)
+	if (!np_fab) {
+		of_node_put(np_sctl);
 		goto err;
+	}
 
 	ret = memblock_reserve(hip04_boot_method[0], hip04_boot_method[1]);
 	if (ret)
-		goto err;
+		goto err_put_node;
 
 	relocation = ioremap(hip04_boot_method[2], hip04_boot_method[3]);
 	if (!relocation) {
@@ -334,6 +337,8 @@ static int __init hip04_smp_init(void)
 	iounmap(relocation);
 
 	smp_set_ops(&hip04_smp_ops);
+	of_node_put(np_fab);
+	of_node_put(np_sctl);
 	return ret;
 err_table:
 	iounmap(fabric);
@@ -343,6 +348,9 @@ static int __init hip04_smp_init(void)
 	iounmap(relocation);
 err_reloc:
 	memblock_free(hip04_boot_method[0], hip04_boot_method[1]);
+err_put_node:
+	of_node_put(np_fab);
+	of_node_put(np_sctl);
 err:
 	return ret;
 }
diff --git a/arch/arm/mach-hisi/platsmp.c b/arch/arm/mach-hisi/platsmp.c
index da5689a..ecc68fa 100644
--- a/arch/arm/mach-hisi/platsmp.c
+++ b/arch/arm/mach-hisi/platsmp.c
@@ -71,14 +71,17 @@ static void __init hi3xxx_smp_prepare_cpus(unsigned int max_cpus)
 		ctrl_base = of_iomap(np, 0);
 		if (!ctrl_base) {
 			pr_err("failed to map address\n");
-			return;
+			goto out_put_node;
 		}
 		if (of_property_read_u32(np, "smp-offset", &offset) < 0) {
 			pr_err("failed to find smp-offset property\n");
-			return;
+			goto out_put_node;
 		}
 		ctrl_base += offset;
 	}
+
+out_put_node:
+	of_node_put(np);
 }
 
 static int hi3xxx_boot_secondary(unsigned int cpu, struct task_struct *idle)
-- 
2.9.5
