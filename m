From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: exynos4412: porting hdmiddc and hdmiphy node entries
Date: Mon, 05 May 2014 22:55:53 +0200
Message-ID: <5367FAD9.9080705@gmx.net>
References: <535C504A.2090809@gmx.net> <53675932.30306@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:55188 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755604AbaEEUz7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 16:55:59 -0400
In-Reply-To: <53675932.30306@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-samsung-soc@vger.kernel.org

Hello Tomasz,

thanks a lot for the support!

> The meaning of hdmiphy is ambiguous.
> In exynos4 spec there are _TWO_ components named HDMIPHY.
> The first one is a PLL that generates a clock for HDMI subsystem.
> This PLL is controlled by I2C.
> 
> You can find an example of its bindings at:
> http://lists.freedesktop.org/archives/dri-devel/2013-October/047687.html
OK, that looks exactly like the bindings I currently have in the dts.


> The second one is HDMI's physical interface located in PMU unit.
> 
> The exynos-simple-phy is dedicated to controller the former (component of PMU).
> 
> The 'phy' attribute in DT refers to the PLL.
> There is a debate if 'phy' should refer to I2C device itself or
> rather to I2C bus. Currently it refers to driverless instance
> of I2C device.
By 'driverless' you mean that the node isn't probed by any specific
driver code / the 'compatible' string isn't used anywhere in the kernel
(like it's currently the situation?)


>> Somehow this doesn't look right. And indeed:
>> https://patchwork.kernel.org/patch/4021121/
>>
>> At least for exynos5250 this node is not a child on an i2c adapter.
> 
> This is a completely different HDMIPHY.
I'm not sure I understand. Different from the PPL and the PMU HDMIPHY?


>> And yes, I would still have to add 'phys' and 'phy-names' to the hdmi
>> node. This looks wrong again. Why do I have to specify 'phys' when I
>> already have 'phy' there? Isn't that redundant?
> 
> 'phys' and 'phy-names' refers to PHY interfaces delivered by phy-core.
> The attribute named 'phy' refers to I2C device used to controller HDMI's PLL.
> The naming convention is very misleading.
Hmm, indeed this is very confusing. So with the move to
exynos-simple-phy, I guess I need these entries as well, am I correct?


>> Well, you see, lots of confusion here. I would appreciate any kind of
>> help on how to proceed here.
> 
> The documentation for HDMI's bindings should be fixed.
Well, I can agree with that :)


With best wishes,
Tobias
