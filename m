From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH 2/2] arm: dt: Exynos5420: populate cpu node enteries to 8 cpus
Date: Thu, 5 Sep 2013 15:45:49 +0530
Message-ID: <CANuQgHFkbpHsnWW_c1QVLtuMgPJ-FgNu1ti4LHDJyWDG-s=UsQ@mail.gmail.com>
References: <1378373086-30676-1-git-send-email-chander.kashyap@linaro.org>
	<3875313.jvPsk6a1oV@amdc1227>
	<CANuQgHGSAGhA_LzU1aP05J86wjjS0qibPTXZM8ka0O3jZz8Kpw@mail.gmail.com>
	<1772890.cJdvnBcfyj@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:63970 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934879Ab3IEKPt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 06:15:49 -0400
Received: by mail-oa0-f49.google.com with SMTP id i7so1929330oag.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 03:15:49 -0700 (PDT)
In-Reply-To: <1772890.cJdvnBcfyj@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On 5 September 2013 15:40, Tomasz Figa <t.figa@samsung.com> wrote:
> On Thursday 05 of September 2013 15:33:17 Chander Kashyap wrote:
>> Hi Tomasz,
>>
>> On 5 September 2013 15:25, Tomasz Figa <t.figa@samsung.com> wrote:
>> > Hi Chander,
>> >
>> > On Thursday 05 of September 2013 14:54:46 Chander Kashyap wrote:
>> >> Exynos5420 is octacore SoC from samsung.
>> >> Hence populate all the cpu node enteries.
>> >>
>> >> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>> >> ---
>> >>
>> >>  arch/arm/boot/dts/exynos5420.dtsi |   28 ++++++++++++++++++++++++++++
>> >>  1 file changed, 28 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>> >> b/arch/arm/boot/dts/exynos5420.dtsi index e97c87b..59489f6 100644
>> >> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> >> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> >> @@ -57,6 +57,34 @@
>> >>
>> >>                       reg = <0x3>;
>> >>                       clock-frequency = <1800000000>;
>> >>
>> >>               };
>> >>
>> >> +
>> >> +             cpu4: cpu@4 {
>> >
>> > I believe this is a typo. The @unit-address suffix should match the
>> > value of reg property.
>>
>> No this is not typo. It is the MPIDR value of the cpu. (24 bits of
>> MPIDR register).
>
> Right. This is what the reg property should be set to. However, the @unit-
> address prefix of node name should match the value of reg property, so if
> the value of reg property is 0x100, then the node should be named cpu@100.

Ah ok,
Thanks. I will spin out a new version and send
>
> Best regards,
> Tomasz
>



-- 
with warm regards,
Chander Kashyap
