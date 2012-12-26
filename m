From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v4 1/5] ARM: Add interface for registering and calling
 firmware-specific operations
Date: Wed, 26 Dec 2012 16:00:27 +0800
Message-ID: <CAGsJ_4xhE0dXmesBfZPgajeEUTWkO594rjy8qTKsN3fZ7LZNaQ@mail.gmail.com>
References: <1353599478-24617-1-git-send-email-t.figa@samsung.com>
	<1353599478-24617-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:50234 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751189Ab2LZIA3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 03:00:29 -0500
Received: by mail-la0-f42.google.com with SMTP id s15so10397564lag.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Dec 2012 00:00:28 -0800 (PST)
In-Reply-To: <1353599478-24617-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, tomasz.figa@gmail.com, kyungmin.park@samsung.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

2012/11/22, Tomasz Figa <t.figa@samsung.com>:
> Some boards are running with secure firmware running in TrustZone secure
> world, which changes the way some things have to be initialized.
>
> This patch adds an interface for platforms to specify available firmware
> operations and call them.
>
> A wrapper macro, call_firmware_op(), checks if the operation is provided
> and calls it if so, otherwise returns -ENOSYS to allow fallback to
> legacy operation..
>
> By default no operations are provided.
>
> Example of use:
>
> In code using firmware ops:
>
> 	__raw_writel(virt_to_phys(exynos4_secondary_startup),
> 		CPU1_BOOT_REG);
>
> 	/* Call Exynos specific smc call */
> 	if (call_firmware_op(cpu_boot, cpu) == -ENOSYS)
> 		cpu_boot_legacy(...); /* Try legacy way */
>
> 	gic_raise_softirq(cpumask_of(cpu), 1);
>
> In board-/platform-specific code:
>
> 	static int platformX_do_idle(void)
> 	{
> 		/* tell platformX firmware to enter idle */
> 	        return 0;
> 	}
>
> 	static int platformX_cpu_boot(int i)
> 	{
> 		/* tell platformX firmware to boot CPU i */
> 		return 0;
> 	}
>
> 	static const struct firmware_ops platformX_firmware_ops = {
> 		.do_idle	= exynos_do_idle,
> 		.cpu_boot	= exynos_cpu_boot,
> 		/* other operations not available on platformX */
> 	};

i am thinking the firmware_ops should be namespaced, some hardware has
firmware, firmware_ops should not be using a global namespace here.

>
> 	static void __init board_init_early(void)
> 	{
> 	        register_firmware_ops(&platformX_firmware_ops);
> 	}
>

-barry
