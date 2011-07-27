From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM:EXYNOS4:Fix Samsung Power Domain
Date: Wed, 27 Jul 2011 14:37:06 +0200
Message-ID: <004901cc4c59$e4c30c50$ae4924f0$%szyprowski@samsung.com>
References: <1311769503-4232-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18159 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752848Ab1G0MhM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 08:37:12 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOZ00KOWSDY6F@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 13:37:10 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOZ00K1VSDXM4@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 13:37:10 +0100 (BST)
In-reply-to: <1311769503-4232-1-git-send-email-sangwook.lee@linaro.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangwook Lee' <sangwook.lee@linaro.org>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>

Hello,

On Wednesday, July 27, 2011 2:25 PM Sangwook Lee wrote:

> Func:samsung_pd_init should be postponed utill end of drivers
> registeration because this activates runtime_suspend in advance.
> 
> For example,
> If PD's runtime_suspend is called, it will power down LCD0_CONF0.
> Since this happens before s3cfb driver registers itself,
> it makes s3cfb_probe hang up with both Origen and SMDK

Nope. This is completely wrong. Power domain driver should be activated
before any device drivers. If the driver hangs in probe() because the
power domain has been suspended, then it is a bug in that driver. Each
driver should call pm_runtime_get_sync() in it's probe if it supports
runtime pm. If you delay registration of power domain driver, then how
do you want to probe devices that belongs to power domains which has
been disabled by bootloader? Our bootloader disables all power domains
that are not needed at boot time.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
