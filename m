From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND RFT PATCH 1/2] mfd: max14577: Use module_init() instead
 of subsys_initcall()
Date: Thu, 16 Jun 2016 11:41:32 +0100
Message-ID: <20160616104132.GV4948@dell>
References: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
 <1464280340-13228-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:36062 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753994AbcFPKkv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 06:40:51 -0400
Received: by mail-wm0-f54.google.com with SMTP id f126so45232303wma.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jun 2016 03:40:50 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1464280340-13228-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Thu, 26 May 2016, Javier Martinez Canillas wrote:

> The driver's init function is called at subsys init call level but th=
e
> dependencies provided by the driver are looked up by drivers that hav=
e
> probe deferral support, so manual ordering of init calls isn't needed=
=2E
>=20
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20
> ---
> Hello,
>=20
> I checked an the only users in mainline for this driver are the Exyno=
s3250
> Monk and Rinato boards. In both, only two regulators are used (safeou=
t_reg
> and motor_reg) and these are looked up by the drivers phy-samsung-usb=
2 and
> regulator-haptic respectively, and both support probe deferral.
>=20
> Best regards,
> Javier
>=20
>  drivers/mfd/max14577.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index 2280b3fdcf68..6c245128ab2e 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -561,7 +561,7 @@ static int __init max14577_i2c_init(void)
> =20
>  	return i2c_add_driver(&max14577_i2c_driver);
>  }
> -subsys_initcall(max14577_i2c_init);
> +module_init(max14577_i2c_init);
> =20
>  static void __exit max14577_i2c_exit(void)
>  {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
