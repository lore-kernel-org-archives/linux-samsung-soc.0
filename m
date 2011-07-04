From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] arm: exynos4: address a section mismatch w/ suspend issue.
Date: Mon, 04 Jul 2011 19:11:57 +0900
Message-ID: <005701cc3a32$d1c02c70$75408550$%kim@samsung.com>
References: <1306384822-17651-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61736 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757079Ab1GDKMF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 06:12:05 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNT005TO0C00FP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 19:12:03 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNT00MYJ0C27O@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 19:12:03 +0900 (KST)
In-reply-to: <1306384822-17651-1-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King' <linux@arm.linux.org.uk>, kyungmin.park@samsung.com, myungjoo.ham@gmail.com

MyungJoo Ham wrote:
> 
> The section mismatch in headsmp.S made hotplug stop working after the
> first instance of suspend-to-RAM and its wakeup.
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/headsmp.S |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/headsmp.S b/arch/arm/mach-
> exynos4/headsmp.S
> index 6c6cfc5..3cdeb36 100644
> --- a/arch/arm/mach-exynos4/headsmp.S
> +++ b/arch/arm/mach-exynos4/headsmp.S
> @@ -13,7 +13,7 @@
>  #include <linux/linkage.h>
>  #include <linux/init.h>
> 
> -	__INIT
> +	__CPUINIT
> 
>  /*
>   * exynos4 specific entry point for secondary CPUs.  This provides
> --
> 1.7.4.1

Will apply this into -fix tree.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
