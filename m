From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: sec-core: Fix possible NULL pointer dereference
 when i2c_new_dummy error
Date: Tue, 11 Feb 2014 09:58:58 +0000
Message-ID: <20140211095858.GJ32042@lee--X1>
References: <1392109945-333-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:37120 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbaBKJ7E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 04:59:04 -0500
Received: by mail-wi0-f171.google.com with SMTP id cc10so3928791wib.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2014 01:59:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392109945-333-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org

> During probe the sec-core driver allocates dummy I2C device for RTC w=
ith
> i2c_new_dummy() but return value is not checked. In case of error
> (i2c_new_device(): memory allocation failure or I2C address cannot be
> used) this function returns NULL which is later used by
> devm_regmap_init_i2c() or i2c_unregister_device().
>=20
> If i2c_new_dummy() fails for RTC device, fail also the probe for main
> MFD driver.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mfd/sec-core.c |    4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
