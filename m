From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Set 1000ns as PWM backlight period on
 SMDKV210
Date: Wed, 21 Dec 2011 13:11:17 +0900
Message-ID: <061c01ccbf96$963e80e0$c2bb82a0$%kim@samsung.com>
References: <1320804636-19950-1-git-send-email-jg1.han@samsung.com>
 <03e701ccb4b0$d1279de0$7376d9a0$%kim@samsung.com>
 <20111209035401.GA25601@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:65483 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002Ab1LUELS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 23:11:18 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWJ00136CXM6ZB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 13:11:17 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWJ002T5CYTYJ00@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 13:11:17 +0900 (KST)
In-reply-to: <20111209035401.GA25601@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> On Wed, Dec 07, 2011 at 04:21:20PM +0900, Kukjin Kim wrote:
> 
> > If switch frequency is 1kHz, the value of pwm_period_ns should be
> 1000000 at
> > mach-crag6410.c not 100000?
> 
> I guess so, please go ahead and make the change - we can always revert
> if it doesn't work.

OK, let me do it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
