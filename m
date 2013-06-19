From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v3 3/3] ARM/dts: change compatible strings for hdmi subsystem
Date: Wed, 19 Jun 2013 21:25:24 +0530
Message-ID: <CAPdUM4Pg7wG4EaPw_7R=N=Lx1qWrNt4=LxhzH2+V5YGx0USfNg@mail.gmail.com>
References: <1371646269-21880-1-git-send-email-rahul.sharma@samsung.com>
	<1371646269-21880-4-git-send-email-rahul.sharma@samsung.com>
	<51C1B72A.6080801@samsung.com>
	<51C1B799.10008@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:36862 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756651Ab3FSPz0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 11:55:26 -0400
Received: by mail-wi0-f181.google.com with SMTP id hq4so808293wib.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 08:55:24 -0700 (PDT)
In-Reply-To: <51C1B799.10008@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com

Thanks Mr. Kim,

I will post v4 with aforesaid change.

regards,
Rahul Sharma.

On Wed, Jun 19, 2013 at 7:22 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 06/19/13 22:50, Kukjin Kim wrote:
>>
>> On 06/19/13 21:51, Rahul Sharma wrote:
>>>
>>> This patch renames the combatible strings for hdmi, mixer, ddc
>>> and hdmiphy. It follows the convention of using compatible string
>>> which represent the SoC in which the IP was added for the first
>>> time.
>>>
>>> Signed-off-by: Rahul Sharma<rahul.sharma@samsung.com>
>>
>>
>> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>>
>
> Just one nit in subject:
>
> [PATCH] ARM: dts: ..... for exynos5250
>
> Thanks,
>
> - Kukjin
>
>>> ---
>>> arch/arm/boot/dts/cros5250-common.dtsi | 4 ++--
>>> arch/arm/boot/dts/exynos5250-smdk5250.dts | 4 ++--
>>> arch/arm/boot/dts/exynos5250.dtsi | 4 ++--
>>> 3 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi
>>> b/arch/arm/boot/dts/cros5250-common.dtsi
>>> index 3f0239e..dc259e8b 100644
>>> --- a/arch/arm/boot/dts/cros5250-common.dtsi
>>> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
>>> @@ -190,7 +190,7 @@
>>> samsung,i2c-max-bus-freq =<66000>;
>>>
>>> hdmiddc@50 {
>>> - compatible = "samsung,exynos5-hdmiddc";
>>> + compatible = "samsung,exynos4210-hdmiddc";
>>> reg =<0x50>;
>>> };
>>> };
>>> @@ -224,7 +224,7 @@
>>> samsung,i2c-max-bus-freq =<378000>;
>>>
>>> hdmiphy@38 {
>>> - compatible = "samsung,exynos5-hdmiphy";
>>> + compatible = "samsung,exynos4212-hdmiphy";
>>> reg =<0x38>;
>>> };
>>> };
>>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> index 3e0c792..f320d7c 100644
>>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>>> @@ -72,7 +72,7 @@
>>> samsung,i2c-max-bus-freq =<66000>;
>>>
>>> hdmiddc@50 {
>>> - compatible = "samsung,exynos5-hdmiddc";
>>> + compatible = "samsung,exynos4210-hdmiddc";
>>> reg =<0x50>;
>>> };
>>> };
>>> @@ -102,7 +102,7 @@
>>> samsung,i2c-max-bus-freq =<66000>;
>>>
>>> hdmiphy@38 {
>>> - compatible = "samsung,exynos5-hdmiphy";
>>> + compatible = "samsung,exynos4212-hdmiphy";
>>> reg =<0x38>;
>>> };
>>> };
>>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>>> b/arch/arm/boot/dts/exynos5250.dtsi
>>> index 0673524..2f7763b 100644
>>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>>> @@ -601,7 +601,7 @@
>>> };
>>>
>>> hdmi {
>>> - compatible = "samsung,exynos5-hdmi";
>>> + compatible = "samsung,exynos4212-hdmi";
>>> reg =<0x14530000 0x70000>;
>>> interrupts =<0 95 0>;
>>> clocks =<&clock 333>,<&clock 136>,<&clock 137>,
>>> @@ -611,7 +611,7 @@
>>> };
>>>
>>> mixer {
>>> - compatible = "samsung,exynos5-mixer";
>>> + compatible = "samsung,exynos5250-mixer";
>>> reg =<0x14450000 0x10000>;
>>> interrupts =<0 94 0>;
>>> };
