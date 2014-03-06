From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v9 3/4] phy: Add new Exynos USB 2.0 PHY driver
Date: Thu, 6 Mar 2014 16:14:41 +0530
Message-ID: <53185199.3090103@ti.com>
References: <1394033288-5551-1-git-send-email-k.debski@samsung.com> <1394033288-5551-4-git-send-email-k.debski@samsung.com> <005c01cf3915$c53476c0$4f9d6440$%tikhomirov@samsung.com> <193a01cf3926$4bef53f0$e3cdfbd0$%debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:46826 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751791AbaCFKpB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 05:45:01 -0500
In-Reply-To: <193a01cf3926$4bef53f0$e3cdfbd0$%debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>, 'Anton Tikhomirov' <av.tikhomirov@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: kyungmin.park@samsung.com, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, matt.porter@linaro.org, tjakobi@math.uni-bielefeld.de, stern@rowland.harvard.edu, sander@humilis.net

Hi,

On Thursday 06 March 2014 03:54 PM, Kamil Debski wrote:
> Hi Anton, Kishon,
>
>> From: Anton Tikhomirov [mailto:av.tikhomirov@samsung.com]
>> Sent: Thursday, March 06, 2014 9:26 AM
>>
>> Hi Kamil,
>>
>> ...
>>
>>> +| 3. Supporting SoCs
>>> ++--------------------
>>> +
>>> +To support a new SoC a new file should be added to the drivers/phy
>>> +directory. Each SoC's configuration is stored in an instance of the
>>> +struct samsung_usb2_phy_config.
>>> +
>>> +struct samsung_usb2_phy_config {
>>> +	const struct samsung_usb2_common_phy *phys;
>>> +	unsigned int num_phys;
>>> +	bool has_mode_switch;
>>
>> You missed rate_to_clk here.
>
> Thank you for spotting this.
>
> Kishon: I am sorry that this omission was made. I am happy to send an
> updated patchset. However, I want to give some time for any additional
> comments. Do you think that we have for this? Is today evening ok with you?

Would be great if you can send the patch in 2-3 hrs.. I'd like to give 
enough time for auto build to detect any errors.

>>
>>> +};
>>> +
>>
>> ...
>>
>>> diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-
>> samsung-
>>> usb2.c new file mode 100644 index 0000000..c3b7719
>>> --- /dev/null
>>> +++ b/drivers/phy/phy-samsung-usb2.c
>>> @@ -0,0 +1,222 @@
>>> +/*
>>> + * Samsung SoC USB 1.1/2.0 PHY driver
>>> + *
>>> + * Copyright (C) 2013 Samsung Electronics Co., Ltd.
>>> + * Author: Kamil Debski <k.debski@samsung.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/phy/phy.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/spinlock.h>
>>> +#include "phy-samsung-usb2.h"
>>> +
>>> +static int samsung_usb2_phy_power_on(struct phy *phy) {
>>> +	struct samsung_usb2_phy_instance *inst = phy_get_drvdata(phy);
>>> +	struct samsung_usb2_phy_driver *drv = inst->drv;
>>> +	int ret;
>>> +
>>> +	dev_dbg(drv->dev, "Request to power_on \"%s\" usb phy\n",
>>> +		inst->cfg->label);
>>> +	ret = clk_prepare_enable(drv->clk);
>>
>> clk_prepare_enable() can sleep, and therefore doesn't allow
>> samusng_usb2_phy_power_on() to be used in atomic context (e.g. inside
>> spin_lock-ed area), what sometimes may be desirable.
>> What about to prepare clock in probe, and just enable it here
>> (note: clk_enable() doesn't sleep).
>
>  From the onward discussion between you and Kishon, I draw the conclusion
> that this change is not necessary. Right?

right.

Cheers
Kishon
