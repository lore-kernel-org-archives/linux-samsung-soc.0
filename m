From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: Re: [PATCH] ARM: Exynos4: Bring exynos4-dt up to date
Date: Thu, 09 Feb 2012 10:24:32 +0100
Message-ID: <4F3390D0.7040209@samsung.com>
References: <1328028434-30139-1-git-send-email-k.lewandowsk@samsung.com>
 <1328028434-30139-2-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30037 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429Ab2BIJYK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 04:24:10 -0500
In-reply-to: <1328028434-30139-2-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: thomas.abraham@linaro.org, m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com

On 31.01.2012 17:47, Karol Lewandowski wrote:

> This commit brings exynos4-dt in line with recent changes to
> mach-exynos tree, specifically:
> 
>  - Fixes build break related to replacing plat/exynos4.h with common.h
>    in commit cc511b8d84d8 ("ARM: 7257/1: EXYNOS: introduce
>    arch/arm/mach-exynos/common.[ch]")


 
>  - Converts machine to use CONFIG_MULTI_IRQ_HANDLER as done for other
>    machines in commit 4e44d2cb95bd ("ARM: exynos4: convert to
>    CONFIG_MULTI_IRQ_HANDLER") converted all exynos boards but
>    exynos4-dt.c.


Minor correction - text from "converted all.." shall be deleted, like:

   - Converts machine to use CONFIG_MULTI_IRQ_HANDLER as done for other
     machines in commit 4e44d2cb95bd ("ARM: exynos4: convert to
     CONFIG_MULTI_IRQ_HANDLER")

(It's result of not proofreading it carefully enough after squashing all
the patches.)

I don't think such a change is worth sending patch again, but I would be
grateful if you could fix it while merging.

Thanks

-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
