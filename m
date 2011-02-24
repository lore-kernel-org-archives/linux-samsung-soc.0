From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S5PC110: disable unused power regulators on Goni
	board
Date: Thu, 24 Feb 2011 10:33:43 +0900
Message-ID: <022a01cbd3c2$e335ef70$a9a1ce50$%kim@samsung.com>
References: <1297760784-8486-1-git-send-email-m.szyprowski@samsung.com>
 <1297760784-8486-2-git-send-email-m.szyprowski@samsung.com>
 <01f301cbd343$d0af4c90$720de5b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43049 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754205Ab1BXBdv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Feb 2011 20:33:51 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LH30055LLOEBF80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Feb 2011 10:33:50 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LH3001KULODQ3@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 24 Feb 2011 10:33:50 +0900 (KST)
In-reply-to: <01f301cbd343$d0af4c90$720de5b0$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com

Kukjin Kim wrote:
> 
> Marek Szyprowski wrote:
> >
> > A lot of power regulator has been enabled by default causing the board
> > to consume a lot of power. This patch fixes this issue.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  arch/arm/mach-s5pv210/mach-goni.c |   10 +---------
> >  1 files changed, 1 insertions(+), 9 deletions(-)

(snip)

> > @@ -371,7 +369,6 @@ static struct regulator_init_data goni_ldo11_data =
{
> >  		.min_uV		= 2800000,
> >  		.max_uV		= 2800000,
> >  		.apply_uV	= 1,
> > -		.always_on	= 1,
> >  	},
> >  };

Oops, already merged above changes by Sylwester's "Add supplies for CIF
camera on GONI board" into my for-next.
So will apply this with removing above changes.

(snip)

> > @@ -391,7 +387,6 @@ static struct regulator_init_data goni_ldo13_data =
{
> >  		.min_uV		= 2800000,
> >  		.max_uV		= 2800000,
> >  		.apply_uV	= 1,
> > -		.always_on	= 1,
> >  	},
> >  };

Same as above.

> > @@ -401,7 +396,6 @@ static struct regulator_init_data goni_ldo14_data =
{
> >  		.min_uV		= 1800000,
> >  		.max_uV		= 1800000,
> >  		.apply_uV	= 1,
> > -		.always_on	= 1,
> >  	},
> >  };

Same as above.

(snip)

> > --
> 
> Ok...will apply this.
> And how about "mach-aquila.c"?
> 

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
