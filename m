From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [v2 PATCH 0/2] EXYNOS: Fix low level debug support
Date: Wed, 24 Jul 2013 17:01:53 +0900
Message-ID: <0e8501ce8844$0f5eae60$2e1c0b20$@org>
References: <1373806020-7336-1-git-send-email-yadi.brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37569 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751894Ab3GXICE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 04:02:04 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00DNKKZ6AAN0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 17:01:54 +0900 (KST)
In-reply-to: <1373806020-7336-1-git-send-email-yadi.brar@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Yadwinder Singh Brar' <yadi.brar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, olof@lixom.net, dianders@chromium.org, thomas.abraham@linaro.org, t.figa@samsung.com, yadi.brar01@gmail.com

Yadwinder Singh Brar wrote:
> 
> Presently, using exynos_defconfig with CONFIG_DEBUG_LL and
> CONFIG_EARLY_PRINTK
> on, kernel is not booting, we are getting following:
> 
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] kernel BUG at mm/vmalloc.c:1134!
> [    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.11.0-rc1 #633
> [    0.000000] task: c052ec48 ti: c0524000 task.ti: c0524000
> [    0.000000] PC is at vm_area_add_early+0x54/0x94
> [    0.000000] LR is at add_static_vm_early+0xc/0x60
> 
> Its because exynos[4/5]_map_io() function ioremaps a single 512KB memory
> size for all the four uart ports which envelopes the mapping created by
> debug_ll_io_init(), called earlier in exynos_init_io().
> 
> This issue seems to be occured after :
> commit ee4de5d99aeac44f4507b7538b2b3faedc5205b9
> ARM: 7781/1: mmu: Add debug_ll_io_init() mappings to early mappings
> 
> This series removes static iodesc entries for UART controller for all
> Samsung
> SoC's and modifies pm debug code to save/restore only the selected debug
> uart
> registers.
> 
> changes since v1:
> - removed uart iodesc entires instead of just moving inside
> CONFIG_DEBUG_LL
>   check, as suggested by Thomas Abraham.
> - Fixed the possible issue after removing uart entries pointed by Tomasz
> Figa.
> 
> Tested doing suspend/resume on smdk5250.
> 
> Yadwinder Singh Brar (2):
>   ARM: SAMSUNG: pm: Save/restore only selected uart's registers
>   ARM: EXYNOS: Fix low level debug support
> 
>  arch/arm/mach-exynos/common.c |   26 --------------------------
>  arch/arm/plat-samsung/pm.c    |   14 +++-----------
>  2 files changed, 3 insertions(+), 37 deletions(-)

This series looks good to me, applied into -fixes.

Just note, I was looking at the static iodesc for UART because of booting
problem ;)

Anyway, thanks,
Kukjin
