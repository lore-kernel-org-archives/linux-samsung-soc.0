From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] ARM: Fix the "WFI" instruction opcode definition.
Date: Wed, 7 Nov 2012 11:00:43 +0000
Message-ID: <CAHkRjk5MV7DWUGEhndUbvym9we90FcmvPD+arDfWtuj6PXCy2A@mail.gmail.com>
References: <DA41BE1DDCA941489001C7FBD7A8820E3CB5512E@szxeml549-mbx.china.huawei.com>
 <5091D13B.6060106@gmail.com> <CAKw8HL0ymmNRB=jgGcZn1+6k0s=FKA+qBV04y_wfeu7xMpUpkw@mail.gmail.com>
 <20121105173604.GF2005@linaro.org> <0bee01cdbc11$4a59afb0$df0d0f10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:50963 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754285Ab2KGLBE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 06:01:04 -0500
Received: by mail-qa0-f46.google.com with SMTP id n12so360978qat.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Nov 2012 03:01:04 -0800 (PST)
In-Reply-To: <0bee01cdbc11$4a59afb0$df0d0f10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Dave Martin <dave.martin@linaro.org>, Fei Yang <yangfei.kernel@gmail.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Paul Mundt <lethal@linux-sh.org>, "Yangfei (Felix)" <felix.yang@huawei.com>, linux-arm-kernel@lists.infradead.org

On 6 November 2012 11:24, Kukjin Kim <kgene.kim@samsung.com> wrote:
> BTW, if mach-exynos includes ARMv8 later?...ARMv8 platform codes will be put
> in the arch/arm/ or arch/arm/64/ if some platform codes share with ARMv7?
> Just wondering...

If mach-exynos would support ARMv8 at some point, I would expect most
of the code to go under various drivers/ subsystems (mfd, power etc.).
I don't see any point in using opcodes. For wfi just use a macro or
cpu_do_idle() (as Rob said, it does the required dsb as well).

I'm also pushing for a standard hotplug.c implementation that is
shared by multiple platforms and uses the power state coordination
interface implemented by the firmware.

-- 
Catalin
