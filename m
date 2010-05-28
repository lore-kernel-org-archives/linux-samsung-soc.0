From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 05/15] ARM: S5P6442: Change to using s3c_gpio_cfgpin_range()
Date: Fri, 28 May 2010 15:24:02 +0900
Message-ID: <AANLkTilPCk0NqJ7od6ZBorqPrlG0xCjdPaim1Q3WwZMH@mail.gmail.com>
References: <1275026212-27510-1-git-send-email-ben-linux@fluff.org>
	<1275026212-27510-6-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:53137 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714Ab0E1GYE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 May 2010 02:24:04 -0400
Received: by vws9 with SMTP id 9so696835vws.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 May 2010 23:24:03 -0700 (PDT)
In-Reply-To: <1275026212-27510-6-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

Looks good but I'm afraid it's more difficult to find pin
configuration from typo.

On Fri, May 28, 2010 at 2:56 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> Change the code setting ranges of GPIO pins using s3c_gpio_cfgpin() t=
o
> use the recently introduced s3c_gpio_cfgpin_range().
>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
> =A0arch/arm/mach-s5p6442/dev-audio.c | =A0 30 ++++++++++-------------=
-------
> =A0arch/arm/mach-s5p6442/dev-spi.c =A0 | =A0 =A04 +---
> =A02 files changed, 11 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm/mach-s5p6442/dev-audio.c b/arch/arm/mach-s5p644=
2/dev-audio.c
> index cb801e1..0e57caf 100644
> --- a/arch/arm/mach-s5p6442/dev-audio.c
> +++ b/arch/arm/mach-s5p6442/dev-audio.c
> @@ -21,22 +21,16 @@
>
> =A0static int s5p6442_cfg_i2s(struct platform_device *pdev)
> =A0{
> + =A0 =A0 =A0 unsigned int base;
> +
> =A0 =A0 =A0 =A0/* configure GPIO for i2s port */
> =A0 =A0 =A0 =A0switch (pdev->id) {
> =A0 =A0 =A0 =A0case 1:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(0), S3C_GP=
IO_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(1), S3C_GP=
IO_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(2), S3C_GP=
IO_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(3), S3C_GP=
IO_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(4), S3C_GP=
IO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6442_GPC1(0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case -1:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(0), S3C_GP=
IO_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(1), S3C_GP=
IO_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(2), S3C_GP=
IO_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(3), S3C_GP=
IO_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(4), S3C_GP=
IO_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6442_GPC0(0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0default:
> @@ -44,6 +38,7 @@ static int s5p6442_cfg_i2s(struct platform_device *=
pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(2));
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> @@ -111,21 +106,15 @@ struct platform_device s5p6442_device_iis1 =3D =
{
>
> =A0static int s5p6442_pcm_cfg_gpio(struct platform_device *pdev)
> =A0{
> + =A0 =A0 =A0 unsigned int base;
> +
> =A0 =A0 =A0 =A0switch (pdev->id) {
> =A0 =A0 =A0 =A0case 0:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(0), S3C_GP=
IO_SFN(3));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(1), S3C_GP=
IO_SFN(3));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(2), S3C_GP=
IO_SFN(3));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(3), S3C_GP=
IO_SFN(3));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC0(4), S3C_GP=
IO_SFN(3));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6442_GPC0(0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case 1:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(0), S3C_GP=
IO_SFN(3));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(1), S3C_GP=
IO_SFN(3));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(2), S3C_GP=
IO_SFN(3));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(3), S3C_GP=
IO_SFN(3));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPC1(4), S3C_GP=
IO_SFN(3));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 base =3D S5P6442_GPC1(0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0default:
> @@ -133,6 +122,7 @@ static int s5p6442_pcm_cfg_gpio(struct platform_d=
evice *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 s3c_gpio_cfgpin_range(base, 5, S3C_GPIO_SFN(3));
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> diff --git a/arch/arm/mach-s5p6442/dev-spi.c b/arch/arm/mach-s5p6442/=
dev-spi.c
> index 3019952..1c5c170 100644
> --- a/arch/arm/mach-s5p6442/dev-spi.c
> +++ b/arch/arm/mach-s5p6442/dev-spi.c
> @@ -37,9 +37,7 @@ static int s5p6442_spi_cfg_gpio(struct platform_dev=
ice *pdev)
> =A0{
> =A0 =A0 =A0 =A0switch (pdev->id) {
> =A0 =A0 =A0 =A0case 0:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPB(0), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPB(2), S3C_GPI=
O_SFN(2));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6442_GPB(3), S3C_GPI=
O_SFN(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin_range(S5P6442_GPB(0), 4=
, S3C_GPIO_SFN(2));

Where's the GPB(1)???

Thank you,
Kyungmin Park

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6442_GPB(0), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6442_GPB(2), S3C_G=
PIO_PULL_UP);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_gpio_setpull(S5P6442_GPB(3), S3C_G=
PIO_PULL_UP);
> --
> 1.6.3.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
