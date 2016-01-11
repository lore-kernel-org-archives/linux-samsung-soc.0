From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: domain off
Date: Mon, 11 Jan 2016 11:21:47 +0900
Message-ID: <569311BB.5040206@samsung.com>
References: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
 <CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
 <CAH9_wRN13+PKLsTL3kSonLUpzHo7zbQJZ658C4+fRZRxe=HeTw@mail.gmail.com>
 <CAJKOXPeCyEYtUGf2skAbudOjGiSVn8Hyzk76B5aW8VJT7apoqA@mail.gmail.com>
 <CAH9_wRO28-4jMHwfVpwnDFbut6m=2gv_zVd3EnLguZj9EJYebA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41454 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758014AbcAKCVx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2016 21:21:53 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0R003YZNWE7910@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Jan 2016 02:21:50 +0000 (GMT)
In-reply-to: <CAH9_wRO28-4jMHwfVpwnDFbut6m=2gv_zVd3EnLguZj9EJYebA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sriram V <vshrirama@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

On 11.01.2016 10:48, Sriram V wrote:
> Hi Krzystof,
> 
> 
> 
> On Mon, Jan 11, 2016 at 4:57 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> 2016-01-10 22:49 GMT+09:00 Sriram V <vshrirama@gmail.com>:
>>> Hi Krzysztof,
>>>
>>> I see that in pm_genpd_sumarry, the domains are off. However, i still
>>> see the clocks are on.
>>> For example; isp and cam is turned off in pm_genpd_summary, however
>>> cam clocks are still on.
>>>
>>> Should'nt the clocks be turned off first and then the domain.
>>
>> No, the clocks in clock hierarchy are usually not disabled as a part
>> of domain power off. However respective drivers attached to a power
>> domain, when entering runtime suspend, should disable these clocks.
>>
> 
> That is true, runtime suspend framework should disable the clocks.
> Hence, my question is if the clocks are active, Will disabling the
> domain take effect? Because when i print the status - they show that
> the domain is OFF.

Yes, the domain will be disabled.

> 
> On my system, what i see is camera clocks are active, But the domain
> is OFF. Hence, i am not sure if camera subsystem is consuming power or
> not since clocks are on.
> 
>>From my understanding, the domain status should not indicate OFF if
> any clocks are still on.

Clocks and power domains in Linux are (mostly) independent subsystems so
the domain will be disabled even though some clocks are active. Some
clocks may be even missing in Linux (not defined) - it doesn't matter...

It doesn't matter except in all the cases when this is a bug. :) The
clocks should be disabled and some muxes reparented to oscclk. One of
the cases we had was hang on reading clk_summary when power domain is off.

Best regards,
Krzysztof
