From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v8 10/17] phy: Add driver for rockchip Display Port PHY
Date: Wed, 28 Oct 2015 21:36:56 +0100
Message-ID: <1657250.2TWeX0dr1C@phil>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com> <1446021033-11537-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:33721 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751431AbbJ1UhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 16:37:22 -0400
In-Reply-To: <1446021033-11537-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, dri-deve

Hi Yakir,

Am Mittwoch, 28. Oktober 2015, 16:30:33 schrieb Yakir Yang:
> +static int rockchip_dp_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct phy_provider *phy_provider;
> +	struct rockchip_dp_phy *dp;
> +	struct resource *res;

drivers/phy/phy-rockchip-dp.c: In function 'rockchip_dp_phy_probe':
drivers/phy/phy-rockchip-dp.c:86:19: warning: unused variable 'res' [-Wunused-variable]

> +	struct phy *phy;
> +	int ret;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
> +	if (IS_ERR(dp))
> +		return -ENOMEM;
> +
> +	dp->dev = dev;
> +
> +	dp->phy_24m = devm_clk_get(dev, "24m");
> +	if (IS_ERR(dp->phy_24m)) {
> +		dev_err(dev, "cannot get clock 24m\n");
> +		return PTR_ERR(dp->phy_24m);
> +	}
> +
> +	ret = clk_set_rate(dp->phy_24m, 24000000);
> +	if (ret < 0) {
> +		dev_err(dp->dev, "cannot set clock phy_24m %d\n", ret);
> +		return ret;
> +	}
> +
