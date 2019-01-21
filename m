From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] usb: dwc3: exynos: Fix error handling of
 clk_prepare_enable
Date: Mon, 21 Jan 2019 10:56:46 +0100
Message-ID: <abc0f943-1d34-cc44-dc65-0428d6188354@samsung.com>
References: <CGME20190118211823epcas1p32d11bff9f7822eb48c0387c85a94da70@epcas1p3.samsung.com>
        <1547846257-19970-1-git-send-email-khoroshilov@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547846257-19970-1-git-send-email-khoroshilov@ispras.ru>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Khoroshilov <khoroshilov@ispras.ru>, Felipe Balbi <balbi@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Alexey,

On 2019-01-18 22:17, Alexey Khoroshilov wrote:
> If clk_prepare_enable() fails in dwc3_exynos_probe(),
> exynos->clks[0] is left undisabled because of usage
> preincrement in while condition.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Fixes: 9f2168367a0a ("usb: dwc3: exynos: Rework clock handling and prepare for new variants")

My fault. There is also a similar issue dwc3_exynos_resume(), so please
fix it too if possible.

> ---
>  drivers/usb/dwc3/dwc3-exynos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index cb7fcd7c0ad8..e7f6cff27b9a 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -78,7 +78,7 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
>  	for (i = 0; i < exynos->num_clks; i++) {
>  		ret = clk_prepare_enable(exynos->clks[i]);
>  		if (ret) {
> -			while (--i > 0)
> +			while (i-- > 0)
>  				clk_disable_unprepare(exynos->clks[i]);
>  			return ret;
>  		}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
