From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Enable G2D on SMDKV310
Date: Mon, 13 Feb 2012 09:54:50 +0530
Message-ID: <CAK9yfHzTE6mt9z1W+ap8_i8+ziPSGuvaz+Pg0_raGA-KyiR4jQ@mail.gmail.com>
References: <1325492711-15012-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:60567 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754793Ab2BMEYv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Feb 2012 23:24:51 -0500
Received: by qcqw6 with SMTP id w6so2742332qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Feb 2012 20:24:50 -0800 (PST)
In-Reply-To: <1325492711-15012-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com

ping

On 2 January 2012 13:55, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> This patch enables G2D support on SMDKV310 board.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> =A0arch/arm/mach-exynos/Kconfig =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0arch/arm/mach-exynos/mach-smdkv310.c | =A0 =A01 +
> =A02 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kcon=
fig
> index bd4600e..a673d0d 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -183,6 +183,7 @@ config MACH_SMDKV310
> =A0 =A0 =A0 =A0select S5P_DEV_FIMC1
> =A0 =A0 =A0 =A0select S5P_DEV_FIMC2
> =A0 =A0 =A0 =A0select S5P_DEV_FIMC3
> + =A0 =A0 =A0 select S5P_DEV_G2D
> =A0 =A0 =A0 =A0select S5P_DEV_I2C_HDMIPHY
> =A0 =A0 =A0 =A0select S5P_DEV_MFC
> =A0 =A0 =A0 =A0select S5P_DEV_TV
> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exy=
nos/mach-smdkv310.c
> index b2c5557..8a5c23b 100644
> --- a/arch/arm/mach-exynos/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
> @@ -270,6 +270,7 @@ static struct platform_device *smdkv310_devices[]=
 __initdata =3D {
> =A0 =A0 =A0 =A0&s5p_device_fimc1,
> =A0 =A0 =A0 =A0&s5p_device_fimc2,
> =A0 =A0 =A0 =A0&s5p_device_fimc3,
> + =A0 =A0 =A0 &s5p_device_g2d,
> =A0 =A0 =A0 =A0&exynos4_device_ac97,
> =A0 =A0 =A0 =A0&exynos4_device_i2s0,
> =A0 =A0 =A0 =A0&exynos4_device_ohci,
> --
> 1.7.4.1
>
