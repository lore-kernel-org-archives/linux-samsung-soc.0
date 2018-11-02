From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3 6/7] clk: clk-twl6040: Free of_provider at remove
Date: Fri, 2 Nov 2018 14:49:51 +0200
Message-ID: <4b0cceec-ddc8-5398-33a1-e0e91dabdcdf@ti.com>
References: <cover.1541161503.git.matti.vaittinen@fi.rohmeurope.com>
 <855d60c35f092de196b131838fe0b07e9d3080d3.1541161503.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <855d60c35f092de196b131838fe0b07e9d3080d3.1541161503.git.matti.vaittinen@fi.rohmeurope.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Russell King <linux@armlinux.org.uk>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Sebastian Reichel <sre@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Huang Shijie <sjhuang@iluvatar.ai>, Akshu Agrawal <Akshu.Agrawal@amd.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Daniel Kurtz <djkurtz@chromium.org>, mazziesaccount@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org



On 11/2/18 2:37 PM, Matti Vaittinen wrote:
> use devm variant for of_provider registration so provider is freed
> at exit.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/clk/clk-twl6040.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-twl6040.c b/drivers/clk/clk-twl6040.c
> index 25dfe050ae9f..e9da09453eb2 100644
> --- a/drivers/clk/clk-twl6040.c
> +++ b/drivers/clk/clk-twl6040.c
> @@ -108,9 +108,8 @@ static int twl6040_pdmclk_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, clkdata);
>  
> -	return of_clk_add_hw_provider(pdev->dev.parent->of_node,
> -				      of_clk_hw_simple_get,
> -				      &clkdata->pdmclk_hw);
> +	return devm_of_clk_add_parent_hw_provider(&pdev->dev,
> +			of_clk_hw_simple_get, &clkdata->pdmclk_hw);
>  }
>  
>  static struct platform_driver twl6040_pdmclk_driver = {
> 

- Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
