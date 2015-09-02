From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v4 03/16] drm: bridge: analogix/dp: split exynos dp driver
 to bridge dir
Date: Wed, 2 Sep 2015 15:50:37 +0100
Message-ID: <CACvgo53pZUtSLRGVMYPs1s4QPBrAr3j=xoZ1t23tPv202bzfyg@mail.gmail.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
	<1441086598-24995-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33594 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753922AbbIBOui (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Sep 2015 10:50:38 -0400
In-Reply-To: <1441086598-24995-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, seanpaul@chromium.com, djkurtz@chromium.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, robherring2@gmail.com, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, dianders@chromium.com, linux-arm-kernel@lists.infradead.org, Linu

[Dropping the CC list]

Hi Yakir Yang,

On 1 September 2015 at 06:49, Yakir Yang <ykk@rock-chips.com> wrote:
> Split the dp core driver from exynos directory to bridge
> directory, and rename the core driver to analogix_dp_*,
> leave the platform code to analogix_dp-exynos.
>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
> Changes in v4:
> - Take Rob suggest, update "analogix,hpd-gpios" to "hpd-gpios" DT propery.
> - Take Jingoo suggest, rename "analogix_dp-exynos.c" file name to "exynos_dp.c"
> - Take Archit suggest, create a separate folder for analogix code in bridge/
>
"Take X suggest", is grammatically incorrect. You should use
"suggestion(s)" or alternatively use the following approach.

- Create a separate folder for analogix code in bridge/ (Archit)

Cheers,
Emil

P.S. Why do you resend the whole series (some 10+ patches) when only a
few patches have been changed ? Are all the patches changed whist
missing that information (vX: rebase on top of A)
