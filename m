From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: Add clkdev support to HSMMC
Date: Wed, 31 Aug 2011 18:43:04 +0530
Message-ID: <CAJuYYwRMoawqOM5nunYzcjh5G1H3MaB+egk-2iwmGTKVFxUu0w@mail.gmail.com>
References: <0LQO00HOLZVZDW20@ms6.samsung.com>
	<4E5DF40A.1040707@samsung.com>
	<CAJuYYwRmEdvo684vP+pRo2XyyPbyxNOMobMVr4TFLUDCv9HHew@mail.gmail.com>
	<4E5E2F80.3010005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:49238 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755349Ab1HaNNG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 09:13:06 -0400
Received: by gwaa12 with SMTP id a12so40302gwa.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Aug 2011 06:13:04 -0700 (PDT)
In-Reply-To: <4E5E2F80.3010005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: banajit.g@samsung.com, RAJESHWARI S SHINDE <rajeshwari.s@samsung.com>, PADMAVATHI VENNA <padma.v@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Sylwester,

On 31 August 2011 18:26, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi Thomas,
>
> On 08/31/2011 12:13 PM, Thomas Abraham wrote:
>>
>> [...]
>>
>>
>>>> 3) In the proposed implementation where we create connection ids only for the
>>>> bus clocks we are creating an extra node for the same in the clkdev table,
>>>
>>>> where as the clock is getting registered only once with the kernel.
>>>
>>> I don't agree with this last statement, the same struct clk is added to
>>> the list of clocks known by the system twice, in s3c24xx_register_clocks()
>>> and clkdev_add_table(). This is only what I have been pointing out.
>>> Please correct me, if I missed anything.
>>
>> s3c24xx_register_clock and clkdev_add_table add one instance of
>> "struct clk_lookup" each (with different connections ids) but both of
>> these "struct clk_lookup" instances point to the same "struct clk"
>> instance.
>
> Yes, that's what happens in Banajit's code.
>
>>
>> So, is two instances of "struct clk_lookup" pointing to the same
>> "struct clk" instance the concern in this case?
>
> No, I don't see this as a problem. Just wanted to get things clarified.
>
> And to suggest that we could avoid having re-created struct clk and struct
> clk_clksrc arrays for s3c24xx_register_clocks() and s3c_register_clksrc()
> functions. However I don't consider this a significant issue.

Thanks for letting us know your opinion.

Regards,
Thomas.

>
> --
> Regards,
> Sylwester
> --
> Sylwester Nawrocki
> Samsung Poland R&D Center
>
