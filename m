From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v9 0/2] Adds PMU and S2R support for exynos5420
Date: Thu, 09 Oct 2014 15:59:55 -0700
Message-ID: <7hh9zcluhg.fsf@deeprootsystems.com>
References: <1412673723-15551-1-git-send-email-vikas.sajjan@samsung.com>
	<7hiojuno9e.fsf@deeprootsystems.com>
	<CAM4voanoOV44EQveAeikp1P0bXCU8HHdX2XDi3jwLkfQOP0CNQ@mail.gmail.com>
	<CABxcv==V0vR2XXq5cKzbaqkCbtkqKgrhJotdPSM5K0uyNW968w@mail.gmail.com>
	<7hbnpknc98.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:42346 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751374AbaJIW77 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Oct 2014 18:59:59 -0400
Received: by mail-pd0-f176.google.com with SMTP id fp1so518108pdb.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2014 15:59:59 -0700 (PDT)
In-Reply-To: <7hbnpknc98.fsf@deeprootsystems.com> (Kevin Hilman's message of
	"Thu, 09 Oct 2014 14:50:43 -0700")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Vikas Sajjan <vikas.sajjan@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Kevin Hilman <khilman@kernel.org> writes:

[...]

> Trying $SUBJECT series on top of kukjin's for-next is working fine, but
> I'm still not able to make it work on linux-next, with or without the
> CLK_IGNORE_UNUSED patch.

Nevermind, turns out I didn't apply the CLK_IGNORE_UNUSED PATCH.  If I
actually apply it, I have it working on top of linux-next.  However, it
seems to have some issues with the nonboot CPUs resuming:

[   11.319833] Enabling non-boot CPUs ...
[   12.319134] CPU1: failed to come online
[   12.319235] Error taking CPU1 up: -5
[   13.319137] CPU2: failed to come online
[   13.319209] Error taking CPU2 up: -5
[   14.319133] CPU3: failed to come online
[   14.319224] Error taking CPU3 up: -5

Are you guys seeing all the non-boot CPUs coming up?  They fail to come
online, but the /sys/devices/.../cpu?/online reports that they are
online, which means the next attempt to hotplug them will probably BUG().

Also, If I turn off the switcher (enabled by default exynos_defconfig),
resume still has problems bringing all the nonboot CPUs online, and then
has a bunch of I2C errors[1].

And one more..., if I try enabling CPUidle[1] with exynos_defconfig, S2R
causes a reboot (seems to be on resume.)

Kevin


[1] 
[   47.644273] cros-ec-spi spi2.0: EC failed to respond in time
[   47.648535] cros-ec-spi spi2.0: spi transfer failed: -110
[   47.653866] tps65090-charger tps65090-charger: tps65090_charger_isr(): Error in reading reg 0xa

[2]
CONFIG_CPU_IDLE=y
CONFIG_ARM_BIG_LITTLE_CPUIDLE=y
CONFIG_ARM_EXYNOS_CPUIDLE=n
