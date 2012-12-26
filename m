From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Wed, 26 Dec 2012 23:58:34 +0100
Message-ID: <50DB811A.8010408@gmail.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com> <20121215072014.2E05E3E0AE3@localhost> <CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com> <CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com> <CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com> <016901cde163$6be034c0$43a09e40$@samsung.com> <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:47087 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751142Ab2LZW6l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 17:58:41 -0500
In-Reply-To: <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, balbi@ti.com, Thomas Abraham <thomas.abraham@linaro.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>

On 12/24/2012 09:13 AM, Vivek Gautam wrote:
>>>> These two changes look good to me.  For both of them:
>>>>
>>>> Reviewed-by: Doug Anderson<dianders@chromium.org>
>>>
>>> Well, I have another idea. Yes, I know, specific chip name should be used.
>> But
>>> you know the specific chip name in compatible can cause another confusion
>>> on other SoC which has same IP. So I think, we need to consider to use
>>> common name or any specific name not chip in compatible for IP/driver like
>>> following?
>>>
>>> -     { .compatible = "samsung,exynos-dwc3" },
>>> +     { .compatible = "samsung,synopsis-dwc3" },
>>>
>>> Or if any version or something, how about following?
>>>
>>> +     { .compatible = "samsung,dwc-v3" },
>>>
> Well, yes the newer SoCs with same IP using the chip name can cause some
> confusion, but won't it be fine that -
> "Newer parts using the same core can claim compatibility by
> including the older string in the compatible list" - as quoted by Grant Likely
>
> Or, can we try another option, using multiple compatible strings for
> SoC specific
> in of_match_table, so that we don't create any confusion by using same
> compatible for newer SoCs also. Like,
>
> -     { .compatible = "samsung,exynos-dwc3" },
> +     { .compatible = "samsung,exynos5250-dwc3" },
> +     { .compatible =<new SoC using same IP>  },

Yes, why not just use an SoC name where given IP first appeared ? I believe
IP revision numbers are not always well documented. Also when an IP is
instantiated multiple times in specific SoC, its revision number might not
be sufficient to determine the system integration details for each instance.
I think having version for some devices and SoC name for others just adds
to the confusion. Thus using specific chip name in the compatible property
seems more clear to me.

--

Thanks,
Sylwester
