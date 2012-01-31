From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: Exynos4: Add cpu-offset property in gic device tree node
Date: Tue, 31 Jan 2012 20:24:35 +0530
Message-ID: <CAJuYYwTzut3+GwKBs8JUWjq3Mw3gTTsm0qxzmvjL=RiwKGwQ8w@mail.gmail.com>
References: <1328021425-4233-1-git-send-email-thomas.abraham@linaro.org>
	<4F280023.8070003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:35413 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753061Ab2AaOyg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 09:54:36 -0500
Received: by vcge1 with SMTP id e1so66647vcg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 06:54:36 -0800 (PST)
In-Reply-To: <4F280023.8070003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 31 January 2012 20:22, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 01/31/12 23:50, Thomas Abraham wrote:
>>
>> Commit 'ARM: gic: allow GIC to support non-banked setups'
>> (db0d4db22a78d31c)
>
>
> I think, following format is more general.
> commit id ("subject")
>
> Please see, below.
> http://lkml.org/lkml/2010/6/1/498

Thanks for the pointer Mr. Kim. I will resubmit with that change.

Regards,
Thomas.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
>> requires a cpu-offset property to be specified for non-banked gic
>> controllers,
>> which is the case for Exynos4.
>>
>> Reported-by: Karol Lewandowski<k.lewandowski@samsung.com>
>> Signed-off-by: Thomas Abraham<thomas.abraham@linaro.org>
>> ---
>> This patch solves the issue of boot failure with SMP enabled kernel =
for
>> Exynos4 device tree enabled machine.
>>
>> =A0arch/arm/boot/dts/exynos4210.dtsi | =A0 =A01 +
>> =A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
>> b/arch/arm/boot/dts/exynos4210.dtsi
>> index 63d7578..a1dd2ee 100644
>> --- a/arch/arm/boot/dts/exynos4210.dtsi
>> +++ b/arch/arm/boot/dts/exynos4210.dtsi
>> @@ -29,6 +29,7 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "arm,cortex-a9-gic";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#interrupt-cells =3D<3>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu-offset =3D<0x8000>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D<0x10490000 0x1000>,<0x1048000=
0 0x100>;
>> =A0 =A0 =A0 =A0};
>>
>
