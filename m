From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v7 0/6] ARM: dts: add support for exynos hdmi subsystem
Date: Fri, 30 Aug 2013 10:13:02 +0530
Message-ID: <CAPdUM4N7DeBkO8Dt859toB92SRskBc8wkGDCNJXt4Fz=YXSOBg@mail.gmail.com>
References: <1377784377-28426-1-git-send-email-rahul.sharma@samsung.com>
	<1620695.hYygFk0Iax@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:65348 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756531Ab3H3EnE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Aug 2013 00:43:04 -0400
In-Reply-To: <1620695.hYygFk0Iax@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, sunil joshi <joshi@samsung.com>

On 29 August 2013 19:05, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Rahul,
>
> On Thursday 29 of August 2013 19:22:51 Rahul Sharma wrote:
>> It adds Device tree nodes and clocks information for HDMI subsystem
>> for exynos5420 and exynos5250 SoCs. It adds pinctrl node for hdmi
>> hpd gpio and update binding documents.
>>
>> This set is based on kukjin's for-next branch at
>> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
>>
>> v7:
>> 1) Minor change in of-documentation.
>> 2) Squash gpio pin-ctrl and ddc patch to one patch.
>>
>> v6:
>> 1) Update clock numbers as per change in mux and divider clocks.
>> 2) Isolate board changes from SoC patch and add a different patch for
>> ddc.
>>
>> v5:
>> 1) Merged Clock addition patch to DT nmde addition patch.
>> 2) Add dout_pixel clock for hdmi in place of sclk_pixel.
>> 3) Enable mixer node in soc dtsi file.
>>
>> v4:
>> 1) Remove the movement of common properties to Exynos5.dtsi for
>> I2C and hdmi subsystem.
>> 2) Change the title of the patches.
>>
>> v3:
>> 1) Rebase to kgene for-next based on 3.11-rc1.
>> 2) Changes clock numbers as per updated clocks file for
>> exyno5250 and exynos5420.
>> 3) Dropped Sachin patch as already got merged.
>>
>> v2:
>> 1) Added patch for moving common i2c properties to exynos5.dtsi
>> 2) Added patch for moving common hdmi, mixer properties to exynos5.dtsi
>> 3) moved hpd pinctrl node to board file.
>> 4) Added Sachin's patch to update binding document for hdmi with hpd
>> information.
>>
>> Andrew Bresticker (1):
>>   ARM: dts: add i2c device nodes for Exynos5420
>>
>> Rahul Sharma (4):
>>   of/documentation: update with clock information for exynos hdmi
>>     subsystem
>>   ARM: dts: add clocks to hdmi dt node for exynos5250
>>   ARM: dts: add dt nodes for hdmi subsystem for exynos5420
>>   ARM: dts: enable hdmi subsystem for exynos5420 smdk board
>>
>> Sean Paul (1):
>>   ARM: dts: add mixer clocks to mixer node for Exynos5250
>>
>>  .../devicetree/bindings/video/exynos_hdmi.txt      |   14 +++-
>>  .../devicetree/bindings/video/exynos_mixer.txt     |    4 ++
>>  arch/arm/boot/dts/exynos5250.dtsi                  |    8 ++-
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   26 +++++++
>>  arch/arm/boot/dts/exynos5420.dtsi                  |   75
>> ++++++++++++++++++++ 5 files changed, 123 insertions(+), 4 deletions(-)
>
> The whole series looks good to me now. Thanks for keeping up with all the
> comments.

Thanks Tomasz.

>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>

Hi Mr. Kim,

Please consider this series for your for-next branch.

regards,
Rahul Sharma.

> Best regards,
> Tomasz
>
