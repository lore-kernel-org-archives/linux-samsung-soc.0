From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 5/6] ARM: dts: Add nodes for spi controllers for Samsung
 Exynos4 platforms
Date: Thu, 24 May 2012 14:37:55 +0530
Message-ID: <CAJuYYwSpAG17hR2OWdF=heDsjBoTthp=ZoYzZmSQ5u_BxJLQSA@mail.gmail.com>
References: <1337334392-6441-1-git-send-email-thomas.abraham@linaro.org>
	<1337334392-6441-6-git-send-email-thomas.abraham@linaro.org>
	<006c01cd3980$e814b240$b83e16c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:47134 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753130Ab2EXJIB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 May 2012 05:08:01 -0400
Received: by wibhm6 with SMTP id hm6so5459684wib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 May 2012 02:08:00 -0700 (PDT)
In-Reply-To: <006c01cd3980$e814b240$b83e16c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jaswinder.singh@linaro.org, Kyoungil Kim <ki0351.kim@samsung.com>

On 24 May 2012 13:13, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Thomas Abraham wrote:
>>
>> Add device nodes for the three instances of spi controllers in Exyno=
s4
>> platforms. Enable instance spi 2 for smdkv310 board and disable all
>> spi instances for origen board.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/boot/dts/exynos4210-origen.dts =A0 | =A0 12 ++++++++
>> =A0arch/arm/boot/dts/exynos4210-smdkv310.dts | =A0 44
>> +++++++++++++++++++++++++++++
>> =A0arch/arm/boot/dts/exynos4210.dtsi =A0 =A0 =A0 =A0 | =A0 30 ++++++=
+++++++++++++
>> =A03 files changed, 86 insertions(+), 0 deletions(-)
>
> [...]
>
>> + =A0 =A0 aliases {
>> + =A0 =A0 =A0 =A0 =A0 =A0 spi0 =3D &spi_0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 spi1 =3D &spi_1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 spi2 =3D &spi_2;
>> + =A0 =A0 };
>> +
>
> Do we need above aliases?

spi0 controller has different fifo sizes than spi1 and spi2. So we
need aliases to identify the port number and know the fifo sizes.

>
> [...]
>
>>
>> + =A0 =A0 spi_2: spi@13940000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&gpc1 1 5 3 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpc1 3 5 3 0>,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpc1 4 5 3 0>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 w25x80@0 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "w25x80";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi-max-frequency =3D <100=
00>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 controller-data {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cs-gpio =3D=
 <&gpc1 2 1 0 3>;
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
>> +
>
>
> Is there a serial flash(w25x80) is connected via SPI2 on smdkv310?

Yes, smdkv310 has a onboard spi flash connected to SPI2 (w25x80).

Thanks,
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
