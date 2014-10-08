From: Kevin Hilman <khilman@linaro.org>
Subject: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Wed, 8 Oct 2014 11:58:37 -0700
Message-ID: <CAGa+x84j02p05uaxYva1FVqJYVeLeLhya13dv-OjB=+TtQCC1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:39199 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751517AbaJHS6i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Oct 2014 14:58:38 -0400
Received: by mail-qc0-f179.google.com with SMTP id x3so7925547qcv.38
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2014 11:58:37 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <k.chander@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Mauro Ribeiro <mdrjr0@gmail.com>

Hi Chander, Abhilash,

I'm using the exynos5422 odroid-xu3 and only 6 of 8 cores are coming
online when using MCPM[1].  All the A15s are booting but only 2 of the
A7s, one of which is the primary CPU.

After booting, if I try to manually bring one of the CPUs online via
/sys/devices/.../cpuX/online, I hit the BUG() in
mcpm-exynos.c:exynos_power_up().

Any ideas why 2 of the A7s aren't booting up?

Kevin

[1]
[    0.001719] CPU: Testing write buffer coherency: ok
[    0.002171] CPU0: update cpu_capacity 448
[    0.002187] CPU0: thread -1, cpu 0, socket 1, mpidr 80000100
[    0.002429] Setting up static identity map for 0x4046df70 - 0x4046dfc8
[    0.002732] ARM CCI driver probed
[    0.002815] exynos_mcpm_usage_count_init: cpu 0 cluster 1
[    0.003010] Exynos MCPM support installed
[    0.030310] mcpm_boot_secondary: logical CPU 1 is physical CPU 0 cluster 0
[    0.030326] exynos_power_up: cpu 0 cluster 0
[    0.030626] CPU1: Booted secondary processor
[    0.030686] CPU1: update cpu_capacity 1535
[    0.030693] CPU1: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.040314] mcpm_boot_secondary: logical CPU 2 is physical CPU 1 cluster 0
[    0.040340] exynos_power_up: cpu 1 cluster 0
[    0.040629] CPU2: Booted secondary processor
[    0.040672] CPU2: update cpu_capacity 1535
[    0.040679] CPU2: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.050321] mcpm_boot_secondary: logical CPU 3 is physical CPU 2 cluster 0
[    0.050347] exynos_power_up: cpu 2 cluster 0
[    0.050659] CPU3: Booted secondary processor
[    0.050703] CPU3: update cpu_capacity 1535
[    0.050710] CPU3: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.060316] mcpm_boot_secondary: logical CPU 4 is physical CPU 3 cluster 0
[    0.060343] exynos_power_up: cpu 3 cluster 0
[    0.060631] CPU4: Booted secondary processor
[    0.060675] CPU4: update cpu_capacity 1535
[    0.060682] CPU4: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.070316] mcpm_boot_secondary: logical CPU 5 is physical CPU 1 cluster 1
[    0.070343] exynos_power_up: cpu 1 cluster 1
[    1.070007] CPU5: failed to come online
[    1.080322] mcpm_boot_secondary: logical CPU 6 is physical CPU 2 cluster 1
[    1.080337] exynos_power_up: cpu 2 cluster 1
[    1.080625] CPU6: Booted secondary processor
[    1.080691] CPU6: update cpu_capacity 448
[    1.080699] CPU6: thread -1, cpu 2, socket 1, mpidr 80000102
[    1.090331] mcpm_boot_secondary: logical CPU 7 is physical CPU 3 cluster 1
[    1.090356] exynos_power_up: cpu 3 cluster 1
[    2.090023] CPU7: failed to come online
[    2.090055] Brought up 6 CPUs
[    2.090067] SMP: Total of 6 processors activated.
[    2.090079] CPU: WARNING: CPU(s) started in wrong/inconsistent
modes (primary CPU mode 0x13)
[    2.090089] CPU: This may indicate a broken bootloader or firmware.
