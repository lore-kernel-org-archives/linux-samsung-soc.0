From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] mfd: sec: Add support for the RTC on S2MPA01
Date: Wed, 13 Feb 2019 07:24:58 +0000
Message-ID: <20190213072458.GB1863@dell>
References: <20190212214639.9613-1-stuart.menefy@mathembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212214639.9613-1-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Good morning Stuart,

It's been a while.  I hope all is well with you.

> The RTC portion of the S2MPA01 appears to have the same
> register layout as the S2MPS14.
> 
> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>  drivers/mfd/sec-core.c | 2 ++
>  drivers/mfd/sec-irq.c  | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index e0835c9df7a1..08621ef5d822 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -103,6 +103,8 @@ static const struct mfd_cell s2mps15_devs[] = {
>  static const struct mfd_cell s2mpa01_devs[] = {
>  	{
>  		.name = "s2mpa01-pmic",
> +	}, {
> +		.name = "s2mps14-rtc",
>  	},
>  };

Ideally one line entries should be on one line (see: s2mps13_devs).

Would you like to take a couple of minutes to make those changes
file-wide and rework this patch on top of it please?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
