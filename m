From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: sec: reorder params in API for regmap
 consistency
Date: Fri, 8 Nov 2013 15:52:02 +0000
Message-ID: <20131108155202.GZ30901@lee--X1>
References: <1383923118-26921-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:43394 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754303Ab3KHPwJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Nov 2013 10:52:09 -0500
Received: by mail-pa0-f52.google.com with SMTP id bj1so2393425pad.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Nov 2013 07:52:08 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1383923118-26921-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, 08 Nov 2013, Krzysztof Kozlowski wrote:

> The last two parameters of certain register access functions were in
> different order than regmap API. This was confusing and error-prone.
>=20
> Reorder parameters for register access API to match regmap API:
>  - sec_bulk_read() reorder count and buf,
>  - sec_bulk_write() reorder count and buf,
>  - sec_reg_update() reorder val and mask.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/mfd/sec-core.c           |    6 +++---
>  drivers/regulator/s5m8767.c      |   26 +++++++++++++-------------
>  include/linux/mfd/samsung/core.h |    6 +++---
>  3 files changed, 19 insertions(+), 19 deletions(-)

Seems to make sense.

=46or the MFD portion: Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
