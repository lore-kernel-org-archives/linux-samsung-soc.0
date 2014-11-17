From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: Re: exynos boot falures in linux-next
Date: Mon, 17 Nov 2014 14:24:01 -0800
Message-ID: <7hlhn9zcse.fsf@deeprootsystems.com>
References: <E1XqKYI-0000pQ-4b@ip-10-35-177-41.ec2.internal>
	<7hoas54y7k.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:34265 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791AbaKQWYF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 17:24:05 -0500
Received: by mail-pa0-f51.google.com with SMTP id ey11so6314032pad.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2014 14:24:04 -0800 (PST)
In-Reply-To: <7hoas54y7k.fsf@deeprootsystems.com> (Kevin Hilman's message of
	"Mon, 17 Nov 2014 07:57:03 -0800")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Kevin Hilman <khilman@kernel.org> writes:

> FYI...
>
> Various new exynos5 boot failures starting next-20141117.  Looking in
> the boot logs, the boot stops during DRM initialization.
>
> Note that the boot failures are only on exynos_defconfig, and not
> multi_v7_defconfig.

As might have been expected, reverting the change that enables the
DRM/display options in exynos_defconfig fixes the problem.

Kevin

> Excerpt from boot report below, or recent exynos boots can also be
> explored here:
>
>    http://status.armcloud.us/boot/?exynos
>
> Kevin
>
>
> Kevin's boot bot <khilman@kernel.org> writes:
>
>> Full Build report: http://status.armcloud.us/build/next/kernel/next-20141117/
>> Full Boot report:  http://status.armcloud.us/boot/all/job/next/kernel/next-20141117/
>>
>> Tree/Branch: next
>> Git describe: next-20141117
>>
>> Failed boot tests
>> =================
>
> [...]
>
>>            exynos5422-odroid-xu3:     FAIL:    arm-exynos_defconfig
>>                                       http://storage.armcloud.us/kernel-ci/next/next-20141117/arm-exynos_defconfig/boot-exynos5422-odroid-xu3.html
>>               exynos5250-arndale:     FAIL:    arm-exynos_defconfig
>>                                       http://storage.armcloud.us/kernel-ci/next/next-20141117/arm-exynos_defconfig/boot-exynos5250-arndale.html
>>              exynos5800-peach-pi:     FAIL:    arm-exynos_defconfig
>>                                       http://storage.armcloud.us/kernel-ci/next/next-20141117/arm-exynos_defconfig/boot-exynos5800-peach-pi.html

[1]
commit 0ef76aea7a344ac520b02822a8080797fa06124c
Author: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Date:   Thu Nov 13 11:51:42 2014 +0900

    ARM: exynos_defconfig: Enable options for display panel support

    Many Exynos devices have a display panel. Most of them just have
    a simple panel while others have more complex configurations that
    requires an embedded DisplayPort (eDP) to LVDS bridges.

    This patch enables the following features to be built in the kernel
    image to support both setups:

    - Direct Rendering Manager (DRM)
    - DRM bridge registration and lookup framework
    - Parade ps8622/ps8625 eDP/LVDS bridge
    - NXP ptn3460 eDP/LVDS bridge
    - Exynos Fully Interactive Mobile Display controller (FIMD)
    - Panel registration and lookup framework
    - Simple panels
    - Backlight & LCD device support

    Signed-off-by: Javier Martinez Canillas
    <javier.martinez@collabora.co.uk>
    Tested-by: Kevin Hilman <khilman@linaro.org>
    Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
