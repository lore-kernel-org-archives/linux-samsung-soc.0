From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Consolidate Kconfig entries
Date: Thu, 06 Feb 2014 15:10:39 +0100
Message-ID: <52F397DF.6050209@samsung.com>
References: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52263 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752829AbaBFOKn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 09:10:43 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0K00JL3VDQQL60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 14:10:38 +0000 (GMT)
In-reply-to: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, olof@lixom.net

Hi Sachin,

On 06.02.2014 12:59, Sachin Kamat wrote:
> Instead of repeating the Kconfig entries for every SoC, move them under
> ARCH_EXYNOS4 and 5 and move the entries common to both 4 and 5 under
> ARCH_EXYNOS. Also, since the individual SoCs do not have any specific
> machine/platform code, keep them as boolean symbols instead of user
> selectable and select them from Exynos4 and 5 config symbols. Individual
> SoC symbols can be removed eventually once the driver Kconfig dependencies
> on these symbols are removed.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>   arch/arm/Kconfig             |   12 ++++++
>   arch/arm/mach-exynos/Kconfig |   97 ++++++++++--------------------------------
>   2 files changed, 35 insertions(+), 74 deletions(-)

I fully agree that there is no real need of having per-SoC Kconfig 
entries, since the differences caused by them are quite insignificant. 
Moreover, this makes me wonder if there is even need to distinguish 
between ARCH_EXYNOS4 and ARCH_EXYNOS5...

Anyway, I second this patch:

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
