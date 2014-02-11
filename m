From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 7/7] mfd: max8998: Fix possible NULL pointer dereference
 on i2c_new_dummy error
Date: Tue, 11 Feb 2014 12:23:46 +0000
Message-ID: <20140211122346.GV32042@lee--X1>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
 <1392113015-11180-7-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:45673 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752690AbaBKMXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 07:23:53 -0500
Received: by mail-wi0-f174.google.com with SMTP id f8so4139170wiw.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2014 04:23:52 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392113015-11180-7-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org

On Tue, 11 Feb 2014, Krzysztof Kozlowski wrote:

> During probe the driver allocates dummy I2C device for RTC with i2c_n=
ew_dummy() but it does not check the return value of this call.
>=20
> In case of error (i2c_new_device(): memory allocation failure or I2C
> address cannot be used) this function returns NULL which is later use=
d
> by i2c_unregister_device().
>=20
> If i2c_new_dummy() fails for RTC device, fail also the probe for
> main MFD driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mfd/max8998.c |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
> index 612ca404e150..61ea1826f8b4 100644
> --- a/drivers/mfd/max8998.c
> +++ b/drivers/mfd/max8998.c
> @@ -215,6 +215,10 @@ static int max8998_i2c_probe(struct i2c_client *=
i2c,
>  	mutex_init(&max8998->iolock);
> =20
>  	max8998->rtc =3D i2c_new_dummy(i2c->adapter, RTC_I2C_ADDR);
> +	if (!max8998->rtc) {
> +		dev_err(&i2c->dev, "Failed to allocate I2C device for RTC\n");
> +		return -ENODEV;
> +	}
>  	i2c_set_clientdata(max8998->rtc, max8998);
> =20
>  	max8998_irq_init(max8998);

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
