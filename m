From: Jungseok Lee <jays.lee@samsung.com>
Subject: [PATCH v2 1/7] arm64: Use pr_* instead of printk
Date: Wed, 16 Apr 2014 13:33:11 +0900
Message-ID: <004101cf592c$f9981340$ecc839c0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41765 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbaDPEdN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 00:33:13 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, Catalin.Marinas@arm.com, Marc Zyngier <Marc.Zyngier@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, steve.capper@linaro.org, sungjinn.chung@samsung.com, Arnd Bergmann <arnd@arndb.de>, kgene.kim@samsung.com, ilho215.lee@samsung.com

This patch fixed the following checkpatch complaint as using pr_*
instead of printk.

WARNING: printk() should include KERN_ facility level

Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
Reviewed-by: Sungjinn Chung <sungjinn.chung@samsung.com>
---
 arch/arm64/kernel/traps.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 7ffaddd..0484e81 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -65,7 +65,7 @@ static void dump_mem(const char *lvl, const char *str, unsigned long bottom,
 	fs = get_fs();
 	set_fs(KERNEL_DS);
 
-	printk("%s%s(0x%016lx to 0x%016lx)\n", lvl, str, bottom, top);
+	pr_emerg("%s%s(0x%016lx to 0x%016lx)\n", lvl, str, bottom, top);
 
 	for (first = bottom & ~31; first < top; first += 32) {
 		unsigned long p;
@@ -83,7 +83,7 @@ static void dump_mem(const char *lvl, const char *str, unsigned long bottom,
 					sprintf(str + i * 9, " ????????");
 			}
 		}
-		printk("%s%04lx:%s\n", lvl, first & 0xffff, str);
+		pr_emerg("%s%04lx:%s\n", lvl, first & 0xffff, str);
 	}
 
 	set_fs(fs);
@@ -124,7 +124,7 @@ static void dump_instr(const char *lvl, struct pt_regs *regs)
 			break;
 		}
 	}
-	printk("%sCode: %s\n", lvl, str);
+	pr_emerg("%sCode: %s\n", lvl, str);
 
 	set_fs(fs);
 }
@@ -156,7 +156,7 @@ static void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk)
 		frame.pc = thread_saved_pc(tsk);
 	}
 
-	printk("Call trace:\n");
+	pr_emerg("Call trace:\n");
 	while (1) {
 		unsigned long where = frame.pc;
 		int ret;
@@ -328,17 +328,17 @@ asmlinkage void bad_mode(struct pt_regs *regs, int reason, unsigned int esr)
 
 void __pte_error(const char *file, int line, unsigned long val)
 {
-	printk("%s:%d: bad pte %016lx.\n", file, line, val);
+	pr_crit("%s:%d: bad pte %016lx.\n", file, line, val);
 }
 
 void __pmd_error(const char *file, int line, unsigned long val)
 {
-	printk("%s:%d: bad pmd %016lx.\n", file, line, val);
+	pr_crit("%s:%d: bad pmd %016lx.\n", file, line, val);
 }
 
 void __pgd_error(const char *file, int line, unsigned long val)
 {
-	printk("%s:%d: bad pgd %016lx.\n", file, line, val);
+	pr_crit("%s:%d: bad pgd %016lx.\n", file, line, val);
 }
 
 void __init trap_init(void)
-- 
1.7.10.4
