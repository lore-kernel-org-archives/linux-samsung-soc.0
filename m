From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung boards update for v3.5
Date: Mon, 14 May 2012 20:03:27 +0000
Message-ID: <201205142003.27537.arnd@arndb.de>
References: <4FAF0326.8000408@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:57268 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932261Ab2ENUDf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 16:03:35 -0400
In-Reply-To: <4FAF0326.8000408@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sunday 13 May 2012, Kukjin Kim wrote:
> Hi Arnd, Olof,
> 
> Please pull Samsung boards update for v3.5.
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> next/board-samsung
> 
> As there were discussions, some exynos4 boards have been updated because 
> current dt cannot support all features for current board files on exynos4.
> 
> Note, this should be merged after next/devel-samsung because some 
> platform devices are defined in that.
> 
> If any problems, please let me know.

Pulled into next/boards now.

Since we have not pulled the next/devel-samsung branch yet, and that branch
depends on the sysmmu branch, the dependencies won't easily get fulfilled.
A test build of exynos4_defconfig showed that there is at least no build
time problem.

What is the dependency you are referring to?

	Arnd
