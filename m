From: Amit Kachhap <amit.kachhap@linaro.org>
Subject: Re: [PATCH 1/4] ARM: exynos4: Add support for AFTR mode cpuidle state
Date: Thu, 17 Nov 2011 16:52:23 +0530
Message-ID: <CAK44p20KprcRRhGg_-9zftsiFDNZEP11u4qYujOHcZwPcMH=HQ@mail.gmail.com>
References: <1320426228-21746-1-git-send-email-amit.kachhap@linaro.org>
	<1320426228-21746-2-git-send-email-amit.kachhap@linaro.org>
	<CAJ0PZbTzFDvom3PoPXEvhC8JE_mV3wfYMspnQdRLO=-oz5wGkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:46107 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756471Ab1KQLWZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Nov 2011 06:22:25 -0500
Received: by eye27 with SMTP id 27so1753923eye.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2011 03:22:23 -0800 (PST)
In-Reply-To: <CAJ0PZbTzFDvom3PoPXEvhC8JE_mV3wfYMspnQdRLO=-oz5wGkw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org, kgene.kim@samsung.com, Jaecheol Lee <jc.lee@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

On 11 November 2011 13:03, MyungJoo Ham <myungjoo.ham@gmail.com> wrote:
> On Sat, Nov 5, 2011 at 2:03 AM, =A0<amit.kachhap@linaro.org> wrote:
>> From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
>>
>> This patch adds support for AFTR(ARM OFF TOP RUNNING) mode in
>> cpuidle driver for EXYNOS4210. L2 cache keeps their data in this mod=
e.
>> This patch ports the code to the latest interfaces to
>> save/restore CPU state inclusive of CPU PM notifiers, l2
>> resume and cpu_suspend/resume.
>>
>> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
>> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
>> ---
> []
>> +#define REG_DIRECTGO_ADDR =A0 =A0 =A0(samsung_rev() =3D=3D EXYNOS42=
10_REV_1_1 ? \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IN=
=46ORM7 : (S5P_VA_SYSRAM + 0x24))
>> +#define REG_DIRECTGO_FLAG =A0 =A0 =A0(samsung_rev() =3D=3D EXYNOS42=
10_REV_1_1 ? \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_IN=
=46ORM6 : (S5P_VA_SYSRAM + 0x20))
>>
> []
>> +
>> + =A0 =A0 =A0 __raw_writel(BSYM(virt_to_phys(s3c_cpu_resume)),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0REG_DIRECTGO_ADDR);
>> + =A0 =A0 =A0 __raw_writel(0xfcba0d10, REG_DIRECTGO_FLAG);
>> +
>> =A0 =A0 =A0 =A0return 0;
>
> Hello,
>
>
> Why are you using INFORM6 and 7 registers in order to save resume
> address and power-mode flags?
>
> INFORM0 and 1 have been used in pm.c for the exactly same purpose.
> Please use the same registers in cpuidle.c as well.
>
> The same part in bootloader (IPL) can handle whether it's
> suspend-to-RAM or AFTR and the both modes are mutually exclusive and
> you only need one value for resume PC.
>
> Therefore, you can keep the value at the same location, which is the
> method we have been using.
Hi,

I tried using INFORM0 and INFORM1 in cpuidle and make it same as pm.c.
But this doesnt work. Looks like my irom fused code checks for the
wakeup source and needs INFORM7 and INFORM6 for non sleep wakeups. My
cpu version is S5PV310AH--0AH1113(Origen board).
I suggest adding support for both type of wakeups(directly from irom
and through bootloader).

Thanks,
Amit D
>
> Besides, the Exynos4210 chipmaker (S.LSI) has told that INFORM6 and 7
> registers are used by in-chip code (iROM or iRAM).
>
>
> Cheers!
> MyungJoo
>
>
>
> --
> MyungJoo Ham, Ph.D.
> Mobile Software Platform Lab, DMC Business, Samsung Electronics
>
