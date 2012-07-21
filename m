From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung devel-2 for v3.6
Date: Sat, 21 Jul 2012 21:46:04 +0000
Message-ID: <201207212146.04865.arnd@arndb.de>
References: <194f01cd65fe$7c865790$759306b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:60477 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707Ab2GUVqZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jul 2012 17:46:25 -0400
In-Reply-To: <194f01cd65fe$7c865790$759306b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "'Rafael J. Wysocki'" <rjw@sisk.pl>

On Thursday 19 July 2012, Kukjin Kim wrote:
> Please pull it from:
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next/devel-samsung-2
> 
> The updating cpufreq for 1.7GHz of exynos5250 has been included in samsung tree because Rafael
> thought it was more related in samsung platform and I agreed. And it is including new
> exynos_defconfig for DT configuration of exynos4 and exynos5 together. The old exynos4_defconfig
> will be used for non-DT for a while and we will try to move on using exynos_defconfig for only DT.
> And others are adding G2D clock for exynos4x12 Socs.
> 

I have pulled all three branches. The next/soc branch was getting pretty big now,
and I already started a late/soc branch for late stuff, so I put devel-2 into
late/soc. I also took the liberty to rebase it in order to split out the defconfig
change into a separate series that I applied to the defconfig branch.

Please confirm that this is ok. If the rebasing cases problems, I can undo that
and take all of devel-2 into late/soc.

	Arnd
