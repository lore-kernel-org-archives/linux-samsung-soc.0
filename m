From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v3] ARM: Samsung: fix watchdog reset issue with clk_get()
Date: Fri, 19 Aug 2011 15:07:42 +0530
Message-ID: <4E4E2EE6.70503@linaro.org>
References: <1313663117-29191-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:55140 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942Ab1HSJhj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 05:37:39 -0400
Received: by pzk37 with SMTP id 37so4560048pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 02:37:39 -0700 (PDT)
In-Reply-To: <1313663117-29191-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

Hi,

On Thursday 18 August 2011 03:55 PM, Marek Szyprowski wrote:
> clkdev framework uses global mutex to protect clock tree, so it is not
> possible to call clk_get() in interrupt context. This patch fixes this
> issue and makes system reset by watchdog call working again.
>
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/plat-samsung/clock.c                      |   11 +++++++++++
>   arch/arm/plat-samsung/include/plat/clock.h         |    3 +++
>   .../arm/plat-samsung/include/plat/watchdog-reset.h |   10 +++-------
>   3 files changed, 17 insertions(+), 7 deletions(-)
>
>
> history:
> v3:
> - moved initialization to arch_initcall, cleaned the code
>
> v2:
> - added missing '__init' section modifiers
(snip)

I tried to test this patch with ORIGEN board.

I took the ORIGEN board support patch from kgene's
next-samsung-board-v3.1 branch and rebased it onto the for-next branch 
for testing.

The system reboot stops at a message saying "Restarting system" and hangs.

However applying below patch reboots the system without even applying 
Marek's patch.

Is there something wrong with mach-origen.c or u-boot [1]?

[1] git://git.linaro.org/people/angus/u-boot.git (origen)

 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

From: Tushar Behera <tushar.behera@linaro.org>
Date: Fri, 19 Aug 2011 14:47:04 +0530
Subject: [PATCH] [TEST] ARM: Disabling cache operation during system reset

On ORIGEN/SMDKV310 board, system reboot hangs during cache disabling
call in arm_machine_restart()=>cpu_proc_fin(). Applying given patch 
enables the system to reboot properly.

This patch is no way a proposed solution. It is intended for further
investigation.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
  arch/arm/mm/proc-v7.S |    2 ++
  1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
index a30e785..1bffc35 100644
--- a/arch/arm/mm/proc-v7.S
+++ b/arch/arm/mm/proc-v7.S
@@ -43,10 +43,12 @@ ENTRY(cpu_v7_proc_init)
  ENDPROC(cpu_v7_proc_init)

  ENTRY(cpu_v7_proc_fin)
+#if 0
  	mrc	p15, 0, r0, c1, c0, 0		@ ctrl register
  	bic	r0, r0, #0x1000			@ ...i............
  	bic	r0, r0, #0x0006			@ .............ca.
  	mcr	p15, 0, r0, c1, c0, 0		@ disable caches
+#endif
  	mov	pc, lr
  ENDPROC(cpu_v7_proc_fin)

-- 
1.7.4.1




-- 
Tushar Behera
