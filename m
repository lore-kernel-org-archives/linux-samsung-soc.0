From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 5/5] usb: exynos-ohci: Adding phy driver support
Date: Tue, 9 Oct 2012 18:17:58 +0530
Message-ID: <CAFp+6iGgTrqBy1=O3jtfV2JFmdkfSe21=JLrYoPd3BEviTnyPQ@mail.gmail.com>
References: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com>
	<1349705548-15207-6-git-send-email-gautam.vivek@samsung.com>
	<004401cda602$e7c9a630$b75cf290$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:51602 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750924Ab2JIMsA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Oct 2012 08:48:00 -0400
In-Reply-To: <004401cda602$e7c9a630$b75cf290$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, kishon@ti.com, p.paneri@samsung.com, yulgon.kim@samsung.com

Hi,

On Tue, Oct 9, 2012 at 3:16 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Monday, October 08, 2012 11:12 PM Vivek Gautam wrote
>>
>> Adding the transceiver to ohci driver. Keeping the platform data
>> for continuing the smooth operation for boards which still uses it
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>
> Hi Vivek Gautam,
>
> Could you replace the patch subject with
> 'USB: ohci-exynos: Add phy driver support'?
>
Sure. I shall update this in the next patchset.
> I also added some comments, too.
>
>> ---
>>  drivers/usb/host/ohci-exynos.c |   62 +++++++++++++++++++++++++++------------
>>  1 files changed, 43 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
>> index 20a5008..e0ed594 100644
>> --- a/drivers/usb/host/ohci-exynos.c
>> +++ b/drivers/usb/host/ohci-exynos.c
>> @@ -16,13 +16,36 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/platform_data/usb-exynos.h>
>>  #include <plat/usb-phy.h>
>> +#include <linux/usb/phy.h>
>
> Please, move header include to proper place as bellows:
>
> #include <linux/platform_data/usb-exynos.h>
> +#include <linux/usb/phy.h>
> ##include <plat/usb-phy.h>
>
Right, i will change this accordingly and update.
>>
>>  struct exynos_ohci_hcd {
>>       struct device *dev;
>>       struct usb_hcd *hcd;
>>       struct clk *clk;
>> +     struct usb_phy *phy;
>> +     struct exynos4_ohci_platdata *pdata;
>>  };
>>
>> +static void exynos_ohci_phy_enable(struct exynos_ohci_hcd *exynos_ohci)
>> +{
>> +     struct platform_device *pdev = to_platform_device(exynos_ohci->dev);
>> +
>> +     if (exynos_ohci->phy)
>> +             usb_phy_init(exynos_ohci->phy);
>> +     else if (exynos_ohci->pdata->phy_init)
>> +             exynos_ohci->pdata->phy_init(pdev, S5P_USB_PHY_HOST);
>> +}
>> +
>> +static void exynos_ohci_phy_disable(struct exynos_ohci_hcd *exynos_ohci)
>> +{
>> +     struct platform_device *pdev = to_platform_device(exynos_ohci->dev);
>> +
>> +     if (exynos_ohci->phy)
>> +             usb_phy_shutdown(exynos_ohci->phy);
>> +     else if (exynos_ohci->pdata->phy_exit)
>> +             exynos_ohci->pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
>> +}
>> +
>>  static int ohci_exynos_start(struct usb_hcd *hcd)
>>  {
>>       struct ohci_hcd *ohci = hcd_to_ohci(hcd);
>> @@ -81,15 +104,10 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
>>       struct usb_hcd *hcd;
>>       struct ohci_hcd *ohci;
>>       struct resource *res;
>> +     struct usb_phy *phy;
>>       int irq;
>>       int err;
>>
>> -     pdata = pdev->dev.platform_data;
>> -     if (!pdata) {
>> -             dev_err(&pdev->dev, "No platform data defined\n");
>> -             return -EINVAL;
>> -     }
>> -
>>       /*
>>        * Right now device-tree probed devices don't get dma_mask set.
>>        * Since shared usb code relies on it, set it here for now.
>> @@ -105,6 +123,20 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
>>       if (!exynos_ohci)
>>               return -ENOMEM;
>>
>> +     pdata = pdev->dev.platform_data;
>> +     if (!pdata) {
>> +             /* Fallback to Phy transceiver */
>> +             phy = devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
>> +             if (IS_ERR_OR_NULL(phy)) {
>> +                     dev_err(&pdev->dev, "no platform data or transceiver defined\n");
>> +                     return -EPROBE_DEFER;
>> +             } else {
>> +                     exynos_ohci->phy = phy;
>> +             }
>> +     } else {
>> +             exynos_ohci->pdata = pdata;
>> +     }
>> +
>>       exynos_ohci->dev = &pdev->dev;
>>
>>       hcd = usb_create_hcd(&exynos_ohci_hc_driver, &pdev->dev,
>> @@ -150,8 +182,7 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
>>               goto fail_io;
>>       }
>>
>> -     if (pdata->phy_init)
>> -             pdata->phy_init(pdev, S5P_USB_PHY_HOST);
>> +     exynos_ohci_phy_enable(exynos_ohci);
>>
>>       ohci = hcd_to_ohci(hcd);
>>       ohci_hcd_init(ohci);
>> @@ -168,6 +199,7 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
>>
>>  fail_io:
>>       clk_disable(exynos_ohci->clk);
>> +     exynos_ohci_phy_disable(exynos_ohci);
>
> As I mentioned, it is also wrong.
>
> Please fix them as follows:
>
>         err = usb_add_hcd(hcd, irq, IRQF_SHARED);
>         if (err) {
>                 dev_err(&pdev->dev, "Failed to add USB HCD\n");
> -               goto fail_io;
> +               goto fail_add_hcd;
>         }
>
>         platform_set_drvdata(pdev, exynos_ohci);
>
>         return 0;
>
> +fail_add_hcd:
> +       exynos_ohci_phy_disable(exynos_ohci);
> fail_io:
>         clk_disable(exynos_ohci->clk);
> fail_clken:
>         clk_put(exynos_ohci->clk);
>
Right, my mistake. I shall modify this as suggested and update.
>
>>  fail_clken:
>>       clk_put(exynos_ohci->clk);
>>  fail_clk:
>> @@ -177,14 +209,12 @@ fail_clk:
>>
>>  static int __devexit exynos_ohci_remove(struct platform_device *pdev)
>>  {
>> -     struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
>>       struct exynos_ohci_hcd *exynos_ohci = platform_get_drvdata(pdev);
>>       struct usb_hcd *hcd = exynos_ohci->hcd;
>>
>>       usb_remove_hcd(hcd);
>>
>> -     if (pdata && pdata->phy_exit)
>> -             pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
>> +     exynos_ohci_phy_disable(exynos_ohci);
>>
>>       clk_disable(exynos_ohci->clk);
>>       clk_put(exynos_ohci->clk);
>> @@ -209,8 +239,6 @@ static int exynos_ohci_suspend(struct device *dev)
>>       struct exynos_ohci_hcd *exynos_ohci = dev_get_drvdata(dev);
>>       struct usb_hcd *hcd = exynos_ohci->hcd;
>>       struct ohci_hcd *ohci = hcd_to_ohci(hcd);
>> -     struct platform_device *pdev = to_platform_device(dev);
>> -     struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
>>       unsigned long flags;
>>       int rc = 0;
>>
>> @@ -229,8 +257,7 @@ static int exynos_ohci_suspend(struct device *dev)
>>
>>       clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
>>
>> -     if (pdata && pdata->phy_exit)
>> -             pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
>> +     exynos_ohci_phy_disable(exynos_ohci);
>>
>>       clk_disable(exynos_ohci->clk);
>>
>> @@ -244,13 +271,10 @@ static int exynos_ohci_resume(struct device *dev)
>>  {
>>       struct exynos_ohci_hcd *exynos_ohci = dev_get_drvdata(dev);
>>       struct usb_hcd *hcd = exynos_ohci->hcd;
>> -     struct platform_device *pdev = to_platform_device(dev);
>> -     struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
>>
>>       clk_enable(exynos_ohci->clk);
>>
>> -     if (pdata && pdata->phy_init)
>> -             pdata->phy_init(pdev, S5P_USB_PHY_HOST);
>> +     exynos_ohci_phy_enable(exynos_ohci);
>>
>>       /* Mark hardware accessible again as we are out of D3 state by now */
>>       set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
>> --
>> 1.7.6.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thanks
Vivek
