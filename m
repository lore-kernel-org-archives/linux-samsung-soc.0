From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH Resend 1/3] ARM: EXYNOS: Consolidate Kconfig entries
Date: Thu, 20 Mar 2014 14:54:45 +0900
Message-ID: <02f701cf4400$e561e2c0$b025a840$@samsung.com>
References: <1395224705-2935-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48486 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbaCTFys (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 01:54:48 -0400
In-reply-to: <1395224705-2935-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com

Sachin Kamat wrote:
> 
> Instead of repeating the Kconfig entries for every SoC, move them under
> ARCH_EXYNOS4 and 5 and move the entries common to both 4 and 5 under
> ARCH_EXYNOS. Also, since the individual SoCs do not have any specific
> machine/platform code, keep them as boolean symbols instead of user
> selectable and select them from Exynos4 and 5 config symbols. Individual
> SoC symbols can be removed eventually once the driver Kconfig dependencies
> on these symbols are removed.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Acked-by: Tomasz Figa <t.figa@samsung.com>
> ---
> This is a resend of the series rebased on top of latest linux-next and
> Tomasz Figa's PM consolidation series 1 and 2.
> ---
>  arch/arm/Kconfig             |   10 +++++
>  arch/arm/mach-exynos/Kconfig |   89
+++++++++++---------------------------
> ----
>  2 files changed, 33 insertions(+), 66 deletions(-)
> 
Hmm...I'm still thinking whether we don't need to select some specific
Exynos SoCs. Because actually we're implement/develop some features based on
mainline kernel and sometimes the features are not valid on all of Exynos4
or Exynos5. Even though they are not in mainline, for mass product it's true
that Samsung needs to do it. It's another thing we have a plan for them or
not.

So in my opinion, basically consolidation something is usually good but it's
not always good so we need to provide a way to use one of both.

Thanks,
Kukjin
