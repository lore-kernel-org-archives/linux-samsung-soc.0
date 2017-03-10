From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH] phy: samsung: move the Samsung specific phy files to
 "samsung" directory
Date: Fri, 10 Mar 2017 19:55:54 +0200
Message-ID: <CAJKOXPcNPA+XQE4J1CpnvjFr56qW0gbHBZfZzsWXkEAQDjxuFA@mail.gmail.com>
References: <CGME20170309113312epcas5p3eceb2a9cce9fc8ff6871bee7b45dc15e@epcas5p3.samsung.com>
 <20170309113311.15345-1-jh80.chung@samsung.com> <58C142F6.2030708@ti.com>
 <CAJKOXPeYpifDySTdvgk2ra4rjNtBdqGBQV8dsMeWkXCJQPP2zg@mail.gmail.com> <4b023d24-6d6b-94be-8895-7ff7f733e5b8@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:43854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932159AbdCJRz7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 12:55:59 -0500
In-Reply-To: <4b023d24-6d6b-94be-8895-7ff7f733e5b8@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, kgene@kernel.org, kamil@wypas.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

On Fri, Mar 10, 2017 at 9:00 AM, Jaehoon Chung <jh80.chung@samsung.com> wrote:
> Hi All,
>
> On 03/09/2017 09:10 PM, Krzysztof Kozlowski wrote:
>> On Thu, Mar 9, 2017 at 1:56 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>>> Hi,
>>>
>>> On Thursday 09 March 2017 05:03 PM, Jaehoon Chung wrote:
>>>> Make the "samsung" directory and move the Samsung specific files to
>>>> there for maintaining the files relevant to Samsung.
>>>
>>> The number of phy drivers in drivers/phy is getting unmanageable. I think this
>>> is a good step to make it a little better. Can you also add a MAINTAINER for
>>> drivers/phy/samsung?
>>
>> There is such:
>>
>> 10903 SAMSUNG USB2 PHY DRIVER
>> 10904 M:      Kamil Debski <kamil@wypas.org>
>> 10905 M:      Sylwester Nawrocki <s.nawrocki@samsung.com>
>> 10906 L:      linux-kernel@vger.kernel.org
>> 10907 S:      Supported
>> 10908 F:      Documentation/devicetree/bindings/phy/samsung-phy.txt
>> 10909 F:      Documentation/phy/samsung-usb2.txt
>> 10910 F:      drivers/phy/phy-exynos4210-usb2.c
>> 10911 F:      drivers/phy/phy-exynos4x12-usb2.c
>> 10912 F:      drivers/phy/phy-exynos5250-usb2.c
>> 10913 F:      drivers/phy/phy-s5pv210-usb2.c
>> 10914 F:      drivers/phy/phy-samsung-usb2.c
>> 10915 F:      drivers/phy/phy-samsung-usb2.h
>>
>> but this patchset does not update it. Paths *everywhere* have to be updated.
>
> Will update..How about the below updating?
> M:      Kamil Debski <kamil@wypas.org>
> M:      Sylwester Nawrocki <s.nawrocki@samsung.com>
> M:      Jaehoon Chung <jh80.chung@samsung.com>
> L:      linux-kernel@vger.kernel.org
> S:      Supported
> F:      Documentation/devicetree/bindings/phy/samsung-phy.txt
> F:      Documentation/phy/samsung-usb2.txt
> F:      driver/phy/samsung/

Hm? Except recent phy-exynos-pcie you did not contribute to other PHY
drivers. You did not reviewed them on the lists. I think that
maintenance starts with reviewing... which did not happen in this
case.

Did you discuss it with existing maintainers (I know that Sylwester is
too polite... but I do not care about politics and I can say straight
from the shoulder).

Maybe you wanted:
SAMSUNG PHY DRIVERS
M:      Kamil Debski <kamil@wypas.org>
M:      Sylwester Nawrocki <s.nawrocki@samsung.com>
L:      linux-kernel@vger.kernel.org
S:      Supported
F:      Documentation/devicetree/bindings/phy/samsung-phy.txt
F:      Documentation/phy/samsung-usb2.txt
F:      driver/phy/samsung/

SAMSUNG PCIE PHY DRIVER
M:      Jaehoon Chung <jh80.chung@samsung.com>
L:      linux-kernel@vger.kernel.org
S:      Supported
F:      driver/phy/samsung/phy-exynos-pcie.c

That looks much more sensible to me.

Best regards,
Krzysztof
