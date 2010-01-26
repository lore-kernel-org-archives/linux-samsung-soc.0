From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/6] ARM: S5P6442: Add Samsung S5P6442 CPU support
Date: Tue, 26 Jan 2010 05:20:59 +0000
Message-ID: <20100126052059.GX10014@trinity.fluff.org>
References: <1264377237-9138-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40719 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750826Ab0AZFVL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 00:21:11 -0500
Content-Disposition: inline
In-Reply-To: <1264377237-9138-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jan 25, 2010 at 08:53:57AM +0900, Kukjin Kim wrote:
> This patch adds support for Samsung S5P6442 CPU. This patch also adds
> an entry for S5P6442 cpu in plat-s5p cpu table.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

[snip]

This is a clarifction / extra comment on my previous review as
requested in private. Posted here as it is useful to everyone involved.

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

If someone had read the above comment before copying this file, they
would have realised it is un-necessary for the current support as the
UART blocks in all the s5p6440, s5p6442 and the v210 are aligned on
one-megabyte boundaries and as such are suitable for mapping on 1MiB
L1 section boundaries.

This should removed from both the 6442 and s5pv210 before submission.

> +	.macro addruart, rx
> +		mrc	p15, 0, \rx, c1, c0
> +		tst	\rx, #1
> +		ldreq	\rx, = S5P_PA_UART
> +		ldrne	\rx, = (S5P_VA_UART + S5P_PA_UART & 0xfffff)

again, since we're one a 1MiB boundary we can lose the + S5P_PA_UART & 0xfffff
from this.

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

As for the debug-macro.S core in arch/arm/plat-s3c/include/plat/debug-macro.S
you can (and it would be advisable) to add the relevant v210 macros so
that both the v210 and the 6442 can use them in their local files...

so possibly:

	.macro fifo_full_v210 rd, rx
	....
	.endm

	.macro fifo_level_v210 rd, rx
	....
	.endm

PS, you will want to edit the v210 code to fix this too.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
