From: Anton Tikhomirov <av.tikhomirov@samsung.com>
Subject: RE: [PATCH v9 3/4] phy: Add new Exynos USB 2.0 PHY driver
Date: Thu, 06 Mar 2014 17:26:28 +0900
Message-ID: <005c01cf3915$c53476c0$4f9d6440$%tikhomirov@samsung.com>
References: <1394033288-5551-1-git-send-email-k.debski@samsung.com>
 <1394033288-5551-4-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1394033288-5551-4-git-send-email-k.debski@samsung.com>
Content-language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Kamil Debski' <k.debski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, tjakobi@math.uni-bielefeld.de, stern@rowland.harvard.edu, sander@humilis.net
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kamil,

...

> +| 3. Supporting SoCs
> ++--------------------
> +
> +To support a new SoC a new file should be added to the drivers/phy
> +directory. Each SoC's configuration is stored in an instance of the
> +struct samsung_usb2_phy_config.
> +
> +struct samsung_usb2_phy_config {
> +	const struct samsung_usb2_common_phy *phys;
> +	unsigned int num_phys;
> +	bool has_mode_switch;

You missed rate_to_clk here.

> +};
> +

...

> diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-samsung-
> usb2.c
> new file mode 100644
> index 0000000..c3b7719
> --- /dev/null
> +++ b/drivers/phy/phy-samsung-usb2.c
> @@ -0,0 +1,222 @@
> +/*
> + * Samsung SoC USB 1.1/2.0 PHY driver
> + *
> + * Copyright (C) 2013 Samsung Electronics Co., Ltd.
> + * Author: Kamil Debski <k.debski@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include "phy-samsung-usb2.h"
> +
> +static int samsung_usb2_phy_power_on(struct phy *phy)
> +{
> +	struct samsung_usb2_phy_instance *inst = phy_get_drvdata(phy);
> +	struct samsung_usb2_phy_driver *drv = inst->drv;
> +	int ret;
> +
> +	dev_dbg(drv->dev, "Request to power_on \"%s\" usb phy\n",
> +		inst->cfg->label);
> +	ret = clk_prepare_enable(drv->clk);

clk_prepare_enable() can sleep, and therefore doesn't allow
samusng_usb2_phy_power_on() to be used in atomic context
(e.g. inside spin_lock-ed area), what sometimes may be desirable.
What about to prepare clock in probe, and just enable it here
(note: clk_enable() doesn't sleep).

> +	if (ret)
> +		goto err_main_clk;
> +	ret = clk_prepare_enable(drv->ref_clk);
> +	if (ret)
> +		goto err_instance_clk;
> +	if (inst->cfg->power_on) {
> +		spin_lock(&drv->lock);
> +		ret = inst->cfg->power_on(inst);
> +		spin_unlock(&drv->lock);
> +	}
> +
> +	return 0;

Thank you
