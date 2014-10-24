From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 2/5] clk: samsung: exynos4415: Add clocks using common
 clock framework
Date: Fri, 24 Oct 2014 07:18:21 -0600
Message-ID: <CAD8Lp45F_6UWXx0f2xVGZL+Rgemg2fzkYhnfPdaeaiky0rKPgw@mail.gmail.com>
References: <1413775749-17539-1-git-send-email-cw00.choi@samsung.com>
	<1413775935-17743-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:42970 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756432AbaJXNSW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 09:18:22 -0400
Received: by mail-wg0-f50.google.com with SMTP id a1so1071543wgh.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2014 06:18:21 -0700 (PDT)
In-Reply-To: <1413775935-17743-2-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, thomas.abraham@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, InKi Dae <inki.dae@samsung.com>, geunsik.lim@samsung.com, jh80.chung@samsung.com, jaewon02.kim@samsung.com, ideal.song@samsung.com, yj44.cho@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

On Sun, Oct 19, 2014 at 9:32 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> This patch adds the new clock driver of Exynos4415 SoC based on Cortex-A9
> using common clock framework. The CMU (Clock Management Unit) of Exynos4415
> controls PLLs(Phase Locked Loops) and generates system clocks for CPU, buses
> and function clocks for individual IPs.

There seems to be a lot in common here with other exynos4 variants in
clk-exynos4.c. Have you considered just adding support for the 4415 in
the existing driver?

Thanks
Daniel
