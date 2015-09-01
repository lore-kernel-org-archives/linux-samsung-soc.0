From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 10/16] phy: Add driver for rockchip Display Port PHY
Date: Tue, 01 Sep 2015 22:58:59 +0200
Message-ID: <3270549.qIHk1CAA0Y@phil>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1441087455-25533-1-git-send-email-ykk@rock-chips.com> <5077044.NGUl9gjQon@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:34564 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751218AbbIAU7X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 16:59:23 -0400
In-Reply-To: <5077044.NGUl9gjQon@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel

Hi Yakir,

small nit more below

Am Dienstag, 1. September 2015, 18:51:16 schrieb Heiko Stuebner:
> Am Dienstag, 1. September 2015, 14:04:15 schrieb Yakir Yang:
> > +- clocks: from common clock binding: handle to dp clock.
> > +	of memory mapped region.
> > +- clock-names: from common clock binding:
> > +	Required elements: "sclk_dp" "sclk_dp_24m"
> > +
> > +- rockchip,grf: this soc should set GRF regs, so need get grf here.
> > +- #phy-cells : from the generic PHY bindings, must be 0;
> > +
> > +Example:
> > +
> > +edp_phy: phy@ff770274 {
> 
> edp_phy: edp-phy {
> 
> > +	compatilble = "rockchip,rk3288-dp-phy";

typo: compatible
