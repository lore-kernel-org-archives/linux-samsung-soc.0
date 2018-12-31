From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] pci: dwc: add a check for resetting gpio
Date: Mon, 31 Dec 2018 14:40:48 -0600
Message-ID: <20181231204048.GG159477@google.com>
References: <20181226022236.71682-1-kjlu@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181226022236.71682-1-kjlu@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Kangjie Lu <kjlu@umn.edu>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, pakki001@umn.edu, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kangjie,

Thanks for the patch.

On Tue, Dec 25, 2018 at 08:22:36PM -0600, Kangjie Lu wrote:
> devm_gpio_request_one() could fail. The fix checks its status and issues
> an error if it fails.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> ---
>  drivers/pci/controller/dwc/pci-exynos.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> index cee5f2f590e2..e3a045e215d2 100644
> --- a/drivers/pci/controller/dwc/pci-exynos.c
> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -226,9 +226,12 @@ static void exynos_pcie_assert_reset(struct exynos_pcie *ep)
>  	struct dw_pcie *pci = ep->pci;
>  	struct device *dev = pci->dev;
>  
> -	if (ep->reset_gpio >= 0)
> -		devm_gpio_request_one(dev, ep->reset_gpio,
> -				GPIOF_OUT_INIT_HIGH, "RESET");
> +	if (ep->reset_gpio >= 0) {
> +		if (devm_gpio_request_one(dev, ep->reset_gpio,
> +				GPIOF_OUT_INIT_HIGH, "RESET"))
> +			dev_err(dev, "Failed requesting reset gpio %d\n",
> +					ep->reset_gpio);
> +	}

Even before your patch, this code doesn't make sense to me.

devm_gpio_request_one() is a setup function and should be called in
the probe path.  The "assert_reset" path should do something like
gpio_set_value().  See other callers, e.g.,

  imx6_pcie_probe()
  histb_pcie_probe()
  mvebu_pcie_parse_port()

I'm skeptical that exynos_pcie_assert_reset() ever worked as intended,
so let's straighten that out before worrying about checking the return
code from devm_gpio_request_one().

The result should be two patches: (1) fix the devm_gpio_request_one()
usage, and (2) check the devm_gpio_request_one() return value.

>  }
