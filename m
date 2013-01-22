From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Tue, 22 Jan 2013 11:18:55 +0530
Message-ID: <CAFp+6iGrp8b+T3n+xNha7jMFMgDsFR8E9zCijoUANZgmN4QL_A@mail.gmail.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
	<20121215072014.2E05E3E0AE3@localhost>
	<CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
	<CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
	<CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
	<016901cde163$6be034c0$43a09e40$@samsung.com>
	<CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
	<50DB811A.8010408@gmail.com>
	<054601cdf862$534a8ad0$f9dfa070$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:61598 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751410Ab3AVFs5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jan 2013 00:48:57 -0500
In-Reply-To: <054601cdf862$534a8ad0$f9dfa070$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Doug Anderson <dianders@chromium.org>, balbi@ti.com, Thomas Abraham <thomas.abraham@linaro.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>, cpgs@samsung.com

Hi Kukjin,


On Tue, Jan 22, 2013 at 11:05 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sylwester Nawrocki wrote:
>>
>> On 12/24/2012 09:13 AM, Vivek Gautam wrote:
>> >>>> These two changes look good to me.  For both of them:
>> >>>>
>> >>>> Reviewed-by: Doug Anderson<dianders@chromium.org>
>> >>>
>> >>> Well, I have another idea. Yes, I know, specific chip name should be
> used.
>> >> But
>> >>> you know the specific chip name in compatible can cause another
>> confusion
>> >>> on other SoC which has same IP. So I think, we need to consider to use
>> >>> common name or any specific name not chip in compatible for IP/driver
>> like
>> >>> following?
>> >>>
>> >>> -     { .compatible = "samsung,exynos-dwc3" },
>> >>> +     { .compatible = "samsung,synopsis-dwc3" },
>> >>>
>> >>> Or if any version or something, how about following?
>> >>>
>> >>> +     { .compatible = "samsung,dwc-v3" },
>> >>>
>> > Well, yes the newer SoCs with same IP using the chip name can cause some
>> > confusion, but won't it be fine that -
>> > "Newer parts using the same core can claim compatibility by
>> > including the older string in the compatible list" - as quoted by Grant
> Likely
>> >
>> > Or, can we try another option, using multiple compatible strings for
>> > SoC specific
>> > in of_match_table, so that we don't create any confusion by using same
>> > compatible for newer SoCs also. Like,
>> >
>> > -     { .compatible = "samsung,exynos-dwc3" },
>> > +     { .compatible = "samsung,exynos5250-dwc3" },
>> > +     { .compatible =<new SoC using same IP>  },
>>
>> Yes, why not just use an SoC name where given IP first appeared ? I
> believe
>> IP revision numbers are not always well documented. Also when an IP is
>> instantiated multiple times in specific SoC, its revision number might not
>> be sufficient to determine the system integration details for each
> instance.
>> I think having version for some devices and SoC name for others just adds
>> to the confusion. Thus using specific chip name in the compatible property
>> seems more clear to me.
>>
> Well, I don't think so. Let's see the DMAC PL330. Its compatible is
> "arm,pl330" and "arm,primecell" not SoC/Chip name. I think DWC is a same
> case or at least similar.
>
> You know, the DWC is a IP from Synopsis and I _Believe_ it has a kind of
> version and it can be used for identify.
>

Right, DWC has version number, but that being the kind of USB controller
(USB 2.0 and USB 3.0)

DWC2: USB High Speed controller (as also indicated in the patch from
Paul: [RFC PATCH 0/6] DWC2 DesignWare HS OTG driver)
DWC3: USB Super Speed controller

Is it fine if we use something like shown below, as suggested by you earlier ?

-     { .compatible = "samsung,exynos-dwc3" },
+     { .compatible = "samsung,synopsis-dwc3" }




-- 
Thanks & Regards
Vivek
