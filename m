From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: Replace small letter of base
 address/offset on Exynos5433
Date: Thu, 12 Jan 2017 06:30:45 +0900
Message-ID: <CAGTfZH1172CkN_EqMvZNvn8_LYYATYgNnW9PJrL7ArPr2SPMVQ@mail.gmail.com>
References: <CGME20170111005552epcas1p4a1f6ed88022b46544dec4b3801583267@epcas1p4.samsung.com>
 <1484096148-17120-1-git-send-email-cw00.choi@samsung.com> <20170111211503.6kwqaunb5mpe6eb2@rob-hp-laptop>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:35714 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753757AbdAKVb0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2017 16:31:26 -0500
In-Reply-To: <20170111211503.6kwqaunb5mpe6eb2@rob-hp-laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Rutland <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, a.hajda@samsung.com, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

2017-01-12 6:15 GMT+09:00 Rob Herring <robh@kernel.org>:
> On Wed, Jan 11, 2017 at 09:55:48AM +0900, Chanwoo Choi wrote:
>> This patch replaces the small letter of base address, offset and hex val=
ue
>> with the capital letter to keep the consistency on Exynos5433.
>
> You mean the other way around, right?

When I posted the dts patches, I got the comment that small letter is bette=
r
for base address/offset. (It doesn=E2=80=99t mean that all dts file in Linu=
x Kernel
have to use the small letter of base address and offset.)

This dts uses the both capital and small letter for each base address/offse=
t.
Almost hex value already uses the small letter. If possible, I hope to use
the one style (small letter).

>
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boo=
t/dts/exynos/exynos5433.dtsi
>> index abaf6b4d599d..d7ed1a68b6fd 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
>> @@ -231,7 +231,7 @@
>>               compatible =3D "arm,psci";
>>               method =3D "smc";
>>               cpu_off =3D <0x84000002>;
>> -             cpu_on =3D <0xC4000003>;
>> +             cpu_on =3D <0xc4000003>;
>>       };
>>
>>       reboot: syscon-reboot {
>> @@ -753,7 +753,7 @@
>>
>>               dsi: dsi@13900000 {
>>                       compatible =3D "samsung,exynos5433-mipi-dsi";
>> -                     reg =3D <0x13900000 0xC0>;
>> +                     reg =3D <0x13900000 0xc0>;
>>                       interrupts =3D <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
>>                       phys =3D <&mipi_phy 1>;
>>                       phy-names =3D "dsim";
>> @@ -880,9 +880,9 @@
>>                       iommus =3D <&sysmmu_jpeg>;
>>               };
>>
>> -             mfc: codec@152E0000 {
>> +             mfc: codec@152e0000 {
>>                       compatible =3D "samsung,exynos5433-mfc";
>> -                     reg =3D <0x152E0000 0x10000>;
>> +                     reg =3D <0x152e0000 0x10000>;
>>                       interrupts =3D <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
>>                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>>                       clocks =3D <&cmu_mfc CLK_PCLK_MFC>,
>> @@ -914,7 +914,7 @@
>>
>>               sysmmu_gscl0: sysmmu@13c80000 {
>>                       compatible =3D "samsung,exynos-sysmmu";
>> -                     reg =3D <0x13C80000 0x1000>;
>> +                     reg =3D <0x13c80000 0x1000>;
>>                       interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>>                       clock-names =3D "aclk", "pclk";
>>                       clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
>> @@ -924,7 +924,7 @@
>>
>>               sysmmu_gscl1: sysmmu@13c90000 {
>>                       compatible =3D "samsung,exynos-sysmmu";
>> -                     reg =3D <0x13C90000 0x1000>;
>> +                     reg =3D <0x13c90000 0x1000>;
>>                       interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>>                       clock-names =3D "aclk", "pclk";
>>                       clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
>> @@ -934,7 +934,7 @@
>>
>>               sysmmu_gscl2: sysmmu@13ca0000 {
>>                       compatible =3D "samsung,exynos-sysmmu";
>> -                     reg =3D <0x13CA0000 0x1000>;
>> +                     reg =3D <0x13ca0000 0x1000>;
>>                       interrupts =3D <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
>>                       clock-names =3D "aclk", "pclk";
>>                       clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
>> --
>> 1.9.1
>>



--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
