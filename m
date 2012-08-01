From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 2/8 v2] ARM: EXYNOS5: Add machine data for USB 2.0
Date: Wed, 01 Aug 2012 12:02:41 +0900
Message-ID: <50189C51.8080409@samsung.com>
References: <1342866729-30460-1-git-send-email-gautam.vivek@samsung.com>
 <201207261124.50141.arnd@arndb.de>
 <CAFp+6iH0c=LogUXnpg0pD05X+mMGP9XiWDDxiTyNQAxJq_srJg@mail.gmail.com>
 <201207291311.08012.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36163 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753914Ab2HADCp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jul 2012 23:02:45 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M820026S34JROK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 12:02:43 +0900 (KST)
Received: from [10.90.51.60] by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M82000TR34BSN60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 12:02:43 +0900 (KST)
In-reply-to: <201207291311.08012.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vivek Gautam <gautamvivek1987@gmail.com>, yulgon.kim@samsung.com, kgene.kim@samsung.com, prashanth.g@samsung.com, olofj@google.com, devicetree-discuss@lists.ozlabs.org, l.majewski@samsung.com, joshi@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, Vivek Gautam <gautam.vivek@samsung.com>, a.kesavan@samsung.com, av.tikhomirov@samsung.com, boyko.lee@samsung.com, ajaykumar.rs@samsung.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

On 07/29/2012 10:11 PM, Arnd Bergmann wrote:
> On Saturday 28 July 2012, Vivek Gautam wrote:
>>> Can you pleae explain why this is done in the changelog?
>>>
>>> We try hard to do such mappings from the device driver instead,
>>> so I'm surprised that this is necessary fo rthe USB phy.
>>>
>> We are doing the mapping for device address in the driver, but this memory
>> mapping for USB PHY registers that need to be programmed by the software
>> is done here. This is similar to what we see for exynos4 also. Is it
>> something
>> that i can still change? Please suggest.
>
> Yes, I think the USB PHY handling for all exynos chips should be changed
> from an ad-hoc method to a more formal device driver. As I commented
> in another patch of this series, I think the main problem is that
> treat the USB PHY as a property of the "platform", which it really isn't.
>
> We have a bunch of other USB PHY drivers for other platforms that are
> inside of the drivers/usb hierarchy. For all I know, there is no formal
> USB PHY driver API yet, and it seems that it would be a good idea to
> introduce one now, but for now, just move the code to
> drivers/usb/phy/ and make it one file per different kind of PHY.
>

Totally agree. I think that two PHY drivers need for usb2.0 PHY and
usb3.0 PHY in drivers/usb/phy directory. First, let's make usb2.0 PHY
driver for samsung SoCs from phy control codes of arch/arm, then add to
support usb2.0 PHY for exynos5 and make usb3.0 PHY driver for exynos.

Thanks.
