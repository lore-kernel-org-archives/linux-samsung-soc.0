From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/4] ARM: EXYNOS4: Use samsung_rev() to distinguish silicon
 revision
Date: Wed, 24 Aug 2011 20:13:56 +0900
Message-ID: <06f401cc624e$eaa67390$bff35ab0$%kim@samsung.com>
References: <1313816759-14564-1-git-send-email-kgene.kim@samsung.com>
 <1313816759-14564-5-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26673 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751433Ab1HXLN6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Aug 2011 07:13:58 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQF00BPOJ72SGC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Aug 2011 20:13:57 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQF001S0J79J3@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Aug 2011 20:13:57 +0900 (KST)
In-reply-to: <1313816759-14564-5-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Kukjin Kim wrote:
> 
> This patch uses samsung_rev() to support variable silicon revision of
> EXYNOS4210 so that can support for EXYNOS4210 REV0, REV1.0 and REV1.1.
> 
> Note: Need to change timer setting on REV0.
> 
> Acked-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---

(snip)

> +#define EXYNOS4210_REV_1_0	(0x2)
> +#define EXYNOS4210_REV_1_1	(0x3)

Should be following...

+#define EXYNOS4210_REV_1_0	(0x10)
+#define EXYNOS4210_REV_1_1	(0x11)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
