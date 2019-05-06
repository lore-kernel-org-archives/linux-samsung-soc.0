From: Jules Maselbas <jmaselbas@kalray.eu>
Subject: Re: [PATCH] usb: dwc2: Force 8bit UTMI width for Samsung Exynos SoCs
Date: Mon, 6 May 2019 15:40:57 +0200
Message-ID: <20190506134057.wdkq4owexgzi4r2h@tellis.lin.mbt.kalray.eu>
References: <20190503204958.GA12532@kozik-lap>
 <CGME20190506130052eucas1p25afd4e15648e9efc6fd011e46081fbea@eucas1p2.samsung.com>
 <20190506130046.20898-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506130046.20898-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Mon, May 06, 2019 at 03:00:46PM +0200, Marek Szyprowski wrote:
> Samsung Exynos SoCs require to force UTMI width to 8bit, otherwise the
> host side of the shared USB2 PHY doesn't work.
> 
> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with phy_utmi_width")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/params.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 6900eea57526..9ece4affb9d4 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -76,6 +76,7 @@ static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
>  	struct dwc2_core_params *p = &hsotg->params;
>  
>  	p->power_down = 0;
> +	p->phy_utmi_width = 8;

Nice catch.

I though that 8bits would be the default value, I am curious to know why it's not ny default at 8.

Thanks.


---
Jules

>  }
>  
>  static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
> -- 
> 2.17.1
> 
