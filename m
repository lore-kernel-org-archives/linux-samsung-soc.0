From: "Jingoo Han" <jingoohan1@gmail.com>
Subject: Re: [PATCH] PCI: exynos: fix the potential null pointer dereference
Date: Mon, 22 Jan 2018 11:52:46 -0500
Message-ID: <000201d393a1$6e7c8b70$4b75a250$@gmail.com>
References: <CGME20180122022856epcas1p494a9efeae478b299e3e8006adad71e6a@epcas1p4.samsung.com> <20180122022854.3634-1-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34735 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751085AbeAVQwt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Jan 2018 11:52:49 -0500
In-Reply-To: <20180122022854.3634-1-jh80.chung@samsung.com>
Content-Language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jaehoon Chung' <jh80.chung@samsung.com>, linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lorenzo.pieralisi@arm.com, kgene@kernel.org, krzk@kernel.org

On Sunday, January 21, 2018 6:29 PM, Jaehoon Chung wrote:
> 
> Before calling the callback function, it needs to check whether
> init_clk_resources is assigned or not.
> Otherwise, it can be occurred the NULL pointer dereference when
> init_clk_resources is not assigned.
> 
> Even though init_clk_resources is assigned now, it needs to prevent the
> potential NULL pointer dereference in future.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> ---
>  drivers/pci/dwc/pci-exynos.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/dwc/pci-exynos.c b/drivers/pci/dwc/pci-exynos.c
> index 56f32aeebd0a..39f08881f9a4 100644
> --- a/drivers/pci/dwc/pci-exynos.c
> +++ b/drivers/pci/dwc/pci-exynos.c
> @@ -499,7 +499,8 @@ static int __init exynos_pcie_probe(struct
> platform_device *pdev)
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
