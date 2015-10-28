From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v7 10/17] phy: Add driver for rockchip Display Port PHY
Date: Wed, 28 Oct 2015 09:49:58 +0800
Message-ID: <563029C6.5000807@rock-chips.com>
References: <1445599415-30856-1-git-send-email-ykk@rock-chips.com>
 <1445655964-15237-1-git-send-email-ykk@rock-chips.com>
 <1445655964-15237-5-git-send-email-ykk@rock-chips.com>
 <2304066.jCpsGbPbCP@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:53437 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbbJ1Bue (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 21:50:34 -0400
In-Reply-To: <2304066.jCpsGbPbCP@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Mark Yao <mark.yao@rock-chips.com>, djkurtz@chromium.org, dianders@chromium.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, linux-arm-k


On 10/28/2015 05:23 AM, Heiko Stuebner wrote:
> Am Samstag, 24. Oktober 2015, 11:06:04 schrieb Yakir Yang:
>> Add phy driver for the Rockchip DisplayPort PHY module. This
>> is required to get DisplayPort working in Rockchip SoCs.
>>
>> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> diff --git a/drivers/phy/phy-rockchip-dp.c b/drivers/phy/phy-rockchip-dp.c
>> new file mode 100644
>> index 0000000..4af19af
>> --- /dev/null
>> +++ b/drivers/phy/phy-rockchip-dp.c
>> @@ -0,0 +1,153 @@
>> +/*
>> + * Rockchip DP PHY driver
>> + *
>> + * Copyright (C) 2015 FuZhou Rockchip Co., Ltd.
>> + * Author: Yakir Yang <ykk@@rock-chips.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License.
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/clk.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define GRF_SOC_CON12                   0x0274
>> +#define GRF_EDP_REF_CLK_SEL_INTER	BIT(4)
>> +#define GRF_EDP_PHY_SIDDQ_WRITE_EN      BIT(21)
>> +#define GRF_EDP_PHY_SIDDQ_ON            0
>> +#define GRF_EDP_PHY_SIDDQ_OFF           BIT(5)
> mixed spacers (tabs and spaces), please use either tabs if you want to
> align stuff or a single space.
>
> Also you're mixing the handling here, for SIDDQ you're defining both the
> actual bit as well as the write-enable bit, but for CLK_SEL_INTR you're
> hard-coding the 16-bit shift down in the code.
>
> You could also just use/copy the HIWORD_MASK macro we use for example
> in the clock controller.
>
>
>> +
>> +struct rockchip_dp_phy {
>> +	struct device  *dev;
>> +	struct regmap  *grf;
>> +	struct clk     *phy_24m;
>> +};
>> +
>> +static int rockchip_set_phy_state(struct phy *phy, bool enable)
>> +{
>> +	struct rockchip_dp_phy *dp = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	if (enable) {
>> +		ret = regmap_write(dp->grf, GRF_SOC_CON12,
>> +				   GRF_EDP_PHY_SIDDQ_WRITE_EN |
>> +				   GRF_EDP_PHY_SIDDQ_ON);
>> +		if (ret < 0) {
>> +			dev_err(dp->dev, "Can't enable PHY power %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = clk_prepare_enable(dp->phy_24m);
>> +
> unnecessary empty line after clk_prepare_enable
>
>
> with these things fixed,
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Oops, thanks

- Yakir

>
> Cheers,
> Heiko
>
>
>
