From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v9 3/4] phy: Add new Exynos USB 2.0 PHY driver
Date: Thu, 6 Mar 2014 14:26:43 +0530
Message-ID: <5318384B.7020009@ti.com>
References: <1394033288-5551-1-git-send-email-k.debski@samsung.com> <1394033288-5551-4-git-send-email-k.debski@samsung.com> <005c01cf3915$c53476c0$4f9d6440$%tikhomirov@samsung.com> <53183220.3040606@ti.com> <006201cf3919$5f760750$1e6215f0$%tikhomirov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <006201cf3919$5f760750$1e6215f0$%tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Tikhomirov <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Kamil Debski' <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, sander-7Kwe/DFdFGvR7s880joybQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Thursday 06 March 2014 02:22 PM, Anton Tikhomirov wrote:
> Hello,
>
>> Subject: Re: [PATCH v9 3/4] phy: Add new Exynos USB 2.0 PHY driver
>>
>>
>>
>> On Thursday 06 March 2014 01:56 PM, Anton Tikhomirov wrote:
>>> Hi Kamil,
>>>
>>> ...
>>>
>>>> +| 3. Supporting SoCs
>>>> ++--------------------
>>>> +
>>>> +To support a new SoC a new file should be added to the drivers/phy
>>>> +directory. Each SoC's configuration is stored in an instance of the
>>>> +struct samsung_usb2_phy_config.
>>>> +
>>>> +struct samsung_usb2_phy_config {
>>>> +	const struct samsung_usb2_common_phy *phys;
>>>> +	unsigned int num_phys;
>>>> +	bool has_mode_switch;
>>>
>>> You missed rate_to_clk here.
>>>
>>>> +};
>>>> +
>>>
>>> ...
>>>
>>>> diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-
>> samsung-
>>>> usb2.c
>>>> new file mode 100644
>>>> index 0000000..c3b7719
>>>> --- /dev/null
>>>> +++ b/drivers/phy/phy-samsung-usb2.c
>>>> @@ -0,0 +1,222 @@
>>>> +/*
>>>> + * Samsung SoC USB 1.1/2.0 PHY driver
>>>> + *
>>>> + * Copyright (C) 2013 Samsung Electronics Co., Ltd.
>>>> + * Author: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or
>>>> modify
>>>> + * it under the terms of the GNU General Public License version 2
>> as
>>>> + * published by the Free Software Foundation.
>>>> + */
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/mfd/syscon.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_address.h>
>>>> +#include <linux/phy/phy.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/spinlock.h>
>>>> +#include "phy-samsung-usb2.h"
>>>> +
>>>> +static int samsung_usb2_phy_power_on(struct phy *phy)
>>>> +{
>>>> +	struct samsung_usb2_phy_instance *inst = phy_get_drvdata(phy);
>>>> +	struct samsung_usb2_phy_driver *drv = inst->drv;
>>>> +	int ret;
>>>> +
>>>> +	dev_dbg(drv->dev, "Request to power_on \"%s\" usb phy\n",
>>>> +		inst->cfg->label);
>>>> +	ret = clk_prepare_enable(drv->clk);
>>>
>>> clk_prepare_enable() can sleep, and therefore doesn't allow
>>> samusng_usb2_phy_power_on() to be used in atomic context
>>> (e.g. inside spin_lock-ed area), what sometimes may be desirable.
>>> What about to prepare clock in probe, and just enable it here
>>> (note: clk_enable() doesn't sleep).
>>
>> The PHY power-on callback is anyway called with mutex held, so I guess
>> it's fine to have clk_prepare_enable() here.
>
> If we rely totally on generic PHY functions such as phy_power_on()
> and friends, why do we need to use locking in callbacks at all.

Didn't get you.. We don't want to invoke power_on when init is getting 
executed or you don't want power on or power off to get executed 
simultaneously right? So we need to protect it.

Cheers
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
