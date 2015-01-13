From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 2/4] clk: samsung: exynos7: add clocks for SPI block
Date: Tue, 13 Jan 2015 11:40:34 +0530
Message-ID: <CAAgF-BcVRUY-kWRJ0KmpkX6GPsppDBd0O73R_pLdPU=OOen8Kw@mail.gmail.com>
References: <1418995427-7712-1-git-send-email-padma.v@samsung.com>
	<1418995427-7712-3-git-send-email-padma.v@samsung.com>
	<CAFp+6iFzawDY1wFA-2AQUHFCk54WsaCJAOkrqvX9t7b-XugY8g@mail.gmail.com>
	<CAFp+6iHaJ3b9+ERygksNLcyG9PxP2yf-6BTtwFgFgcUOqX+PVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:39233 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbbAMGKf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 01:10:35 -0500
In-Reply-To: <CAFp+6iHaJ3b9+ERygksNLcyG9PxP2yf-6BTtwFgFgcUOqX+PVg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi ViVek,

On 1/9/15, Vivek Gautam <gautamvivek1987@gmail.com> wrote:
> On Fri, Jan 9, 2015 at 5:18 PM, Vivek Gautam <gautamvivek1987@gmail.com>
> wrote:
>> Hi Padma,
>>
>>
>> On Fri, Dec 19, 2014 at 6:53 PM, Padmavathi Venna <padma.v@samsung.com>
>> wrote:
>>> Add clock support for 5 SPI channels.
>>>
>>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>>> ---

[snip]

>> Same here for SCLK_SPI5, unused in the patch.

ok.

>>
>> [snip]
>>
>> The rest all looks good in this patch. I have also verified from the
>> Exynos7 UM.
>
> missed it earlier. You may also want to add update documentation for
> clock sources
> of peric1 block.

I will add the required source clks.
Thanks for the review.

Padma
>
>
> --
> Best Regards
> Vivek Gautam
> Samsung R&D Institute, Bangalore
> India
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
