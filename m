From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 1/3] phy: Add exynos-simple-phy driver
Date: Thu, 15 May 2014 19:11:35 +0530
Message-ID: <5374C40F.3090402@ti.com>
References: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>	<1400095043-685-2-git-send-email-rahul.sharma@samsung.com>	<1584926.JkD1mqdaNu@amdc1032> <CAPdUM4O2Qpf+XmtRoXNVfSBODKJqtG9uUfAJpt-zvDwBwh05oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:34046 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752936AbaEONlz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 09:41:55 -0400
In-Reply-To: <CAPdUM4O2Qpf+XmtRoXNVfSBODKJqtG9uUfAJpt-zvDwBwh05oQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, sunil joshi <joshi@samsung.com>



On Thursday 15 May 2014 07:05 PM, Rahul Sharma wrote:
> Hi,
> 
> On 15 May 2014 19:01, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>>
>> Hi,
>>
>> On Thursday, May 15, 2014 12:47:21 AM Rahul Sharma wrote:
>>> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
>>>
>>> Add exynos-simple-phy driver to support a single register
>>> PHY interfaces present on Exynos4 SoC.
>>>
>>> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
>>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>>>
>>> ---
>>>  .../devicetree/bindings/phy/samsung-phy.txt        |   56 ++++++
>>>  drivers/phy/Kconfig                                |    5 +
>>>  drivers/phy/Makefile                               |    1 +
>>>  drivers/phy/exynos-simple-phy.c                    |  189 ++++++++++++++++++++
>>>  include/dt-bindings/phy/exynos-simple-phy.h        |   27 +++
>>>  5 files changed, 278 insertions(+)
>>>  create mode 100644 drivers/phy/exynos-simple-phy.c
>>>  create mode 100644 include/dt-bindings/phy/exynos-simple-phy.h
>>
>> [...]
>>
>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>>> index 16a2f06..2a13e0d 100644
>>> --- a/drivers/phy/Kconfig
>>> +++ b/drivers/phy/Kconfig
>>> @@ -178,4 +178,9 @@ config PHY_XGENE
>>>       help
>>>         This option enables support for APM X-Gene SoC multi-purpose PHY.
>>>
>>> +config EXYNOS_SIMPLE_PHY
>>> +     tristate "Exynos Simple PHY driver"
>>
>> Please limit this driver to EXYNOS platforms with:
>>
>>         depends on ARCH_EXYNOS
>>
>> or (optionally)
>>
>>         depends on ARCH_EXYNOS || COMPILE_TEST
>>
>> Moreover the generic PHY dependency is missing.  It can be fixed with:
>>
>>         select GENERIC_PHY
>>
> 
> Yea, I will fix this part.

While at that, change the header of the driver file to *2014*

Thanks
Kishon
> 
> Regards,
> Rahul Sharma.
> 
>>> +     help
>>> +       Support for 1-bit PHY controllers on SoCs from Exynos family.
>>> +
>>>  endmenu
>>
>> Best regards,
>> --
>> Bartlomiej Zolnierkiewicz
>> Samsung R&D Institute Poland
>> Samsung Electronics
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
