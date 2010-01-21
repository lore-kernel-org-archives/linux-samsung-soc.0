From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM: S3C64XX: Tidy up common code in s3c64xx_spi_set_info()
Date: Thu, 21 Jan 2010 15:11:05 +0900
Message-ID: <1b68c6791001202211m7ead63e8i82c186f2e3830241@mail.gmail.com>
References: <1264051266-18754-1-git-send-email-ben-linux@fluff.org>
	 <1264051266-18754-2-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f202.google.com ([209.85.221.202]:42467 "EHLO
	mail-qy0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751435Ab0AUGLJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2010 01:11:09 -0500
Received: by qyk40 with SMTP id 40so3346959qyk.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jan 2010 22:11:05 -0800 (PST)
In-Reply-To: <1264051266-18754-2-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jassi Brar <jassi.brar@samsung.com>

On Thu, Jan 21, 2010 at 2:21 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> The s3c64xx_spi_set_info() sets one of two platform data structures d=
epending
> on which controller is being specified. Change to taking a pointer to=
 the
> relevant platform data structure and then having one set of code to p=
lace
> the data into the area being pointed to.
>
> Cc: Jassi Brar <jassi.brar@samsung.com>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
> =C2=A0arch/arm/plat-s3c64xx/dev-spi.c | =C2=A0 15 +++++++++------
> =C2=A01 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/plat-s3c64xx/dev-spi.c b/arch/arm/plat-s3c64xx/=
dev-spi.c
> index 6b6d7af..ca10388 100644
> --- a/arch/arm/plat-s3c64xx/dev-spi.c
> +++ b/arch/arm/plat-s3c64xx/dev-spi.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <mach/gpio.h>
>
> =C2=A0#include <plat/spi-clocks.h>
> +
> =C2=A0#include <plat/s3c64xx-spi.h>
> =C2=A0#include <plat/gpio-bank-c.h>
> =C2=A0#include <plat/gpio-cfg.h>
> @@ -154,6 +155,8 @@ EXPORT_SYMBOL(s3c64xx_device_spi1);
>
> =C2=A0void __init s3c64xx_spi_set_info(int cntrlr, int src_clk_nr, in=
t num_cs)
> =C2=A0{
> + =C2=A0 =C2=A0 =C2=A0 struct s3c64xx_spi_info *pd;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reject invalid configuration */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!num_cs || src_clk_nr < 0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|| src_clk_nr > S3C64XX_SPI_SRCCLK_48M) {
> @@ -163,18 +166,18 @@ void __init s3c64xx_spi_set_info(int cntrlr, in=
t src_clk_nr, int num_cs)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cntrlr) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c64xx_spi0_pdata=
=2Enum_cs =3D num_cs;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c64xx_spi0_pdata=
=2Esrc_clk_nr =3D src_clk_nr;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c64xx_spi0_pdata=
=2Esrc_clk_name =3D spi_src_clks[src_clk_nr];
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pd =3D &s3c64xx_sp=
i0_pdata;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c64xx_spi1_pdata=
=2Enum_cs =3D num_cs;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c64xx_spi1_pdata=
=2Esrc_clk_nr =3D src_clk_nr;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c64xx_spi1_pdata=
=2Esrc_clk_name =3D spi_src_clks[src_clk_nr];
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pd =3D &s3c64xx_sp=
i1_pdata;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_ER=
R "%s: Invalid SPI controller(%d)\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, cntrlr=
);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0 =C2=A0 pd->num_cs =3D num_cs;
> + =C2=A0 =C2=A0 =C2=A0 pd->src_clk_nr =3D src_clk_nr;
> + =C2=A0 =C2=A0 =C2=A0 pd->src_clk_name =3D spi_src_clks[src_clk_nr];
> =C2=A0}
acked-by: Jassi Brar <jassi.brar@samsung.com>
