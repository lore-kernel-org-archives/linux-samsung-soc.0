From: Kevin Hilman <khilman@kernel.org>
Subject: exynos boot falures in linux-next (was: next boot: 94 boots: 79 pass, 13 fail, 2 untried (next-20141117))
Date: Mon, 17 Nov 2014 07:57:03 -0800
Message-ID: <7hoas54y7k.fsf@deeprootsystems.com>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:43555 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751260AbaKQP5G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 10:57:06 -0500
Received: by mail-pa0-f49.google.com with SMTP id eu11so729155pac.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2014 07:57:06 -0800 (PST)
In-Reply-To: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal> (Kevin's boot
	bot's message of "Mon, 17 Nov 2014 11:33:02 +0000")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

FYI...

Various new exynos5 boot failures starting next-20141117.  Looking in
the boot logs, the boot stops during DRM initialization.

Note that the boot failures are only on exynos_defconfig, and not
multi_v7_defconfig.

Excerpt from boot report below, or recent exynos boots can also be
explored here:

   http://status.armcloud.us/boot/?exynos

Kevin


Kevin's boot bot <khilman@kernel.org> writes:

> Full Build report: http://status.armcloud.us/build/next/kernel/next-20141117/
> Full Boot report:  http://status.armcloud.us/boot/all/job/next/kernel/next-20141117/
>
> Tree/Branch: next
> Git describe: next-20141117
>
> Failed boot tests
> =================

[...]

>            exynos5422-odroid-xu3:     FAIL:    arm-exynos_defconfig
>                                       http://storage.armcloud.us/kernel-ci/next/next-20141117/arm-exynos_defconfig/boot-exynos5422-odroid-xu3.html
>               exynos5250-arndale:     FAIL:    arm-exynos_defconfig
>                                       http://storage.armcloud.us/kernel-ci/next/next-20141117/arm-exynos_defconfig/boot-exynos5250-arndale.html
>              exynos5800-peach-pi:     FAIL:    arm-exynos_defconfig
>                                       http://storage.armcloud.us/kernel-ci/next/next-20141117/arm-exynos_defconfig/boot-exynos5800-peach-pi.html
