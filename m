From: Olof Johansson <olof@lixom.net>
Subject: Re: About LPAE supporting on EXYNOS5440
Date: Tue, 11 Jun 2013 17:11:12 -0700
Message-ID: <20130612001112.GK23774@quad.lixom.net>
References: <109e01ce667e$5becc880$13c65980$%kim@samsung.com>
 <6690814.Wx0lSuVAQ5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:54135 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752354Ab3FLALI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 20:11:08 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj3so4864335pad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 17:11:07 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <6690814.Wx0lSuVAQ5@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Tue, Jun 11, 2013 at 11:53:36AM +0200, Arnd Bergmann wrote:
> On Tuesday 11 June 2013 17:33:33 Kukjin Kim wrote:
> > Hi all,
> > 
> > The exynos5440 can support LPAE and referece boards, SSDK5440 and SD5v1 have
> > over 8GiB memory.
> > 
> > Current exynos_defconfig selects every EXYNOS SoCs including exynos5440 it
> > means supporting LPAE will be selected for other EXYNOS SoCs.
> > 
> > I'm wondering if seleting LPAE causes some problem for multiplatform. Can we
> > support LPAE enabled and disabled platform together with single zImage?
> 
> No, that isn't possible. I think we should enable all exynos support in the
> regular multi_v7_defconfig and leave LPAE turned off for that, but create
> another multi_lpae_defconfig that has all LPAE capable machines turned on.
> This is also what I expect the distros to do.

I think it would be unfortunate to split the defconfig just for LPAE,
since all the other parts should be identical (drivers, etc).

I wonder if it makes more sense to just include a config fragment to
turn on LPAE together with the existing multi_v7_defconfig.


-Olof
