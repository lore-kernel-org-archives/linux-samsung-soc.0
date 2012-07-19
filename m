From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] [CPUFREQ] EXYNOS5250: Add support max 1.7GHz for EXYNOS5250
Date: Thu, 19 Jul 2012 15:43:11 +0900
Message-ID: <184201cd6579$c3f90ee0$4beb2ca0$%kim@samsung.com>
References: <02d501cd4ebe$d9fbc100$8df34300$%kim@samsung.com>
 <144501cd63b0$a91e94c0$fb5bbe40$%kim@samsung.com>
 <201207172033.38308.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35923 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752614Ab2GSGnN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 02:43:13 -0400
In-reply-to: <201207172033.38308.rjw@sisk.pl>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'Rafael J. Wysocki'" <rjw@sisk.pl>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, jc.lee@samsung.com

Rafael J. Wysocki wrote:
> 
> On Tuesday, July 17, 2012, Kukjin Kim wrote:
> > Kukjin Kim wrote:
> > >
> > > From: Jaecheol Lee <jc.lee@samsung.com>
> > >
> > > This patch adds support 1.7GHz max frequency for EXYNOS5250
> > >
> > > Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> > > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > > ---
> > >  drivers/cpufreq/exynos5250-cpufreq.c |   55
> > +++++++++++++++---------------
> > > ----
> > >  1 files changed, 24 insertions(+), 31 deletions(-)
> > >

[snip]

> >
> > Hi Rafael,
> >
> > Any problems or comments on this? I couldn't find this in your tree...
> 
> No problems and I thought it would be merged through your platform tree.
> 
OK, thanks. I applied this in my tree.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
