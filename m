From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] mfd: max77693: reorder params in API for regmap
 consistency
Date: Fri, 8 Nov 2013 15:54:04 +0000
Message-ID: <20131108155404.GA30901@lee--X1>
References: <1383923118-26921-1-git-send-email-k.kozlowski@samsung.com>
 <1383923118-26921-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383923118-26921-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 08 Nov 2013, Krzysztof Kozlowski wrote:

> The last two parameters of certain register access functions were in
> different order than regmap API. This was confusing and error-prone.
>=20
> Reorder parameters for register access API to match regmap API:
>  - max77693_bulk_read() reorder count and buf,
>  - max77693_bulk_write() reorder count and buf,
>  - max77693_update_reg() reorder val and mask.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/extcon/extcon-max77693.c     |   14 +++++++-------
>  drivers/mfd/max77693-irq.c           |    2 +-
>  drivers/mfd/max77693.c               |    6 +++---
>  include/linux/mfd/max77693-private.h |   10 +++++-----
>  4 files changed, 16 insertions(+), 16 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
