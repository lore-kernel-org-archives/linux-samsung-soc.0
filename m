From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix low level debug support
Date: Tue, 23 Jul 2013 09:45:55 +0200
Message-ID: <5267014.uEXBxK1uXj@flatron>
References: <1373709465-21042-1-git-send-email-yadi.brar@samsung.com> <6790481.xItQ52QUhM@amdc1227> <CAKew6eX5JperTq4Quo_mPR8L638_VfqTnDvz_kmmTjDNNykYOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f50.google.com ([209.85.214.50]:50563 "EHLO
	mail-bk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754224Ab3GWHqB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 03:46:01 -0400
Received: by mail-bk0-f50.google.com with SMTP id ik5so180080bkc.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2013 00:45:59 -0700 (PDT)
In-Reply-To: <CAKew6eX5JperTq4Quo_mPR8L638_VfqTnDvz_kmmTjDNNykYOg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, kgene@kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>

On Tuesday 23 of July 2013 13:04:58 Yadwinder Singh Brar wrote:
> On Mon, Jul 22, 2013 at 6:37 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> > On Monday 22 of July 2013 06:23:06 Thomas Abraham wrote:
> >> On 13 July 2013 04:57, Yadwinder Singh Brar <yadi.brar@samsung.com>
> > 
> > wrote:
> >> > Presently, using exynos_defconfig with CONFIG_DEBUG_LL and
> >> > CONFIG_EARLY_PRINTK on, kernel is not booting, we are getting
> >> > following:
> >> > 
> >> > [    0.000000] ------------[ cut here ]------------
> >> > [    0.000000] kernel BUG at mm/vmalloc.c:1134!
> >> > [    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> >> > [    0.000000] Modules linked in:
> >> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.11.0-rc1
> >> > #633
> >> > [    0.000000] task: c052ec48 ti: c0524000 task.ti: c0524000
> >> > [    0.000000] PC is at vm_area_add_early+0x54/0x94
> >> > [    0.000000] LR is at add_static_vm_early+0xc/0x60
> >> > 
> >> > Its because iotable_init tries to map UART again which is already
> >> > mapped by debug_ll_io_init() call in exynos_init_io() within same
> >> > virtal address range as requested later.
> >> 
> >> debug_ll_io_init ioremaps debug uart address space with 4KB size
> >> whereas the exynos_init_io() function ioremaps a single 512KB memory
> >> size for all the four uart ports which envelops the mapping created
> >> by
> >> debug_ll_io_init. This is caught as a kernel bug.
> > 
> > Right.
> > 
> >> > This issue seems to be occured after :
> >> > commit ee4de5d99aeac44f4507b7538b2b3faedc5205b9
> >> > ARM: 7781/1: mmu: Add debug_ll_io_init() mappings to early mappings
> >> > 
> >> > This patch moves S3C_UART iodesc(in iodesc_list) inside
> >> > CONFIG_DEBUG_LL
> >> > check.
> >> 
> >> Instead of moving, all the such iodesc entries for UART controller
> >> can
> >> be removed for all Samsung SoC's now since the Samsung uart driver
> >> does a ioremap during probe and any needed iomapping for earlyprintk
> >> is handled by debug_ll_io_init().
> > 
> > Yes. This mapping should not be here, but...
> > 
> > If you look at plat-samsung/pm.c, there is a debugging code that
> > relies on presence of this mapping.
> 
> Thanks for pointing this, I completely missed it.
> 
> >So until this gets fixed/removed (I'm working on
> >
> > it right now), I'd suggest keeping Yadwinder's solution.
> 
> But that debugging code is under "CONFIG_SAMSUNG_PM_DEBUG"
> and SAMSUNG_PM_DEBUG selects DEBUG_LL also.
> So the problem you stated below will their always when ever it will
> enter that code

Makes sense.

> > The only problem is that the code in pm.c expects _all_ UARTs to be
> > mapped (see s3c_pm_resture_uarts() and co.), so in case of DEBUG_LL
> > enabled, something must be done ensure that rest of the ports are
> > mapped.
> how about fixing this problem with something like below:
> saving only mapped/configured UART's registers.
> 
> 8<----------------------------------------------------------------------
> ---------------------------------- diff --git
> a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c index
> ea36136..34a7371 100644
> --- a/arch/arm/plat-samsung/pm.c
> +++ b/arch/arm/plat-samsung/pm.c
> @@ -102,10 +102,8 @@ static void s3c_pm_save_uart(unsigned int uart,
> struct pm_u static void s3c_pm_save_uarts(void)
>  {
>         struct pm_uart_save *save = uart_save;
> -       unsigned int uart;
> 
> -       for (uart = 0; uart < CONFIG_SERIAL_SAMSUNG_UARTS; uart++,
> save++) -               s3c_pm_save_uart(uart, save);
> +       s3c_pm_save_uart(CONFIG_DEBUG_S3C_UART, save);
>  }
> 
>  static void s3c_pm_restore_uart(unsigned int uart, struct pm_uart_save
> *save)
> 
> 8<----------------------------------------------------------------------
> ------------------------------------

Looks good to me.

Best regards,
Tomasz
