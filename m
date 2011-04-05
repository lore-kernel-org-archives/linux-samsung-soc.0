From: Tushar Behera <tushar.behera@linaro.org>
Subject: Bug: SMDKV310: System hang during reboot
Date: Tue, 5 Apr 2011 15:10:09 +0530
Message-ID: <BANLkTinNKKp1eP1iNDW1mQ0_EHuZJEvA6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40542 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751591Ab1DEJkL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Apr 2011 05:40:11 -0400
Received: by bwz15 with SMTP id 15so164916bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Apr 2011 02:40:10 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org

Hi,

While executing reboot call on SMDKV310, the system hangs during
cpu_proc_fin() call.

Commenting out this line of code, the reboot works properly.

--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -46,7 +46,6 @@ ENTRY(cpu_v7_proc_fin)
        mrc     p15, 0, r0, c1, c0, 0           @ ctrl register
        bic     r0, r0, #0x1000                 @ ...i............
        bic     r0, r0, #0x0006                 @ .............ca.
-       mcr     p15, 0, r0, c1, c0, 0           @ disable caches
        mov     pc, lr
 ENDPROC(cpu_v7_proc_fin)

Are we missing something in the Exynos4 machine code or is it a
CPU_V7 specific issue?

Regards,
Tushar
