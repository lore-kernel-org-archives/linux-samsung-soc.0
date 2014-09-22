From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH v4 1/2] usb: host: ehci-exynos: Remove unnecessary usb-phy support
Date: Mon, 22 Sep 2014 11:04:36 +0530
Message-ID: <CAFp+6iGXLKhtGaHm=dFDGCpN38G=w6mX0PuatskBhvcL_HA=Bg@mail.gmail.com>
References: <1411014258-17877-1-git-send-email-gautam.vivek@samsung.com>
	<Pine.LNX.4.44L0.1409181048290.894-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:43076 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751027AbaIVFeh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 01:34:37 -0400
In-Reply-To: <Pine.LNX.4.44L0.1409181048290.894-100000@iolanthe.rowland.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Kukjin Kim <kgene.kim@samsung.com>, Jingoo Han <jg1.han@samsung.com>

On Thu, Sep 18, 2014 at 8:20 PM, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Thu, 18 Sep 2014, Vivek Gautam wrote:
>
>> Now that we have completely moved from older USB-PHY drivers
>> to newer GENERIC-PHY drivers for PHYs available with USB controllers
>> on Exynos series of SoCs, we can remove the support for the same
>> in our host drivers too.
>>
>> We also defer the probe for our host in case we end up getting
>> EPROBE_DEFER error when getting PHYs.
>
> Better now.  But I didn't notice this the first time:
>
>> +             if (IS_ERR(phy)) {
>> +                     ret = PTR_ERR(phy);
>> +                     if (ret == -EPROBE_DEFER) {
>> +                             return ret;
>> +                     } else if (ret != -ENOSYS && ret != -ENODEV) {
>> +                             dev_err(dev,
>> +                                     "Error retrieving usb2 phy: %d\n", ret);
>> +                             return PTR_ERR(phy);
>
> It doesn't make any real difference, but wouldn't you prefer to say
> "return ret" here?

sure, will update this.

>
> With or without that change, for both these two patches:
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
