From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [RFC PATCH] phy: samsung: move the Samsung specific phy files to
 "samsung" directory
Date: Fri, 10 Mar 2017 16:00:57 +0900
Message-ID: <4b023d24-6d6b-94be-8895-7ff7f733e5b8@samsung.com>
References: <CGME20170309113312epcas5p3eceb2a9cce9fc8ff6871bee7b45dc15e@epcas5p3.samsung.com>
 <20170309113311.15345-1-jh80.chung@samsung.com> <58C142F6.2030708@ti.com>
 <CAJKOXPeYpifDySTdvgk2ra4rjNtBdqGBQV8dsMeWkXCJQPP2zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45958 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751399AbdCJHBB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 02:01:01 -0500
In-reply-to: <CAJKOXPeYpifDySTdvgk2ra4rjNtBdqGBQV8dsMeWkXCJQPP2zg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, kgene@kernel.org, kamil@wypas.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

Hi All,

On 03/09/2017 09:10 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 9, 2017 at 1:56 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>> Hi,
>>
>> On Thursday 09 March 2017 05:03 PM, Jaehoon Chung wrote:
>>> Make the "samsung" directory and move the Samsung specific files to
>>> there for maintaining the files relevant to Samsung.
>>
>> The number of phy drivers in drivers/phy is getting unmanageable. I think this
>> is a good step to make it a little better. Can you also add a MAINTAINER for
>> drivers/phy/samsung?
> 
> There is such:
> 
> 10903 SAMSUNG USB2 PHY DRIVER
> 10904 M:      Kamil Debski <kamil@wypas.org>
> 10905 M:      Sylwester Nawrocki <s.nawrocki@samsung.com>
> 10906 L:      linux-kernel@vger.kernel.org
> 10907 S:      Supported
> 10908 F:      Documentation/devicetree/bindings/phy/samsung-phy.txt
> 10909 F:      Documentation/phy/samsung-usb2.txt
> 10910 F:      drivers/phy/phy-exynos4210-usb2.c
> 10911 F:      drivers/phy/phy-exynos4x12-usb2.c
> 10912 F:      drivers/phy/phy-exynos5250-usb2.c
> 10913 F:      drivers/phy/phy-s5pv210-usb2.c
> 10914 F:      drivers/phy/phy-samsung-usb2.c
> 10915 F:      drivers/phy/phy-samsung-usb2.h
> 
> but this patchset does not update it. Paths *everywhere* have to be updated.

Will update..How about the below updating?
M:      Kamil Debski <kamil@wypas.org>
M:      Sylwester Nawrocki <s.nawrocki@samsung.com>
M:	Jaehoon Chung <jh80.chung@samsung.com>
L:      linux-kernel@vger.kernel.org
S:      Supported
F:      Documentation/devicetree/bindings/phy/samsung-phy.txt
F:      Documentation/phy/samsung-usb2.txt
F: 	driver/phy/samsung/

Let me know your opinion.

Best Regards,
Jaehoon Chung

> 
> Best regards,
> Krzysztof
> 
> 
> 
