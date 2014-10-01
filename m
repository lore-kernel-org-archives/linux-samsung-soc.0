From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/2] Exynos PM updates for v3.18
Date: Wed, 1 Oct 2014 17:43:27 +0200
Message-ID: <201410011743.28084.arnd@arndb.de>
References: <54227E61.5060909@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:50365 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbaJAPoE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 11:44:04 -0400
In-Reply-To: <54227E61.5060909@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wednesday 24 September 2014, Kukjin Kim wrote:
> The following changes since commit 7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9:
> 
>    Linux 3.17-rc1 (2014-08-16 10:40:26 -0600)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/exynos-pm
> 
> for you to fetch changes up to c3294253713cbc96df59a7cc6a9a3fc0c4ae5ba7:
> 
>    ARM: EXYNOS: Refactor the pm code to use DT based lookup (2014-09-24 
> 16:45:14 +0900)
> 
> ----------------------------------------------------------------
> PM related updates for exynos v3.18
> 
> - Refactor the pm code to use DT based lookup instead of
>    using "soc_is_exynosxxxx"
> - While at it, move exynos5250 specific disabling of JPEG
>    USE_RETENTION to pmu.c

Pulled into next/late, thanks,

	Arnd
