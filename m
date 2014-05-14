From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL 1/4] Samsung clock Exynos5260 support for v3.16
Date: Thu, 15 May 2014 04:59:22 +0900
Message-ID: <5373CB1A.1040801@samsung.com>
References: <1400090591-5064-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:33884 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052AbaENT70 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 15:59:26 -0400
Received: by mail-pb0-f53.google.com with SMTP id md12so36155pbc.40
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2014 12:59:26 -0700 (PDT)
In-Reply-To: <1400090591-5064-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org

On 05/15/14 03:03, Tomasz Figa wrote:

Hi Mike,

I've talked to Tomasz about current samsung related clock stuff. Since 
they are mostly having dependency on samsung tree now not clock core 
stuff, so would be better if it could be sent to upstream via samsung 
tree. And as you know, updating arch/arm/ and clock stuff are usually 
required for adding new SoC or supporting CCF newly...

How do you think? Basically I need your agreement for it.

Thanks,
Kukjin


> The following changes since commit 2916f9a2c6d9200b4c840a613cd1fa1dad04240f:
>
>    ARM: S3C24XX: remove SAMSUNG_CLOCK remnants after ccf conversion (2014-05-13 08:00:46 +0900)
>
> are available in the git repository at:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tfiga/samsung-clk.git for_3.16/exynos5260
>
> for you to fetch changes up to d39e55e06371c1ba9d11f4a17a56a0f925d12415:
>
>    clk/exynos5260: add clock file for exynos5260 (2014-05-14 19:16:55 +0200)
>
> ----------------------------------------------------------------
>
> Samsung clock Exynos5260 support for v3.16.
>
> This pull request contains patches preparing Samsung Common Clock Framework
> helpers to support Exynos5260 by adding support for multiple clock providers
> and then adding clock driver for Exynos5260.
>
> ----------------------------------------------------------------
> Pankaj Dubey (1):
>        clk/samsung: add support for pll2550xx
>
> Rahul Sharma (4):
>        clk/samsung: add support for multiple clock providers
>        clk/samsung: add support for pll2650xx
>        clk/exynos5260: add macros and documentation for exynos5260
>        clk/exynos5260: add clock file for exynos5260
>
>   .../devicetree/bindings/clock/exynos5260-clock.txt |  190 ++
>   drivers/clk/samsung/Makefile                       |    1 +
>   drivers/clk/samsung/clk-exynos4.c                  |   47 +-
>   drivers/clk/samsung/clk-exynos5250.c               |   25 +-
>   drivers/clk/samsung/clk-exynos5260.c               | 1980 ++++++++++++++++++++
>   drivers/clk/samsung/clk-exynos5260.h               |  459 +++++
>   drivers/clk/samsung/clk-exynos5420.c               |   24 +-
>   drivers/clk/samsung/clk-exynos5440.c               |   18 +-
>   drivers/clk/samsung/clk-pll.c                      |  223 ++-
>   drivers/clk/samsung/clk-pll.h                      |    2 +
>   drivers/clk/samsung/clk-s3c2410.c                  |   51 +-
>   drivers/clk/samsung/clk-s3c2412.c                  |   29 +-
>   drivers/clk/samsung/clk-s3c2443.c                  |   46 +-
>   drivers/clk/samsung/clk-s3c64xx.c                  |   44 +-
>   drivers/clk/samsung/clk.c                          |  114 +-
>   drivers/clk/samsung/clk.h                          |   72 +-
>   include/dt-bindings/clock/exynos5260-clk.h         |  469 +++++
>   17 files changed, 3589 insertions(+), 205 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/clock/exynos5260-clock.txt
>   create mode 100644 drivers/clk/samsung/clk-exynos5260.c
>   create mode 100644 drivers/clk/samsung/clk-exynos5260.h
>   create mode 100644 include/dt-bindings/clock/exynos5260-clk.h
> --
