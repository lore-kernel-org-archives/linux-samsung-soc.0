From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: sec: Export OF module alias table
Date: Fri, 27 Jul 2018 09:27:06 +0100
Message-ID: <20180727082706.GF4628@dell>
References: <20180725155302.4718-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725155302.4718-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 25 Jul 2018, Krzysztof Kozlowski wrote:

> In case of Device Tree platforms, even though the Samsung PMIC sec
> device is instantiated from DT, the driver is still matched through I2C
> module alias.  That is because I2C core always reports an I2C module
> alias instead of DT one.
> 
> This could change in the future so export DT module alias.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/sec-core.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
