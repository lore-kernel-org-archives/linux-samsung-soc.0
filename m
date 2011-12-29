From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V1] ARM: EXYNOS: Adds Samsung TRATS board support
Date: Thu, 29 Dec 2011 12:30:20 +0900
Message-ID: <028701ccc5da$31491fc0$93db5f40$%kim@samsung.com>
References: <1324966676-5714-1-git-send-email-riverful.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9825 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336Ab1L2DaW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 22:30:22 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWY00H7E4EJ5K80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:30:20 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWY00BAY4EKWA70@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 29 Dec 2011 12:30:20 +0900 (KST)
In-reply-to: <1324966676-5714-1-git-send-email-riverful.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'HeungJun, Kim'" <riverful.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com

HeungJun, Kim wrote:
> 
> This patch adds Samsung Mobile TRATS board support.
> 
> The changes against V0:
>   1) Modify Makefile & boardfile name: from "board-trats.c" to "mach-
> trats.c"
>   2) Fix name of mmc's fixed regulator: remove "inverted"
>   3) Fix directory name on GPL comments: from "exynos4" to "exynos"
> 
> Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig      |   11 ++
>  arch/arm/mach-exynos/Makefile     |    1 +
>  arch/arm/mach-exynos/mach-trats.c |  340
> +++++++++++++++++++++++++++++++++++++
>  3 files changed, 352 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/mach-trats.c
> 
Hi HeungJun,

Thanks for your re-submit.

Hmm, maybe this is v2 not v1?

Anyway, as I said, this conflicts with other ARM consolidation works. So
please wait until after the merge window for this patch.

Happy New Year.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
