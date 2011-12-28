From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/3] Samsung S5P platform modification required for G2D driver
Date: Wed, 28 Dec 2011 15:17:13 +0530
Message-ID: <CAK9yfHy2rwStKyXgr=Uf1bAToWi-ZmFvuBph64H7VCqHMJD93Q@mail.gmail.com>
References: <1324992088-12037-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:60880 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752190Ab1L1JrO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 04:47:14 -0500
Received: by qadc12 with SMTP id c12so7147351qad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2011 01:47:13 -0800 (PST)
In-Reply-To: <1324992088-12037-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com, kgene.kim@samsung.com

Hi Kamil,

Your previous patch set has already been merged into [1].
Thus this has the G2D selected under SMDKV310 instead of NURI in the
KConfig file.


[1] http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=shortlog;h=refs/heads/for-next


Regards
Sachin

On 27/12/2011, Kamil Debski <k.debski@samsung.com> wrote:
> Hi,
>
> This series of patches contains necessary platform modification required by
> the
> G2D driver. G2D is a 2D-graphics acceleration engine present in the S5PC110
> and
> Exynos4 Samsung SoCs.
>
> I have fixed the errors pointed out by Kukjin Kim an Sachin Kamat. (Thanks!)
> Also the patches have been rebased to the newest kgene/for-next branch.
>
> Best wishes,
> Kamil Debski
>
> Kamil Debski (3):
>   s5p-g2d: add G2D to plat-s5p and mach-exynos4
>   s5p-g2d: add G2D to mach-nuri
>   s5p-g2d: add G2D to mach-universal
>
>  arch/arm/mach-exynos/Kconfig               |    2 ++
>  arch/arm/mach-exynos/include/mach/map.h    |    3 +++
>  arch/arm/mach-exynos/mach-nuri.c           |    1 +
>  arch/arm/mach-exynos/mach-universal_c210.c |    1 +
>  arch/arm/plat-s5p/Kconfig                  |    5 +++++
>  arch/arm/plat-samsung/devs.c               |   28
> ++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h  |    1 +
>  7 files changed, 41 insertions(+), 0 deletions(-)
>
>


-- 
With warm regards,
Sachin
