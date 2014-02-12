From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: exynos5250-arndale: Keep G3D regulator always on
Date: Wed, 12 Feb 2014 10:18:33 +0530
Message-ID: <CAHbNUh0gPXV36CtmsktJA+hHPDBkvVcej3xJgTRB8UqASuyeeQ@mail.gmail.com>
References: <1392141043-27170-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:38958 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbaBLEsd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 23:48:33 -0500
Received: by mail-ob0-f170.google.com with SMTP id va2so9920202obc.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2014 20:48:33 -0800 (PST)
In-Reply-To: <1392141043-27170-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, stable@vger.kernel.org

On 11 February 2014 23:20, Tomasz Figa <t.figa@samsung.com> wrote:
> Apparently, if G3D regulator is powered off, the SoC cannot enter low
> power modes and just hangs. This patch fixes this by keeping the
> regulator always on when the system is running, as suggested by Exynos 4
> User's Manual in case of Exynos4210/4x12 SoCs (Exynos5250 UM does not
> have such note, but observed behavior seems to confirm that it is true
> for this SoC as well).
>
> This fixes an issue preventing Arndale board from entering sleep mode
> observed since commit
>
> 346f372f7b72a0 clk: exynos5250: Add CLK_IGNORE_UNUSED flag for pmu clock
>
> that landed in kernel 3.11, which has fixed the clock driver to make the
> SoC actually try to enter the sleep mode.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: stable@vger.kernel.org

Thanks for the patch.

Tested-by: Tushar Behera <tushar.behera@linaro.org>

-- 
Tushar Behera
