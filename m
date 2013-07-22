From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix low level debug support
Date: Mon, 22 Jul 2013 15:07:44 +0200
Message-ID: <6790481.xItQ52QUhM@amdc1227>
References: <1373709465-21042-1-git-send-email-yadi.brar@samsung.com>
 <CAJuYYwRij6CAfLCG-xmmoe_iDnvCsTCB_4PnEiRfD+bAiBe9VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:61745 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754697Ab3GVNHt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 09:07:49 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQC004JG9RN6120@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 14:07:47 +0100 (BST)
In-reply-to: <CAJuYYwRij6CAfLCG-xmmoe_iDnvCsTCB_4PnEiRfD+bAiBe9VQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Yadwinder Singh Brar <yadi.brar@samsung.com>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, olof@lixom.net, dianders@chromium.org, yadi.brar01@gmail.com

On Monday 22 of July 2013 06:23:06 Thomas Abraham wrote:
> On 13 July 2013 04:57, Yadwinder Singh Brar <yadi.brar@samsung.com> 
wrote:
> > Presently, using exynos_defconfig with CONFIG_DEBUG_LL and
> > CONFIG_EARLY_PRINTK on, kernel is not booting, we are getting
> > following:
> > 
> > [    0.000000] ------------[ cut here ]------------
> > [    0.000000] kernel BUG at mm/vmalloc.c:1134!
> > [    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> > [    0.000000] Modules linked in:
> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.11.0-rc1 #633
> > [    0.000000] task: c052ec48 ti: c0524000 task.ti: c0524000
> > [    0.000000] PC is at vm_area_add_early+0x54/0x94
> > [    0.000000] LR is at add_static_vm_early+0xc/0x60
> > 
> > Its because iotable_init tries to map UART again which is already
> > mapped by debug_ll_io_init() call in exynos_init_io() within same
> > virtal address range as requested later.
> 
> debug_ll_io_init ioremaps debug uart address space with 4KB size
> whereas the exynos_init_io() function ioremaps a single 512KB memory
> size for all the four uart ports which envelops the mapping created by
> debug_ll_io_init. This is caught as a kernel bug.

Right.

> > This issue seems to be occured after :
> > commit ee4de5d99aeac44f4507b7538b2b3faedc5205b9
> > ARM: 7781/1: mmu: Add debug_ll_io_init() mappings to early mappings
> > 
> > This patch moves S3C_UART iodesc(in iodesc_list) inside CONFIG_DEBUG_LL
> > check.
> Instead of moving, all the such iodesc entries for UART controller can
> be removed for all Samsung SoC's now since the Samsung uart driver
> does a ioremap during probe and any needed iomapping for earlyprintk
> is handled by debug_ll_io_init().

Yes. This mapping should not be here, but...

If you look at plat-samsung/pm.c, there is a debugging code that relies on 
presence of this mapping. So until this gets fixed/removed (I'm working on 
it right now), I'd suggest keeping Yadwinder's solution.

The only problem is that the code in pm.c expects _all_ UARTs to be mapped 
(see s3c_pm_resture_uarts() and co.), so in case of DEBUG_LL enabled, 
something must be done ensure that rest of the ports are mapped.

I'm going to completely rework Samsung PM code in some time, so this 
problem will go away, but this must be fixed in 3.11.

Best regards,
Tomasz
