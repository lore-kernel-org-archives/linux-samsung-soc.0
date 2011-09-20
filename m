From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung boards for v3.2
Date: Tue, 20 Sep 2011 22:30:09 +0200
Message-ID: <201109202230.09426.arnd@arndb.de>
References: <001a01cc76b8$208e52c0$61aaf840$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:55337 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892Ab1ITUaM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 16:30:12 -0400
In-Reply-To: <001a01cc76b8$208e52c0$61aaf840$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

On Monday 19 September 2011, Kukjin Kim wrote:
> Please pull from:
>   git://github.com/kgene/linux-samsung.git next-samsung-board
> 
> As you see, the next-samsung-board includes new board, SMDK4212. Of course
> to support new SoC, EXYNOS4212 is required for it but current
> arch/arm/mach-exynos4 (ARCH_EXYNOS4) can support it so I merged it into
> next-samsung-board not next-samsung-soc and to support handling of cupid and
> rev. in Samsung stuff for it. As I remember, you said -soc branch of arm-soc
> is for adding new architecture like arch/arm/mach-xxxx.
> 
> As a note, this includes samsung-fixes-2 which has been already pulled in
> your tree too.

Looks good. I had to apply the same atag_offset change to the new board
file that was done in all other branches as well.

Pulled into next/board. Thanks!

	Arnd
