From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 06/10] ARM: EXYNOS: Add support for mapping PMU base
 address via DT
Date: Sat, 05 Apr 2014 19:58:04 +0900
Message-ID: <533FE1BC.7050300@samsung.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com>
 <1396425058-4012-7-git-send-email-pankaj.dubey@samsung.com>
 <533BF905.6070701@samsung.com> <533BFF69.1060701@monstr.eu>
 <533D24D6.2030103@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10553 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751896AbaDEKkk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Apr 2014 06:40:40 -0400
In-reply-to: <533D24D6.2030103@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: monstr@monstr.eu, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, Young-Gun Jang <yg1004.jang@samsung.com>

On 04/03/2014 06:07 PM, Sylwester Nawrocki wrote:
> On 02/04/14 14:15, Michal Simek wrote:
>>> There were some patches posted for syscon to make it available in earlier
>>> system initialization stage: https://lkml.org/lkml/2014/2/19/218
>> I haven't finished this yet. I have to look at it again.
> Thanks for the information, I assume this would be also useful
> on the Exynos SoC series, so I'd be happy to see continuation
> of those works.

It is useful for Exynos SoC series and I have modified this patch series to use 
early syscon
initialization API and I can see it's working.
I have some observation for early initialization of syscon API which I will
update in corresponding message thread.

> --
> Thanks,
> Sylwester
>


-- 
Best Regards,
Pankaj Dubey
