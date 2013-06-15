From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/28] Twenty eight patches big Exynos cleanup
Date: Sat, 15 Jun 2013 11:20:30 +0900
Message-ID: <172301ce696e$e87f9f00$b97edd00$%kim@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
 <5750530.AyJQs5JHPZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58375 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097Ab3FOCUc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 22:20:32 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOE00LIPX61PEG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 15 Jun 2013 11:20:31 +0900 (KST)
In-reply-to: <5750530.AyJQs5JHPZ@wuerfel>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Tomasz Figa' <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>

Arnd Bergmann wrote:
> 
> On Friday 14 June 2013 21:32:36 Tomasz Figa wrote:
> >
> > As I promised, I am doing some spring (or rather summer) cleaning
> > of Exynos- and Samsung- related code.
> >
> > This first part consists mostly of removing dead code remaining after
> > removal of ATAGS support for Exynos, but several patches cleans up
> > other things found by the way.
> >
> > See particular patches for more detailed description.
> >
> > On Exynos4210-based Trats board:
> > Tested-by: Tomasz Figa <t.figa@samsung.com>
> >
> > Build tested every patch with s3c6400_defconfig, s5pv210_defconfig
> > and exynos_defconfig.
> 
> Great stuff. I unfortunately did almost the exact same patch since I
> did not know you were on it too. Yours looks better in some details,
> and your patch descriptions are /much/ better than my single large
> patch.
> 
> I'll try to cross-check the two series to see if there is anything
> you missed that was in my patch set.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

OK, let me take Tomasz's patches with your ack.

Thanks,
- Kukjin
