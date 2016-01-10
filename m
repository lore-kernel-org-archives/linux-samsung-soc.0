From: Sriram V <vshrirama@gmail.com>
Subject: Re: domain off
Date: Sun, 10 Jan 2016 19:19:14 +0530
Message-ID: <CAH9_wRN13+PKLsTL3kSonLUpzHo7zbQJZ658C4+fRZRxe=HeTw@mail.gmail.com>
References: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
	<CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:33178 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756717AbcAJNtP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2016 08:49:15 -0500
Received: by mail-yk0-f172.google.com with SMTP id k129so384749217yke.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Jan 2016 05:49:15 -0800 (PST)
In-Reply-To: <CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

I see that in pm_genpd_sumarry, the domains are off. However, i still
see the clocks are on.
For example; isp and cam is turned off in pm_genpd_summary, however
cam clocks are still on.

Should'nt the clocks be turned off first and then the domain.






On Sun, Jan 10, 2016 at 11:45 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2016-01-09 19:19 GMT+09:00 Sriram V <vshrirama@gmail.com>:
>>
>> Hello,
>>
>> I am trying to power down power domains which are not used but i am
>> unable to do so unless i write manually into the registers.
>>
>> Can anyone help me on the standard way to power down power domains on
>> a exynos 5422.
>>
>> I  tried marking status /bts-status to disable in the device tree file
>> for pd-disp1, but that does not help.
>>
>> What is the standard way of powering down if they are not used. Do we
>> need to do using dt or somewhere in the kernel board file?
>
> Hi,
>
> The domains defined in DT (and enabled in DT... status=disabled marks
> the *node* as disabled, not the power domain) are automatically turned
> off when attached devices are runtime suspended. Use
> PM_DEBUG+PM_ADVANCED_DEBUG and then:
> cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
>
> Domains not present there are not defined so they are left in default
> status set by bootloader (probably on).
>
> BR,
> Krzysztof



-- 
Regards,
Sriram
