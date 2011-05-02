From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 0/2] Add WM8994 PCM Machine driver for Exynos4210
Date: Mon, 02 May 2011 16:06:58 +0900
Message-ID: <083701cc0897$9990f680$ccb2e380$%kim@samsung.com>
References: <1303954372-18565-1-git-send-email-sbkim73@samsung.com>
 <20110428103824.GC14494@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34645 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753900Ab1EBHHb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 May 2011 03:07:31 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LKK00CBQ3RSZM60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 May 2011 16:07:29 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LKK005RC3SGNX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 May 2011 16:07:29 +0900 (KST)
In-reply-to: <20110428103824.GC14494@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Sangbeom Kim' <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, ben-linux@fluff.org

Mark Brown wrote:
> 
> On Thu, Apr 28, 2011 at 10:32:50AM +0900, Sangbeom Kim wrote:
> 
> > This is 2nd patchset for WM8994 pcm machine driver that supports
> > PCM audio on SMDKV310, SMDKC210 and test is done.
> 
> As with your first patch set I'm waiting for a response from Kukjin
> here.  I'm expecting that the arch/arm parts won't be merged as they add
> new features.

Hmm...yeah, need more time and some solutions for it...first of all, I'm
thinking to keep some branch for new features is possible and if required,
it can be adapted after arch/arm consolidation work. But as you know, the
branch cannot be sent to upstream upcoming merge window.

If any updates, let you know :)
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
