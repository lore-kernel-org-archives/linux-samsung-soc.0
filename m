From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Fri, 21 Nov 2014 21:57:00 +0100
Message-ID: <546FA71C.8050804@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>	<7hh9xwxsev.fsf@deeprootsystems.com>	<546CCAB8.9050402@collabora.co.uk>	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>	<7hppchsu29.fsf@deeprootsystems.com>	<546E293D.9000300@collabora.co.uk>	<7hbno1spdt.fsf@deeprootsystems.com>	<20141120234953.GA4010@luxor.wired.org>	<546F22F0.5060204@suse.de> <CAEC9eQPaZ7FJj00DtZHuNSY7HkqvGAZzN1oX=pf7dwsuEw7qUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34873 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712AbaKUU5H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 15:57:07 -0500
In-Reply-To: <CAEC9eQPaZ7FJj00DtZHuNSY7HkqvGAZzN1oX=pf7dwsuEw7qUA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: Paolo Pisati <p.pisati@gmail.com>, Kevin Hilman <khilman@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>

Hello Ajay,

On 11/21/2014 06:32 PM, Ajay kumar wrote:
> Hi,
> 
> I have rebased my bridge series on top of linux-next.
> 
> This is my git log:
> 4b38a6f Revert "Revert "ARM: exynos_defconfig: Enable options for
> display panel support""
> 6fb39a7 ARM: dts: peach-pit: represent the connection between bridge
> and panel using videoport and endpoints
> aee649c ARM: dts: snow: represent the connection between bridge and
> panel using videoport and endpoints
> 5b76d8d drm/bridge: Add i2c based driver for ps8622/ps8625 bridge
> 581257f Documentation: bridge: Add documentation for ps8622 DT properties
> 178e8b9 Documentation: devicetree: Add vendor prefix for parade
> 0ceea75 Documentation: drm: bridge: move to video/bridge
> f143e2e drm/bridge: ptn3460: use gpiod interface
> 2d5cb9d drm/bridge: ptn3460: probe connector at the end of bridge attach
> 32ac563 drm/bridge: ptn3460: support drm_panel
> 91c6c30 drm/exynos: dp: support drm_bridge
> 7eea7eb drm/bridge: ptn3460: Convert to i2c driver model
> 602f343 drm/bridge: make bridge registration independent of drm flow
> 14c7143 drm/bridge: do not pass drm_bridge_funcs to drm_bridge_init
> 2c01ac4 drm/bridge: ptn3460: Few trivial cleanups
> 7415f6c arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> 28655d1 drm/exynos: Move platform drivers registration to module init
> ed6778a Add linux-next specific files for 20141121
> 
> I have attached the rebased patches as well.
> I tested it on snow, peach_pit and peach_pi without *clk_ignore_unused*.
> Display is totally fine with exynos_defconfig (booting is fine even
> with CONFIG_SND_SOC_SNOW=y)
> 

Thanks for forward porting your patches to linux-next. Unfortunately I
won't have time to test them until Monday but I wonder why you didn't
have the boot issues that we have with next-20141121.

I found that the commit ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add
runtime Power Management support v12") had to be reverted in order to
boot linux-next.

Best regards,
Javier
