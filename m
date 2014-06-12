From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 1/2] usb: ehci-exynos: Make provision for vdd regulators
Date: Thu, 12 Jun 2014 13:21:09 +0900
Message-ID: <003801cf85f5$bc7ca200$3575e600$%han@samsung.com>
References: <1402064411-18244-1-git-send-email-gautam.vivek@samsung.com>
 <Pine.LNX.4.44L0.1406111131200.890-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:24476 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869AbaFLEVT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 00:21:19 -0400
In-reply-to: <Pine.LNX.4.44L0.1406111131200.890-100000@iolanthe.rowland.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alan Stern' <stern@rowland.harvard.edu>, 'Vivek Gautam' <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, June 12, 2014 12:39 AM, Alan Stern wrote:
> On Fri, 6 Jun 2014, Vivek Gautam wrote:
> 
> > Facilitate getting required 3.3V and 1.0V VDD supply for
> > EHCI controller on Exynos.
> >
> > With patches for regulators' nodes merged in 3.15:
> > c8c253f ARM: dts: Add regulator entries to smdk5420
> > 275dcd2 ARM: dts: add max77686 pmic node for smdk5250,
> >
> > certain perripherals will now need to ensure that,
> > they request VDD regulators in their drivers, and enable
> > them so as to make them working.
> 
> "Certain peripherals"?  Don't you mean "certain controllers"?
> 
> Does this mean some controllers don't need to use the VDD regulators?
> 
> > @@ -193,7 +196,31 @@ static int exynos_ehci_probe(struct platform_device *pdev)
> >
> >  	err = exynos_ehci_get_phy(&pdev->dev, exynos_ehci);
> >  	if (err)
> > -		goto fail_clk;
> > +		goto fail_regulator1;
> > +
> > +	exynos_ehci->vdd33 = devm_regulator_get(&pdev->dev, "vdd33");
> > +	if (!IS_ERR(exynos_ehci->vdd33)) {
> > +		err = regulator_enable(exynos_ehci->vdd33);
> > +		if (err) {
> > +			dev_err(&pdev->dev,
> > +				"Failed to enable 3.3V Vdd supply\n");
> > +			goto fail_regulator1;
> > +		}
> > +	} else {
> > +		dev_warn(&pdev->dev, "Regulator 3.3V Vdd supply not found\n");
> > +	}
> 
> What if this is one of the controllers that don't need to use a VDD
> regulator?  Do you really want to print out a warning in that case?
> Should you call devm_regulator_get_optional() instead?

I agree with Alan's suggestion. This warning message is not
proper, when USB controllers that don't need a VDD regulator
are used. The devm_regulator_get_optional() looks better.

Best regards,
Jingoo Han
