From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH v8 1/2] phy: Add new Exynos5 USB 3.0 PHY driver
Date: Tue, 13 May 2014 11:37:04 +0530
Message-ID: <CAFp+6iH-bLd9WUYyK8d8i=UNUm4DHpEYz=Am_qzPyX6gDovyKA@mail.gmail.com>
References: <1399643877-14528-1-git-send-email-gautam.vivek@samsung.com>
	<5370C689.2090402@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5370C689.2090402@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-doc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, robh+dt <robh+dt@kernel.org>, Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kamil Debski <k.debski@samsung.com>, Jingoo Han <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kishon,


On Mon, May 12, 2014 at 6:33 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> Hi Gautam,
>
> On Friday 09 May 2014 07:27 PM, Vivek Gautam wrote:
>> Add a new driver for the USB 3.0 PHY on Exynos5 series of SoCs.
>> The new driver uses the generic PHY framework and will interact
>> with DWC3 controller present on Exynos5 series of SoCs.
>>
>> Also, created a new header file in linux/mfd/syscon/ for
>> Exynos5 SoCs and put the required PMU offset definitions
>> for the basic available PHYs.
>>
>
>
> I get the following checkpatch warnings
>
> WARNING: please write a paragraph that describes the config symbol fully
> #163: FILE: drivers/phy/Kconfig:163:
> +config PHY_EXYNOS5_USBDRD
>
> WARNING: DT compatible string "samsung,exynos5250-usbdrd-phy" appears
> un-documented -- check ./Documentation/devicetree/bindings/
> #708: FILE: drivers/phy/phy-exynos5-usbdrd.c:516:
> +               .compatible = "samsung,exynos5250-usbdrd-phy",
>
> WARNING: DT compatible string "samsung,exynos5420-usbdrd-phy" appears
> un-documented -- check ./Documentation/devicetree/bindings/
> #711: FILE: drivers/phy/phy-exynos5-usbdrd.c:519:
> +               .compatible = "samsung,exynos5420-usbdrd-phy",.
>
>
> I think you just need to separate the Documentation into a separate patch
> before applying the driver patch.
>

I somehow don't see the Documentation warning. Below is the checkpatch
output which i ran on this v8 patch version.
  linux-phy$ ./scripts/checkpatch.pl phy.patch
  WARNING: please write a paragraph that describes the config symbol fully
  #127: FILE: drivers/phy/Kconfig:163:
  +config PHY_EXYNOS5_USBDRD

  total: 0 errors, 1 warnings, 760 lines checked

  phy.patch has style problems, please review.

  If any of these errors are false positives, please report
  them to the maintainer, see CHECKPATCH in MAINTAINERS.

am i missing something ?

[snip]



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
