From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: Add EXYNOS5433 ARM architectures entry as a
 supporter
Date: Thu, 05 Jan 2017 22:41:04 +0900
Message-ID: <20170105134104.zzjdirdiuqj6efyy@gangnam.samsung>
References: <CGME20170105131251epcas1p18bb302757d0e45145595cc68c4ad947e@epcas1p1.samsung.com>
 <1483621969-27631-1-git-send-email-cw00.choi@samsung.com>
 <43019997-a6cf-30df-2437-306055ea6a78@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51577 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934724AbdAENlI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 08:41:08 -0500
Content-disposition: inline
In-reply-to: <43019997-a6cf-30df-2437-306055ea6a78@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Daniel,

> > +ARM/SAMSUNG EXYNOS5433 ARM ARCHITECTURES
> > +M:	Chanwoo Choi <cw00.choi@samsung.com>
> > +R:	Andi Shyti <andi.shyti@samsung.com>
> > +L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> > +S:	Supported
> > +F:	arch/arm64/boot/dts/exynos/exynos5433*
> > +
> 
> Does it make sense to add a MAINTAINER entry for some dts files ?

I think it does considering that exynos5433* files are more then
the half of the arm64/.../exynos/ directory.

Besides Chanwoo has authored all of them (almost) and doesn't
appear from the get_maintainers script.

Considering also that we are continuosly developing and
maintaining exynos5433 and we can test, review and compare with
the documents I think it makes more sense.

Thanks,
Andi
