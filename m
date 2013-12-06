From: Yuvaraj Kumar <yuvaraj.cd@gmail.com>
Subject: Re: [PATCH] ARM: dts: Fix mmc node on exynos5250 snow board
Date: Fri, 6 Dec 2013 10:30:28 +0530
Message-ID: <CAKuRcO+DTOmVrXYrRNHYhjC42rwQSX5qzPFxSiKok47VKtEsfQ@mail.gmail.com>
References: <1386237974-2255-1-git-send-email-yuvaraj.cd@samsung.com>
	<CAPz6YkUO7tqSa+tU_M4Do5k7dwc6MaCxX3T-3aJtG1=XQFjTRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51]:36547 "EHLO
	mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750703Ab3LFFA3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 00:00:29 -0500
In-Reply-To: <CAPz6YkUO7tqSa+tU_M4Do5k7dwc6MaCxX3T-3aJtG1=XQFjTRQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sonny Rao <sonnyrao@chromium.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, ALIM AKHTAR <alim.akhtar@samsung.com>, Douglas Anderson <dianders@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

On Fri, Dec 6, 2013 at 12:19 AM, Sonny Rao <sonnyrao@chromium.org> wrote:
> On Thu, Dec 5, 2013 at 2:06 AM, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com> wrote:
>> Commits 64c138a ("ARM: dts: Move fifo-depth property from exynos5250
>> board dts") and 0c3de788 ("ARM: dts: change status property of dwmmc
>> nodes for exynos5250") missed out handling the exynos5250 snow dts file.
>> Delete the fifo-depth property and enable the mmc node in the snow dts
>> file.
>>
>
> Since this is really fixing two different issues, even though they
> both affect dw_mmc, would you mind splitting this up into two
> different commits?
 OK, I will split into two and repost.
>
>> Signed-off-by : Abhilash Kesavan <a.kesavan@samsung.com>
>>
>> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
>> ---
>>  arch/arm/boot/dts/cros5250-common.dtsi |    7 -------
>>  arch/arm/boot/dts/exynos5250-snow.dts  |    9 +++++++++
>>  2 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
>> index 6470536..2dd70e9 100644
>> --- a/arch/arm/boot/dts/cros5250-common.dtsi
>> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
>> @@ -233,7 +233,6 @@
>>                 num-slots = <1>;
>>                 supports-highspeed;
>>                 broken-cd;
>> -               fifo-depth = <0x80>;
>
> Why are you deleting fifo-depth?
fifo-depth property has been moved to SOC specific file exynos5250.dtsi
>
>>                 card-detect-delay = <200>;
>>                 samsung,dw-mshc-ciu-div = <3>;
>>                 samsung,dw-mshc-sdr-timing = <2 3>;
>> @@ -247,14 +246,9 @@
>>                 };
>>         };
>>
>> -       mmc@12210000 {
>> -               status = "disabled";
>> -       };
>> -
>>         mmc@12220000 {
>>                 num-slots = <1>;
>>                 supports-highspeed;
>> -               fifo-depth = <0x80>;
>>                 card-detect-delay = <200>;
>>                 samsung,dw-mshc-ciu-div = <3>;
>>                 samsung,dw-mshc-sdr-timing = <2 3>;
>> @@ -273,7 +267,6 @@
>>                 num-slots = <1>;
>>                 supports-highspeed;
>>                 broken-cd;
>> -               fifo-depth = <0x80>;
>>                 card-detect-delay = <200>;
>>                 samsung,dw-mshc-ciu-div = <3>;
>>                 samsung,dw-mshc-sdr-timing = <2 3>;
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
>> index a9395c4..67484d1 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -171,11 +171,20 @@
>>                 };
>>         };
>>
>> +       mmc@12200000 {
>> +               status = "okay";
>> +       };
>> +
>> +       mmc@12220000 {
>> +               status = "okay";
>> +       };
>> +
>>         /*
>>          * On Snow we've got SIP WiFi and so can keep drive strengths low to
>>          * reduce EMI.
>>          */
>>         mmc@12230000 {
>> +               status = "okay";
>>                 slot@0 {
>>                         pinctrl-names = "default";
>>                         pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4>;
>> --
>> 1.7.9.5
>>
