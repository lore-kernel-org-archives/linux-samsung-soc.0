From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/8] clk: clk-max77686: Clean clkdev lookup leak and
 use devm
Date: Fri, 2 Nov 2018 09:15:17 +0100
Message-ID: <CAJKOXPd=E+S3j3XnpCVRs3JdStY2z+pHe0bh_HNzQTmJW_dH=Q@mail.gmail.com>
References: <cover.1541054985.git.matti.vaittinen@fi.rohmeurope.com> <83e985f2f60a68f89fac777aa29c55b1edb8769f.1541054985.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <83e985f2f60a68f89fac777aa29c55b1edb8769f.1541054985.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matti.vaittinen@fi.rohmeurope.com
Cc: corbet@lwn.net, mturquette@baylibre.com, sboyd@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, kgene@kernel.org, s.nawrocki@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>, andrew.smirnov@gmail.com, sre@kernel.org, linux@roeck-us.net, robh@kernel.org, sjhuang@iluvatar.ai, Akshu.Agrawal@amd.com, rafael.j.wysocki@intel.com, djkurtz@chromium.org, mazziesaccount@gmail.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 1 Nov 2018 at 08:19, Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> clk-max77686 never clean clkdev lookup at remove. This can cause
> oops if clk-max77686 is removed and inserted again. Fix leak by
> using new devm clkdev lookup registration. Simplify also error
> path by using new devm_of_clk_add_parent_hw_provider.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/clk/clk-max77686.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
> index 02551fe4b87c..b1920c1d9b76 100644
> --- a/drivers/clk/clk-max77686.c
> +++ b/drivers/clk/clk-max77686.c
> @@ -235,7 +235,7 @@ static int max77686_clk_probe(struct platform_device *pdev)
>                         return ret;
>                 }
>
> -               ret = clk_hw_register_clkdev(&max_clk_data->hw,
> +               ret = devm_clk_hw_register_clkdev(dev, &max_clk_data->hw,
>                                              max_clk_data->clk_idata.name, NULL);

You need to re-align the next line.

>                 if (ret < 0) {
>                         dev_err(dev, "Failed to clkdev register: %d\n", ret);
> @@ -244,8 +244,8 @@ static int max77686_clk_probe(struct platform_device *pdev)
>         }
>
>         if (parent->of_node) {
> -               ret = of_clk_add_hw_provider(parent->of_node, of_clk_max77686_get,
> -                                            drv_data);
> +               ret = devm_of_clk_add_parent_hw_provider(dev,
> +                                               of_clk_max77686_get, drv_data);

The same, please.

Rest looks good, so with these changes:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
