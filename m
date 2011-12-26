From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Mon, 26 Dec 2011 09:29:45 +0530
Message-ID: <CAK9yfHxxg0ftXis5tX5M5kc8+z=tg_AB3t6L-BakRQCVLi-K1g@mail.gmail.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
	<1323446682-25252-3-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:57615 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753558Ab1LZD7q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 Dec 2011 22:59:46 -0500
Received: by qcqz2 with SMTP id z2so6429852qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Dec 2011 19:59:46 -0800 (PST)
In-Reply-To: <1323446682-25252-3-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

Hi Kamil,


On 9 December 2011 21:34, Kamil Debski <k.debski@samsung.com> wrote:
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0arch/arm/mach-exynos/Kconfig =A0 =A0 | =A0 =A01 +
> =A0arch/arm/mach-exynos/mach-nuri.c | =A0 =A01 +
> =A02 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kcon=
fig
> index 0afcc3b..176092c 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -171,6 +171,7 @@ config MACH_SMDKV310
> =A0 =A0 =A0 =A0select S5P_DEV_FIMC1
> =A0 =A0 =A0 =A0select S5P_DEV_FIMC2
> =A0 =A0 =A0 =A0select S5P_DEV_FIMC3
> + =A0 =A0 =A0 select S5P_DEV_G2D

Shouldn't this entry be under  "config MACH_NURI" instead of  MACH_SMDK=
V310 ?


> =A0 =A0 =A0 =A0select S5P_DEV_I2C_HDMIPHY
> =A0 =A0 =A0 =A0select S5P_DEV_MFC
> =A0 =A0 =A0 =A0select S5P_DEV_TV
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/=
mach-nuri.c
> index 236bbe1..5251e91 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -1262,6 +1262,7 @@ static struct platform_device *nuri_devices[] _=
_initdata =3D {
> =A0 =A0 =A0 =A0&s3c_device_i2c3,
> =A0 =A0 =A0 =A0&i2c9_gpio,
> =A0 =A0 =A0 =A0&s3c_device_adc,
> + =A0 =A0 =A0 &s5p_device_g2d,
> =A0 =A0 =A0 =A0&s3c_device_rtc,
> =A0 =A0 =A0 =A0&s5p_device_mfc,
> =A0 =A0 =A0 =A0&s5p_device_mfc_l,
> --
> 1.7.0.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--
With warm regards,
Sachin
