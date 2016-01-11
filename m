From: Sriram V <vshrirama@gmail.com>
Subject: Re: domain off
Date: Mon, 11 Jan 2016 07:18:06 +0530
Message-ID: <CAH9_wRO28-4jMHwfVpwnDFbut6m=2gv_zVd3EnLguZj9EJYebA@mail.gmail.com>
References: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
	<CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
	<CAH9_wRN13+PKLsTL3kSonLUpzHo7zbQJZ658C4+fRZRxe=HeTw@mail.gmail.com>
	<CAJKOXPeCyEYtUGf2skAbudOjGiSVn8Hyzk76B5aW8VJT7apoqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:33241 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757932AbcAKBsH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2016 20:48:07 -0500
Received: by mail-yk0-f173.google.com with SMTP id k129so394444768yke.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Jan 2016 17:48:07 -0800 (PST)
In-Reply-To: <CAJKOXPeCyEYtUGf2skAbudOjGiSVn8Hyzk76B5aW8VJT7apoqA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Krzystof,



On Mon, Jan 11, 2016 at 4:57 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2016-01-10 22:49 GMT+09:00 Sriram V <vshrirama@gmail.com>:
>> Hi Krzysztof,
>>
>> I see that in pm_genpd_sumarry, the domains are off. However, i still
>> see the clocks are on.
>> For example; isp and cam is turned off in pm_genpd_summary, however
>> cam clocks are still on.
>>
>> Should'nt the clocks be turned off first and then the domain.
>
> No, the clocks in clock hierarchy are usually not disabled as a part
> of domain power off. However respective drivers attached to a power
> domain, when entering runtime suspend, should disable these clocks.
>

That is true, runtime suspend framework should disable the clocks.
Hence, my question is if the clocks are active, Will disabling the
domain take effect? Because when i print the status - they show that
the domain is OFF.

On my system, what i see is camera clocks are active, But the domain
is OFF. Hence, i am not sure if camera subsystem is consuming power or
not since clocks are on.

>From my understanding, the domain status should not indicate OFF if
any clocks are still on.



> Best regards,
> Krzysztof



-- 
Regards,
Sriram
