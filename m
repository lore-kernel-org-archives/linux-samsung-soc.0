From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroid*: remove fimd node
Date: Mon, 23 Nov 2015 10:56:47 -0300
Message-ID: <56531B1F.9050502@osg.samsung.com>
References: <1447151049-25370-1-git-send-email-m.szyprowski@samsung.com>
 <56428F34.7060003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:45634 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753139AbbKWN4y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2015 08:56:54 -0500
In-Reply-To: <56428F34.7060003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 11/10/2015 09:43 PM, Krzysztof Kozlowski wrote:

[snip]

> 
> 
> BTW, do you know why we don't have EXYNOS_IOMMU enabled in defconfig?
> Any reasons against?
>

It was explicitly disabled by commit 6562f3bd396a ("ARM: exynos_defconfig:
Disable IOMMU support") because Exynos IOMMU support was broken and caused
a BUG on boot, the discussion of the patch is [0].

But I just tested booting a v4.4-rc2 kernel on an Exynos5800 Peach Pi with
Exynos IOMMU enabled and the machine boots, display is working and
/sys/kernel/iommu_grups/*/devices shows that the devices were correctly
attached to an IOMMU group so things seems to have been sorted out now.

So it seems that EXYNOS_IOMMU could be enabled again. It would be good to
give such a patch a spin at kernelci before posting IMHO though just to be
sure there are no issues remaining.

> Best regards,
> Krzysztof
> 
> 

[0]: https://lkml.org/lkml/2015/2/17/163

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
