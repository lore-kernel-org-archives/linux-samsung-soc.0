From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v5 0/6] ARM: dts: add support for exynos hdmi subsystem
Date: Tue, 27 Aug 2013 10:59:28 +0530
Message-ID: <CAPdUM4OJJd40dcsy=5PO7kv7UANq5z=aXnTq7coH11j3M8yWLg@mail.gmail.com>
References: <1377509901-9467-1-git-send-email-rahul.sharma@samsung.com>
	<3096714.XGeJNyPCXd@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:44817 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752576Ab3H0F3a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 01:29:30 -0400
In-Reply-To: <3096714.XGeJNyPCXd@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, sunil joshi <joshi@samsung.com>

On 27 August 2013 05:12, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
> On Monday 26 of August 2013 15:08:15 Rahul Sharma wrote:
>> It adds Device tree nodes and clocks information for HDMI subsystem
>> for exynos5420 and exynos5250 SoCs. It adds pinctrl node for hdmi
>> hpd gpio and update binding documents.
>>
>> This set is based on kukjin's for-next branch at
>> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
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
>>
>>
>> Andrew Bresticker (1):
>>   ARM: dts: add i2c device nodes for Exynos5420
>>
>> Rahul Sharma (4):
>>   ARM: dts: add clocks to hdmi dt node for exynos5250
>>   ARM: dts: add dt nodes for hdmi subsystem for exynos5420
>>   ARM: dts: add hdmi hpd gpio pinctrl node for exynos5420
>>   of/documentation: update with clock information for exynos hdmi
>>     subsystem
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
> Except patches 4-6, which I have commented on, for the series:
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
> Also one minor comment: It would be better if you updated the
> documentation as first patch. This would make all the following patches to
> be based on already existing documentation.
>

Done. I reordered them.

regards,
Rahul Sharma.

> Best regards,
> Tomasz
>
