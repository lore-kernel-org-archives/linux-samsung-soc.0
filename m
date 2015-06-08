From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 1/2] usb: ehci-exynos: Make provision for vdd regulators
Date: Mon, 8 Jun 2015 11:17:13 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1506081111050.1574-100000@iolanthe.rowland.org>
References: <1433761633-8542-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433761633-8542-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 8 Jun 2015, Vivek Gautam wrote:

> Facilitate getting required 3.3V and 1.0V VDD supply for
> EHCI controller on Exynos.
> 
> For example, patches for regulators' nodes:
> c8c253f ARM: dts: Add regulator entries to smdk5420
> 275dcd2 ARM: dts: add max77686 pmic node for smdk5250,
> enable only minimum number of regulators on smdk5250.
> 
> So ensuring now that the controller driver requests the necessary
> VDD regulators (if available, unless there are direct VDD rails),
> and enable them so as to make them working on exynos systems.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

Something about this looks a little fishy...

> @@ -170,7 +173,27 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>  
>  	err = exynos_ehci_get_phy(&pdev->dev, exynos_ehci);
>  	if (err)
> -		goto fail_clk;
> +		goto fail_regulator1;
> +
> +	exynos_ehci->vdd33 = devm_regulator_get_optional(&pdev->dev, "vdd33");

Just before this region of code, there is:

	if (of_device_is_compatible(pdev->dev.of_node,
					"samsung,exynos5440-ehci"))
		goto skip_phy;

If that "goto" is taken, exynos_ehci->vdd33 and ->vdd10 will be NULL, 
not an ERR_PTR code.

> +	if (!IS_ERR(exynos_ehci->vdd33)) {
> +		err = regulator_enable(exynos_ehci->vdd33);
> +		if (err) {
> +			dev_err(&pdev->dev,
> +				"Failed to enable 3.3V Vdd supply\n");
> +			goto fail_regulator1;
> +		}
> +	}
> +
> +	exynos_ehci->vdd10 = devm_regulator_get_optional(&pdev->dev, "vdd10");
> +	if (!IS_ERR(exynos_ehci->vdd10)) {
> +		err = regulator_enable(exynos_ehci->vdd10);
> +		if (err) {
> +			dev_err(&pdev->dev,
> +				"Failed to enable 1.0V Vdd supply\n");
> +			goto fail_regulator2;
> +		}
> +	}
>  
>  skip_phy:
>  
> @@ -231,6 +254,12 @@ fail_add_hcd:
>  fail_io:
>  	clk_disable_unprepare(exynos_ehci->clk);
>  fail_clk:
> +	if (!IS_ERR(exynos_ehci->vdd10))
> +		regulator_disable(exynos_ehci->vdd10);
> +fail_regulator2:
> +	if (!IS_ERR(exynos_ehci->vdd33))
> +		regulator_disable(exynos_ehci->vdd33);

Which means these regulator_disable() calls will crash when they 
dereference a NULL pointer.

I think it would be simpler in the end to let a NULL pointer mean the 
regulator isn't present.  If devm_regulator_get_optional() returns an 
error, convert it to NULL (or don't do the assignment to 
exynos_ehci->vdd?? in the first place).

The same criticism applies to the other patch in this series.

Alan Stern
