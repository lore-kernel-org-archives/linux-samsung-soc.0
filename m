From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/6] ARM: S5P6442: Add Samsung S5P6442 CPU support
Date: Mon, 25 Jan 2010 03:45:14 +0000
Message-ID: <20100125034514.GA15870@trinity.fluff.org>
References: <1264377237-9138-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:43568 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752331Ab0AYDpV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 22:45:21 -0500
Content-Disposition: inline
In-Reply-To: <1264377237-9138-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jan 25, 2010 at 08:53:57AM +0900, Kukjin Kim wrote:

Sorry, further comments that got missed last time.

> diff --git a/arch/arm/mach-s5p6442/Makefile b/arch/arm/mach-s5p6442/Makefile
> new file mode 100644
> index 0000000..b2271c0
> --- /dev/null
> +++ b/arch/arm/mach-s5p6442/Makefile
> @@ -0,0 +1,19 @@
> +# arch/arm/mach-s5p6442/Makefile
> +#
> +# Copyright (c) 2010 Samsung Electronics Co., Ltd.
> +#		http://www.samsung.com/
> +#
> +# Licensed under GPLv2
> +
> +obj-y				:=
> +obj-m				:=
> +obj-n				:=
> +obj-				:=
> +
> +# Core support for S5P6442 system
> +
> +obj-$(CONFIG_CPU_S5P6442)	+= cpu.o s5p6442-init.o s5p6442-clock.o

Why not call these init.o and clock.o? no need to have s5p6442 infront.

Plus s5p6442-clock.c isn't even in this patch, so s5p6442-clock.o shouldn't
be added here.

> +# machine support
> +
> +obj-$(CONFIG_MACH_SMDK6442)	+= mach-smdk6442.o

Same for this, mach-smdk6442.c isn't in this patch so this line shouldn't
be here.

> diff --git a/arch/arm/mach-s5p6442/include/mach/debug-macro.S b/arch/arm/mach-s5p6442/include/mach/debug-macro.S
> new file mode 100644
> index 0000000..1b3ab4d
> --- /dev/null
> +++ b/arch/arm/mach-s5p6442/include/mach/debug-macro.S
> @@ -0,0 +1,39 @@
> +/* linux/arch/arm/mach-s5p6442/include/mach/debug-macro.S
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * Based on arch/arm/mach-s3c6400/include/mach/debug-macro.S
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/* pull in the relevant register and map files. */
> +
> +#include <mach/map.h>
> +#include <plat/regs-serial.h>
> +
> +	/* note, for the boot process to work we have to keep the UART
> +	 * virtual address aligned to an 1MiB boundary for the L1
> +	 * mapping the head code makes. We keep the UART virtual address
> +	 * aligned and add in the offset when we load the value here.
> +	 */
> +
> +	.macro addruart, rx
> +		mrc	p15, 0, \rx, c1, c0
> +		tst	\rx, #1
> +		ldreq	\rx, = S5P_PA_UART
> +		ldrne	\rx, = (S5P_VA_UART + S5P_PA_UART & 0xfffff)
> +#if CONFIG_DEBUG_S3C_UART != 0
> +		add	\rx, \rx, #(0x400 * CONFIG_DEBUG_S3C_UART)
> +#endif
> +	.endm
> +
> +/* include the reset of the code which will do the work, we're only
> + * compiling for a single cpu processor type so the default of s3c2440
> + * will be fine with us.
> + */
> +
> +#include <plat/debug-macro.S>

We acutally have a code problem here, since we're relying on the
default FIFO settings and the S5P6442/S5PV210 UARTs do not use the
same UFSTAT register layout as the previous SoCs do.

arch/arm/plat-s3c/include/plat/debug-macro.S:

    17          .macro fifo_level_s3c2440 rd, rx
    18                  ldr     \rd, [ \rx, # S3C2410_UFSTAT ]
    19                  and     \rd, \rd, #S3C2440_UFSTAT_TXMASK
    20          .endm
    21
    22  #ifndef fifo_level
    23  #define fifo_level fifo_level_s3c2440
    24  #endif
    25
    26          .macro  fifo_full_s3c2440 rd, rx
    27                  ldr     \rd, [ \rx, # S3C2410_UFSTAT ]
    28                  tst     \rd, #S3C2440_UFSTAT_TXFULL
    29          .endm
    30
    31  #ifndef fifo_full
    32  #define fifo_full fifo_full_s3c2440
    33  #endif

Show we use the s3c2440 versions for fifo_level and fifo_full if they
have not been defined before including this file.

from arch/arm/plat-s3c/include/plat/regs-serial.h:
   167  #define S3C2440_UFSTAT_TXFULL     (1<<14)
   171  #define S3C2440_UFSTAT_TXMASK     (63<<8)

   220  #define S5PV210_UFSTAT_TXFULL   (1<<24)
   222  #define S5PV210_UFSTAT_TXMASK   (255<<16)

Note the different positions of the TXUFLL and TXMASK bits.

This means you'll ave to define your own fifo_full and fifo_level
settings and the relevant macros for them.

Further patches snipped.
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
