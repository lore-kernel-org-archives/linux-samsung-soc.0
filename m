From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V5 5/5] ARM: exynos: Enable l2 configuration through
 device tree
Date: Wed, 4 Jan 2012 20:36:12 -0800
Message-ID: <CAOesGMjb5no9o0kwiVm87XM8Q5QsMWdXhAypCmJMi7npy1fnSA@mail.gmail.com>
References: <1325737525-12869-1-git-send-email-amit.kachhap@linaro.org>
	<1325737525-12869-6-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:57643 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757931Ab2AEEgM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 23:36:12 -0500
Received: by yenm11 with SMTP id m11so32867yen.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jan 2012 20:36:12 -0800 (PST)
In-Reply-To: <1325737525-12869-6-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On Wed, Jan 4, 2012 at 8:25 PM, Amit Daniel Kachhap
<amit.kachhap@linaro.org> wrote:
> This patch enables calling generic l2 setup functions if device tree =
is used.
>
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
> ---
> =A0arch/arm/mach-exynos/common.c | =A0 14 ++++++++++++--
> =A01 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/com=
mon.c
> index f8bb808..e91b92d 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -47,6 +47,8 @@
> =A0#include <plat/regs-serial.h>
>
> =A0#include "common.h"
> +#define L2_AUX_VAL 0x7C470001
> +#define L2_AUX_MASK 0xC200ffff
>
> =A0static const char name_exynos4210[] =3D "EXYNOS4210";
> =A0static const char name_exynos4212[] =3D "EXYNOS4212";
> @@ -453,6 +455,15 @@ core_initcall(exynos4_core_init);
> =A0#ifdef CONFIG_CACHE_L2X0
> =A0static int __init exynos4_l2x0_cache_init(void)
> =A0{
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 ret =3D l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
> + =A0 =A0 =A0 if (!ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 l2x0_regs_phys =3D virt_to_phys(&l2x0_s=
aved_regs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clean_dcache_area(&l2x0_regs_phys, size=
of(unsigned long));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> +#endif

No need for ifdef here, if CONFIG_OF is off, then there's a static
inline version of l2x_of_init() that will return -ENODEV.


-Olof
