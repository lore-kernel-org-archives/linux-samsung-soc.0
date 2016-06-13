From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/8] ARM: exynos: Topic branch with driver changes for
 v4.8
Date: Mon, 13 Jun 2016 14:47:06 -0700
Message-ID: <20160613214706.GB20845@localhost>
References: <1465215933-22709-1-git-send-email-k.kozlowski@samsung.com>
 <1465215933-22709-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34304 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345AbcFNQxR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 12:53:17 -0400
Received: by mail-pf0-f194.google.com with SMTP id 66so11399455pfy.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jun 2016 09:53:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1465215933-22709-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, mchehab@osg.samsung.com
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

On Mon, Jun 06, 2016 at 02:25:29PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> A topic branch for MultiFormat Codec driver. This pulls in
> an external dependency from media tree (Sylwester Nawrocki).
> 
> Below you will find two pull-request-changelogs
> 
> 
> Best regards,
> Krzysztof
> 
> 
> ################################################################
> Samsung tree only changes:
> ################################################################
> 
> The following changes since commit 04f776734c4e03e33111d3d5a994b589870df623:
> 
>   media: s5p-mfc: add iommu support (2016-06-03 11:13:45 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-exynos-mfc-4.8
> 
> for you to fetch changes up to 96167bd37dd604cbba0aed341765dda8556405b2:
> 
>   ARM: dts: exynos: Enable MFC device on Exynos4412 Odroid boards (2016-06-06 09:30:43 +0200)
> 
> ----------------------------------------------------------------
> Topic branch for Exynos MFC changes for v4.8:
> Pull s5p-mfc changes from media tree so the arm/mach-exynos code
> could be removed. The bindings are converted to generic reserved memory
> bindings.

Hi,

Tis branch contains an external dependency but I don't see the toplevel
maintainer cc:d on the pull request. Just to avoid any confusion, I'd like to
double check and make sure this branch is expected to be stable.

Mauro, is that the case? The branch is:
Merge branch 'for-v4.8/media/exynos-mfc' of git://linuxtv.org/snawrocki/samsung into for-v4.8/exynos-mfc

I see it in -next, so I just want to make sure it's on a stable branch that
won't be rewritten. 


Thanks!

-Olof
