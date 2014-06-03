From: Olof Johansson <olof@lixom.net>
Subject: Re: Exynos induced build error with recent arm-soc
Date: Mon, 2 Jun 2014 21:03:55 -0700
Message-ID: <CAOesGMjLAoWOAkm-5+HrHDND_TRyBmbA49ugK+bRBZswBhd3wA@mail.gmail.com>
References: <20140602234216.GD933@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:42875 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915AbaFCED4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 00:03:56 -0400
Received: by mail-qa0-f45.google.com with SMTP id hw13so3981221qab.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jun 2014 21:03:55 -0700 (PDT)
In-Reply-To: <20140602234216.GD933@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arm@kernel.org" <arm@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>

On Mon, Jun 2, 2014 at 4:42 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> Spotted with a randconfig today:
>
> arch/arm/mach-exynos/built-in.o: In function `exynos_set_cpu_boot_addr':
> pm_domains.c:(.text+0x19c): undefined reference to `sysram_ns_base_addr'
> arch/arm/mach-exynos/built-in.o:(.data+0x94): undefined reference to `exynos_enter_aftr'
>
> This should be fixed before the merge window...
>
> The failing .config is:
>
> http://www.arm.linux.org.uk/developer/build/file.php?lid=8598
>
> and the resulting build log with errors:
>
> http://www.arm.linux.org.uk/developer/build/result.php?type=log&cid=3001&lid=8600&format=build
>
> Thanks.

Ah, yes, definitely needs fixing. Looks like sysram_base_addr can
cause similar problems if CONFIG_SUSPEND -> CONFIG_PM_SLEEP is enabled
on !SMP.

The setup (and location) for these variables need to be moved out of
platsmp.c. exynos.c seems like as good a place as any in this case.
I'll post a patch separately in a few minutes.


-Olof
