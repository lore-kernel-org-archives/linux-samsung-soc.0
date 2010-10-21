From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/5] ARM: SAMSUNG: Add to enable/disable clock on S3C PL330
Date: Thu, 21 Oct 2010 11:36:13 +0900
Message-ID: <030201cb70c8$bc7f4aa0$357ddfe0$%kim@samsung.com>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
 <1287622713-1657-6-git-send-email-kgene.kim@samsung.com>
 <AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36862 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757187Ab0JUCfz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 22:35:55 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAM00DY1CJTQUE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Oct 2010 11:35:53 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAM008LRCJTFK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Oct 2010 11:35:53 +0900 (KST)
In-reply-to: <AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Seungwhan Youn' <sw.youn@samsung.com>

Kyungmin Park wrote:
> 
> On Thu, Oct 21, 2010 at 9:58 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > From: Seungwhan Youn <sw.youn@samsung.com>
> >
> > This patch adds to enable/disable DMA operation clock on S3C-PL330
> > DMA controller driver.
> 
> The title and description seems to clock gating but actual code is
> just enable at probe and disable at remove.
> 
> Can you make it REAL clock gating, enable clock only when using?
> 

This is just to move DMA enable/disable clock into DMA driver(S3C PL330).
So it would be better if we could discuss about what you said next time.

Basically, I prefer most clocks should be registered as disabled, then if
required enable, just should be controlled in each driver.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
