From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/4] mfd: maxim: Add SPDX license identifiers
Date: Fri, 24 Aug 2018 10:20:21 +0100
Message-ID: <20180824092021.GD28860@dell>
References: <20180807161125.18155-1-krzk@kernel.org>
 <20180807161125.18155-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180807161125.18155-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 07 Aug 2018, Krzysztof Kozlowski wrote:

> Replace GPL v2.0+ license statements with SPDX license identifiers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/max14577.c               | 28 +++++++++-------------------
>  drivers/mfd/max77686.c               | 32 +++++++++-----------------------
>  drivers/mfd/max77693.c               | 34 ++++++++++------------------------
>  drivers/mfd/max77843.c               | 19 +++++++------------
>  drivers/mfd/max8997-irq.c            | 30 ++++++++----------------------
>  drivers/mfd/max8997.c                | 30 ++++++++----------------------
>  drivers/mfd/max8998-irq.c            | 18 ++++++------------
>  drivers/mfd/max8998.c                | 28 +++++++---------------------
>  include/linux/mfd/max14577-private.h | 11 +----------
>  include/linux/mfd/max14577.h         | 11 +----------
>  include/linux/mfd/max77686-private.h | 15 +--------------
>  include/linux/mfd/max77686.h         | 15 +--------------
>  include/linux/mfd/max77693-common.h  |  6 +-----
>  include/linux/mfd/max77693-private.h | 15 +--------------
>  include/linux/mfd/max77693.h         | 15 +--------------
>  include/linux/mfd/max77843-private.h |  6 +-----
>  include/linux/mfd/max8997-private.h  | 15 +--------------
>  include/linux/mfd/max8997.h          | 15 +--------------
>  include/linux/mfd/max8998-private.h  | 15 +--------------
>  include/linux/mfd/max8998.h          | 15 +--------------
>  20 files changed, 76 insertions(+), 297 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
