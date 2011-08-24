From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/4] ARM: SAMSUNG: Add support for handling of cpu revision
Date: Wed, 24 Aug 2011 20:13:44 +0900
Message-ID: <06f301cc624e$e38dbd70$aaa93850$%kim@samsung.com>
References: <1313816759-14564-1-git-send-email-kgene.kim@samsung.com>
 <1313816759-14564-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15618 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750855Ab1HXLNq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Aug 2011 07:13:46 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQF000LHJ6XDAT0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Aug 2011 20:13:45 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQF0022CJ6X0N@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Aug 2011 20:13:45 +0900 (KST)
In-reply-to: <1313816759-14564-4-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Kukjin Kim wrote:
> 
> This patch adds plat-samsung/cpu.c for detecting of cpu id and
> silicon revision.
> 
> This patch was originally from Changhwan Youn <chaos.youn@samsung.com>
> 
> Acked-by: Changhwan Youn <chaos.youn@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---

(snip)

> +void __init s5p_init_cpu(void __iomem *cpuid_addr)
> +{
> +	samsung_cpu_id = __raw_readl(cpuid_addr);
> +	samsung_cpu_rev = samsung_cpu_id & 0xF;

Oops, should be 0xFF not 0xF.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
