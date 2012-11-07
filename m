From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] USB: PHY: Add support for USB 3.0 phy for exynos5250
Date: Wed, 07 Nov 2012 20:27:49 +0100
Message-ID: <509AB635.3080603@gmail.com>
References: <1352216197-11828-1-git-send-email-gautam.vivek@samsung.com> <1352216197-11828-2-git-send-email-gautam.vivek@samsung.com> <50999FD0.8050406@gmail.com> <CAFp+6iFowuVCKdVEf_ythJ829ZVZqF8t=Aq+GzXadXD5nJiUxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:34671 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944Ab2KGT1z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 14:27:55 -0500
In-Reply-To: <CAFp+6iFowuVCKdVEf_ythJ829ZVZqF8t=Aq+GzXadXD5nJiUxg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, balbi@ti.com, Rob Herring <rob.herring@calxeda.com>, kgene.kim@samsung.com, yulgon.kim@samsung.com, av.tikhomirov@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, kishon <kishon@ti.com>, Praveen Paneri <p.paneri@samsung.com>

On 11/07/2012 02:35 PM, Vivek Gautam wrote:
>>> @@ -180,10 +273,12 @@ enum samsung_cpu_type {
>>>    /*
>>>     * struct samsung_usbphy - transceiver driver state
>>>     * @phy: transceiver structure
>>> + * @phy3: transceiver structure for USB 3.0
>>>     * @plat: platform data
>>>     * @dev: The parent device supplied to the probe function
>>>     * @clk: usb phy clock
>>>     * @regs: usb phy register memory base
>>> + * @regs_phy3: usb 3.0 phy register memory base
>>>     * @ref_clk_freq: reference clock frequency selection
>>>     * @cpu_type: machine identifier
>>>     * @phy_type: It keeps track of the PHY type.
>>> @@ -191,10 +286,12 @@ enum samsung_cpu_type {
>>>     */
>>>    struct samsung_usbphy {
>>>          struct usb_phy  phy;
>>> +       struct usb_phy  phy3;
>>>          struct samsung_usbphy_data *plat;
>>>          struct device   *dev;
>>>          struct clk      *clk;
>>>          void __iomem    *regs;
>>> +       void __iomem    *regs_phy3;
>>
>>
>> Wouldn't it be better to create a new data structure for USB 3.0
>> and embedding it here, rather than adding multiple fields with "3"
>> suffix ? E.g.
>>
>>          struct {
>>                  void __iomem    *phy_regs;
>>                  struct usb_phy  phy;
>>          } usb3;
>> ?
>>
> Yes, thanks for suggesting. This way things will look clearer.
> Will update this.
>
>> And why do you need to duplicate those fields in first place ?
>> I guess phy and phy3 are dependant and you can't register 2 PHYs
>> separately ?
>>
> Controllers like DWC3 needs two different PHYs. One of USB2 type and
> one of USB3 type. So we needed to register two separate PHYs.

OK, I was just wondering if there is any dependency between those two phys
so you need to aggregate them in one struct samsung_usbphy, rather than
creating two separate struct samsung_usbphy objects for them.

>>> +/*
>>> + * The function passed to the usb driver for phy initialization
>>> + */
>>>    static int samsung_usbphy_init(struct usb_phy *phy)
>>>    {
>>>          struct samsung_usbphy *sphy;
>>> @@ -570,6 +872,8 @@ static int __devinit samsung_usbphy_probe(struct platform_device *pdev)
>>>          struct device *dev =&pdev->dev;
>>>
>>>          struct resource *phy_mem;
>>>          void __iomem    *phy_base;
>>> +       struct resource *phy3_mem;
>>> +       void __iomem    *phy3_base = NULL;
>>>          struct clk *clk;
>>>          int     ret = 0;
>>>
>>> @@ -618,7 +922,38 @@ static int __devinit samsung_usbphy_probe(struct platform_device *pdev)
>>>
>>>          sphy->clk = clk;
>>>
>>> +       if (sphy->cpu_type == TYPE_EXYNOS5250) {
>>> +               phy3_mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>> +               if (!phy3_mem) {
>>> +                       dev_err(dev, "%s: missing mem resource\n", __func__);
>>> +                       return -ENODEV;
>>> +               }
>>> +
>>> +               phy3_base = devm_request_and_ioremap(dev, phy3_mem);
>>> +               if (!phy3_base) {
>>> +                       dev_err(dev, "%s: register mapping failed\n", __func__);
>>> +                       return -ENXIO;
>>> +               }
>>> +       }
>>> +
>>> +       sphy->regs_phy3         = phy3_base;
>>> +       sphy->phy3.dev          = sphy->dev;
>>> +       sphy->phy3.label        = "samsung-usbphy3";
>>> +       sphy->phy3.init         = samsung_usbphy3_init;
>>> +       sphy->phy3.shutdown     = samsung_usbphy3_shutdown;
>>> +
>>>          ret = usb_add_phy(&sphy->phy, USB_PHY_TYPE_USB2);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       if (sphy->cpu_type != TYPE_EXYNOS5250) {
>>> +               dev_warn(dev, "Not a valid cpu_type for USB 3.0\n");
>>> +       } else {
>>> +               ret = usb_add_phy(&sphy->phy3, USB_PHY_TYPE_USB3);
>>> +               if (ret)
>>> +                       return ret;
>>
>>
>> 2 redundant lines here.
>>
> Will two returns under if return not error codes ? The last return
> actually returns success.
> If still it needs modification, will do that.

It's up to you how you structure it. The last return returns whatever
value ret has. I can't see what is an advantage of doing something like:

	if (ret)
		return ret;

	return ret;
--

Thanks,
Sylwester
