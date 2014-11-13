From: Tyler Baker <tyler.baker@linaro.org>
Subject: exynos5250/arndale: failed to set cpu voltage
Date: Thu, 13 Nov 2014 14:00:21 -0800
Message-ID: <CANMBJr4ZgEZDAtdfuLhCXppCGHnHhgmT1aFUi+=kJb2PdkqhGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:46563 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964802AbaKMWAX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 17:00:23 -0500
Received: by mail-wg0-f50.google.com with SMTP id z12so17826473wgg.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2014 14:00:21 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com

In recent upstream kernels, exynos5420-based arndale boards have been
producing boot-time errors due to the fact they failed to set the cpu
voltage. These message flood the serial console even after userspace
has been loaded, yielding the console unusable without forcing a lower
log level. These errors are produced _only_ with the
multi_v7_defconfig and they are _not_ present
with exynos_defconfig. Here are some recent boot logs showing the boot errors:

mainline/v3.18-rc4-65-g2c54396:
    multi_v7_defconfig:
        http://storage.armcloud.us/kernel-ci/mainline/v3.18-rc4-65-g2c54396/arm-multi_v7_defconfig/boot-exynos5250-arndale.html
    exynos_defconfig:
        http://storage.armcloud.us/kernel-ci/mainline/v3.18-rc4-65-g2c54396/arm-exynos_defconfig/boot-exynos5250-arndale.html

next/next-20141113:
    multi_v7_defconfig:
        http://storage.armcloud.us/kernel-ci/next/next-20141113/arm-multi_v7_defconfig/boot-exynos5250-arndale.html
    exynos_defconfig:
        http://storage.armcloud.us/kernel-ci/next/next-20141113/arm-exynos_defconfig/boot-exynos5250-arndale.html

arm-soc/v3.18-rc4-185-gbfcf8f9:
    multi_v7_defconfig:
        http://storage.armcloud.us/kernel-ci/arm-soc/v3.18-rc4-185-gbfcf8f9/arm-multi_v7_defconfig/boot-exynos5250-arndale.html
    exynos_defconfig:
        http://storage.armcloud.us/kernel-ci/arm-soc/v3.18-rc4-185-gbfcf8f9/arm-exynos_defconfig/boot-exynos5250-arndale.html

Cheers,

-- 
Tyler Baker
Tech Lead, LAVA
Linaro.org | Open source software for ARM SoCs
Follow Linaro: http://www.facebook.com/pages/Linaro
http://twitter.com/#!/linaroorg - http://www.linaro.org/linaro-blog
