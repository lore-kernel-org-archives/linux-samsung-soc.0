From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/2] regulator: s5m8767: Use GPIO for controlling
 Buck9/eMMC
Date: Fri, 24 Jan 2014 16:03:14 +0000
Message-ID: <20140124160314.GB27911@lee--X1>
References: <1390570678-30686-1-git-send-email-k.kozlowski@samsung.com>
 <1390570678-30686-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:33362 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831AbaAXQDV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jan 2014 11:03:21 -0500
Received: by mail-wg0-f49.google.com with SMTP id a1so3119444wgh.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jan 2014 08:03:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1390570678-30686-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Fri, 24 Jan 2014, Krzysztof Kozlowski wrote:

> Add support for GPIO control (enable/disable) over Buck9. The Buck9
> Converter is used as a supply for eMMC Host Controller.
>=20
> BUCK9EN GPIO of S5M8767 chip may be used by application processor to
> enable or disable the Buck9. This has two benefits:
>  - It is faster than toggling it over I2C bus.
>  - It allows disabling the regulator during suspend to RAM; The AP wi=
ll
>    enable it during resume; Without the patch the regulator supplying
>    eMMC must be defined as fixed-regulator.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/regulator/s5m8767.c         |   87 +++++++++++++++++++++++++=
++++++++--
>  include/linux/mfd/samsung/core.h    |    3 +-
>  include/linux/mfd/samsung/s5m8767.h |    7 +++
>  3 files changed, 93 insertions(+), 4 deletions(-)

=46or the MFD changes:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
