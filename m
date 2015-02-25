From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: fix exynos randconfig build error
Date: Wed, 25 Feb 2015 12:46:20 +0100
Message-ID: <CAJKOXPf2F-g9fU9TrNXz8LPwp8fBNZ6NpaAoP15N0nbHWVesaw@mail.gmail.com>
References: <E1YQa78-0000O0-A4@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173]:42914 "EHLO
	mail-vc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751641AbbBYLqV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Feb 2015 06:46:21 -0500
Received: by mail-vc0-f173.google.com with SMTP id hy4so1136707vcb.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Feb 2015 03:46:20 -0800 (PST)
In-Reply-To: <E1YQa78-0000O0-A4@rmk-PC.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

2015-02-25 12:26 GMT+01:00 Russell King <rmk+kernel@arm.linux.org.uk>:
> The following error was observed with SMP=n in v4.0-rc1:
>
> arch/arm/mach-exynos/pm.c: In function 'exynos_cpu0_enter_aftr':
> arch/arm/mach-exynos/pm.c:246:4: error: implicit declaration of function 'arch_send_wakeup_ipi_mask' [-Werror=implicit-function-declaration]
>
> As the code unconditionally calls a function only available with SMP=y,
> make the Exynos PM support depend on SMP.
>
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Hi,

Thanks for the patch but this already waits for Kukjin top be picked
up. The first patch was similar to yours (adds dependency on SMP),
sent on 4th of February:
https://patchwork.ozlabs.org/patch/436231/

But later Bartlomiej fixed this in other way (allowing to use cpuidle
on non-SMP):
https://patchwork.ozlabs.org/patch/436445/

Unfortunately none of them were picked up.

Best regards,
Krzysztof
