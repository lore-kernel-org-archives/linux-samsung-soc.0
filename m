From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 2/3] ARM: S5P: Add System define for arch_reset()
Date: Thu, 24 Jun 2010 10:35:27 +0900
Message-ID: <AANLkTim2s6syCjpl5v_qVloktrzz27JsSrR6kgWqNHUm@mail.gmail.com>
References: <1277332317-30192-1-git-send-email-kgene.kim@samsung.com>
	<1277332317-30192-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:56865 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754134Ab0FXBf2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 21:35:28 -0400
Received: by pxi7 with SMTP id 7so496840pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jun 2010 18:35:28 -0700 (PDT)
In-Reply-To: <1277332317-30192-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>

On Thu, Jun 24, 2010 at 7:31 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Jongpill Lee <boyko.lee@samsung.com>
>
> This patch adds system define for arch_reset() using Watchdog reset.
> And adds IO mapping for using WDT.

Are there any reason to use the WDT to system reset?
As original purpose of WDT. doesn't it better to use system reset?
Since we use the WDT reset at other purpose. but if you add the WDT
reset to system reset.
then we can't control it. bootloader check the reset reason then
report something wrong at previous operation.

So I want to use system reset as original purpose.

Thank you,
Kyungmin Park

>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/plat-s5p/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A05 +++++
> =A0arch/arm/plat-s5p/include/plat/system-reset.h | =A0 24 +++++++++++=
+++++++++++++
> =A02 files changed, 29 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/plat-s5p/include/plat/system-reset.h
>
> diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
> index 75cb8c3..1ab55e8 100644
> --- a/arch/arm/plat-s5p/cpu.c
> +++ b/arch/arm/plat-s5p/cpu.c
> @@ -103,6 +103,11 @@ static struct map_desc s5p_iodesc[] __initdata =3D=
 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5P_PA_GPIO),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_WATCHDOG,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_WDT),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> =A0 =A0 =A0 =A0},
> =A0};
>
> diff --git a/arch/arm/plat-s5p/include/plat/system-reset.h b/arch/arm=
/plat-s5p/include/plat/system-reset.h
> new file mode 100644
> index 0000000..7f76a16
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/plat/system-reset.h
> @@ -0,0 +1,24 @@
> +/* linux/arch/arm/plat-s5p/include/plat/system-reset.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * Based on arch/arm/mach-s3c2410/include/mach/system-reset.h
> + *
> + * S5P - System define for arch_reset()
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <plat/watchdog-reset.h>
> +
> +static void arch_reset(char mode, const char *cmd)
> +{
> + =A0 =A0 =A0 /* Perform reset using Watchdog reset.
> + =A0 =A0 =A0 =A0* SWRESET support will be added later.
> + =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 arch_wdt_reset();
> +}
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
