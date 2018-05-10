From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/2] i2c: exynos5: remove some dead code
Date: Thu, 10 May 2018 10:36:57 +0200
Message-ID: <b3915e40-895f-2a72-27a2-dcffe504456d@samsung.com>
References: <CGME20180509194548epcas2p25579e969e21707afe2435b1f568ff005@epcas2p2.samsung.com>
        <20180509194532.28929-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509194532.28929-1-peda@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09.05.2018 21:45, Peter Rosin wrote:
> The else branch cannot be taken as i will always equal num.
> Get rid of the whole construct.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 12ec8484e653..a2cbc779c33a 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -727,17 +727,7 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
>  			goto out;
>  	}
>  
> -	if (i == num) {
> -		ret = num;
> -	} else {
> -		/* Only one message, cannot access the device */
> -		if (i == 1)
> -			ret = -EREMOTEIO;
> -		else
> -			ret = i;
> -
> -		dev_warn(i2c->dev, "xfer message failed\n");
> -	}
> +	ret = num;
>  
>   out:
>  	clk_disable(i2c->clk);

You can go further and remove "out:" label, use break instead, and at
the end use "return (i == num) ? num : ret;" or sth similar.

With this change you can add:

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
