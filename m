From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Remove unused static iomapping
Date: Thu, 13 Nov 2014 11:44:01 +0900
Message-ID: <54641AF1.50105@samsung.com>
References: <1415683022-21771-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:54297 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754AbaKMCoJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 21:44:09 -0500
Received: by mail-pd0-f171.google.com with SMTP id r10so13482827pdi.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2014 18:44:08 -0800 (PST)
In-Reply-To: <1415683022-21771-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, thomas.ab@samsung.com, heiko@sntech.de

On 11/11/14 14:17, Pankaj Dubey wrote:
> This patch removes all unused static iomapping from
> exynos4/5_iodesc table, and at the same time removes
> related macros from map.h and map-s5p.h.
> All such mappings are present in exynos.c but not currently
> there are no users of these mappings, so its safe to remove these.
>
> Signed-off-by: Pankaj Dubey<pankaj.dubey@samsung.com>
> ---
> This patch has been compiled tested for exynos_defconfig; multi_v7_defconfig;
> s5pv210_defconfig; s3c6400_defconfig; and s3c2410_defconfig.
>
> I have verified system booting on SMDK5250 and Exynos3250 based board.
>
>   arch/arm/mach-exynos/exynos.c                |   50 --------------------------
>   arch/arm/mach-exynos/include/mach/map.h      |   23 ------------
>   arch/arm/plat-samsung/include/plat/map-s5p.h |   21 -----------
>   3 files changed, 94 deletions(-)

Applied, thanks.

- Kukjin
