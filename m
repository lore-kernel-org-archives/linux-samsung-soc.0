From: Tushar Behera <trblinux@gmail.com>
Subject: Re: Problems booting exynos5420 with >1 CPU
Date: Fri, 06 Jun 2014 10:08:12 +0530
Message-ID: <539145B4.5000200@gmail.com>
References: <CAD=FV=UX90hgyojW3k_kpT=mt8eX9=AyHr+AGjhK=MrE1hHbUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:44608 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbaFFEiS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 00:38:18 -0400
Received: by mail-pb0-f51.google.com with SMTP id ma3so2117020pbc.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jun 2014 21:38:17 -0700 (PDT)
In-Reply-To: <CAD=FV=UX90hgyojW3k_kpT=mt8eX9=AyHr+AGjhK=MrE1hHbUA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kevin Hilman <khilman@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, "Turquette, Mike" <mturquette@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Arun Kumar <arun.kk@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sonny Rao <sonnyrao@chromium.org>

On 06/06/2014 06:38 AM, Doug Anderson wrote:
> Hi,
> 
> When I try to boot linuxnext on my exynos5420-peach-pit chromebook I
> have problems bringing up extra CPUs:
> 
> 1. They don't come up
> 

[ ... ]

> [    1.125030] CPU1: failed to boot: -38
> [    2.130043] CPU2: failed to boot: -38
> [    3.135059] CPU3: failed to boot: -38
> 

With following config modifications over exynos_defconfig, I can see 4
big cores coming up.

CONFIG_MCPM=y
CONFIG_EXYNOS5420_MCPM=y

[    0.030919] Exynos MCPM support installed
[    0.060233] CPU1: Booted secondary processor
[    0.090006] CPU1: update cpu_power 1535
[    0.090010] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.100234] CPU2: Booted secondary processor
[    0.130007] CPU2: update cpu_power 1535
[    0.130011] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.140233] CPU3: Booted secondary processor
[    0.170008] CPU3: update cpu_power 1535
[    0.170012] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003


-- 
Tushar Behera
