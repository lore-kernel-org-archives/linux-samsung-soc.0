From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5 1/9] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Tue, 10 Mar 2015 10:31:03 +0900
Message-ID: <54FE4957.7050904@samsung.com>
References: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
 <1425533911-14800-2-git-send-email-cw00.choi@samsung.com>
 <20150305122459.GC14093@leverpostej>
 <CAGTfZH3Bf1ueFO25NXFbN+Mvb9TcGbErbSp=a+vQ0=A+E07mQA@mail.gmail.com>
 <20150305170450.GG14093@leverpostej>
 <CAGTfZH3nkCvnuu+fC1Gv5DrRQXEg6Y19tQnh+phj6c_jAFpbvg@mail.gmail.com>
 <20150305185407.GK14093@leverpostej> <54F9140B.3060109@samsung.com>
 <20150306114021.GF8700@leverpostej> <54F99B1A.3080600@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34616 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbCJBbH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Mar 2015 21:31:07 -0400
In-reply-to: <54F99B1A.3080600@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Chanwoo Choi <cwchoi00@gmail.com>, "kgene@kernel.org" <kgene@kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "ideal.song@samsung.com" <ideal.song@samsung.com>, "a.kesavan@samsung.com" <a.kesavan@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Mark,

On 03/06/2015 09:18 PM, Chanwoo Choi wrote:
> Hi,
> 
> On 03/06/2015 08:40 PM, Mark Rutland wrote:

[snip]

>>
>>>>>>>> I take it CPUs boot at EL2?
>>>>>>
>>>>>> Do the CPUs boot at EL1 or EL2?
>>>>>
>>>>> Unfortunately, I cannot check the secure firmware for Exynos5433 SoC.
>>>>> I think that a few SoC provider probably would know it.
>>>>
>>>> I guess I asked the wrong question.
>>>>
>>>> Do CPUs enter the kernel at EL2 or at EL1?
>>>
>>> Could you give me a tip how to check the kernel at EL2 or EL1?
>>
>> Hmm... I thought we logged this but it looks like we don't.
>>
>> You could hack in a check of is_hyp_mode_available() and
>> is_hyp_mode_mismatched(). That will tell you if EL2/hyp is available,
>> and whether all CPUs enter at the same mode (mandatory per the boot
>> protocol).
> 
> OK, I'll try it.

I check the return value of is_hyp_mode_available() to catch whether EL1 or EL2. 

The is_hyp_mode_available() returns 'false' during kernel booting.
- __boot_cpu_mode[0]: 0xe11 (BOOT_CPU_MODE_EL1)
- __boot_cpu_mode[1]: 0x0

Best Regards,
Chanwoo Choi
