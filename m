From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Wed, 10 Apr 2013 15:55:27 +0200
Message-ID: <201304101555.27984.arnd@arndb.de>
References: <51642dab.e844440a.0ad1.ffffc13f@mx.google.com> <201304101459.07263.arnd@arndb.de> <51656D2D.7060004@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:55480 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760323Ab3DJNzd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 09:55:33 -0400
In-Reply-To: <51656D2D.7060004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Olof Johansson' <olof@lixom.net>

On Wednesday 10 April 2013, Sylwester Nawrocki wrote:
> Hmm, it turns out we are still actively using some boards based on
> Exynos4210 EVT0 SoCs. And since it seems unlikely the patches from
> Tomasz [1] adding basic DT support for those will get merged for
> 3.10, it would be a bit inconvenient to remove the ATAGS support
> now, leaving Exynos4210 Rev. 0 not supported at all.

I still have hope to get those included.

> Not sure what's others opinion on that, and what would be an advantage
> of removing non-dt support for Exynos now, rather than in 3.11, vs. any
> possible inconvenience and regressions this could cause.

A multiplatform kernel will not work on an ATAGS based Exynos platform,
but I think we can have it both ways and allow either multiplatform
DT-only or single-platform with both DT and ATAGS in 3.10.

	Arnd
