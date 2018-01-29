From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] PCI: exynos: fix the potential null pointer dereference
Date: Mon, 29 Jan 2018 17:10:10 +0000
Message-ID: <20180129171010.GA23955@e107981-ln.cambridge.arm.com>
References: <CGME20180122022856epcas1p494a9efeae478b299e3e8006adad71e6a@epcas1p4.samsung.com>
 <20180122022854.3634-1-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:42942 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751281AbeA2RKR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Jan 2018 12:10:17 -0500
Content-Disposition: inline
In-Reply-To: <20180122022854.3634-1-jh80.chung@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jingoohan1@gmail.com, kgene@kernel.org, krzk@kernel.org

On Mon, Jan 22, 2018 at 11:28:54AM +0900, Jaehoon Chung wrote:
> Before calling the callback function, it needs to check whether
> init_clk_resources is assigned or not.
> Otherwise, it can be occurred the NULL pointer dereference when
> init_clk_resources is not assigned.
> 
> Even though init_clk_resources is assigned now, it needs to prevent the
> potential NULL pointer dereference in future.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  drivers/pci/dwc/pci-exynos.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/dwc/pci-exynos.c b/drivers/pci/dwc/pci-exynos.c
> index 56f32aeebd0a..39f08881f9a4 100644
> --- a/drivers/pci/dwc/pci-exynos.c
> +++ b/drivers/pci/dwc/pci-exynos.c
> @@ -499,7 +499,8 @@ static int __init exynos_pcie_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> -	if (ep->ops && ep->ops->get_clk_resources) {
> +	if (ep->ops && ep->ops->get_clk_resources &&
> +			ep->ops->init_clk_resources) {
>  		ret = ep->ops->get_clk_resources(ep);
>  		if (ret)
>  			return ret;
> -- 
> 2.15.1

I applied it to pci/dwc for 4.16.

Thanks,
Lorenzo
