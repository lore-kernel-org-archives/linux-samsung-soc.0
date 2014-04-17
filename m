From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH resend] mfd/rtc: s5m: Do not allocate RTC I2C dummy and
 regmap for unsupported chipsets
Date: Thu, 17 Apr 2014 09:08:47 +0100
Message-ID: <20140417080847.GF28725@lee--X1>
References: <1397461245-818-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:44729 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754437AbaDQIIw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Apr 2014 04:08:52 -0400
Received: by mail-we0-f182.google.com with SMTP id p61so110447wes.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Apr 2014 01:08:51 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1397461245-818-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

> The rtc-s5m driver does not support all of S2M and S5M chipsets
> supported by main MFD sec-core driver. For such chipsets unsupported =
by
> rtc-s5m, the MFD sec-core driver initialized regmap with default conf=
ig.
> This config in such cases wouldn't work at all.
>=20
> The main MFD sec-core driver shouldn't initialize regmap for child
> drivers which is not used by them and even not valid.
>=20
> Move the allocation of RTC I2C dummy device and initialization of RTC
> regmap from main MFD sec-core driver to the rtc-s5m driver. The rtc-s=
5m
> driver will use proper regmap config for supported devices.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/sec-core.c           | 53 +---------------------------
>  drivers/rtc/rtc-s5m.c            | 75 ++++++++++++++++++++++++++++++=
+++++++---
>  include/linux/mfd/samsung/core.h |  3 --
>  3 files changed, 71 insertions(+), 60 deletions(-)

MFD changes look good to me. If Alessandro provides his Ack for the
RTC adaptions I can setup an MFD-RTC branch for him to pull from in
order to save conflicts at merge time.

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
