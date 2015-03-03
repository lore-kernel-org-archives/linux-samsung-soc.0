From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Disable IOMMU support
Date: Tue, 03 Mar 2015 08:01:43 +0100
Message-ID: <54F55C57.2010801@collabora.co.uk>
References: <1424173109-30347-1-git-send-email-javier.martinez@collabora.co.uk> <54F00CB2.2060708@collabora.co.uk> <54F4BD60.2090500@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34209 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960AbbCCHBu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Mar 2015 02:01:50 -0500
In-Reply-To: <54F4BD60.2090500@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Kukjin,

On 03/02/2015 08:43 PM, Kukjin Kim wrote:
> On 02/27/15 15:20, Javier Martinez Canillas wrote:
>> Hello Kukjin,
>> 
> Hi,
> 
>> On 02/17/2015 12:38 PM, Javier Martinez Canillas wrote:
>> 
>> Can you please pick this patch? linux-next is still broken for many Exynos
>> boards after commit 8dcc14f82f06 ("drm/exynos: IOMMU support should not be
>> selectable by user") so we need to disable IOMMU support on Exynos to make
>> them boot again.
>> 
>> Here are boot logs of some boards that are affected by this issue:
>> 
>> http://storage.kernelci.org/samsung/v4.0-rc1-44-g6a05e2a77140/arm-exynos_defconfig/lab-tbaker/boot-exynos5250-arndale.html
>> http://storage.kernelci.org/samsung/v4.0-rc1-28-g55a4c031ed15/arm-exynos_defconfig/lab-collabora/boot-exynos5800-peach-pi.html
>> http://storage.kernelci.org/samsung/v4.0-rc1-28-g55a4c031ed15/arm-exynos_defconfig/lab-collabora/boot-exynos5250-snow.html
>> 
> Thanks, applied.
>

Thanks a lot, please keep in mind that this patch is 4.0 rc material since
the offending commit landed in 4.0-rc1 so Exynos DRM driver breaks the boot.
 
>> Also there are other exynos_defconfig patches that have been in the list:
>> 
>> * [PATCH 1/1] ARM: exynos_defconfig: Enable HDMI support
>> https://lkml.org/lkml/2015/2/6/531
>> 
>> * [PATCH] ARM: exynos_defconfig: Enable Marvell WiFi-Ex support
>> https://lkml.org/lkml/2015/2/15/59
>> 
> Will have a look soon ;)
>

Great, thanks.

> - Kukjin
>

Best regards,
Javier
