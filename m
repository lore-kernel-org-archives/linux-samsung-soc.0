From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/28] Twenty eight patches big Exynos cleanup
Date: Fri, 14 Jun 2013 23:26:04 +0200
Message-ID: <5750530.AyJQs5JHPZ@wuerfel>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:56563 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294Ab3FNV0G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 17:26:06 -0400
In-Reply-To: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Friday 14 June 2013 21:32:36 Tomasz Figa wrote:
> 
> As I promised, I am doing some spring (or rather summer) cleaning
> of Exynos- and Samsung- related code.
> 
> This first part consists mostly of removing dead code remaining after
> removal of ATAGS support for Exynos, but several patches cleans up
> other things found by the way.
> 
> See particular patches for more detailed description.
> 
> On Exynos4210-based Trats board:
> Tested-by: Tomasz Figa <t.figa@samsung.com>
> 
> Build tested every patch with s3c6400_defconfig, s5pv210_defconfig
> and exynos_defconfig.

Great stuff. I unfortunately did almost the exact same patch since I
did not know you were on it too. Yours looks better in some details,
and your patch descriptions are /much/ better than my single large
patch.

I'll try to cross-check the two series to see if there is anything
you missed that was in my patch set.

Acked-by: Arnd Bergmann <arnd@arndb.de>
