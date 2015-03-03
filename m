From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Tue, 03 Mar 2015 12:36:08 -0800
Message-ID: <7hioehu8cn.fsf@linaro.org>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:43874 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754977AbbCCUgK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Mar 2015 15:36:10 -0500
Received: by pablj1 with SMTP id lj1so17826145pab.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Mar 2015 12:36:09 -0800 (PST)
In-Reply-To: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk>
	(Javier Martinez Canillas's message of "Tue, 17 Feb 2015 12:38:29
	+0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tyler.baker@linaro.org

Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

> Enabling Exynos DRM IOMMU support for Exynos is currently broken and
> causes a BUG on exynos-iommu driver. This was not an issue since the
> options was disabled in exynos_defconfig but after commit 8dcc14f82f06
> ("drm/exynos: IOMMU support should not be selectable by user"), it is
> selected if EXYNOS_IOMMU is enabled which is in exynos_defconfig.
>
> So a kernel built using exynos_defconfig after the mentioned commit
> fails to boot [0]. Disable IOMMU support in Exynos defconfig until
> things get sorted out.

So some other exynos boards started failing in next-20150303[1], and
appear are DRM failures.

Interestingly, (re)enabling CONFIG_EXYNOS_IOMMU for these cause things to
work again.  Even more intersting, with IOMMU enabled, peach-pi is 

I'm starting to think it's the DRM driver that needs to be disabled
until it actually gets some testing, rathre than disabling IOMMU.

Kevin

[1] http://kernelci.org/boot/?next-20150303&fail
