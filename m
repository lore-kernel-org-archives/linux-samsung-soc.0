From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v4 05/12] ARM: EXYNOS: add support uart for EXYNOS4 and
 EXYNOS5
Date: Wed, 28 Mar 2012 19:05:53 -0700
Message-ID: <4F73C381.1090504@samsung.com>
References: <1331736138-28964-1-git-send-email-kgene.kim@samsung.com> <1331736138-28964-6-git-send-email-kgene.kim@samsung.com> <CAJuYYwTJsA1M1Qj2P1-1K=pWzi0BPo8YJNDSx4NqGC7NX0030g@mail.gmail.com> <074401cd074f$c2946b90$47bd42b0$%szyprowski@samsung.com> <4F6B3256.40304@samsung.com> <CAJuYYwT5_EHPD4D+Qx0rX8bUVGLbLYUps2BYSUihLbuKGnhHdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:36291 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758587Ab2C2CF5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 22:05:57 -0400
Received: by gghe5 with SMTP id e5so1215160ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 19:05:57 -0700 (PDT)
In-Reply-To: <CAJuYYwT5_EHPD4D+Qx0rX8bUVGLbLYUps2BYSUihLbuKGnhHdA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, olof@lixom.net, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org

Thomas Abraham wrote:
> 2012/3/22 Kukjin Kim<kgene.kim@samsung.com>:
>> On 03/21/12 03:45, Marek Szyprowski wrote:
>>>
>>> Hello,
>>>
>>> On Wednesday, March 21, 2012 10:14 AM Thomas Abraham wrote:
>>>
>>>> On 14 March 2012 20:12, Kukjin Kim<kgene.kim@samsung.com>    wrote:
>>>>>
>>>>> Actually, the base address of uart is different between EXYNOS4
>>>>> and EXYNOS5 and this patch enables to support uart for EXYNOS4
>>>>> and EXYNOS5 SoCs at runtime.
>>>>>
>>>>> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>>>>> ---
>>>>
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S
>>>>> b/arch/arm/mach-
>>>>
>>>> exynos/include/mach/debug-macro.S
>>>>>
>>>>> index 6cacf16..6c857ff 100644
>>>>> --- a/arch/arm/mach-exynos/include/mach/debug-macro.S
>>>>> +++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
>>>>> @@ -21,8 +21,13 @@
>>>>>          */
>>>>>
>>>>>         .macro addruart, rp, rv, tmp
>>>>> -               ldr     \rp, = S3C_PA_UART
>>>>> -               ldr     \rv, = S3C_VA_UART
>>>>> +               mov     \rp, #0x10000000
>>>>
>>>>
>>>> This is physical address of Exynos4/5 CPUID register which cannot be
>>>> used here. And virtual address S5P_VA_CPUID also cannot be used here
>>>> since this will be called before paging_init when earlyprintk boot
>>>> param is used. So, with this change, earlyprintk does not work for
>>>> both Exynos4 and Exynos5.
>>>
>>>
>>> I confirm, printascii freeze the system on EXYNOS4 after that patch,
>>> tested on Exynos4210 Nuri board.
>>>
>> Hi,
>>
>> I think, it can be solved with following and if no problems, it will be
>> fixed during v3.4-rcX.
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/debug-macro.S
>> b/arch/arm/mach-exynos/in
>> index 6c857ff..a865417 100644
>> --- a/arch/arm/mach-exynos/include/mach/debug-macro.S
>> +++ b/arch/arm/mach-exynos/include/mach/debug-macro.S
>> @@ -21,10 +21,10 @@
>>
>>          */
>>
>>         .macro addruart, rp, rv, tmp
>> -               mov     \rp, #0x10000000
>> -               ldr     \rp, [\rp, #0x0]
>> -               and     \rp, \rp, #0xf00000
>> -               teq     \rp, #0x500000          @@ EXYNOS5
>> +               mrc     p15, 0, \tmp, c0, c0, 0
>> +               and     \tmp, \tmp, #0xf0
>> +               teq     \tmp, #0xf0             @@ A15
>> +
>>                 ldreq   \rp, =EXYNOS5_PA_UART
>>
>>                 movne   \rp, #EXYNOS4_PA_UART   @@ EXYNOS4
>>                 ldr     \rv, =S3C_VA_UART
>>
>
> Dear Mr. Kim,
>
> I have tested the above patch on Exynos5. Thanks.
>
> Tested-by: Thomas Abraham<thomas.abraham@linaro.org>

Hi Marek, Thomas,

Thanks for your test.
I will apply above patch with your 'Tested-by:...'

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
