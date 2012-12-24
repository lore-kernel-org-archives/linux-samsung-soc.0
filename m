From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Mon, 24 Dec 2012 13:43:23 +0530
Message-ID: <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
	<20121215072014.2E05E3E0AE3@localhost>
	<CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
	<CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
	<CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
	<016901cde163$6be034c0$43a09e40$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:47011 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752934Ab2LXINZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Dec 2012 03:13:25 -0500
In-Reply-To: <016901cde163$6be034c0$43a09e40$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, balbi@ti.com, Thomas Abraham <thomas.abraham@linaro.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>

Hi Kukjin,


On Mon, Dec 24, 2012 at 4:45 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Kukjin Kim wrote:
>>
> Re-sending due to e-mail client problem...
>
>> Doug Anderson wrote:
>> >
>> > On Fri, Dec 21, 2012 at 12:14 AM, Vivek Gautam
>> > <gautamvivek1987@gmail.com> wrote:
>> > > On Wed, Dec 19, 2012 at 7:16 PM, Vivek Gautam
>> > <gautamvivek1987@gmail.com> wrote:
>> > >>
>> > >> On Sat, Dec 15, 2012 at 12:50 PM, Grant Likely
>> > >> <grant.likely@secretlab.ca> wrote:
>> > >>> On Thu, 13 Dec 2012 20:22:26 +0530, Vivek Gautam
>> > <gautam.vivek@samsung.com> wrote:
>> > >>>> Using chip specific compatible string as it should be.
>> > >>>> So fixing this for ehci-s5p, ohci-exynos and dwc3-exynos
>> > >>>> which till now used a generic 'exynos' in their compatible strings.
>> > >>>>
>> > >>>> This goes as per the discussion happened in the thread for
>> > >>>> [PATCH v2] ARM: Exynos5250: Enabling dwc3-exynos driver
>> > >>>> available at:
>> > >>>> http://www.spinics.net/lists/linux-usb/msg74145.html
>> > >>>>
>> > >>>> Vivek Gautam (2):
>> > >>>>   usb: ehci-s5p/ohci-exynos: Fix compatible strings for the device
>> > >>>>   usb: dwc3-exynos: Fix compatible strings for the device
>> > >>>
>> > >>> for both patches:
>> > >>> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>> > >>>
>> > >
>> > > Any more thought about this patch-set?
>> > > Or does this change seems fine?
>> >
>> > These two changes look good to me.  For both of them:
>> >
>> > Reviewed-by: Doug Anderson <dianders@chromium.org>
>>
>> Well, I have another idea. Yes, I know, specific chip name should be used.
> But
>> you know the specific chip name in compatible can cause another confusion
>> on other SoC which has same IP. So I think, we need to consider to use
>> common name or any specific name not chip in compatible for IP/driver like
>> following?
>>
>> -     { .compatible = "samsung,exynos-dwc3" },
>> +     { .compatible = "samsung,synopsis-dwc3" },
>>
>> Or if any version or something, how about following?
>>
>> +     { .compatible = "samsung,dwc-v3" },
>>
Well, yes the newer SoCs with same IP using the chip name can cause some
confusion, but won't it be fine that -
"Newer parts using the same core can claim compatibility by
including the older string in the compatible list" - as quoted by Grant Likely

Or, can we try another option, using multiple compatible strings for
SoC specific
in of_match_table, so that we don't create any confusion by using same
compatible
for newer SoCs also. Like,

-     { .compatible = "samsung,exynos-dwc3" },
+     { .compatible = "samsung,exynos5250-dwc3" },
+     { .compatible = <new SoC using same IP> },

>> - Kukjin
>



-- 
Thanks & Regards
Vivek
