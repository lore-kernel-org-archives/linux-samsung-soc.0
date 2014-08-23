From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Enable options for display panel support
Date: Fri, 22 Aug 2014 20:55:37 -0700
Message-ID: <7h4mx37tc6.fsf@paris.lan>
References: <1408749185-14133-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:44001 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863AbaHWDzk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 23:55:40 -0400
Received: by mail-pd0-f176.google.com with SMTP id y10so16675323pdj.35
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2014 20:55:39 -0700 (PDT)
In-Reply-To: <1408749185-14133-1-git-send-email-javier.martinez@collabora.co.uk>
	(Javier Martinez Canillas's message of "Sat, 23 Aug 2014 01:13:05
	+0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, afaerber@suse.de, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

> Many Exynos devices have a display panel, most of them just have
> a simple panel while others have more complex configurations that
> requires an embedded DisplayPort (eDP) to LVDS display bridge.
>
> This patch enables the following features to support both setups:
>
> - Direct Rendering Manager (DRM)
> - DRM bridge registration and lookup framework
> - Parade ps8622/ps8625 eDP/LVDS bridge
> - NXP ptn3460 eDP/LVDS bridge
> - Exynos Fully Interactive Mobile Display controller (FIMD)
> - Panel registration and lookup framework
> - Simple panels
> - Backlight and LCD device support
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>
> Some of the options enabled here (e.g: the eDP/LVDS bridges)
> are still not merged in mainline so this patch depends on
> the following posted patches that were still not merged:
>
> "drm/bridge: Modify drm_bridge core to support driver model" [0]
> "drm/bridge: Add i2c based driver for ptn3460 bridge" [1]
> "drm/bridge: Add i2c based driver for ps8622/ps8625 bridge" [2]
>
> But I wanted to post anyways to make easier for others to
> figure out what are the needed options to have the display
> working on their Exynos machines.

Great, thanks for this!  I spent/wasted quite a bit of time trying to
figure out which options I needed to enable to get basic display support
working.
>
> In order to test the display panel on the Peach machines,
> the following patches are also needed:
>
> "ARM: dts: Add DT changes for display on peach_pit" [3]
> "ARM: dts: Add DT changes for display on peach_pi" [4]

Tested-by: Kevin Hilman <khilman@linaro.org>

On v3.17-rc1 along with these DT patches abvoe on exynos5800/chromebook2
(peach-pi).

Thanks,

Kevin
