From: Sriram V <vshrirama@gmail.com>
Subject: Re: domain off
Date: Wed, 20 Jan 2016 16:05:23 +0530
Message-ID: <CAH9_wRNxxifRBh6p77e3Pqh4QpbSmYrg6g+WOR2AjAX9EHG6ZA@mail.gmail.com>
References: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
	<CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
	<CAH9_wRN13+PKLsTL3kSonLUpzHo7zbQJZ658C4+fRZRxe=HeTw@mail.gmail.com>
	<CAJKOXPeCyEYtUGf2skAbudOjGiSVn8Hyzk76B5aW8VJT7apoqA@mail.gmail.com>
	<CAH9_wRO28-4jMHwfVpwnDFbut6m=2gv_zVd3EnLguZj9EJYebA@mail.gmail.com>
	<569311BB.5040206@samsung.com>
	<CAH9_wRPnvosp4sq3fBHGhd7G=V69s7qQdg3mUF_d08aWS4H_ng@mail.gmail.com>
	<569F5D80.4040103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:32909 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934080AbcATKfY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 05:35:24 -0500
Received: by mail-yk0-f172.google.com with SMTP id k129so4596183yke.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jan 2016 02:35:24 -0800 (PST)
In-Reply-To: <569F5D80.4040103@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,


Are you saying that only power domains under "Local Power Control" can
be attached to runtime PM and can be turned off?

In that case, i dont see other domains such as peris, psgen, wcore in
there, Hence these need to be always on?

is my understanding correct?


Thanks


On Wed, Jan 20, 2016 at 3:42 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 20.01.2016 18:52, Sriram V wrote:
>> Hi Krzyszof,
>>
>>
>>
>> On Mon, Jan 11, 2016 at 7:51 AM, Krzysztof Kozlowski
>> <k.kozlowski@samsung.com> wrote:
>>> On 11.01.2016 10:48, Sriram V wrote:
>>>> Hi Krzystof,
>>>>
>>>>
>>>>
>>>> On Mon, Jan 11, 2016 at 4:57 AM, Krzysztof Kozlowski
>>>> <k.kozlowski@samsung.com> wrote:
>>>>> 2016-01-10 22:49 GMT+09:00 Sriram V <vshrirama@gmail.com>:
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> I see that in pm_genpd_sumarry, the domains are off. However, i still
>>>>>> see the clocks are on.
>>>>>> For example; isp and cam is turned off in pm_genpd_summary, however
>>>>>> cam clocks are still on.
>>>>>>
>>>>>> Should'nt the clocks be turned off first and then the domain.
>>>>>
>>>>> No, the clocks in clock hierarchy are usually not disabled as a part
>>>>> of domain power off. However respective drivers attached to a power
>>>>> domain, when entering runtime suspend, should disable these clocks.
>>>>>
>>>>
>>>> That is true, runtime suspend framework should disable the clocks.
>>>> Hence, my question is if the clocks are active, Will disabling the
>>>> domain take effect? Because when i print the status - they show that
>>>> the domain is OFF.
>>>
>>> Yes, the domain will be disabled.
>>>
>>>>
>>>> On my system, what i see is camera clocks are active, But the domain
>>>> is OFF. Hence, i am not sure if camera subsystem is consuming power or
>>>> not since clocks are on.
>>>>
>>>> >From my understanding, the domain status should not indicate OFF if
>>>> any clocks are still on.
>>>
>>> Clocks and power domains in Linux are (mostly) independent subsystems so
>>> the domain will be disabled even though some clocks are active. Some
>>> clocks may be even missing in Linux (not defined) - it doesn't matter...
>>>
>>> It doesn't matter except in all the cases when this is a bug. :) The
>>> clocks should be disabled and some muxes reparented to oscclk. One of
>>> the cases we had was hang on reading clk_summary when power domain is off.
>>>
>>
>> Thanks for your pointers.
>>
>> When i boot the kernel, I see that the following domains are currently
>> on. I see that the following domains are currently on, Linux does not
>> know about these domains and they are permanently on.
>>
>> pd-fsys, pd-psgen, pd-peric, pd-wcore
>>
>> Is there a way of finding out if these can be shut off. i dont think
>> if clocks for the IP's serviced by these domains and the domain itself
>> is correctly tied-in in runtime-pm. As these domains are always on.
>
> The datasheet/reference manual in the "Local power control" describes
> conditions whether they could be disabled or not. It also documents what
> is required to power off them.
>
>>
>> Also, what kernel are you using?
>
> Usually mainline and linux-next.
>
> In some of the projects I use different ones, e.g. these on tizen.org
> (https://review.tizen.org/git/?p=platform/kernel/linux-exynos.git;a=summary).
>
> Best regards,
> Krzysztof



-- 
Regards,
Sriram
