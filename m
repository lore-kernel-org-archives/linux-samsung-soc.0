From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 05/12] ARM: EXYNOS: add support uart for EXYNOS4 and EXYNOS5
Date: Mon, 26 Mar 2012 19:42:12 +0530
Message-ID: <CAJuYYwT5_EHPD4D+Qx0rX8bUVGLbLYUps2BYSUihLbuKGnhHdA@mail.gmail.com>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com>
	<1331736138-28964-6-git-send-email-kgene.kim@samsung.com>
	<CAJuYYwTJsA1M1Qj2P1-1K=pWzi0BPo8YJNDSx4NqGC7NX0030g@mail.gmail.com>
	<074401cd074f$c2946b90$47bd42b0$%szyprowski@samsung.com>
	<4F6B3256.40304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:37538 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757434Ab2CZOMN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Mar 2012 10:12:13 -0400
Received: by vcqp1 with SMTP id p1so4361584vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Mar 2012 07:12:12 -0700 (PDT)
In-Reply-To: <4F6B3256.40304@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, olof@lixom.net, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org

2012/3/22 Kukjin Kim <kgene.kim@samsung.com>:
> On 03/21/12 03:45, Marek Szyprowski wrote:
>>
>> Hello,
>>
>> On Wednesday, March 21, 2012 10:14 AM Thomas Abraham wrote:
>>
>>> On 14 March 2012 20:12, Kukjin Kim<kgene.kim@samsung.com> =A0wrote:
>>>>
>>>> Actually, the base address of uart is different between EXYNOS4
>>>> and EXYNOS5 and this patch enables to support uart for EXYNOS4
>>>> and EXYNOS5 SoCs at runtime.
>>>>
>>>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>>>> ---
>>>
>>>
>>> [...]
>>>
>>>> diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S
>>>> b/arch/arm/mach-
>>>
>>> exynos/include/mach/debug-macro.S
>>>>
>>>> index 6cacf16..6c857ff 100644
>>>> --- a/arch/arm/mach-exynos/include/mach/debug-macro.S
>>>> +++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
>>>> @@ -21,8 +21,13 @@
>>>> =A0 =A0 =A0 =A0 */
>>>>
>>>> =A0 =A0 =A0 =A0.macro addruart, rp, rv, tmp
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \rp, =3D S3C_PA_UART
>>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \rv, =3D S3C_VA_UART
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 \rp, #0x10000000
>>>
>>>
>>> This is physical address of Exynos4/5 CPUID register which cannot b=
e
>>> used here. And virtual address S5P_VA_CPUID also cannot be used her=
e
>>> since this will be called before paging_init when earlyprintk boot
>>> param is used. So, with this change, earlyprintk does not work for
>>> both Exynos4 and Exynos5.
>>
>>
>> I confirm, printascii freeze the system on EXYNOS4 after that patch,
>> tested on Exynos4210 Nuri board.
>>
> Hi,
>
> I think, it can be solved with following and if no problems, it will =
be
> fixed during v3.4-rcX.
>
> diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S
> b/arch/arm/mach-exynos/in
> index 6c857ff..a865417 100644
> --- a/arch/arm/mach-exynos/include/mach/debug-macro.S
> +++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
> @@ -21,10 +21,10 @@
>
> =A0 =A0 =A0 =A0 */
>
> =A0 =A0 =A0 =A0.macro addruart, rp, rv, tmp
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 \rp, #0x10000000
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \rp, [\rp, #0x0]
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 and =A0 =A0 \rp, \rp, #0xf00000
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 teq =A0 =A0 \rp, #0x500000 =A0 =A0 =A0 =
=A0 =A0@@ EXYNOS5
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrc =A0 =A0 p15, 0, \tmp, c0, c0, 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 and =A0 =A0 \tmp, \tmp, #0xf0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 teq =A0 =A0 \tmp, #0xf0 =A0 =A0 =A0 =A0=
 =A0 =A0 @@ A15
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ldreq =A0 \rp, =3DEXYNOS5_PA_UART
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0movne =A0 \rp, #EXYNOS4_PA_UART =A0 @@=
 EXYNOS4
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ldr =A0 =A0 \rv, =3DS3C_VA_UART
>

Dear Mr. Kim,

I have tested the above patch on Exynos5. Thanks.

Tested-by: Thomas Abraham <thomas.abraham@linaro.org>
