From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 06/27] ARM: S5P64X0: 2nd Change to using s3c_gpio_cfgpin_range()
Date: Sat, 2 Oct 2010 10:23:02 +0900
Message-ID: <AANLkTimBW5udfRN=0=ZHoAwkn+2ewyUX-0B5jLfrsT+i@mail.gmail.com>
References: <1285934724-5007-1-git-send-email-kgene.kim@samsung.com>
	<1285934724-5007-7-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:54180 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750706Ab0JBBXE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 21:23:04 -0400
Received: by wyb28 with SMTP id 28so3511507wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Oct 2010 18:23:02 -0700 (PDT)
In-Reply-To: <1285934724-5007-7-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

On Fri, Oct 1, 2010 at 9:05 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch changes the code setting ranges of GPIO pins in mach-s5p64=
x0 using
> s3c_gpio_cfgpin() to use the recently introduced s3c_gpio_cfgpin_rang=
e().
> NOTE: This is for missed things from the previous patch.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5p64x0/dev-spi.c =A0 =A0| =A0 24 ++++++++++++------=
------
> =A0arch/arm/mach-s5p64x0/setup-i2c0.c | =A0 =A06 ++----
> =A0arch/arm/mach-s5p64x0/setup-i2c1.c | =A0 =A06 ++----
> =A03 files changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm/mach-s5p64x0/dev-spi.c b/arch/arm/mach-s5p64x0/=
dev-spi.c
> index 5b69ec4..be64fee 100644
> --- a/arch/arm/mach-s5p64x0/dev-spi.c
> +++ b/arch/arm/mach-s5p64x0/dev-spi.c
> @@ -39,20 +39,18 @@ static char *s5p64x0_spi_src_clks[] =3D {
> =A0*/
> =A0static int s5p6440_spi_cfg_gpio(struct platform_device *pdev)
> =A0{
> + =A0 =A0 =A0 unsigned int base;
> +
> =A0 =A0 =A0 =A0switch (pdev->id) {
> =A0 =A0 =A0 =A0case 0:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(0), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(1), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(2), S3C_GPI=
O_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6440_GPC(0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(0), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(1), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(2), S3C_G=
PIO_PULL_UP);

Also make a wrapper, s3c_gpio_cfgrange_pullup, then you can also
remove above codes.
There's lots of codes use PULL_UP as default pin setup.

Thank you,
Kyungmin Park
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case 1:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(4), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(5), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPC(6), S3C_GPI=
O_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6440_GPC(4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(4), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(5), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPC(6), S3C_G=
PIO_PULL_UP);
> @@ -63,25 +61,25 @@ static int s5p6440_spi_cfg_gpio(struct platform_d=
evice *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 s3c_gpio_cfgpin_range(base, 3, S3C_GPIO_SFN(2));
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> =A0static int s5p6450_spi_cfg_gpio(struct platform_device *pdev)
> =A0{
> + =A0 =A0 =A0 unsigned int base;
> +
> =A0 =A0 =A0 =A0switch (pdev->id) {
> =A0 =A0 =A0 =A0case 0:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPC(0), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPC(1), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPC(2), S3C_GPI=
O_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6450_GPC(0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPC(0), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPC(1), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPC(2), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case 1:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPC(4), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPC(5), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPC(6), S3C_GPI=
O_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6450_GPC(4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPC(4), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPC(5), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPC(6), S3C_G=
PIO_PULL_UP);
> @@ -92,6 +90,8 @@ static int s5p6450_spi_cfg_gpio(struct platform_dev=
ice *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 s3c_gpio_cfgpin_range(base, 3, S3C_GPIO_SFN(2));
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> diff --git a/arch/arm/mach-s5p64x0/setup-i2c0.c b/arch/arm/mach-s5p64=
x0/setup-i2c0.c
> index dc4cc65..75ef9e5 100644
> --- a/arch/arm/mach-s5p64x0/setup-i2c0.c
> +++ b/arch/arm/mach-s5p64x0/setup-i2c0.c
> @@ -25,17 +25,15 @@ struct platform_device; /* don't need the content=
s */
>
> =A0void s5p6440_i2c0_cfg_gpio(struct platform_device *dev)
> =A0{
> - =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPB(5), S3C_GPIO_SFN(2));
> + =A0 =A0 =A0 s3c_gpio_cfgpin_range(S5P6440_GPB(5), 2, S3C_GPIO_SFN(2=
));
> =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPB(5), S3C_GPIO_PULL_UP);
> - =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPB(6), S3C_GPIO_SFN(2));
> =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPB(6), S3C_GPIO_PULL_UP);
> =A0}
>
> =A0void s5p6450_i2c0_cfg_gpio(struct platform_device *dev)
> =A0{
> - =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPB(5), S3C_GPIO_SFN(2));
> + =A0 =A0 =A0 s3c_gpio_cfgpin_range(S5P6450_GPB(5), 2, S3C_GPIO_SFN(2=
));
> =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPB(5), S3C_GPIO_PULL_UP);
> - =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPB(6), S3C_GPIO_SFN(2));
> =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPB(6), S3C_GPIO_PULL_UP);
> =A0}
>
> diff --git a/arch/arm/mach-s5p64x0/setup-i2c1.c b/arch/arm/mach-s5p64=
x0/setup-i2c1.c
> index 2edd791..5d5dd3c 100644
> --- a/arch/arm/mach-s5p64x0/setup-i2c1.c
> +++ b/arch/arm/mach-s5p64x0/setup-i2c1.c
> @@ -25,17 +25,15 @@ struct platform_device; /* don't need the content=
s */
>
> =A0void s5p6440_i2c1_cfg_gpio(struct platform_device *dev)
> =A0{
> - =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPR(9), S3C_GPIO_SFN(6));
> + =A0 =A0 =A0 s3c_gpio_cfgpin_range(S5P6440_GPR(9), 2, S3C_GPIO_SFN(6=
));
> =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPR(9), S3C_GPIO_PULL_UP);
> - =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPR(10), S3C_GPIO_SFN(6));
> =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6440_GPR(10), S3C_GPIO_PULL_UP);
> =A0}
>
> =A0void s5p6450_i2c1_cfg_gpio(struct platform_device *dev)
> =A0{
> - =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPR(9), S3C_GPIO_SFN(6));
> + =A0 =A0 =A0 s3c_gpio_cfgpin_range(S5P6450_GPR(9), 2, S3C_GPIO_SFN(6=
));
> =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPR(9), S3C_GPIO_PULL_UP);
> - =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPR(10), S3C_GPIO_SFN(6));
> =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6450_GPR(10), S3C_GPIO_PULL_UP);
> =A0}
>
> --
> 1.6.2.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
