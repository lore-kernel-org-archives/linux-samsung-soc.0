From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Convert to devm_kzalloc()
Date: Sun, 29 Jan 2012 13:14:39 +0800
Message-ID: <CAGsJ_4x285CE0aDB4J2iKN7uyc4afxSTZ=i-Mrmc7DfsiNUEQA@mail.gmail.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:61006 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1749667Ab2A2FPA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Jan 2012 00:15:00 -0500
In-Reply-To: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org

2012/1/21 Mark Brown <broonie@opensource.wolfsonmicro.com>:
> Saves remembering to call kfree(). There's some kfree()s used by the
> resource still, these will be removed in 3.3 using the newly added
> devm_request_and_ioremap().
>
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Reviewed-by: Barry Song <Baohua.Song@csr.com>

> ---
> =C2=A0drivers/i2c/busses/i2c-s3c2410.c | =C2=A0 =C2=A04 +---
> =C2=A01 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2=
c-s3c2410.c
> index 4c17180..e6f982b 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -890,7 +890,7 @@ static int s3c24xx_i2c_probe(struct platform_devi=
ce *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> - =C2=A0 =C2=A0 =C2=A0 i2c =3D kzalloc(sizeof(struct s3c24xx_i2c), GF=
P_KERNEL);
> + =C2=A0 =C2=A0 =C2=A0 i2c =3D devm_kzalloc(&pdev->dev, sizeof(struct=
 s3c24xx_i2c), GFP_KERNEL);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!i2c) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&pdev-=
>dev, "no memory for state\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;
> @@ -1035,7 +1035,6 @@ static int s3c24xx_i2c_probe(struct platform_de=
vice *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_put(i2c->clk);
>
> =C2=A0err_noclk:
> - =C2=A0 =C2=A0 =C2=A0 kfree(i2c);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
> =C2=A0}
>
> @@ -1061,7 +1060,6 @@ static int s3c24xx_i2c_remove(struct platform_d=
evice *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0release_resource(i2c->ioarea);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c24xx_i2c_dt_gpio_free(i2c);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(i2c->ioarea);
> - =C2=A0 =C2=A0 =C2=A0 kfree(i2c);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
> --
> 1.7.7.3
