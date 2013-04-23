From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 00/10] ARM: exynos multiplatform series, part 1
Date: Tue, 23 Apr 2013 11:09:46 +0200
Message-ID: <3631184.UZH7PcBe14@wuerfel>
References: <1365716245-99231-1-git-send-email-arnd@arndb.de> <201304221512.25920.arnd@arndb.de> <CAK9yfHxR_NE2R8qzx4p2DinJHqZoOK-4g6EtiAg6fecjy_Vd5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:60654 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755925Ab3DWJJs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 05:09:48 -0400
In-Reply-To: <CAK9yfHxR_NE2R8qzx4p2DinJHqZoOK-4g6EtiAg6fecjy_Vd5A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>

On Tuesday 23 April 2013 09:32:30 Sachin Kamat wrote:
> On 22 April 2013 18:42, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Monday 22 April 2013, Sachin Kamat wrote:
> >>
> >> With this branch now available (merged) in linux-next (20130422),
> >> looks like exynos4 DT support is broken on it. Tested on Origen 4210
> >> and 4412 and I get the following warnings on 4412 Origen board with
> >> exynos_defconfig (Note that clocks are all 0). However, it boots fine
> >> on Arndale board.
> >
> > I think this issue should be fixed with the patch that Thomas Abraham
> > just sent. Thomas, can you confirm?
> 
> Boot tested Origen 4210, 4412 and Arndale boards after applying Thomas
> Abraham's chip-id dt support patches.
> They all boot fine.
> 
> However I could not see multiplatform support for Exynos in
> exynos_defconfig (i.e., CONFIG_ARCH_EXYNOS and
> CONFIG_ARCH_MULTIPLATFORM are not set together). This was available in
> your 'samsung/exynos-multiplatform' branch. Has this been disabled in
> next?

Yes, you have to remove the "depends on BROKEN" part in
arch/arm/mach-exynos/Kconfig. The problem is that multiplatform support
on Exynos only works when you have many the patches that are in
linux-next at the moment, but it does not work with arm-soc alone,
so I cannot enable it yet.

	Arnd
