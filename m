From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 00/12] Samsung PM consolidation part 2 (multiplatform)
Date: Sat, 08 Feb 2014 00:59:46 +0100
Message-ID: <52F57372.7010507@gmail.com>
References: <1391713977-22300-1-git-send-email-t.figa@samsung.com> <20140207221537.GA12714@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:57749 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750868AbaBGX7w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Feb 2014 18:59:52 -0500
Received: by mail-ea0-f173.google.com with SMTP id d10so1864971eaj.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2014 15:59:51 -0800 (PST)
In-Reply-To: <20140207221537.GA12714@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>



On 07.02.2014 23:15, Olof Johansson wrote:
> On Thu, Feb 06, 2014 at 08:12:45PM +0100, Tomasz Figa wrote:
>
>> On Exynos4210-based Trats, Exynos4412-based Trats2 and Exynos5250-based
>> Arndale boards (except suspend/resume, which is broken because of
>> unrelated reasons):
>
> Has this been reported, and is it being worked on by anyone?

Yes, reported quite a long time ago by Vikas Sajjan of Samsung/Linaro, 
but I'm not sure if anybody is working to fix it.

I've been looking into this for a while, but couldn't really find 
anything except that it hangs when PMU starts power state transtion 
after CPU executing WFI instruction.

Best regards,
Tomasz
