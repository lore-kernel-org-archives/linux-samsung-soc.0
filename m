From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable MAX77686 PMIC drivers
 for exynos4412-prime based SoCs
Date: Thu, 4 Dec 2014 23:17:17 -0800
Message-ID: <20141205071717.GA29274@quad.lixom.net>
References: <1417728264-7268-1-git-send-email-tyler.baker@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:64581 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891AbaLEHRR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Dec 2014 02:17:17 -0500
Received: by mail-pa0-f45.google.com with SMTP id lj1so157602pab.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Dec 2014 23:17:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1417728264-7268-1-git-send-email-tyler.baker@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tyler Baker <tyler.baker@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-samsung-soc@vger.kernel.org

On Thu, Dec 04, 2014 at 01:24:24PM -0800, Tyler Baker wrote:
> This patch enables the MAX77686 PMIC drivers in the multi_v7_defconfig used
> on exynos4412-prime family of SoCs [1]. The exynos4412-prime based boards
> are producing the following runtime errors only on the multi_v7_defconfig [2]:
> 
> kern.err: deviceless supply vdd_arm not found, using dummy regulator
> kern.err: exynos-cpufreq exynos-cpufreq: failed to set cpu voltage to 1287500
> kern.err: cpufreq: __target_index: Failed to change cpu frequency: -22
> 
> I reviewed the exynos_defconfig, which does not produce these runtime
> errors. It was obvious that the exynos_defconfig has the PMIC drivers
> enabled, whereas the multi_v7_defconfig does not. This patch has been tested 
> on a odroid-u2 and a odroid-u3 board. It has resolved the runtime errors.
> Therefore, I purpose we enabled these drivers in the multi_v7_defconfig.
> 
> [1] http://www.hardkernel.com/main/products/prdt_info.php?g_code=G135270682824
> [2] http://storage.armcloud.us/kernel-ci/mainline/v3.18-rc7-48-g7cc78f8/arm-multi_v7_defconfig/lab-tbaker-00/boot-exynos4412-odroidu3.html
> 

FWIW, the 5250-based Samsung Chromebook also uses 77686.

Applied to next/defconfig for 3.19 after fixing up some fuzz.


-Olof
