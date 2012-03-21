From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 05/12] ARM: EXYNOS: add support uart for EXYNOS4 and EXYNOS5
Date: Wed, 21 Mar 2012 14:43:53 +0530
Message-ID: <CAJuYYwTJsA1M1Qj2P1-1K=pWzi0BPo8YJNDSx4NqGC7NX0030g@mail.gmail.com>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
	<1331736138-28964-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:40731 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754947Ab2CUJNy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Mar 2012 05:13:54 -0400
Received: by wgbdr13 with SMTP id dr13so518427wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Mar 2012 02:13:53 -0700 (PDT)
In-Reply-To: <1331736138-28964-6-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, olof@lixom.net

On 14 March 2012 20:12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Actually, the base address of uart is different between EXYNOS4
> and EXYNOS5 and this patch enables to support uart for EXYNOS4
> and EXYNOS5 SoCs at runtime.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---

[...]

> diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S b/arch/a=
rm/mach-exynos/include/mach/debug-macro.S
> index 6cacf16..6c857ff 100644
> --- a/arch/arm/mach-exynos/include/mach/debug-macro.S
> +++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
> @@ -21,8 +21,13 @@
> =A0 =A0 =A0 =A0 */
>
> =A0 =A0 =A0 =A0.macro addruart, rp, rv, tmp
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \rp, =3D S3C_PA_UART
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \rv, =3D S3C_VA_UART
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 \rp, #0x10000000

This is physical address of Exynos4/5 CPUID register which cannot be
used here. And virtual address S5P_VA_CPUID also cannot be used here
since this will be called before paging_init when earlyprintk boot
param is used. So, with this change, earlyprintk does not work for
both Exynos4 and Exynos5.

Thanks,
Thomas.
