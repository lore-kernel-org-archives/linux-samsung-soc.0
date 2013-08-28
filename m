From: Yuvaraj Kumar <yuvaraj.cd@gmail.com>
Subject: Re: [PATCH V4] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Wed, 28 Aug 2013 14:55:29 +0530
Message-ID: <CAKuRcOK9LywWsZvjgozaCexs4aLN+teZG1YQq51iLWuWsjbqCw@mail.gmail.com>
References: <1377595351-30233-1-git-send-email-yuvaraj.cd@samsung.com>
	<20130827110145.GG19893@e106331-lin.cambridge.arm.com>
	<CAKuRcOLK0PjcVKFxUZ9hedVScKe1K+QYE1g57CZ5JOE=AmFJow@mail.gmail.com>
	<4043486.2T4HEilLdr@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:64224 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751616Ab3H1JZc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 05:25:32 -0400
In-Reply-To: <4043486.2T4HEilLdr@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "dianders@chromium.org" <dianders@chromium.org>, "cjb@laptop.org" <cjb@laptop.org>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On Tue, Aug 27, 2013 at 6:31 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Yuvaraj,
>
> On Tuesday 27 of August 2013 17:32:52 Yuvaraj Kumar wrote:
>> On Tue, Aug 27, 2013 at 4:31 PM, Mark Rutland <mark.rutland@arm.com>
> wrote:
>> > On Tue, Aug 27, 2013 at 10:22:31AM +0100, Yuvaraj Kumar C D wrote:
>> >> This patch adds the device tree node entries for exynos5420 SOC.
>> >> Exynos5420 has a different version of DWMMC controller,so a new
>> >> compatible string is used to distinguish it from the prior SOC's.
>> >>
>> >> This patch depends on
>> >>
>> >>       mmc: dw_mmc: exynos: Add a new compatible string for exynos5420
>> >>
>> >> changes since V3:
>> >>       1.change fifo-depth size from 0x80 to 0x40
>> >>       2.Move the below properties
>> >>
>> >>               a.card-detect-delay
>> >>               b.samsung,dw-mshc-ciu-div
>> >>               c.samsung,dw-mshc-sdr-timing
>> >>               d.samsung,dw-mshc-ddr-timing
>> >>
>> >>       from SOC dts to board dts file as suggested by Doug Anderson
>> >>
>> >> changes since V2:
>> >>       1.dropped num-slots property from node as its not required
>> >>
>> >>         if number of card slots available is 1.
>> >>
>> >>       2.Move the below properties
>> >>
>> >>               a.fifo-depth
>> >>               b.card-detect-delay
>> >>               c.samsung,dw-mshc-ciu-div
>> >>               d.samsung,dw-mshc-sdr-timing
>> >>               e.samsung,dw-mshc-ddr-timing
>> >>
>> >>       from board dts to SOC dts,as these are not board specific
>> >>       properties.
>> >>
>> >>       3.Updated the binding document exynos-dw-mshc.txt.
>> >>
>> >> changes since V1:
>> >>       1.disable node by status = disabled in SOC file
>> >>       2.enable node by status = okay in board specific file
>> >>
>> >> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
>> >> ---
>> >>
>> >>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    4 ++
>> >>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   34
>> >>  +++++++++++++++++ arch/arm/boot/dts/exynos5420.dtsi
>> >>  |   39 ++++++++++++++++++++ 3 files changed, 77 insertions(+)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
>> >> b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt index
>> >> 6d1c098..25368e8 100644
>> >> --- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
>> >> +++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
>> >>
>> >> @@ -16,6 +16,8 @@ Required Properties:
>> >>         specific extensions.
>> >>
>> >>       - "samsung,exynos5250-dw-mshc": for controllers with Samsung
>> >>       Exynos5250
>> >>
>> >>         specific extensions.
>> >>
>> >> +     - "samsung,exynos5420-dw-mshc": for controllers with Samsung
>> >> Exynos5420 +       specific extensions.
>> >>
>> >>  * samsung,dw-mshc-ciu-div: Specifies the divider value for the card
>> >>  interface>>
>> >>    unit (ciu) clock. This property is applicable only for Exynos5
>> >>    SoC's and
>> >>
>> >> @@ -31,6 +33,8 @@ Required Properties:
>> >>    data rate mode operation. Refer notes below for the order of the
>> >>    cells and the valid values.
>> >>
>> >> +* bypass-smu: Bypass Security Management Unit of eMMC channel 0 and
>> >> channel 1. +
>> >
>> > Could you elaborate on why this is needed?
>>
>> Exynos5420  Mobile Storage Host controller has a Security Management
>> Unit (SMU) for
>> channel 0 and channel 1 (mainly for eMMC). This binding property
>> requires to add a quirk
>> to bypass SMU as it is not being used yet.
>
> This looks like a configuration property, not hardware description to me
> then. If presence of SMU depends on particular channel, then either the
> property should be "snps,has-smu" or something like this, to indicate that
> particular channel supports it and it's up to the driver how to handle this
> feature.
>
>> > Is the SMU broken or not present in some hardware revisions?
>>
>> SMU is only present in channel 0 and channel 1,but not in channel 2.So
>> to distinguish this,
>> bypass-smu property has been added as quirks in the channel.
>
> Also a good question is what you mean with "channel". Is it the whole mshc
> entity having compatible property or its subnodes aka slots?
Its with the whole MSHC entity.
>
> If it's the former and channel 2 does not have SMU, making it compatible
> with "samsung,exynos5250-dw-mshc", then it should be marked as such. In
> this case the ideal solution would be to determine the SMU quirk only by
> compatible value.
Good one.I tried this,works perfect.Will repost the patch soon.
>
> Best regards,
> Tomasz
>
