From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: add pinctrl nodes for Exynos5250 SoC
Date: Thu, 25 Apr 2013 11:13:11 +0200
Message-ID: <1915783.V1ojdPclI6@amdc1227>
References: <1355403978-388-1-git-send-email-thomas.abraham@linaro.org>
 <20130424233348.GA6603@quad.lixom.net>
 <CA+Ln22EafDes5Lrvpwg08HnyNRuo=Z2uHAg6VJDMjNon9=E_qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34639 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755022Ab3DYJNR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Apr 2013 05:13:17 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLT00K6509M8IJ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Apr 2013 18:13:16 +0900 (KST)
In-reply-to: <CA+Ln22EafDes5Lrvpwg08HnyNRuo=Z2uHAg6VJDMjNon9=E_qQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Oh screw that mobile GMail - seems like it now always sends plain + HTM=
L...

Resending the post from a mail client working properly:

On Thursday 25 of April 2013 10:47:21 Tomasz Figa wrote:

Hi Olof,

W dniu czwartek, 25 kwietnia 2013 u=C5=BCytkownik Olof Johansson <olof@=
lixom.net>=20
napisa=C5=82:
> On Thu, Dec 13, 2012 at 06:36:18PM +0530, Thomas Abraham wrote:
>> Add pinctrl device nodes for Exynos5250 SoC.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>
> Replying to an old email of a patch that has been merged because it s=
eems
> horribly broken.
>

As far as I can see in Kgene's tree, newer version of this patch has be=
en=20
merged.

I managed to already found a typo in that new version, though. The pinc=
trl2=20
block is located at 0x3860000 not 0x3680000, or at least this is what t=
he=20
manual says.

>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi=20
b/arch/arm/boot/dts/exynos5250.dtsi
>> index 581e57a..eb8d610 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -18,6 +18,7 @@
>>  */
>>
>>  /include/ "skeleton.dtsi"
>> +/include/ "exynos5250-pinctrl.dtsi"
>>
>>  / {
>>       compatible =3D "samsung,exynos5250";
>> @@ -48,6 +49,8 @@
>>               mshc1 =3D &dwmmc_1;
>>               mshc2 =3D &dwmmc_2;
>>               mshc3 =3D &dwmmc_3;
>> +             pinctrl0 =3D &pinctrl_0;
>> +             pinctrl3 =3D &pinctrl_3;
>>       };
>>
>>       gic:interrupt-controller@10481000 {
>> @@ -79,6 +82,24 @@
>>               interrupts =3D <0 42 0>;
>>       };
>>
>> +     pinctrl_0: pinctrl@11400000 {
>> +             compatible =3D "samsung,pinctrl-exynos5250";
>> +             reg =3D <0x11400000 0x1000>;
>> +             interrupts =3D <0 46 0>;
>> +
>> +             wakup_eint: wakeup-interrupt-controller {
>> +                     compatible =3D "samsung,exynos4210-wakeup-eint=
";
>> +                     interrupt-parent =3D <&gic>;
>> +                     interrupts =3D <0 32 0>;
>> +             };
>
> Typo, should be "wakeup_eint". And what happened to #interrupt-cells?=
 And=20
the
> interrupt map?
>
> Do you have an example of a tested user or a testcase for this? I'm
> trying to get interrupts going on these pins, and it's not looking li=
ke
> it's even close to working.

I have extensively tested interrupt handling in pinctrl-driver when rew=
orking=20
it. Testing was done on Exynos4210 and Exynos4412, but Exynos5250 seems=
 to=20
follow exactly the same design of pinctrl block.

Could you specify a bit more precisely what is your use case (GPIO pin,=
=20
driver, device tree node of interrupt user, etc.)?

Best regards,
--=20
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
