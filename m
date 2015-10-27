From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v7 09/17] Documentation: drm/bridge: add document for analogix_dp
Date: Tue, 27 Oct 2015 22:14:13 +0100
Message-ID: <7020871.rDEeBYHTDp@phil>
References: <1445599415-30856-1-git-send-email-ykk@rock-chips.com> <1445655964-15237-1-git-send-email-ykk@rock-chips.com> <1445655964-15237-4-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445655964-15237-4-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chip>
List-Id: linux-samsung-soc@vger.kernel.org

Patch subject should probably be something like:

dt-bindings: add document for rockchip variant of analogix_dp

or similar, but definitly should mention that it's the Rockchip variant.


Am Samstag, 24. Oktober 2015, 11:06:03 schrieb Yakir Yang:
> Rockchip DP driver is a helper driver of analogix_dp coder driver,
> so most of the DT property should be descriped in analogix_dp document.
> 
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>

everything else looks nice, so with a better subject

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
