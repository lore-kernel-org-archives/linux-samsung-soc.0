From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 18/20] ARM: dts: Update device tree source files for EXYNOS5250
Date: Tue, 15 May 2012 19:30:29 +0530
Message-ID: <CAJuYYwTws16QQzimAp4c1T33nW4XapOLtE8mL8p=aRfRp8V28A@mail.gmail.com>
References: <1335813270-13083-1-git-send-email-thomas.abraham@linaro.org>
	<1335813270-13083-19-git-send-email-thomas.abraham@linaro.org>
	<CAOesGMiSrNoOA5wTEZo4RiZkPvSAMi43CntN6GUepTzx6M++OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:64682 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753304Ab2EOOA3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 10:00:29 -0400
Received: by vbbff1 with SMTP id ff1so6053462vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 May 2012 07:00:29 -0700 (PDT)
In-Reply-To: <CAOesGMiSrNoOA5wTEZo4RiZkPvSAMi43CntN6GUepTzx6M++OA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On 3 May 2012 01:25, Olof Johansson <olof@lixom.net> wrote:
> Hi,
>
> On Mon, Apr 30, 2012 at 12:14 PM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>> Updated EXYNOS5 device tree source files to reflect changes in rev1
>> of EXYNOS5 SoC. This includes new additions to the EXYNOS5 dtsi and
>> SMDK5250 dts files and few minor fixes.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> ---
>> =A0arch/arm/boot/dts/exynos5250-smdk5250.dts | =A0 52 ++++++++++++++=
+++++++++++++++
>> =A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 | =A0 44 ++++++=
+-----------------
>> =A02 files changed, 65 insertions(+), 31 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/bo=
ot/dts/exynos5250-smdk5250.dts
>> index 399d17b..bcc4b89 100644
>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> @@ -23,4 +23,56 @@
>> =A0 =A0 =A0 =A0chosen {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bootargs =3D "root=3D/dev/ram0 rw ram=
disk=3D8192 console=3DttySAC1,115200";
>> =A0 =A0 =A0 =A0};
>> +
>> + =A0 =A0 =A0 i2c@12C60000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>
> Two nits:
>
> #a-c and #s-c is likely to always be 1/0, so you might as well move
> these to the dtsi file for the SoC.

This is fixed.

>
> Also, we tend to use non-caps here and in other locations (so it
> should be 12c60000 here).

The dtsi file uses 'C' instead of 'c'. So any change here in dts file
would require a change in the dtsi file as well. So adding this change
in this patch does not seem correct. So I will not do this change for
now.

Thanks,
Thomas.

>
>
> -Olof
