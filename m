From: Yuvaraj Kumar <yuvaraj.cd@gmail.com>
Subject: Re: [PATCH V5] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Mon, 2 Sep 2013 16:45:41 +0530
Message-ID: <CAKuRcO+EF12mbx-EyptWKmuAiabw4Cx7TqUMTmUAgVFWkwMr=w@mail.gmail.com>
References: <1377691386-7085-1-git-send-email-yuvaraj.cd@samsung.com>
	<1499444.qkqi2LXfcl@amdc1227>
	<CAKuRcO+qhfry4KT2gJmB5DGgPF7=0WrEJH=7quVOj3tobnPv=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:56707 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755915Ab3IBLPm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Sep 2013 07:15:42 -0400
In-Reply-To: <CAKuRcO+qhfry4KT2gJmB5DGgPF7=0WrEJH=7quVOj3tobnPv=A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Doug Anderson <dianders@chromium.org>, Chris Ball <cjb@laptop.org>, Thomas Abraham <thomas.abraham@linaro.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Kumar Gala <galak@codeaurora.org>

On Fri, Aug 30, 2013 at 12:29 PM, Yuvaraj Kumar <yuvaraj.cd@gmail.com> wrote:
> On Wed, Aug 28, 2013 at 5:52 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Yuvaraj,
>>
>> On Wednesday 28 of August 2013 17:33:06 Yuvaraj Kumar C D wrote:
>>> This patch adds the device tree node entries for exynos5420 SOC.
>>> Exynos5420 has a different version of DWMMC controller,so a new
>>> compatible string is used to distinguish it from the prior SOC's.
>>>
>>> This patch depends on
>>>       mmc: dw_mmc: exynos: Add a new compatible string for exynos5420
>>>
>>> changes since v4:
>>>       1.Droppped the bypass-smu binding property.
>>>       2.Used compatible string "samsung,exynos5250-dw-mshc"
>>>         for controller instance which does not have SMU.
>>>
>>> changes since V3:
>>>       1.change fifo-depth size from 0x80 to 0x40
>>>       2.Move the below properties
>>>               a.card-detect-delay
>>>               b.samsung,dw-mshc-ciu-div
>>>               c.samsung,dw-mshc-sdr-timing
>>>               d.samsung,dw-mshc-ddr-timing
>>>       from SOC dts to board dts file as suggested by Doug Anderson
>>>
>>> changes since V2:
>>>       1.dropped num-slots property from node as its not required
>>>         if number of card slots available is 1.
>>>
>>>       2.Move the below properties
>>>               a.fifo-depth
>>>               b.card-detect-delay
>>>               c.samsung,dw-mshc-ciu-div
>>>               d.samsung,dw-mshc-sdr-timing
>>>               e.samsung,dw-mshc-ddr-timing
>>>       from board dts to SOC dts,as these are not board specific properties.
>>>
>>>       3.Updated the binding document exynos-dw-mshc.txt.
>>>
>>> changes since V1:
>>>       1.disable node by status = disabled in SOC file
>>>       2.enable node by status = okay in board specific file
>>>
>>> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
>>> ---
>>>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    2 +
>>>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   33
>>> +++++++++++++++++ arch/arm/boot/dts/exynos5420.dtsi                  |
>>> 39 ++++++++++++++++++++ 3 files changed, 74 insertions(+)
>>
>> This patch looks good to me now, except some minor comments below.
>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
>>> b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt index
>>> 6d1c098..84cd56f 100644
>>> --- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
>>> +++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
>>> @@ -16,6 +16,8 @@ Required Properties:
>>>         specific extensions.
>>>       - "samsung,exynos5250-dw-mshc": for controllers with Samsung Exynos5250
>>> specific extensions.
>>> +     - "samsung,exynos5420-dw-mshc": for controllers with Samsung Exynos5420
>>> +       specific extensions.
>>>
>>>  * samsung,dw-mshc-ciu-div: Specifies the divider value for the card
>>> interface unit (ciu) clock. This property is applicable only for Exynos5
>>> SoC's and diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>>> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index bafba25..3ce5c97
>>> 100644
>>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>>> @@ -31,6 +31,39 @@
>>>               };
>>>       };
>>>
>>> +     dwmmc0@12200000 {
>>
>> Node name should not contain instance index. Instead, according to ePAPR
>> recommendation, I would opt for a generic name such as mmc, mshc or sdio-
>> host. mshc is already used on Exynos 4 so it might be a good idea to use it
>> for consistency.
> If we change node name's to mshc, debug statements are look like below:
> dwmmc_exynos 12200000.mshc: num-slots property not found, assuming 1
> slot is available
> dwmmc_exynos 12200000.mshc: no vmmc regulator found: -19
> dwmmc_exynos 12200000.mshc: Using internal DMA controller.
> dwmmc_exynos 12200000.mshc: Version ID is 250a
> dwmmc_exynos 12200000.mshc: DW MMC controller at irq 107, 64 bit host
> data width, 64 deep fifo
>
> "dwmmc_exynos" is platform driver name and "12200000.mshc" from dt
> node.Is'nt it look like bit confusing?
Any comments on this?
>
>>
>> [Adding DT maintainers on CC]
>>
>> Best regards,
>> Tomasz
>>
