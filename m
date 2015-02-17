From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Tue, 17 Feb 2015 13:20:23 +0100
Message-ID: <1424175623.14482.4.camel@AMDC1943>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On wto, 2015-02-17 at 12:38 +0100, Javier Martinez Canillas wrote:
> Enabling Exynos DRM IOMMU support for Exynos is currently broken and
> causes a BUG on exynos-iommu driver. This was not an issue since the
> options was disabled in exynos_defconfig but after commit 8dcc14f82f06
> ("drm/exynos: IOMMU support should not be selectable by user"), it is
> selected if EXYNOS_IOMMU is enabled which is in exynos_defconfig.
> 
> So a kernel built using exynos_defconfig after the mentioned commit
> fails to boot [0]. Disable IOMMU support in Exynos defconfig until
> things get sorted out.

On which board you got this error?

Best regards,
Krzysztof
