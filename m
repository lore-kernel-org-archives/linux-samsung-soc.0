From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: remove Exynos4212 support (dead code)
Date: Wed, 11 Jan 2017 18:41:00 +0200
Message-ID: <20170111164100.4ebg63gscpdjnbt7@kozik-lap>
References: <CGME20170111074433eucas1p17027e7b9f72de528197b4d2b0e611a2a@eucas1p1.samsung.com>
 <1484120668-29954-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:36019 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760931AbdAKQlL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 11:41:11 -0500
Received: by mail-wj0-f193.google.com with SMTP id dh1so11219083wjb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jan 2017 08:41:10 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1484120668-29954-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>

On Wed, Jan 11, 2017 at 08:44:28AM +0100, Marek Szyprowski wrote:
> There are no Exynos4212 based boards in mainline, so there is no need to
> keep additional files for SoCs, which are never used. This patch removes
> support for Exynos4212 SoCs and moves previously shared Exynos4412
> definitions to a single file to simplify future maintenance.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> Changelog:
> v3:
> - generated patch on top of current samsung/for-next to avoid adding nodes,
>   which are not yet in the mainline
> 
> v2:
> - generated patch with -M for easier review
> - replaced 4x12 with 4412 in dts comments
> 
> v1:
> - initial version
> ---
>  arch/arm/boot/dts/exynos4212.dtsi                  | 133 -----
>  ...os4x12-pinctrl.dtsi => exynos4412-pinctrl.dtsi} |   4 +-
>  arch/arm/boot/dts/exynos4412.dtsi                  | 575 +++++++++++++++++++-
>  arch/arm/boot/dts/exynos4x12.dtsi                  | 594 ---------------------
>  4 files changed, 572 insertions(+), 734 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/exynos4212.dtsi
>  rename arch/arm/boot/dts/{exynos4x12-pinctrl.dtsi => exynos4412-pinctrl.dtsi} (99%)
>  delete mode 100644 arch/arm/boot/dts/exynos4x12.dtsi
> 

Thanks, applied.

Best regards,
Krzysztof
