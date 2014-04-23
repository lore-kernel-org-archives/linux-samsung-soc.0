From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH resend] mfd/rtc: s5m: Do not allocate RTC I2C dummy and
 regmap for unsupported chipsets
Date: Wed, 23 Apr 2014 15:22:13 +0100
Message-ID: <20140423142213.GE6264@lee--X1>
References: <1397461245-818-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1397461245-818-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

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

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
