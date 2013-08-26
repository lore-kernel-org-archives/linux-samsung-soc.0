From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v4 4/7] ARM: dts: add dt nodes for exynos5420 hdmi subsystem
Date: Mon, 26 Aug 2013 10:42:11 +0530
Message-ID: <CAPdUM4OFoNvBHm3smLoOY9J6KNUs_gJo+E=TkMu45J+b-ioyRQ@mail.gmail.com>
References: <1377253461-20851-1-git-send-email-rahul.sharma@samsung.com>
	<7099911.E9MGK44AOv@flatron>
	<CAPdUM4N9cBfJFL1XMXug+QjbCdgq9b9u6u6ViH3Rc4Bh-5MOOQ@mail.gmail.com>
	<3791850.fQhgslc95O@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:52237 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754897Ab3HZFMM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 01:12:12 -0400
In-Reply-To: <3791850.fQhgslc95O@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, "sw0312.kim" <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, sunil joshi <joshi@samsung.com>

On 24 August 2013 20:02, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Saturday 24 of August 2013 12:05:36 Rahul Sharma wrote:
>> > Hi Rahul,
>> >
>> > Please see my comments inline.
>> >
>> > On Friday 23 of August 2013 15:54:18 Rahul Sharma wrote:
>> >> Add hdmi, mixer, ddc device tree nodes for Exynos 5420 SoC.
>> >>
>> >> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> >> ---
>> >>
>> >>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   19 +++++++++++++++++++
>> >>  arch/arm/boot/dts/exynos5420.dtsi         |   14 ++++++++++++++
>> >>  2 files changed, 33 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> >> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index bafba25..7dbf1fa
>> >> 100644
>> >> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> >> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> >> @@ -61,4 +61,23 @@
>> >>
>> >>               };
>> >>
>> >>       };
>> >>
>> >> +     hdmi@14530000 {
>> >> +             status = "okay";
>> >> +             hpd-gpio = <&gpx3 7 0>;
>> >> +     };
>> >> +
>> >> +     mixer@14450000 {
>> >> +             status = "okay";
>> >> +     };
>> >> +
>> >> +     i2c_2: i2c@12C80000 {
>> >> +             samsung,i2c-sda-delay = <100>;
>> >> +             samsung,i2c-max-bus-freq = <66000>;
>> >> +             status = "okay";
>> >> +
>> >> +             hdmiddc@50 {
>> >> +                     compatible = "samsung,exynos4210-hdmiddc";
>> >> +                     reg = <0x50>;
>> >> +             };
>> >> +     };
>> >>
>> >>  };
>> >
>> > You should separate above board-specific changes from this patch and
>> > squash it with patch 6/7, adjusting patch subject and description
>> > appropriately.
>> >
>> >> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>> >> b/arch/arm/boot/dts/exynos5420.dtsi index 05dee86..7c6214d 100644
>> >> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> >> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> >> @@ -274,4 +274,18 @@
>> >>
>> >>               pinctrl-0 = <&i2c3_bus>;
>> >>               status = "disabled";
>> >>
>> >>       };
>> >>
>> >> +
>> >> +     hdmi@14530000 {
>> >> +             compatible = "samsung,exynos4212-hdmi";
>> >> +             reg = <0x14530000 0x70000>;
>> >> +             interrupts = <0 95 0>;
>> >> +             status = "disabled";
>> >> +     };
>> >> +
>> >> +     mixer@14450000 {
>> >> +             compatible = "samsung,exynos5420-mixer";
>> >> +             reg = <0x14450000 0x10000>;
>> >> +             interrupts = <0 94 0>;
>> >> +             status = "disabled";
>> >
>> > This node looks like a candidate to be enabled here on SoC level,
>> > since it does not require any board specific information.
>>
>> Hi Tomasz,
>>
>> Both hdmi and mixer should be enabled at same time. Mixer don't
>> but hdmi needs hpd gpio information which is board dependent. Thats
>> why I kept them disabled in SoC file. What you say?
>
> Hmm, is it a hardware restriction? I mean, if HDMI is not enabled, is it
> impossible to enable mixer and use it for some purposes? I don't know much
> about the Exynos HDMI subsystem, so sorry for the noise if this is
> obvious.

Hi Tomasz,

No, It is not a hardware restriction. Mixer can be probed independently
but there is NO usecase where mixer can be used without hdmi
enabled. Mixer output is hardwired to hdmi block in SoC.

>
> What I have in mind is that device tree should describe the hardware,
> regardless of use case. This is, all the hardware that can possibly
> operate should be listed as operational.

I understand your point. We can keep mixer enabled in DTSI.

regards,
Rahul Sharma.

>
> Best regards,
> Tomasz
>
