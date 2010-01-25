From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: S5P: Move System support header and Uncompress
	code
Date: Mon, 25 Jan 2010 10:39:17 +0000
Message-ID: <20100125103917.GW10014@trinity.fluff.org>
References: <1264394661-7469-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:38198 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753221Ab0AYKjW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2010 05:39:22 -0500
Content-Disposition: inline
In-Reply-To: <1264394661-7469-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jan 25, 2010 at 01:44:21PM +0900, Kukjin Kim wrote:
> This patch moves system support and uncompress common codes for S5P into
> plat-s5p/include/mach from mach-s5p6440/include/mach.

Russell doesn't like this so we need to revert to the previous policy
of putting these in arch/arm/mach-xxx/include/mach
 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/include/mach/system.h     |   26 -----------------------
>  arch/arm/mach-s5p6440/include/mach/uncompress.h |   24 ---------------------
>  arch/arm/plat-s5p/include/mach/system.h         |   26 +++++++++++++++++++++++
>  arch/arm/plat-s5p/include/mach/uncompress.h     |   24 +++++++++++++++++++++
>  4 files changed, 50 insertions(+), 50 deletions(-)
>  delete mode 100644 arch/arm/mach-s5p6440/include/mach/system.h
>  delete mode 100644 arch/arm/mach-s5p6440/include/mach/uncompress.h
>  create mode 100644 arch/arm/plat-s5p/include/mach/system.h
>  create mode 100644 arch/arm/plat-s5p/include/mach/uncompress.h
> 
> diff --git a/arch/arm/mach-s5p6440/include/mach/system.h b/arch/arm/mach-s5p6440/include/mach/system.h
> deleted file mode 100644
> index d2dd817..0000000
> --- a/arch/arm/mach-s5p6440/include/mach/system.h
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -/* linux/arch/arm/mach-s5p6440/include/mach/system.h
> - *
> - * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com/
> - *
> - * S5P6440 - system support header
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -#ifndef __ASM_ARCH_SYSTEM_H
> -#define __ASM_ARCH_SYSTEM_H __FILE__
> -
> -static void arch_idle(void)
> -{
> -	/* nothing here yet */
> -}
> -
> -static void arch_reset(char mode, const char *cmd)
> -{
> -	/* nothing here yet */
> -}
> -
> -#endif /* __ASM_ARCH_SYSTEM_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/uncompress.h b/arch/arm/mach-s5p6440/include/mach/uncompress.h
> deleted file mode 100644
> index 7c1f600..0000000
> --- a/arch/arm/mach-s5p6440/include/mach/uncompress.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/* linux/arch/arm/mach-s5p6440/include/mach/uncompress.h
> - *
> - * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> - *		http://www.samsung.com/
> - *
> - * S5P6440 - uncompress code
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> -*/
> -
> -#ifndef __ASM_ARCH_UNCOMPRESS_H
> -#define __ASM_ARCH_UNCOMPRESS_H
> -
> -#include <mach/map.h>
> -#include <plat/uncompress.h>
> -
> -static void arch_detect_cpu(void)
> -{
> -	/* we do not need to do any cpu detection here at the moment. */
> -}
> -
> -#endif /* __ASM_ARCH_UNCOMPRESS_H */
> diff --git a/arch/arm/plat-s5p/include/mach/system.h b/arch/arm/plat-s5p/include/mach/system.h
> new file mode 100644
> index 0000000..3544536
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/mach/system.h
> @@ -0,0 +1,26 @@
> +/* linux/arch/arm/plat-s5p/include/mach/system.h
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P - system support header
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_SYSTEM_H
> +#define __ASM_ARCH_SYSTEM_H __FILE__
> +
> +static void arch_idle(void)
> +{
> +	/* nothing here yet */
> +}
> +
> +static void arch_reset(char mode, const char *cmd)
> +{
> +	/* nothing here yet */
> +}
> +
> +#endif /* __ASM_ARCH_SYSTEM_H */
> diff --git a/arch/arm/plat-s5p/include/mach/uncompress.h b/arch/arm/plat-s5p/include/mach/uncompress.h
> new file mode 100644
> index 0000000..c673399
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/mach/uncompress.h
> @@ -0,0 +1,24 @@
> +/* linux/arch/arm/plat-s5p/include/mach/uncompress.h
> + *
> + * Copyright (c) 2009 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P - uncompress code
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_UNCOMPRESS_H
> +#define __ASM_ARCH_UNCOMPRESS_H __FILE__
> +
> +#include <mach/map.h>
> +#include <plat/uncompress.h>
> +
> +static void arch_detect_cpu(void)
> +{
> +	/* we do not need to do any cpu detection here at the moment. */
> +}
> +
> +#endif /* __ASM_ARCH_UNCOMPRESS_H */
> -- 
> 1.6.2.5
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
