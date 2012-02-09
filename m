From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: EXYNOS: Enable MDMA driver
Date: Thu, 09 Feb 2012 20:42:02 +0900
Message-ID: <06a101cce71f$d747c870$85d75950$%kim@samsung.com>
References: <1328025437-5396-1-git-send-email-kgene.kim@samsung.com>
 <1328025437-5396-2-git-send-email-kgene.kim@samsung.com>
 <4F28A8BD.9000601@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54823 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756388Ab2BILmD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 06:42:03 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ4004E3J60U6V0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:42:00 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400M2CJ608N10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:42:00 +0900 (KST)
In-reply-to: <4F28A8BD.9000601@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Boojin Kim' <boojin.kim@samsung.com>

Tushar Behera wrote:
> 
> On 01/31/2012 09:27 PM, Kukjin Kim wrote:
> > From: Boojin Kim <boojin.kim@samsung.com>
> >
> > This patch adds MDMA platform data and enables
> > MDMA for DMA memcpy operation for EXYNOS SoCs.

[...]

> > +static struct clk exynos4_clk_mdma1 = {
> 
> exynos4_clk_mdma ?
> 
Boojin, could you please explain why you used 'exynos4_clk_mdma1' instead of
just mdma here?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
