From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 06/10] ARM: EXYNOS: Add support for mapping PMU base
 address via DT
Date: Thu, 03 Apr 2014 11:07:34 +0200
Message-ID: <533D24D6.2030103@samsung.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com>
 <1396425058-4012-7-git-send-email-pankaj.dubey@samsung.com>
 <533BF905.6070701@samsung.com> <533BFF69.1060701@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24431 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162296AbaDCJHo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 05:07:44 -0400
In-reply-to: <533BFF69.1060701@monstr.eu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: monstr@monstr.eu
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com, Young-Gun Jang <yg1004.jang@samsung.com>

On 02/04/14 14:15, Michal Simek wrote:
>> There were some patches posted for syscon to make it available in earlier
>> system initialization stage: https://lkml.org/lkml/2014/2/19/218
>
> I haven't finished this yet. I have to look at it again.

Thanks for the information, I assume this would be also useful
on the Exynos SoC series, so I'd be happy to see continuation
of those works.

--
Thanks,
Sylwester
