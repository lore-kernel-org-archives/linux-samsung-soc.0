From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v7 1/9] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Tue, 14 Apr 2015 16:53:35 +0900
Message-ID: <552CC77F.10801@samsung.com>
References: <1426637856-3730-1-git-send-email-cw00.choi@samsung.com>
 <1426637856-3730-2-git-send-email-cw00.choi@samsung.com>
 <20150330160940.GA13731@leverpostej> <5519E2B6.2030905@samsung.com>
 <20150402173558.GB30669@leverpostej> <551DD321.6030707@samsung.com>
 <20150407102523.GA23190@leverpostej> <20150413105618.GD4076@leverpostej>
 <552BB14A.6010205@samsung.com> <20150413154949.GI4076@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55458 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751650AbbDNHx7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Apr 2015 03:53:59 -0400
In-reply-to: <20150413154949.GI4076@leverpostej>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, "kgene@kernel.org" <kgene@kernel.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, Marc Zyngier <Marc.Zyngier@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "ideal.song@samsung.com" <ideal.song@samsung.com>, "a.kesavan@samsung.com" <a.kesavan@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Kukjin and Mark,

On 04/14/2015 12:49 AM, Mark Rutland wrote:
>>>>>> So NAK to the PSCI node and PSCI enable method in this dts until we
>>>>>> either have a working firmware, or a reasonable mechanism to handle the
>>>>>> deficiency.
>>>>>
>>>>> There is only CPU0 hotplug issue. Excpet CPU{1-7} are well working.
>>>>
>>>> I understand that, but the issue with CPU0 is still a blocker from my
>>>> PoV.
>>>>
>>>>> To fix this issue, we must need the help of firmware developer.
>>>>> But, We never get the any help.
>>>>
>>>> Previously dyou said that you did not have access to the source code
>>>> rather than not having help from the relevant firmware engineers. I take
>>>> it you have informed them of the issue with CPU0?
>>
>> I didn't ask any help to firmware engineer because I didn't know who firmware engineer
>> and also didn't access the source code. If I knew the engineer and can access them,
>> I would have asked some help to them or inquired the reason about CPU0 not hotplugged.
> 
> You must have acquired the firmware (or board(s) with the firmware
> preloaded) from somewhere. Surely you can work backwards from there to
> file a bug report and/or inquire as to who you need to speak to...

As you commented, I got the board that firmware was preloaded.
Unfortunately, I didn't know the any routine to contact firmware developer
and developer about SoC design.

Dear Kukjin,
I need your help about CPU0 issue of Exynos SoC.
Could you answer why CPU0 cannot be hotplugged on Exynos SoC?

Thanks,
Chanwoo Choi
