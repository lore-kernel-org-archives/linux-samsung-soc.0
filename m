From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: About LPAE supporting on EXYNOS5440
Date: Wed, 12 Jun 2013 11:58:20 +0200
Message-ID: <201306121158.20676.arnd@arndb.de>
References: <109e01ce667e$5becc880$13c65980$%kim@samsung.com> <15605927.1Yi6Xe5hWs@wuerfel> <51B7FD2E.9030306@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:59560 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751454Ab3FLJ7B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 05:59:01 -0400
In-Reply-To: <51B7FD2E.9030306@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Subash Patel <subashrp@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wednesday 12 June 2013, Subash Patel wrote:
> > I would definitely leave on exynos5440 support in defconfig. It's not a
> > lot of extra code, and if you have a system with less than 4GB memory,
> > you really don't want to enable LPAE because of the overhead.
> 
> Even if we have <= 4GB memory, and the system designers have placed the 
> memory banks in addresses > 2^32 bytes, then we need LPAE support. I 
> think we may have such systems in future. So memory capacity is not the 
> only parameter to judge if we need to enable LPAE or not.

Yes, but that wasn't the point. You can always build systems with
exynos5440 that don't need LPAE, so we should not assume that it is
not a reasonable configuration.

I would certainly advise system designers to put all the RAM and I/O
into normally addressable locations if possible to avoid the need
for LPAE, but of course that isn't always possible.

We should probably have someone measure the performance impact
of LPAE as well. If it's less than a few percent, we might not
care all that much.

	Arnd
