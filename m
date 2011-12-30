From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Fix the memory mapped GPIOs on
 Cragganmore
Date: Fri, 30 Dec 2011 11:00:17 +0900
Message-ID: <02cc01ccc696$c741e400$55c5ac00$%kim@samsung.com>
References: <1325121813-2066-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <029301ccc5de$58557970$09006c50$%kim@samsung.com>
 <20111229103412.GC2909@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40270 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754604Ab1L3CAT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 21:00:19 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWZ00BXYUVOME80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Dec 2011 11:00:17 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWZ00KOWUWHYP50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 30 Dec 2011 11:00:17 +0900 (KST)
In-reply-to: <20111229103412.GC2909@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> On Thu, Dec 29, 2011 at 01:00:04PM +0900, Kukjin Kim wrote:
> 
> > And Mark, how about using DEFINE_RES_XXX() like following?
> 
> That's fine, though the mmgpio one does need to have the name added.

Yeah, it's  a little bit...so I'm sorting it out with others for next time
:)

Happy New Year!!!
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
