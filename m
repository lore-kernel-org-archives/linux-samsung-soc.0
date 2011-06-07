From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix incorrect mapping of gpio pull-up macro
 to register setting
Date: Tue, 7 Jun 2011 17:42:47 +0900
Message-ID: <BANLkTi=YeOyK1WX61NtyprYdUyNmSo1sTw@mail.gmail.com>
References: <1307435689-15954-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:40906 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751368Ab1FGIms convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 04:42:48 -0400
Received: by vxi39 with SMTP id 39so3374671vxi.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2011 01:42:47 -0700 (PDT)
In-Reply-To: <1307435689-15954-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Tue, Jun 7, 2011 at 5:34 PM, Thomas Abraham <thomas.ab@samsung.com> =
wrote:
> The S3C_GPIO_PULL_UP macro value incorrectly maps to a reserved setti=
ng of GPIO
> pull up/down registers on Exynos4 platform. Fix this incorrect mappin=
g by adding
> wrappers to the s3c_gpio_setpull_updown and s3c_gpio_getpull_updown f=
unctions.

Personally I like to use the variable instead of function hooking.
set the correct variable at cpu dection and use it
then these thing make a single generic function and each gpio_cfg use
the same thing.

Anyway it's next step. current fix the bug first.

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
> =A0drivers/gpio/gpio-exynos4.c | =A0 29 +++++++++++++++++++++++++----
> =A01 files changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-exynos4.c b/drivers/gpio/gpio-exynos4.=
c
> index d54ca6a..9029835 100644
> --- a/drivers/gpio/gpio-exynos4.c
> +++ b/drivers/gpio/gpio-exynos4.c
> @@ -21,16 +21,37 @@
> =A0#include <plat/gpio-cfg.h>
> =A0#include <plat/gpio-cfg-helpers.h>
>
> +int s3c_gpio_setpull_exynos4(struct s3c_gpio_chip *chip,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigne=
d int off, s3c_gpio_pull_t pull)
> +{
> + =A0 =A0 =A0 if (pull =3D=3D S3C_GPIO_PULL_UP)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pull =3D 3;
> +
> + =A0 =A0 =A0 return s3c_gpio_setpull_updown(chip, off, pull);
> +}
static?
> +
> +s3c_gpio_pull_t s3c_gpio_getpull_exynos4(struct s3c_gpio_chip *chip,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int off)
> +{
> + =A0 =A0 =A0 s3c_gpio_pull_t pull;
> +
> + =A0 =A0 =A0 pull =3D s3c_gpio_getpull_updown(chip, off);
> + =A0 =A0 =A0 if (pull =3D=3D 3)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pull =3D S3C_GPIO_PULL_UP;
> +
> + =A0 =A0 =A0 return pull;
> +}
ditto.
> +
> =A0static struct s3c_gpio_cfg gpio_cfg =3D {
> =A0 =A0 =A0 =A0.set_config =A0 =A0 =3D s3c_gpio_setcfg_s3c64xx_4bit,
> - =A0 =A0 =A0 .set_pull =A0 =A0 =A0 =3D s3c_gpio_setpull_updown,
> - =A0 =A0 =A0 .get_pull =A0 =A0 =A0 =3D s3c_gpio_getpull_updown,
> + =A0 =A0 =A0 .set_pull =A0 =A0 =A0 =3D s3c_gpio_setpull_exynos4,
> + =A0 =A0 =A0 .get_pull =A0 =A0 =A0 =3D s3c_gpio_getpull_exynos4,
> =A0};
>
> =A0static struct s3c_gpio_cfg gpio_cfg_noint =3D {
> =A0 =A0 =A0 =A0.set_config =A0 =A0 =3D s3c_gpio_setcfg_s3c64xx_4bit,
> - =A0 =A0 =A0 .set_pull =A0 =A0 =A0 =3D s3c_gpio_setpull_updown,
> - =A0 =A0 =A0 .get_pull =A0 =A0 =A0 =3D s3c_gpio_getpull_updown,
> + =A0 =A0 =A0 .set_pull =A0 =A0 =A0 =3D s3c_gpio_setpull_exynos4,
> + =A0 =A0 =A0 .get_pull =A0 =A0 =A0 =3D s3c_gpio_getpull_exynos4,
> =A0};
>
> =A0/*
> --
> 1.6.6.rc2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
