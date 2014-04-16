From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/6] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 16 Apr 2014 23:00:50 +0200
Message-ID: <4235968.l5YN2u3Kvp@wuerfel>
References: <1397554134-11827-1-git-send-email-sachin.kamat@linaro.org> <5094962.iM2Kd6gfjd@wuerfel> <20140416205001.GY12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.24]:61536 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754827AbaDPVA6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 17:00:58 -0400
In-Reply-To: <20140416205001.GY12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <ta.omasab@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Abraham <thomas.ab@samsung.com>, Sangsu Park <sangsu4u.park@samsung.com>

On Wednesday 16 April 2014 21:50:01 Mark Brown wrote:
> On Wed, Apr 16, 2014 at 08:14:27PM +0200, Arnd Bergmann wrote:
> 
> > This patch does a partial revert of 313367e7bfa by allowing these
> > drivers on all samsung platforms except EXYNOS, so we can proceed
> > with the multiplatform patches.
> 
> > If support for these drivers is actually needed on EXYNOS machines,
> > the drivers should first be moved over to use the dmaengine code.
> 
> I would be surprised if neither IP is present on any Exynos SoC, they
> were added in the s5p range.  Is Sachin's fix for building these
> (present in -rc1) not doing the job?

I hadn't noticed that patch, it probably does, so nevermind.

	Arnd
