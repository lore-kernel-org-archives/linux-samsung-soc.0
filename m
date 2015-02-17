From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Tue, 17 Feb 2015 13:56:25 +0100
Message-ID: <54E33A79.3060904@collabora.co.uk>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk> <1424175623.14482.4.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:60895 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756292AbbBQM4b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Feb 2015 07:56:31 -0500
In-Reply-To: <1424175623.14482.4.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Krzysztof,

On 02/17/2015 01:20 PM, Krzysztof Kozlowski wrote:
> On wto, 2015-02-17 at 12:38 +0100, Javier Martinez Canillas wrote:
>> Enabling Exynos DRM IOMMU support for Exynos is currently broken and
>> causes a BUG on exynos-iommu driver. This was not an issue since the
>> options was disabled in exynos_defconfig but after commit 8dcc14f82f06
>> ("drm/exynos: IOMMU support should not be selectable by user"), it is
>> selected if EXYNOS_IOMMU is enabled which is in exynos_defconfig.
>> 
>> So a kernel built using exynos_defconfig after the mentioned commit
>> fails to boot [0]. Disable IOMMU support in Exynos defconfig until
>> things get sorted out.
> 
> On which board you got this error?
> 

Sorry, I should had mention it in the commit message. I get that error
with at least Exynos5800 Peach Pi, Exynos5420 Peach Pit and Exynos5250
Snow Chromebooks with today's next (next-20150217).

The problem is that the Exynos IOMMU driver does not set a struct
exynos_iommu_owner in dev.archdata.iommu but __exynos_sysmmu_enable()
has a BUG_ON(!has_sysmmu(dev)).

Marek's series [1] solves this issue by filling sysmmu devices from DT
but causes boot failures on the Exynos Chromebooks because the display
is left enabled by the bootloader [2].

So I think that this option should be disabled until is known to not
cause issues on any platform.

> Best regards,
> Krzysztof
>

[1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/319244.html
[2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/319293.html
