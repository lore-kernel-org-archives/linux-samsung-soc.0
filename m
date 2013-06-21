From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v3 3/3] ARM/dts: change compatible strings for hdmi subsystem
Date: Fri, 21 Jun 2013 10:57:14 +0530
Message-ID: <CAPdUM4Okr3C9S4DfimG7-js7o0yVh7UbS0Ersmtbzz6M09JPag@mail.gmail.com>
References: <1371646269-21880-1-git-send-email-rahul.sharma@samsung.com>
	<1371646269-21880-4-git-send-email-rahul.sharma@samsung.com>
	<51C1B72A.6080801@samsung.com>
	<51C1B799.10008@samsung.com>
	<CAPdUM4Pg7wG4EaPw_7R=N=Lx1qWrNt4=LxhzH2+V5YGx0USfNg@mail.gmail.com>
	<CAAQKjZOHmr57WoLuPvLM_KbGvvuOFNjNtD_aBmsykAebt+B+AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:59265 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750745Ab3FUF1P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 01:27:15 -0400
Received: by mail-we0-f175.google.com with SMTP id t59so6173161wes.34
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 22:27:14 -0700 (PDT)
In-Reply-To: <CAAQKjZOHmr57WoLuPvLM_KbGvvuOFNjNtD_aBmsykAebt+B+AQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <daeinki@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Sean Paul <seanpaul@chromium.org>, Lucas Stach <l.stach@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, grant.likely@linaro.org, sunil joshi <joshi@samsung.com>

Thanks Mr. Dae, nothing else for this series.

On Fri, Jun 21, 2013 at 10:47 AM, Inki Dae <daeinki@gmail.com> wrote:
>
>
>
> 2013/6/20 Rahul Sharma <r.sh.open@gmail.com>
>>
>> Thanks Mr. Kim,
>>
>> I will post v4 with aforesaid change.
>>
>
> You don't need  to re-post it. I gonna change it to "ARM/dts: change
> compatible strings for Exynos5250 hdmi subsystem", and merge it. Is there
> another you want?
>
> Thanks,
> Inki Dae
>
>> regards,
>> Rahul Sharma.
>>
>> On Wed, Jun 19, 2013 at 7:22 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > On 06/19/13 22:50, Kukjin Kim wrote:
>> >>
>> >> On 06/19/13 21:51, Rahul Sharma wrote:
>> >>>
>> >>> This patch renames the combatible strings for hdmi, mixer, ddc
>> >>> and hdmiphy. It follows the convention of using compatible string
>> >>> which represent the SoC in which the IP was added for the first
>> >>> time.
>> >>>
>> >>> Signed-off-by: Rahul Sharma<rahul.sharma@samsung.com>
>> >>
>> >>
>> >> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>> >>
>> >
>> > Just one nit in subject:
>> >
>> > [PATCH] ARM: dts: ..... for exynos5250
>> >
>> > Thanks,
>> >
>> > - Kukjin
>> >
>> >>> ---
>> >>> arch/arm/boot/dts/cros5250-common.dtsi | 4 ++--
>> >>> arch/arm/boot/dts/exynos5250-smdk5250.dts | 4 ++--
>> >>> arch/arm/boot/dts/exynos5250.dtsi | 4 ++--
>> >>> 3 files changed, 6 insertions(+), 6 deletions(-)
>> >>>
>> >>> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi
>> >>> b/arch/arm/boot/dts/cros5250-common.dtsi
>> >>> index 3f0239e..dc259e8b 100644
>> >>> --- a/arch/arm/boot/dts/cros5250-common.dtsi
>> >>> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
>> >>> @@ -190,7 +190,7 @@
>> >>> samsung,i2c-max-bus-freq =<66000>;
>> >>>
>> >>> hdmiddc@50 {
>> >>> - compatible = "samsung,exynos5-hdmiddc";
>> >>> + compatible = "samsung,exynos4210-hdmiddc";
>> >>> reg =<0x50>;
>> >>> };
>> >>> };
>> >>> @@ -224,7 +224,7 @@
>> >>> samsung,i2c-max-bus-freq =<378000>;
>> >>>
>> >>> hdmiphy@38 {
>> >>> - compatible = "samsung,exynos5-hdmiphy";
>> >>> + compatible = "samsung,exynos4212-hdmiphy";
>> >>> reg =<0x38>;
>> >>> };
>> >>> };
>> >>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> >>> b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> >>> index 3e0c792..f320d7c 100644
>> >>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> >>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> >>> @@ -72,7 +72,7 @@
>> >>> samsung,i2c-max-bus-freq =<66000>;
>> >>>
>> >>> hdmiddc@50 {
>> >>> - compatible = "samsung,exynos5-hdmiddc";
>> >>> + compatible = "samsung,exynos4210-hdmiddc";
>> >>> reg =<0x50>;
>> >>> };
>> >>> };
>> >>> @@ -102,7 +102,7 @@
>> >>> samsung,i2c-max-bus-freq =<66000>;
>> >>>
>> >>> hdmiphy@38 {
>> >>> - compatible = "samsung,exynos5-hdmiphy";
>> >>> + compatible = "samsung,exynos4212-hdmiphy";
>> >>> reg =<0x38>;
>> >>> };
>> >>> };
>> >>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>> >>> b/arch/arm/boot/dts/exynos5250.dtsi
>> >>> index 0673524..2f7763b 100644
>> >>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> >>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> >>> @@ -601,7 +601,7 @@
>> >>> };
>> >>>
>> >>> hdmi {
>> >>> - compatible = "samsung,exynos5-hdmi";
>> >>> + compatible = "samsung,exynos4212-hdmi";
>> >>> reg =<0x14530000 0x70000>;
>> >>> interrupts =<0 95 0>;
>> >>> clocks =<&clock 333>,<&clock 136>,<&clock 137>,
>> >>> @@ -611,7 +611,7 @@
>> >>> };
>> >>>
>> >>> mixer {
>> >>> - compatible = "samsung,exynos5-mixer";
>> >>> + compatible = "samsung,exynos5250-mixer";
>> >>> reg =<0x14450000 0x10000>;
>> >>> interrupts =<0 94 0>;
>> >>> };
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
