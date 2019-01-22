From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] usb: dwc3: exynos: Fix error handling of
 clk_prepare_enable
Date: Tue, 22 Jan 2019 09:20:56 +0100
Message-ID: <c781bb2f-aad0-84c5-3d6e-1c7ce93bc57f@samsung.com>
References: <CGME20190121212507epcas1p1f2b689e91046a2736ed26a84367c210a@epcas1p1.samsung.com>
        <1548105830-26376-1-git-send-email-khoroshilov@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548105830-26376-1-git-send-email-khoroshilov@ispras.ru>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Khoroshilov <khoroshilov@ispras.ru>, Felipe Balbi <balbi@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Alexey,

On 2019-01-21 22:23, Alexey Khoroshilov wrote:
> If clk_prepare_enable() fails in dwc3_exynos_probe() or in
> dwc3_exynos_resume(), exynos->clks[0] is left undisabled
> because of usage preincrement in while condition.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Fixes: 9f2168367a0a ("usb: dwc3: exynos: Rework clock handling and prepare for new variants")
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2: Add fix for the second instance in dwc3_exynos_resume() per Marek Szyprowski note.
>
>  drivers/usb/dwc3/dwc3-exynos.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index cb7fcd7c0ad8..c1e9ea621f41 100644
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
> @@ -223,7 +223,7 @@ static int dwc3_exynos_resume(struct device *dev)
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
