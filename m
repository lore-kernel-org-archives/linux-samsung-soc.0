From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v5 0/17] Add Analogix Core Display Port Driver
Date: Wed, 7 Oct 2015 11:26:43 +0200
Message-ID: <5614E553.6060108@osg.samsung.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1442906428-2609-1-git-send-email-ykk@rock-chips.com>
 <5614BADD.1070307@rock-chips.com> <5614DBE2.6080102@osg.samsung.com>
 <5614DFBC.8060105@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:47614 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752089AbbJGJ0z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Oct 2015 05:26:55 -0400
In-Reply-To: <5614DFBC.8060105@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Thierry Reding <treding@nvidia.com>, joe@perches.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Hello Yakir,

On 10/07/2015 11:02 AM, Yakir Yang wrote:
> Hi Javier,
> 
> On 10/07/2015 04:46 PM, Javier Martinez Canillas wrote:
>> Hello Yakir,
>>
>> On 10/07/2015 08:25 AM, Yakir Yang wrote:
>>> Hi all,
>>>
>>> Friendly ping.....   :)
>>>
>>>
>>> Best regards,
>>> - Yakir
>>>
>>>
>> Do you have a tree that I can use to test these patches?
> 
> Wow, thanks a lot, I do have a tree on github [https://github.com/yakir-Yang/linux/tree/analogix_dp],
> crossing my finger, wish things works......    ;)
>

I tried your analogix_dp branch on an Exynos5800 Peach Pi Chromebook
but the machine didn't boot. Unfortunately I need to do some soldering
to have a serial console on this board so don't have a kernel boot log.

I'll let you know if I can get more info about this issue.

Also, there is Kconfig recursive dependency that you may want to fix:

$ make exynos_defconfig
drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
drivers/video/fbdev/Kconfig:5: symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:34: symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
drivers/gpu/drm/Kconfig:28: symbol DRM_KMS_HELPER is selected by DRM_ANALOGIX_DP
drivers/gpu/drm/bridge/analogix/Kconfig:1: symbol DRM_ANALOGIX_DP is selected by DRM_EXYNOS_DP
drivers/gpu/drm/exynos/Kconfig:57: symbol DRM_EXYNOS_DP depends on DRM_EXYNOS_FIMD
drivers/gpu/drm/exynos/Kconfig:19: symbol DRM_EXYNOS_FIMD depends on FB_S3C
drivers/video/fbdev/Kconfig:2023: symbol FB_S3C depends on FB
 
> Thanks,
> - Yakir
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
