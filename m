From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/3] phy: Add new Exynos USB PHY driver
Date: Wed, 6 Nov 2013 18:20:36 +0530
Message-ID: <527A3B1C.50200@ti.com>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com> <1383668001-19141-2-git-send-email-k.debski@samsung.com> <5279FB45.3010808@ti.com> <2656549.jVSier62Qi@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2656549.jVSier62Qi@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wednesday 06 November 2013 05:08 PM, Tomasz Figa wrote:
> Hi Kishon
>
> On Wednesday 06 of November 2013 13:48:13 Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Tuesday 05 November 2013 09:43 PM, Kamil Debski wrote:
>>> Add a new driver for the Exynos USB PHY. The new driver uses the generic
>>> PHY framework. The driver includes support for the Exynos 4x10 and 4x12
>>> SoC families.
>>>
>>> Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>    .../devicetree/bindings/phy/samsung-usbphy.txt     |   52 ++++
>>>    drivers/phy/Kconfig                                |   23 +-
>>>    drivers/phy/Makefile                               |    4 +
>>>    drivers/phy/phy-exynos-usb2.c                      |  234 ++++++++++++++
>>>    drivers/phy/phy-exynos-usb2.h                      |   87 ++++++
>>>    drivers/phy/phy-exynos4210-usb2.c                  |  272 ++++++++++++++++
>>>    drivers/phy/phy-exynos4212-usb2.c                  |  324 ++++++++++++++++++++
>>>    7 files changed, 995 insertions(+), 1 deletion(-)
>>>    create mode 100644 Documentation/devicetree/bindings/phy/samsung-usbphy.txt
>>>    create mode 100644 drivers/phy/phy-exynos-usb2.c
>>>    create mode 100644 drivers/phy/phy-exynos-usb2.h
>>>    create mode 100644 drivers/phy/phy-exynos4210-usb2.c
>>>    create mode 100644 drivers/phy/phy-exynos4212-usb2.c
> [snip]
>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>>> index a344f3d..bdf0fab 100644
>>> --- a/drivers/phy/Kconfig
>>> +++ b/drivers/phy/Kconfig
> [snip]
>>> @@ -51,4 +51,25 @@ config PHY_EXYNOS_DP_VIDEO
>>>    	help
>>>    	  Support for Display Port PHY found on Samsung EXYNOS SoCs.
>>>
>>> +config PHY_EXYNOS_USB2
>>> +	tristate "Samsung USB 2.0 PHY driver"
>>> +	help
>>> +	  Enable this to support Samsung USB phy helper driver for Samsung SoCs.
>>> +	  This driver provides common interface to interact, for Samsung
>>> +	  USB 2.0 PHY driver.
>>
>> I still think we can get rid of this helper driver and have a single
>> driver for both PHY_EXYNOS4210_USB2 and PHY_EXYNOS4212_USB2.
>
> This helper driver is a really nice way to avoid code duplication, while
> still leaving the code clean and readable.
>
> All the Samsung USB 2.0 PHYs require exactly the same semantics
> (isolation, reference rate configuration, power up, power on), but each
> one has completely different layout of registers and bits inside
> registers.

I just did a diff of registers in exynos 4210 and 4212 PHY drivers [1] 
and couldn't find that big a difference in register layout. Of course 
there are a few changes in HSIC bit fields and PHYFSEL but that's only 
minimal and could well be handled in a single driver.

[1] -> http://diffchecker.com/py3tp68m
>
> Making a big single driver would end up being identical to the old Exynos
> USB2PHY driver with a lot of if and switch statements inside most of
> functions, which is not only ugly but makes any further extension hard.

Probably we shouldn't try to over design and just convert the old exynos 
usb2 phy driver to the generic phy framework to begin with?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
