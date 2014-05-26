From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] arm: exynos: Fix "allmodconfig" build errors in mcpm and hotplug
Date: Mon, 26 May 2014 12:19:54 +0530
Message-ID: <CAK9yfHzNkVZX6pMkFmdeubTgoZdRhd=U0oMtUDHr9bvZZYQYbQ@mail.gmail.com>
References: <1401083696-25702-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:37827 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbaEZGtz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 02:49:55 -0400
Received: by mail-oa0-f46.google.com with SMTP id i4so7910152oah.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2014 23:49:54 -0700 (PDT)
In-Reply-To: <1401083696-25702-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Thanks Abhilash.

On 26 May 2014 11:24, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> This fixes the following build errors:
>
> /tmp/ccRbZlaA.s: Assembler messages:
> /tmp/ccRbZlaA.s:69: Error: selected processor does not support ARM mode `isb '
> /tmp/ccRbZlaA.s:75: Error: selected processor does not support ARM mode `isb '
> /tmp/ccRbZlaA.s:76: Error: selected processor does not support ARM mode `dsb '
> make[1]: *** [arch/arm/mach-exynos/hotplug.o] Error 1
>
> /tmp/ccJEg4jw.s: Assembler messages:
> /tmp/ccJEg4jw.s:454: Error: selected processor does not support ARM mode `isb'
> /tmp/ccJEg4jw.s:455: Error: selected processor does not support ARM mode `dsb'
> /tmp/ccJEg4jw.s:465: Error: selected processor does not support ARM mode `isb'
> /tmp/ccJEg4jw.s:474: Error: selected processor does not support ARM mode `isb'
> /tmp/ccJEg4jw.s:475: Error: selected processor does not support ARM mode `dsb'
> /tmp/ccJEg4jw.s:516: Error: selected processor does not support ARM mode `isb'
> /tmp/ccJEg4jw.s:525: Error: selected processor does not support ARM mode `isb'
> /tmp/ccJEg4jw.s:526: Error: selected processor does not support ARM mode `dsb'
> make[1]: *** [arch/arm/mach-exynos/mcpm-exynos.o] Error 1
>
> Reported-by: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>

This patch fixes the above reported issues.

Tested-by: Sachin Kamat <sachin.kamat@linaro.org>

-- 
With warm regards,
Sachin
