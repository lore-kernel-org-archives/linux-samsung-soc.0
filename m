From: Dave Martin <dave.martin@linaro.org>
Subject: [PATCH] ARM: s5pv310: Correct data alignment in headsmp.S for CONFIG_THUMB2_KERNEL
Date: Tue, 16 Nov 2010 13:14:20 +0000
Message-ID: <1289913260-8772-1-git-send-email-dave.martin@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:58095 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932673Ab0KPNOe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Nov 2010 08:14:34 -0500
Received: by wwa36 with SMTP id 36so737091wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Nov 2010 05:14:33 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Dave Martin <dave.martin@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Directives such as .long and .word do not magically cause the
assembler location counter to become aligned in gas.  As a
result, using these directives in code sections can result in
misaligned data words when building a Thumb-2 kernel
(CONFIG_THUMB2_KERNEL).

This is a Bad Thing, since the ABI permits the compiler to
assume that fundamental types of word size or above are word-
aligned when accessing them from C.  If the data is not really
word-aligned, this can cause impaired performance and stray
alignment faults in some circumstances.

In general, the following rules should be applied when using
data word declaration directives inside code sections:

    * .quad and .double:
         .align 3

    * .long, .word, .single, .float:
         .align (or .align 2)

    * .short:
        No explicit alignment required, since Thumb-2
        instructions are always 2 or 4 bytes in size.
        immediately after an instruction.

Applies cleanly on v2.6.37-rc1.

Signed-off-by: Dave Martin <dave.martin@linaro.org>
---
 arch/arm/mach-s5pv310/headsmp.S |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/headsmp.S b/arch/arm/mach-s5pv310/headsmp.S
index 164b7b0..65f8574 100644
--- a/arch/arm/mach-s5pv310/headsmp.S
+++ b/arch/arm/mach-s5pv310/headsmp.S
@@ -37,5 +37,6 @@ pen:	ldr	r7, [r6]
 	 */
 	b	secondary_startup
 
+	.align
 1:	.long	.
 	.long	pen_release
-- 
1.7.1
