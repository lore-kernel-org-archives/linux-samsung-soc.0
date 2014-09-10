From: Tyler Baker <tyler.baker@linaro.org>
Subject: exynos5420/arndale-octa: imprecise external aborts on exynos_defconfig
Date: Wed, 10 Sep 2014 11:20:19 -0700
Message-ID: <CANMBJr41TQx4jVjnOO9WThn=SiZCq12mx1xtGN8_ubzZrO1=YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:37093 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263AbaIJSUV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 14:20:21 -0400
Received: by mail-la0-f46.google.com with SMTP id el20so1479153lab.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Sep 2014 11:20:20 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Exynos5420-based Arndale octa boards have recently started failing boot
tests due to imprecise external aborts.  This only appears to happen
when using exynos_defconfig and boots fine with multi_v7_defconfig.  The
issue seems to be intermittent, so is not reliably reproducable and
difficult to bisect.  Here are a few boot logs from recent
mainline/linux-next kernels that are failing:

mainline/v3.17-rc3-165-g56c2285:
    http://armv7.com/scheduler/job/5525/log_file#L_59_276

mainline/v3.17-rc3-176-g2b12164:
    http://armv7.com/scheduler/job/5595/log_file#L_59_278

mainline/v3.17-rc4-131-gd030671:
    http://armv7.com/scheduler/job/5770/log_file#L_193_277

mainline/v3.17-rc4-146-g619df5d:
    http://armv7.com/scheduler/job/6014/log_file#L_124_0

next/20140908:
    http://armv7.com/scheduler/job/5815/log_file#L_59_276

next/20140910:
    http://armv7.com/scheduler/job/6161/log_file#L_59_278

The ramdisk is used is a very minimal open embedded based filesystem,
which can be found here:

http://images.armcloud.us/lava/common/linaro-image-minimal-initramfs-genericarmv7a.cpio.gz.u-boot

Please let me know if any more information is needed to help
reproduce. If/when a root cause is determined, I am more than willing
to assist in testing any fixes provided.

Thanks,

-- 
Tyler Baker
Tech Lead, LAVA
Linaro.org | Open source software for ARM SoCs
Follow Linaro: http://www.facebook.com/pages/Linaro
http://twitter.com/#!/linaroorg - http://www.linaro.org/linaro-blog
