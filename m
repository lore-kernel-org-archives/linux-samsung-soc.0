From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH V2 0/3] exynos: arch: add support for exynos5260 SoC
Date: Wed, 5 Feb 2014 11:47:04 +0530
Message-ID: <CAPdUM4PgAO-WB7R_mR7wHeTJFZr-NgY9cWtFLCk3y7N5O5qh3g@mail.gmail.com>
References: <1391577375-17625-1-git-send-email-rahul.sharma@samsung.com>
	<000301cf2233$92224670$b666d350$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:47308 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751288AbaBEGRG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Feb 2014 01:17:06 -0500
Received: by mail-wi0-f174.google.com with SMTP id f8so232101wiw.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Feb 2014 22:17:04 -0800 (PST)
In-Reply-To: <000301cf2233$92224670$b666d350$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sunil Joshi <joshi@samsung.com>

Oops. Thanks Jingoo Han.

On 5 February 2014 11:01, Jingoo Han <jg1.han@samsung.com> wrote:
> On Wednesday, February 05, 2014 2:16 PM, Rahul Sharma wrote:
>>
>> This is re-spin of V2 which add arch-side support for exynos5260 SoC.
>>
>> V2:
>>   1) Split up DT patch into SoC and Board patch.
>>
>> This series is based on Kukjin's for-next branch at
>> http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git
>>
>> Pankaj Dubey (1):
>>   ARM: EXYNOS: initial board support for exynos5260 SoC
>>
>> Rahul Sharma (2):
>>   ARM: dts: add dts files for exynos5260 SoC
>>   ARM: dts: add dts files for xyref5260 board
>>
>>  arch/arm/boot/dts/Makefile                      |    1 +
>>  arch/arm/boot/dts/exynos5260-pinctrl.dtsi       |  572 +++++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts |  105 +++++
>>  arch/arm/boot/dts/exynos5260.dtsi               |  317 +++++++++++++
>>  arch/arm/mach-exynos/Kconfig                    |    9 +
>>  arch/arm/mach-exynos/common.c                   |   18 +
>>  arch/arm/mach-exynos/include/mach/map.h         |    1 +
>>  arch/arm/mach-exynos/mach-exynos5-dt.c          |    1 +
>>  arch/arm/plat-samsung/include/plat/cpu.h        |    8 +
>>  arch/arm/plat-samsung/include/plat/map-s5p.h    |    1 +
>>  10 files changed, 1033 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/exynos5260-pinctrl.dtsi
>>  create mode 100644 arch/arm/boot/dts/exynos5260-xyref5260-evt0.dts
>>  create mode 100644 arch/arm/boot/dts/exynos5260.dtsi
>>  mode change 100644 => 100755 arch/arm/mach-exynos/include/mach/map.h
>>  mode change 100644 => 100755 arch/arm/mach-exynos/mach-exynos5-dt.c
>>  mode change 100644 => 100755 arch/arm/plat-samsung/include/plat/cpu.h
>
> The mode of these three files should NOT be changed to 100755.
> Please fix it.
>
> Best regards,
> Jingoo Han
>
