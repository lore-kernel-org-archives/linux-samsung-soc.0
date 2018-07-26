From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/4] ARM: exynos: Fix imprecise abort during Exynos5422
 suspend to RAM
Date: Thu, 26 Jul 2018 08:40:12 +0200
Message-ID: <CAJKOXPc1csipQsmtJ77uZOwUgchPwGoA_+xxzmCjx97dLU5cyg@mail.gmail.com>
References: <20180724164946.6274-1-krzk@kernel.org> <20180724164946.6274-4-krzk@kernel.org>
 <CANAwSgSChhEzDf5oSqZ2Srt62n16Z+ppFnupT=0pGkaSCv90vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgSChhEzDf5oSqZ2Srt62n16Z+ppFnupT=0pGkaSCv90vw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-doc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 26 July 2018 at 08:22, Anand Moon <linux.amoon@gmail.com> wrote:
> Hi Krzysztof,
>
> On 24 July 2018 at 22:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> Suspend to RAM on Odroid XU3/XU4/HC1 family (Exynos5422) causes
>> imprecise abort:
>>
>>         PM: Syncing filesystems ... done.
>>         Freezing user space processes ... (elapsed 0.003 seconds) done.
>>         OOM killer disabled.
>>         Freezing remaining freezable tasks ... (elapsed 0.003 seconds) done.
>>         wake enabled for irq 139
>>         Disabling non-boot CPUs ...
>>         IRQ51 no longer affine to CPU1
>>         IRQ52 no longer affine to CPU2
>>         IRQ53 no longer affine to CPU3
>>         IRQ54 no longer affine to CPU4
>>         IRQ55 no longer affine to CPU5
>>         IRQ56 no longer affine to CPU6
>>         cpu cpu4: Dropping the link to regulator.40
>>         IRQ57 no longer affine to CPU7
>>         Unhandled fault: external abort on non-linefetch (0x1008) at 0xf081a028
>>         Internal error: : 1008 [#1] PREEMPT SMP ARM
>>
>> with last call trace in exynos_suspend_enter().
>>
>> The abort is caused by writing to register in secure part of sysram.
>> Boards booted under secure firmware (e.g. Hardkernel Odroid boards)
>> should access non-secure sysram.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>
> I could not get the suspend to ram working on my Odroid-XU4.

Correct, resuming from suspend to RAM does not work on Exynos5422
(yet). The patch does not add support for it. I did not write that it
works. The only thing patch does, is fixing the imprecise abort during
suspend.

Best regards,
Krzysztof
