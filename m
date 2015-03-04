From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: hdmi: Add support for Exynos7 HDMI
Date: Wed, 04 Mar 2015 11:32:15 +0100
Message-ID: <54F6DF2F.8060903@samsung.com>
References: <1424964285-27480-1-git-send-email-ajaykumar.rs@samsung.com>
 <54F04B80.7050606@samsung.com>
 <CAEC9eQMc002Nd-CF0tjwzipUZVcN3vTxWsq9OrfTnHsXQdp0tQ@mail.gmail.com>
 <54F6C990.6050503@samsung.com>
 <CAEC9eQNCT2uj2=xgqA9KeCQMKeTAMvxWyqt_ZmB0osN2_ADhzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28577 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758587AbbCDKcv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Mar 2015 05:32:51 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NKO00JM9O5B0C50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Mar 2015 10:36:47 +0000 (GMT)
In-reply-to: <CAEC9eQNCT2uj2=xgqA9KeCQMKeTAMvxWyqt_ZmB0osN2_ADhzQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene.kim@gmail.com>, InKi Dae <inki.dae@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>

On 03/04/2015 10:54 AM, Ajay kumar wrote:
> On Wed, Mar 4, 2015 at 2:30 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>> On 03/02/2015 09:40 AM, Ajay kumar wrote:
>>> Hi Andrej,
>>>
>>> On Fri, Feb 27, 2015 at 4:18 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>> Hi Ajay,
>>>>
>>>> Thanks for the patch.
>>> Thanks for reviewing the patch.
>>>
>>>> On 02/26/2015 04:24 PM, Ajay Kumar wrote:
>>>>> Modify the exynos HDMI driver to support Exynos7 HDMI 1.4.
>>>>> * Add phy configs for Exynos7.
>>>>> * Exynos7 has a different clock structure for HDMI,
>>>>>   so introduce the new clocks.
>>>>> * Add sysreg support to enable HDMI SYSREG on Exynos7.
>>>>> * Exynos7 based boards need a DCDC_EN and LS_EN pins
>>>>>   for powering up HDMI. Add support for that too.
>>>>>
>>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>>> ---
>>>>>  .../devicetree/bindings/video/exynos_hdmi.txt      |   21 +-
>>>>>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  252 ++++++++++++++++----
>>>>>  drivers/gpu/drm/exynos/regs-hdmi.h                 |    4 +
>>>>>  3 files changed, 231 insertions(+), 46 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>>>> index 1fd8cf9..bb22a60 100644
>>>>> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>>>> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>>>> @@ -6,6 +6,7 @@ Required properties:
>>>>>       2) "samsung,exynos4210-hdmi"
>>>>>       3) "samsung,exynos4212-hdmi"
>>>>>       4) "samsung,exynos5420-hdmi"
>>>>> +     5) "samsung,exynos7-hdmi"
>>>> Why not "samsung,exynos7420-hdmi" ?
>>>> What compatible will you use for Exynos7430 or higher chip number?
>>> I will leave this decision to Inki Dae or Kukjin.
>>>
>>>>>  - reg: physical base address of the hdmi and length of memory mapped
>>>>>       region.
>>>>>  - interrupts: interrupt number to the cpu.
>>>>> @@ -15,21 +16,33 @@ Required properties:
>>>>>       c) optional flags and pull up/down.
>>>>>  - clocks: list of clock IDs from SoC clock driver.
>>>>>       a) hdmi: Gate of HDMI IP bus clock.
>>>>> -     b) sclk_hdmi: Gate of HDMI special clock.
>>>>> -     c) sclk_pixel: Pixel special clock, one of the two possible inputs of
>>>>> +     HDMI clocks necessary for non exynos7:
>>>>> +      b) sclk_hdmi: Gate of HDMI special clock.
>>>>> +      c) sclk_pixel: Pixel special clock, one of the two possible inputs of
>>>>>               HDMI clock mux.
>>>>> -     d) sclk_hdmiphy: HDMI PHY clock output, one of two possible inputs of
>>>>> +      d) sclk_hdmiphy: HDMI PHY clock output, one of two possible inputs of
>>>>>               HDMI clock mux.
>>>>> -     e) mout_hdmi: It is required by the driver to switch between the 2
>>>>> +      e) mout_hdmi: It is required by the driver to switch between the 2
>>>>>               parents i.e. sclk_pixel and sclk_hdmiphy. If hdmiphy is stable
>>>>>               after configuration, parent is set to sclk_hdmiphy else
>>>>>               sclk_pixel.
>>>>> +     HDMI clocks necessary for Exynos7:
>>>>> +      b) pclk_hdmiphy: Gate to HDMIPHY clock.
>>>> According to specs there is also pclk_hdmi, why do you specify only this
>>>> one?
>>> Right, I have reused "hdmi" gating clock for pclk_hdmi. That is why I have
>>> left "hdmi" clock as common for exynos7 and non-exynos7.
>> IMO it would be better to use separate entry for pclk_hdmi.
> Ok.
>
>>>>> +      c) hdmi_pixel: Gate clock of MUX output for I_PIXEL_CLK.
>>>>> +      d) hdmi_tmds: Gate clock of MUX output for I_TMDS_CLK.
>>>> According to specs these clocks should be named i_pixel_clk and
>>>> i_tmds_clk, shouldn't they?
>>> I actually took these changes from an "internal" code(non-DRM).
>>> The original author used these names, and I just carried the same names. :)
>>>
>>>>>  - clock-names: aliases as per driver requirements for above clock IDs:
>>>>>       "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
>>>>>  - ddc: phandle to the hdmi ddc node
>>>>>  - phy: phandle to the hdmi phy node
>>>>>  - samsung,syscon-phandle: phandle for system controller node for PMU.
>>>>>
>>>>> +Only for Exynos7(when compatible = "samsung,exynos7-hdmi"):
>>>>> +- samsung,sysreg-phandle: phandle for system controller node for SYSREG block.
>>>>> +
>>>>> +Optional properties:
>>>>> +- dcdc-gpios: OF device-tree gpio specification for HDMI_DCDC_EN pin.
>>>>> +- lsen-gpios: OF device-tree gpio specification for HDMI_LS_EN pin.
>>>> What is purpose of these gpios?
>>> These 2 GPIOs need to be enabled to powerup HDMI on exynos7-espresso board.
>>> Other boards need not provide the GPIO.
>> HDMI is internal IP of SoC, so it is rather not configurable via pins.
>> Pin names suggests they are for DC-DC converter and level shifter, I guess
>> these are for HDMI connector, not the HDMI IP, am I right?
> Right, this is for HDMI connector.
>
>> Maybe better option is to use pinctrl for these gpios, or use gpio
>> regulator, hard
>> to guess without documentation.
> Why should I not use devm_gpiod_get_optional for these GPIOs?

Because these gpios are board specific so they should not be handled by
hdmi driver.

I still do not know what exactly are they for.
If they only drive power for pin18 of hdmi connector the best solution
is to create
gpio regulator and point to it hdmi-en-supply property in hdmi node, as
this is the role of this property.
I guess it should work for you.
If they are used for some other things(??) and cannot be handled using
existing mechanisms
you can try to handle it using pinctrl property in hdmi - it should set
gpios correctly without polluting
the driver and bindings with board specific code/properties.

Regards
Andrzej

>
> Ajay
>
