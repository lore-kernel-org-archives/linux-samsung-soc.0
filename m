From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: [PATCH 8/9] ARM: EXYNOS: suspend requires regulator access
Date: Wed, 4 Mar 2015 20:44:07 +0100
Message-ID: <CAJKOXPf6eY4oZZe3tG51QnRhsvFuOVRmYsEpc4g0bwyAfip0EQ@mail.gmail.com>
References: <1423769746-582629-1-git-send-email-arnd@arndb.de>
	<2062492.pEav958W9c@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:58007 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760113AbbCDToI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Mar 2015 14:44:08 -0500
Received: by mail-vc0-f175.google.com with SMTP id hq12so16625554vcb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2015 11:44:07 -0800 (PST)
In-Reply-To: <2062492.pEav958W9c@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arm@kernel.org" <arm@kernel.org>, javier.martinez@collabora.co.uk, broonie@kernel.org

W dniu poniedzia=C5=82ek, 2 marca 2015 Arnd Bergmann <arnd@arndb.de> na=
pisa=C5=82(a):
>
> Building an exynos kernel without regulators but with suspend enabled=
 results
> in a link error:
>
> arch/arm/mach-exynos/built-in.o: In function `exynos_suspend_finish':
> arch/arm/mach-exynos/suspend.c:532: undefined reference to `regulator=
_suspend_finish'
> arch/arm/mach-exynos/built-in.o: In function `exynos_suspend_prepare'=
:
> arch/arm/mach-exynos/suspend.c:515: undefined reference to `regulator=
_suspend_prepare'
>
> This adds an appropriate 'select' statement in Kconfig to ensure the =
symbols
> are available.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Isn't this fixed already by:=C2=A0https://lkml.org/lkml/2015/2/4/119
(applied by Mark Brown)?

I can't test it now (I am out of office) but issue looks quite similar.

Best regards,
Krzysztof

>
> ---
> =C2=A0arch/arm/mach-exynos/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kcon=
fig
> index 603820e5aba7..f4bd06370ad8 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -22,6 +22,7 @@ menuconfig ARCH_EXYNOS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 select PINCTRL
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 select PINCTRL_EXYNOS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 select PM_GENERIC_DOMAINS if PM
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0select REGULATOR if PM_SLEEP
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 select S5P_DEV_MFC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 select SRAM
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 select MFD_SYSCON
> --
> 2.1.0.rc2
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
