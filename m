From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RESEND][PATCH] gpio/samsung: Fix incorrect gpio pull up/down
 callback for Exynos4
Date: Sun, 9 Oct 2011 17:10:03 -0600
Message-ID: <CACxGe6v1COBz_USrg=xrXvzg=fZptYi08MsEzun2Td04BM3BJQ@mail.gmail.com>
References: <1318185325-32256-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:45612 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751123Ab1JIXKY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Oct 2011 19:10:24 -0400
Received: by vws1 with SMTP id 1so4220220vws.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Oct 2011 16:10:23 -0700 (PDT)
In-Reply-To: <1318185325-32256-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Sun, Oct 9, 2011 at 12:35 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> Some of the gpio chips of exynos4 are assigned a default gpio config =
without
> the exynos4 specific pull up/down callbacks which resulted in incorre=
ct
> setting of pull up/down configuration.
>
> Fix this by adding two new exynos4 specific entries in the array of d=
efault
> configs with set_pull and get_pull callbacks set to exynos4 specific =
callbacks
> The new default gpio configs can then be used for exynos4 gpio chips.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Hi Thomas,

Does this need to be merged as a bug fix for v3.1, or is it for v3.2?
Does it have any dependencies, or can it go in via the gpio/next tree?

g.

> ---
> =A0drivers/gpio/gpio-samsung.c | =A0 31 +++++++++++++++++++----------=
--
> =A01 files changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.=
c
> index 037d3bb..b33cad3 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -486,7 +486,14 @@ static struct samsung_gpio_cfg samsung_gpio_cfgs=
[] =3D {
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.set_config =A0 =A0 =3D samsung_gpio_s=
etcfg_2bit,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.get_config =A0 =A0 =3D samsung_gpio_g=
etcfg_2bit,
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .set_pull =A0 =A0 =A0 =3D exynos4_gpio_=
setpull,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .get_pull =A0 =A0 =A0 =3D exynos4_gpio_=
getpull,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .cfg_eint =A0 =A0 =A0 =3D 0x3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .set_pull =A0 =A0 =A0 =3D exynos4_gpio_=
setpull,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .get_pull =A0 =A0 =A0 =3D exynos4_gpio_=
getpull,
> + =A0 =A0 =A0 }
> =A0};
>
> =A0/*
> @@ -2253,49 +2260,49 @@ static struct samsung_gpio_chip exynos4_gpios=
_2[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPL2",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[0],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[8],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPY0(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D EXYNOS4_=
GPIO_Y0_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPY0",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[0],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[8],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPY1(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D EXYNOS4_=
GPIO_Y1_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPY1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[0],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[8],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPY2(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D EXYNOS4_=
GPIO_Y2_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPY2",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[0],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[8],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPY3(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D EXYNOS4_=
GPIO_Y3_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPY3",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[0],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[8],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPY4(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D EXYNOS4_=
GPIO_Y4_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPY4",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[0],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[8],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPY5(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D EXYNOS4_=
GPIO_Y5_NR,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.label =A0=3D "GPY5",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[0],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[8],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPY6(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ngpio =A0=3D EXYNOS4_=
GPIO_Y6_NR,
> @@ -2303,7 +2310,7 @@ static struct samsung_gpio_chip exynos4_gpios_2=
[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D (S5P_VA_GPIO2 + 0xC00),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[3],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[9],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq_base =3D IRQ_EINT(0),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPX0(0),
> @@ -2313,7 +2320,7 @@ static struct samsung_gpio_chip exynos4_gpios_2=
[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D (S5P_VA_GPIO2 + 0xC20),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[3],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[9],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq_base =3D IRQ_EINT(8),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPX1(0),
> @@ -2323,7 +2330,7 @@ static struct samsung_gpio_chip exynos4_gpios_2=
[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D (S5P_VA_GPIO2 + 0xC40),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[3],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[9],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq_base =3D IRQ_EINT(16),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPX2(0),
> @@ -2333,7 +2340,7 @@ static struct samsung_gpio_chip exynos4_gpios_2=
[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D (S5P_VA_GPIO2 + 0xC60),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[3],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .config =3D &samsung_gpio_cfgs[9],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.irq_base =3D IRQ_EINT(24),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.chip =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.base =A0 =3D EXYNOS4_=
GPX3(0),
> --
> 1.6.6.rc2
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
