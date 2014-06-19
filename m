From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v2] arm: exynos: Support cluster power off on exynos5420/5800
Date: Thu, 19 Jun 2014 13:34:49 -0700
Message-ID: <7hy4wsvdsm.fsf@paris.lan>
References: <1403104722-14848-1-git-send-email-a.kesavan@samsung.com>
	<1403181617-19743-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:39876 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756433AbaFSUev (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 16:34:51 -0400
Received: by mail-pb0-f50.google.com with SMTP id rp16so2285923pbb.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jun 2014 13:34:51 -0700 (PDT)
In-Reply-To: <1403181617-19743-1-git-send-email-a.kesavan@samsung.com>
	(Abhilash Kesavan's message of "Thu, 19 Jun 2014 18:10:17 +0530")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, nicolas.pitre@linaro.org, kesavan.abhilash@gmail.com, abrestic@chromium.org

Abhilash Kesavan <a.kesavan@samsung.com> writes:

> Turning off a cluster when all 4 cores of the cluster are powered off
> saves power significantly. Powering off the A15 L2 alone gives around
> 100mW in savings. Add support for powering off the A15/A7 clusters on
> exynos5420/5800.
>
> The patch enables specific register bits which ensure that:
>    - cluster L2 will be turned on before the first man is powered up.
>    - last man will be turned off before the cluster L2 is turned off.
>    - core is powered down before powering it up.
>
> Remove the exynos_cluster_power_control function completely as we can
> rely on the above mentioned bits rather than polling the cluster power
> status register.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Acked-by: Nicolas Pitre <nico@linaro.org>
> ---
> Change in v2:
> Added a macro for the COMMON_OPTION register and used it in the MCPM
> back-end.
>
> The patch is based on Linux-next 20140619. It has been tested on an
> exynos5420-based chromebook using the "/dev/bL_switcher" interface as
> well as the script provided by Nicolas Pitre and Dave Martin [1].
>
> Patch depends on:
> [v2] ARM: EXYNOS: mcpm: Don't rely on firmware's secondary_cpu_start
>
> [1] http://www.spinics.net/lists/linux-samsung-soc/msg31257.html

Tested on exynos5800/Chromebook2 along with the dependency patch and using
the script from Dave and Nico.

Tested-by: Kevin Hilman <khilman@linaro.org>

Kevin
