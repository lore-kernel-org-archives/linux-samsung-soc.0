From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 04/11] ARM: EXYNOS: add interrupt definitions for EXYNOS5250
Date: Thu, 16 Feb 2012 16:10:13 -0800
Message-ID: <CAOesGMhmcnt6LPb9O+3420VgG=PiCnOjzZA3JqsA=4OdHN-R-g@mail.gmail.com>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
	<1328981685-8602-5-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:54361 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753981Ab2BQAKO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 19:10:14 -0500
Received: by yenm8 with SMTP id m8so1612960yen.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 16:10:13 -0800 (PST)
In-Reply-To: <1328981685-8602-5-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de

Hi,

On Sat, Feb 11, 2012 at 9:34 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch adds the interrupt definitions for EXYNOS5250 at
> <mach/irqs.h> file. Basically, now it is needed for EXYNOS5250
> interrupt and will be updated for single zImage next time.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos/include/mach/irqs.h | =A0236 ++++++++++++++++=
+++++++++++++-
> =A01 files changed, 232 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach=
-exynos/include/mach/irqs.h
> index f77bce0..0dab1b1 100644
> --- a/arch/arm/mach-exynos/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
> @@ -1,9 +1,8 @@
> -/* linux/arch/arm/mach-exynos4/include/mach/irqs.h
> - *
> - * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> +/*
> + * Copyright (c) 2010-2012 Samsung Electronics Co., Ltd.
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> =A0*
> - * EXYNOS4 - IRQ definitions
> + * EXYNOS - IRQ definitions
> =A0*
> =A0* This program is free software; you can redistribute it and/or mo=
dify
> =A0* it under the terms of the GNU General Public License version 2 a=
s
> @@ -25,6 +24,8 @@
>
> =A0#define IRQ_SPI(x) =A0 =A0 =A0 =A0 =A0 =A0 (x+32)
>
> +#ifdef CONFIG_ARCH_EXYNOS4
> +

irqs.h seems to be one of the major files that causes conflicts if a
combined EXYNOS4+5 kernel is built (after editing Kconfig to allow
both). Can you please try to come up with a way to allow both of them
to coexist instead of making them exclusive?


-Olof



-Olof
