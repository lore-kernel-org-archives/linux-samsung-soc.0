From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung Cleanup EXYNOS clock for v3.4
Date: Sat, 10 Mar 2012 07:35:29 -0800
Message-ID: <4F5B74C1.3080200@samsung.com>
References: <4F589474.8050609@samsung.com> <CAOesGMiWOChuMjLQTK1pGys+oXCc4A=HO-2_=37rh3M6pgUP_g@mail.gmail.com> <4F5A22AD.1070907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43973 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755104Ab2CJPfe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Mar 2012 10:35:34 -0500
Received: by yhmm54 with SMTP id m54so1561573yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Mar 2012 07:35:33 -0800 (PST)
In-Reply-To: <4F5A22AD.1070907@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>

On 03/09/12 07:33, Kukjin Kim wrote:
> On 03/08/12 07:16, Olof Johansson wrote:
>> Hi,
>>
>> On Thu, Mar 8, 2012 at 3:13 AM, Kukjin Kim<kgene.kim@samsung.com> wrote:
>>
>>> Kukjin Kim (2):
>>> ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
>>
>> This is one large commit that does many things in one change. As the
>> patch message says:
>>
>> ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
>>
>> - the prefix of clk register replace S5P_ with EXYNOS4_
>> - move mach-exynos/clock.c to mach-exynos/clock-exynos4.c
>> - according to moving clock-exynos4.c,
>> move<mach/exynos4-clock.h> to "clock-exynos4.h"
>> - add prefix exynos4_ on clk declaration
>>
>> It makes it hard to review, especially when you combine a move with
>> other changes. It's better to do the move in a separate commit that
>> doesn't change code (or only changes very very little) and then do the
>> other changes in separate commits later.
>>
> Hmm...OK, let me do as per your suggestion and will re-send this soon.
>
Hi Olof,

I addressed comments from you and I think it should be ok to you.

Please pull from:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-exynos-clock

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


The following changes since commit 192cfd58774b4d17b2fe8bdc77d89c2ef4e0591d:

   Linux 3.3-rc6 (2012-03-03 17:08:09 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-exynos-clock

Jaecheol Lee (1):
       ARM: EXYNOS: add clock registers for exynos4x12-cpufreq

Kukjin Kim (4):
       ARM: EXYNOS: replace clock.c for other new EXYNOS SoCs
       ARM: EXYNOS: use static declaration on regarding clock
       ARM: EXYNOS: change the prefix S5P_ to EXYNOS4_ for clock
       PM / devfreq: update the name of EXYNOS clock register

MyungJoo Ham (2):
       PM / devfreq: update the name of EXYNOS clock registers that were 
omitted
       ARM: EXYNOS: Add clock register addresses for EXYNOS4X12 bus 
devfreq driver

  arch/arm/mach-exynos/Makefile                     |    3 +-
  arch/arm/mach-exynos/clock-exynos4.c              | 1563 
++++++++++++++++++++
  arch/arm/mach-exynos/clock-exynos4.h              |   30 +
  arch/arm/mach-exynos/clock-exynos4210.c           |   46 +-
  arch/arm/mach-exynos/clock-exynos4212.c           |   30 +-
  arch/arm/mach-exynos/clock.c                      | 1564 
---------------------
  arch/arm/mach-exynos/common.h                     |    9 +
  arch/arm/mach-exynos/include/mach/exynos4-clock.h |   43 -
  arch/arm/mach-exynos/include/mach/regs-clock.h    |  416 +++---
  arch/arm/mach-exynos/pm.c                         |   40 +-
  drivers/devfreq/exynos4_bus.c                     |  230 ++--
  11 files changed, 2009 insertions(+), 1965 deletions(-)
  create mode 100644 arch/arm/mach-exynos/clock-exynos4.c
  create mode 100644 arch/arm/mach-exynos/clock-exynos4.h
  delete mode 100644 arch/arm/mach-exynos/clock.c
  delete mode 100644 arch/arm/mach-exynos/include/mach/exynos4-clock.h
