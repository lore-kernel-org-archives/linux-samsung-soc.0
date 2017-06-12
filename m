From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usb: host: ehci-exynos: Handle return value of
 clk_prepare_enable
Date: Mon, 12 Jun 2017 10:09:39 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1706121008340.2092-100000@iolanthe.rowland.org>
References: <3aa745c2cea5b8a91d10f898bc201121001a9a0b.1497265923.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:35750 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1752004AbdFLOJk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 10:09:40 -0400
In-Reply-To: <3aa745c2cea5b8a91d10f898bc201121001a9a0b.1497265923.git.arvind.yadav.cs@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 12 Jun 2017, Arvind Yadav wrote:

> clk_prepare_enable() can fail here and we must check its return value.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/usb/host/ehci-exynos.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index 7a603f6..26b6411 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -279,7 +279,9 @@ static int exynos_ehci_resume(struct device *dev)
>  	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
>  	int ret;
>  
> -	clk_prepare_enable(exynos_ehci->clk);
> +	ret = clk_prepare_enable(exynos_ehci->clk);
> +	if (ret)
> +		return ret;
>  
>  	ret = exynos_ehci_phy_enable(dev);
>  	if (ret) {

Acked-by: Alan Stern <stern@rowland.harvard.edu>
