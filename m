From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 6/6] ARM: dts: Add nodes for spi controllers for Samsung
 Exynos5 platforms
Date: Thu, 24 May 2012 14:39:58 +0530
Message-ID: <CAJuYYwSe0mOF=oUNiaB88fnxn1pHwR=CNVgzrJr9Uw7id-rudQ@mail.gmail.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
	<1337334392-6441-7-git-send-email-thomas.abraham@linaro.org>
	<006d01cd3981$c8b0d950$5a128bf0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:53626 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932239Ab2EXJKA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 05:10:00 -0400
Received: by wgbdr13 with SMTP id dr13so8093623wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 May 2012 02:09:58 -0700 (PDT)
In-Reply-To: <006d01cd3981$c8b0d950$5a128bf0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jaswinder.singh@linaro.org, Kyoungil Kim <ki0351.kim@samsung.com>

On 24 May 2012 13:19, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> Add device nodes for the three instances of spi controllers in Exyno=
s5
>> platforms and enable instance spi 1 for smdk5250 board.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/boot/dts/exynos5250-smdk5250.dts | =A0 47
>> ++++++++++++++++++++++++++++-
>> =A0arch/arm/boot/dts/exynos5250.dtsi =A0 =A0 =A0 =A0 | =A0 46
>> ++++++++++++++++++++++++++++
>> =A02 files changed, 92 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> index 49945cc..dca572d 100644
>> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
>> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
>
> [...]
>
>> - =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "root=3D/dev/ram0 rw ramdisk=3D=
8192
>> console=3DttySAC1,115200";
>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D"root=3D/dev/ram0 rw ramdisk=3D=
8192
>> initrd=3D0x41000000,8M console=3DttySAC2,115200 init=3D/linuxrc";
>
> Yes, we need above. But it should be separated patch from here.

This is mistake. I will remove this from here. Thanks for pointing this=
 out.

>
> [...]
>
>> + =A0 =A0 spi_1: spi@12d30000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&gpa2 4 2 3 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpa2 6 2 3 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpa2 7 2 3 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 w25q80bw@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "w25x80";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi-max-frequency =3D <100=
00>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 controller-data {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cs-gpio =3D=
 <&gpa2 5 1 0 3>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung,sp=
i-feedback-delay =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 partition@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D =
"U-Boot";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0=
x0 0x40000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 read-only;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 partition@40000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D =
"Kernel";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0=
x40000 0xc0000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 =A0 =A0 =A0 =A0 };
>> + =A0 =A0 };
>
> See my previous comments on 5/6.

Yes, there is a onboard spi flash.

>
> [...]
>
>> + =A0 =A0 combiner:interrupt-controller@10440000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4210-combine=
r";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <2>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 samsung,combiner-nr =3D <32>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10440000 0x1000>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 0 0>, <0 1 0>, <0 2 0>, =
<0 3 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0 4 0>, <0 5 0=
>, <0 6 0>, <0 7 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0 8 0>, <0 9 0=
>, <0 10 0>, <0 11 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0 12 0>, <0 13=
 0>, <0 14 0>, <0 15 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0 16 0>, <0 17=
 0>, <0 18 0>, <0 19 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0 20 0>, <0 21=
 0>, <0 22 0>, <0 23 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0 24 0>, <0 25=
 0>, <0 26 0>, <0 27 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0 28 0>, <0 29=
 0>, <0 30 0>, <0 31 0>;
>> + =A0 =A0 };
>
> Already merged above in my tree.

Right. I completely missed this one. I will remove this from here.

Thanks a lot for your review and comments.

Regards,
Thomas.

>
> [...]
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
