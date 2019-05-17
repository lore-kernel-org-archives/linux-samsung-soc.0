From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4] usb: exynos: add workaround for the USB device bindings
 conflict
Date: Fri, 17 May 2019 09:56:56 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1905170955040.1430-100000@iolanthe.rowland.org>
References: <20190517105702.4522-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190517105702.4522-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 17 May 2019, Marek Szyprowski wrote:

> Commit 69bec7259853 ("USB: core: let USB device know device node") added
> support for attaching devicetree node for USB devices. Those nodes are
> children of their USB host controller. However Exynos EHCI and OHCI
> driver bindings already define child-nodes for each physical root hub
> port and assigns respective PHY controller and parameters to them. Those
> bindings predates support for USB device tree nodes.
> 
> To mitigate the side-effects of the conflict between those bindings,
> lets reset Exynos host controller of_node pointer before registering it
> to USB subsystem. This fixes the issue raised by the commit 01fdf179f4b0
> ("usb: core: skip interfaces disabled in devicetree"), which incorrectly
> disabled some devices on Exynos based boards.
> 
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Suggested-by: Måns Rullgård <mans@mansr.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v4:
> - moved workaround to Exynos OHCI/EHCI drivers as suggested by Måns
> 
> v3: https://lkml.org/lkml/2019/5/9/119
> - replaced ad hoc checks by proper test for proper value of the
>   compatible string in drivers/usb/core/of.c
> 
> v2: https://lkml.org/lkml/2019/5/8/321
> 
> v1: https://lkml.org/lkml/2019/5/7/715
> ---
>  drivers/usb/host/ehci-exynos.c | 10 ++++++++++
>  drivers/usb/host/ohci-exynos.c | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index 8e3bab1e0c1f..b127642332ee 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -39,6 +39,7 @@ static struct hc_driver __read_mostly exynos_ehci_hc_driver;
>  
>  struct exynos_ehci_hcd {
>  	struct clk *clk;
> +	struct device_node *of_node;
>  	struct phy *phy[PHY_NUMBER];
>  };
>  
> @@ -203,6 +204,13 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>  	ehci = hcd_to_ehci(hcd);
>  	ehci->caps = hcd->regs;
>  
> +	/*
> +	 * Workaround: reset of_node pointer to avoid conflict between Exynos
> +	 * EHCI port subnodes and generic USB device bindings
> +	 */
> +	exynos_ehci->of_node = pdev->dev.of_node;
> +	pdev->dev.of_node = NULL;
> +
>  	/* DMA burst Enable */
>  	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
>  

You forgot to adjust the fail_add_hcd: error pathway in 
exynos_ehci_probe().

> @@ -231,6 +239,8 @@ static int exynos_ehci_remove(struct platform_device *pdev)
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
>  	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
>  
> +	pdev->dev.of_node = exynos_ehci->of_node;
> +
>  	usb_remove_hcd(hcd);
>  
>  	exynos_ehci_phy_disable(&pdev->dev);
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index c0c4dcca6f3c..29f65963af3b 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -30,6 +30,7 @@ static struct hc_driver __read_mostly exynos_ohci_hc_driver;
>  
>  struct exynos_ohci_hcd {
>  	struct clk *clk;
> +	struct device_node *of_node;
>  	struct phy *phy[PHY_NUMBER];
>  };
>  
> @@ -170,6 +171,13 @@ static int exynos_ohci_probe(struct platform_device *pdev)
>  		goto fail_io;
>  	}
>  
> +	/*
> +	 * Workaround: reset of_node pointer to avoid conflict between Exynos
> +	 * OHCI port subnodes and generic USB device bindings
> +	 */
> +	exynos_ohci->of_node = pdev->dev.of_node;
> +	pdev->dev.of_node = NULL;
> +
>  	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to add USB HCD\n");

And same here.

Alan Stern

> @@ -192,6 +200,8 @@ static int exynos_ohci_remove(struct platform_device *pdev)
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
>  	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
>  
> +	pdev->dev.of_node = exynos_ohci->of_node;
> +
>  	usb_remove_hcd(hcd);
>  
>  	exynos_ohci_phy_disable(&pdev->dev);
> 
