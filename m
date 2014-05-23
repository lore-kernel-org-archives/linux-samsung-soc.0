From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung 2nd fixes for 3.15
Date: Sat, 24 May 2014 00:00:56 +0200
Message-ID: <201405240000.56933.arnd@arndb.de>
References: <537FA4DA.3090600@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:65433 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106AbaEWWBC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 18:01:02 -0400
In-Reply-To: <537FA4DA.3090600@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "arm@kernel.org" <arm@kernel.org>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Friday 23 May 2014, Kukjin Kim wrote:
> Hi,
> 
> Here is 2nd samsung fixes for 3.15, actually it happened before 3.14 but 
> would be better if this could be merged into 3.15.
> 
> Thanks,
> Kukjin
> 
> 
> The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:
> 
>    Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/samsung-fixes-2nd-tag
> 
> for you to fetch changes up to 68d0e40298f064a5cff40670caded0480274d4b2:
> 
>    ARM: dts: Keep LDO4 always ON for exynos5250-arndale board 
> (2014-05-20 01:15:46 +0900)
> 
> ----------------------------------------------------------------
> Samsung-fixes-2 for 3.15
> - keep LD04 always on for exynos5250-arndale
> - fix spi interrupt numbers for exynos5420
> - fix ak8975 compatible for exynos4412-trats2

Pulled into fixes branch.

Should these have been marked 'Cc: stable'?

	Arnd
