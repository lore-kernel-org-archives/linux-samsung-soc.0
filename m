From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/5] ARM: S3C24XX: convert s3c2412 to common clock
 framework
Date: Tue, 25 Feb 2014 09:45:51 +0900
Message-ID: <530BE7BF.7060306@samsung.com>
References: <1835515.oOiOlPWUhB@phil> <530937A4.3010301@gmail.com> <2112473.9LIChJWDSQ@phil> <5309456D.3040805@gmail.com> <20140224000603.22529.1282@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:38008 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751489AbaBYAp7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Feb 2014 19:45:59 -0500
Received: by mail-pd0-f182.google.com with SMTP id v10so7068943pde.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2014 16:45:59 -0800 (PST)
In-Reply-To: <20140224000603.22529.1282@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 02/24/14 09:06, Mike Turquette wrote:
> Quoting Tomasz Figa (2014-02-22 16:48:45)
>> On 23.02.2014 01:29, Heiko St=C3=BCbner wrote:
>>> Hi Tomasz,
>>>
>>> Am Sonntag, 23. Februar 2014, 00:49:56 schrieb Tomasz Figa:
>>>> Hi,
>>>>
>>>> On 22.02.2014 23:45, Heiko St=C3=BCbner wrote:
>>>>> Second incarnation of the series converting s3c2412/s3c2413 to th=
e common
>>>>> clock framework. As before the conversion is done by a mix of dat=
asheet
>>>>> data and the pre-existing clock code and as this time I have no h=
ardware
>>>>> of this type, it is compile-tested only. So hopefully somebody wi=
th
>>>>> s3c2412
>>>>> hw will be able to test it for real.
>>>>>
>>>>> The conversion of s3c2412 now moved in front of the
>>>>> s3c2410/s3c2440/s3c2442
>>>>> one, as I'll need a bit more time for the clockout changes sugges=
ted by
>>>>> Tomasz Figa.
>>>>>
>>>>> This series builds on top of the previous submitted s3c2443/s3c24=
16
>>>>> series.
>>>>>
>>>>>
>>>>> Changes since v1:
>>>>> - move in front of s3c2410 conversion, therefore move 2 necessary=
 patches
>>>>>
>>>>>      that also got ACKs, from there into this series
>>>>>
>>>>> - adapt to Samsung clock pm rework from Tomasz Figa
>>>>> - apply some changes suggested by Tomasz Figa in the s3c2410 cloc=
k driver
>>>>>
>>>>>      that also apply to this driver.
>>>>>
>>>>> Heiko Stuebner (5):
>>>>>      ARM: S3C24XX: only store clock registers when old clock code=
 is active
>>>>>      clk: samsung: add plls used by the early s3c24xx cpus
>>>>>      dt-bindings: add documentation for s3c2412 clock controller
>>>>>      clk: samsung: add clock controller driver for s3c2412
>>>>>      ARM: S3C24XX: convert s3c2412 to common clock framework
>>>>>
>>>>>     .../bindings/clock/samsung,s3c2412-clock.txt       |  50 ++
>>>>>     arch/arm/mach-s3c24xx/Kconfig                      |   8 +-
>>>>>     arch/arm/mach-s3c24xx/Makefile                     |   2 +-
>>>>>     arch/arm/mach-s3c24xx/clock-s3c2412.c              | 761
>>>>>     --------------------- arch/arm/mach-s3c24xx/common.c
>>>>>      |   9 +-
>>>>>     arch/arm/mach-s3c24xx/common.h                     |   4 +
>>>>>     arch/arm/mach-s3c24xx/mach-jive.c                  |   9 +-
>>>>>     arch/arm/mach-s3c24xx/mach-smdk2413.c              |   9 +-
>>>>>     arch/arm/mach-s3c24xx/mach-vstms.c                 |   9 +-
>>>>>     arch/arm/mach-s3c24xx/pm.c                         |  13 +-
>>>>>     arch/arm/mach-s3c24xx/s3c2412.c                    |  43 --
>>>>>     drivers/clk/samsung/Makefile                       |   1 +
>>>>>     drivers/clk/samsung/clk-pll.c                      | 182 ++++=
+
>>>>>     drivers/clk/samsung/clk-pll.h                      |   3 +
>>>>>     drivers/clk/samsung/clk-s3c2412.c                  | 268 ++++=
++++
>>>>>     include/dt-bindings/clock/s3c2412.h                |  73 ++
>>>>>     16 files changed, 627 insertions(+), 817 deletions(-)
>>>>>     create mode 100644
>>>>>     Documentation/devicetree/bindings/clock/samsung,s3c2412-clock=
=2Etxt
>>>>>     delete mode 100644 arch/arm/mach-s3c24xx/clock-s3c2412.c
>>>>>     create mode 100644 drivers/clk/samsung/clk-s3c2412.c
>>>>>     create mode 100644 include/dt-bindings/clock/s3c2412.h
>>>>
>>>> For mach and DT patches:
>>>>
>>>> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>>>>
>>>> Kukjin, I'll take binding and clock patches to Samsung clock tree =
as
>>>> soon as DT bindings get acked by one of DT maintainers. I will pre=
pare a
>>>> branch for you to apply mach patches on top. Is it fine for you?
>>>
>>> I think Kukjin already applied the s3c2416/s3c2443 series on top of=
 your
>>> clock-pm-changes in the linux-samsung tree [1], so it might be best=
 to just
>>> pile this series on top of it.
>>
>> I'm aware of this, but I'm afraid this might cause conflicts with
>> remaining patches that I might have to apply in this release cycle.
>>
>> Patch clk/samsung: add support for multiple clock providers[1] is mo=
stly
>> what I have in my mind, but there is also at least one patch that is
>> based on top of PM rework floating on the list.
>>
>> I'd try to sort this out first with Kukjin and if we fail we will ha=
ve
>> to fall back to merging any clock patches through Samsung tree for t=
his
>> release cycle.
>
YES!

> Better if we can sort it out, but if these patches must go through th=
e
> samsung tree then please add my Ack.
>
Agreed and thanks.

Tomasz, I'll take this series with you and Mike's ack then if required,=
=20
can you please merge the branch "v3.15-next/clk-s3c24xx" into your clk=20
branch?

- Kukjin
