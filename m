From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/5] ARM: Add interface for registering and calling
 firmware-specific operations
Date: Fri, 21 Sep 2012 22:50:15 -0700
Message-ID: <20120922055015.GD32245@quad.lixom.net>
References: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
 <1347524018-19301-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43670 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753366Ab2IVFuF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Sep 2012 01:50:05 -0400
Received: by pbbrr4 with SMTP id rr4so3996840pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Sep 2012 22:50:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1347524018-19301-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de

On Thu, Sep 13, 2012 at 10:13:35AM +0200, Tomasz Figa wrote:
> Some boards are running with secure firmware running in TrustZone sec=
ure
> world, which changes the way some things have to be initialized.
>=20
> This patch adds an interface for platforms to specify available firmw=
are
> operations and call them.
>=20
> A wrapper macro, call_firmware_op(), checks if the operation is provi=
ded
> and calls it if so, otherwise returns 0.
>=20
> By default no operations are provided.
>=20
> This is a follow-up on the patch by Kyungmin Park:
> [PATCH v5 1/2] ARM: Make a compile firmware conditionally
> http://thread.gmane.org/gmane.linux.ports.arm.kernel/183607/focus=3D1=
83988
>=20
> Example of use:
>=20
> In code using firmware ops:
>=20
> 	__raw_writel(virt_to_phys(exynos4_secondary_startup),
> 		CPU1_BOOT_REG);
>=20
> 	/* Call Exynos specific smc call */
> 	do_firmware_op(cpu_boot, cpu);
>=20
> 	gic_raise_softirq(cpumask_of(cpu), 1);
>=20
> In board-/platform-specific code:
>=20
> 	static int platformX_do_idle(void)
> 	{
> 		/* tell platformX firmware to enter idle */
> 	        return 0;
> 	}
>=20
> 	static void platformX_cpu_boot(int i)
> 	{
> 		/* tell platformX firmware to boot CPU i */
> 	}
>=20
> 	static const struct firmware_ops platformX_firmware_ops __initdata =3D=
 {
> 		.do_idle	=3D exynos_do_idle,
> 		.cpu_boot	=3D exynos_cpu_boot,
> 		/* cpu_boot_reg not available on platformX */
> 	};
>=20
> 	static void __init board_init_early(void)
> 	{
> 	=A0=A0=A0=A0=A0=A0=A0=A0register_firmware_ops(&platformX_firmware_op=
s);
> 	}
>=20
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/common/Makefile        |  2 ++
>  arch/arm/common/firmware.c      | 18 ++++++++++++++++++
>  arch/arm/include/asm/firmware.h | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)
>  create mode 100644 arch/arm/common/firmware.c
>  create mode 100644 arch/arm/include/asm/firmware.h
>=20
> diff --git a/arch/arm/common/Makefile b/arch/arm/common/Makefile
> index e8a4e58..55d4182 100644
> --- a/arch/arm/common/Makefile
> +++ b/arch/arm/common/Makefile
> @@ -2,6 +2,8 @@
>  # Makefile for the linux kernel.
>  #
> =20
> +obj-y +=3D firmware.o
> +
>  obj-$(CONFIG_ARM_GIC)		+=3D gic.o
>  obj-$(CONFIG_ARM_VIC)		+=3D vic.o
>  obj-$(CONFIG_ICST)		+=3D icst.o
> diff --git a/arch/arm/common/firmware.c b/arch/arm/common/firmware.c
> new file mode 100644
> index 0000000..27ddccb
> --- /dev/null
> +++ b/arch/arm/common/firmware.c
> @@ -0,0 +1,18 @@
> +/*
> + * Copyright (C) 2012 Samsung Electronics.
> + * Kyungmin Park <kyungmin.park@samsung.com>
> + * Tomasz Figa <t.figa@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/suspend.h>
> +
> +#include <asm/firmware.h>
> +
> +static const struct firmware_ops default_firmware_ops;
> +
> +const struct firmware_ops *firmware_ops =3D &default_firmware_ops;
> diff --git a/arch/arm/include/asm/firmware.h b/arch/arm/include/asm/f=
irmware.h
> new file mode 100644
> index 0000000..ed51b02
> --- /dev/null
> +++ b/arch/arm/include/asm/firmware.h
> @@ -0,0 +1,30 @@
> +/*
> + * Copyright (C) 2012 Samsung Electronics.
> + * Kyungmin Park <kyungmin.park@samsung.com>
> + * Tomasz Figa <t.figa@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __ASM_ARM_FIRMWARE_H
> +#define __ASM_ARM_FIRMWARE_H
> +
> +struct firmware_ops {
> +	int (*do_idle)(void);
> +	void (*cpu_boot)(int cpu);
> +	void __iomem *(*cpu_boot_reg)(int cpu);
> +};
> +
> +extern const struct firmware_ops *firmware_ops;
> +
> +#define call_firmware_op(op, ...)					\
> +	((firmware_ops->op) ? firmware_ops->op(__VA_ARGS__) : 0)

I think this will cause sparse warnings for call_firmware_op(cpu_boot_r=
eg)
if there are no ops defined, since the '0' isn't annotated as __iomem. =
And
you can't annotate it since the other function pointers don't need it.

I think you might be better off with stub functions as fallbacks instea=
d of
allowing and checking for NULL here.


-Olof
