From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] mfd: sec: Export OF module alias table
Date: Sat, 4 Aug 2018 01:30:19 +0200
Message-ID: <CABxcv=k-BS04gZKGQqE1=CLhNk79yOHC9_CcrB6=UJ9xYNqGMg@mail.gmail.com>
References: <20180725155302.4718-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725155302.4718-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Wed, Jul 25, 2018 at 5:53 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> In case of Device Tree platforms, even though the Samsung PMIC sec
> device is instantiated from DT, the driver is still matched through I2C
> module alias.  That is because I2C core always reports an I2C module
> alias instead of DT one.
>

Just a heads up that this already changed in v4.17 since commit
af503716ac1 ("i2c: core: report OF style module alias for devices
registered via OF").

> This could change in the future so export DT module alias.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/sec-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index ca6b80d08ffc..9613b4257302 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -146,6 +146,7 @@ static const struct of_device_id sec_dt_match[] = {
>                 /* Sentinel */
>         },
>  };
> +MODULE_DEVICE_TABLE(of, sec_dt_match);

This driver can't be built as a module since its config symbol is
bool, so technically this macro isn't needed. But it's a no-op when
the driver is built-in so it's harmless to have it.

Best regards,
Javier
