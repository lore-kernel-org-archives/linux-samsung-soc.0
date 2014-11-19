From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung clock changes for 3.19
Date: Wed, 19 Nov 2014 16:23:40 +0900
Message-ID: <546C457C.6030901@samsung.com>
References: <5453C8A7.6080502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:34109 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754837AbaKSHXr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 02:23:47 -0500
Received: by mail-pd0-f178.google.com with SMTP id y13so11835pdi.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2014 23:23:46 -0800 (PST)
In-Reply-To: <5453C8A7.6080502@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 11/01/14 02:36, Sylwester Nawrocki wrote:
> Hi Mike,
> 
Hi Mike,

> I've collected Exynos clk patches in this pull request, as Tomasz has
> been busy recently. 
> This includes addition of clock controller drivers for Exynos4415 and 
> Exynos7 SoCs and related refactoring of the Samsung common clk API. 
> 
> As I mentioned in my other e-mail, it might be sensible to put these 
> patches into a separate topic branch, so Kukjin can pull it as 
> a dependency for the related dts changes.
> 
As Sylwester suggested, can you please provide a topic branch for
samsung tree so that I can apply regarding DT changes such as exynos
4415 and exynos7...

- Kukjin

> There are also few Samsung clk cleanup patches not included here,
> I thought I'd send them separately.
> 
> The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:
> 
>   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)
> 
> are available in the git repository at:
> 
>   git://linuxtv.org/snawrocki/samsung.git for-v3.19/exynos-clk
> 
> for you to fetch changes up to 932e98224d5602be17ed61d0e057e9326f12b59d:
> 
>   clk: samsung: exynos7: add gate clock for ADC block (2014-10-31 10:45:54 +0100)
> 
> ----------------------------------------------------------------
> Abhilash Kesavan (1):
>       clk: samsung: exynos7: add gate clock for ADC block
> 
> Chanwoo Choi (2):
>       clk: samsung: Document binding for Exynos4415 clock controller
>       clk: samsung: exynos4415: Add clocks using common clock framework
> 
> Naveen Krishna Ch (8):
>       clk: samsung: add support for 145xx and 1460x PLLs
>       clk: samsung: Factor out the common code to clk.c
>       clk: samsung: Add fixed_factor_clocks field to struct exynos_cmu_info
>       clk: samsung: add initial clock support for Exynos7 SoC
>       clk: samsung: exynos7: add clocks for I2C block
>       clk: samsung: exynos7: add clocks for MMC block
>       clk: samsung: exynos7: add clocks for RTC block
>       clk: samsung: exynos7: add gate clocks for WDT, TMU and PWM blocks
> 
>  .../devicetree/bindings/clock/exynos4415-clock.txt |   38 +
>  .../devicetree/bindings/clock/exynos7-clock.txt    |   93 ++
>  drivers/clk/samsung/Makefile                       |    2 +
>  drivers/clk/samsung/clk-exynos4415.c               | 1142 ++++++++++++++++++++
>  drivers/clk/samsung/clk-exynos5260.c               |  185 +---
>  drivers/clk/samsung/clk-exynos7.c                  |  743 +++++++++++++
>  drivers/clk/samsung/clk-pll.c                      |   25 +-
>  drivers/clk/samsung/clk-pll.h                      |    4 +
>  drivers/clk/samsung/clk.c                          |   98 ++
>  drivers/clk/samsung/clk.h                          |   37 +
>  include/dt-bindings/clock/exynos4415.h             |  360 ++++++
>  include/dt-bindings/clock/exynos7-clk.h            |   92 ++
>  12 files changed, 2655 insertions(+), 164 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/exynos4415-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/exynos7-clock.txt
>  create mode 100644 drivers/clk/samsung/clk-exynos4415.c
>  create mode 100644 drivers/clk/samsung/clk-exynos7.c
>  create mode 100644 include/dt-bindings/clock/exynos4415.h
>  create mode 100644 include/dt-bindings/clock/exynos7-clk.h
