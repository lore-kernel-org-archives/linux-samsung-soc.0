From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v2 0/3] Add initial support of PMU for exynos5260
Date: Fri, 11 Apr 2014 18:46:06 +0530
Message-ID: <CAGm_ybhk8FdBy_U2jJfY0d=dC-dJDcXnkFexr3q_LCLXUVxtHw@mail.gmail.com>
References: <1395061795-17777-1-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:42362 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757378AbaDKNQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 09:16:07 -0400
In-Reply-To: <1395061795-17777-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Vikas Sajjan <vikas.sajjan@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>

 Hi,

 Any comments on this series.


On Mon, Mar 17, 2014 at 6:39 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> From: Vikas Sajjan <vikas.sajjan@linaro.org>
>
> 1) Added initial PMU support for exynos5260
>
> 2) Added S2R(single CPU) support on exynos5260
>
> 3) Added PMU mapping via DT.
>
> rebased on
> 1) kgene tree for-next branch
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
>
> 2) Rahul's patches for basic support of exynos5260
> http://www.spinics.net/lists/linux-samsung-soc/msg27282.html
>
> 3) Rahul's clk patches http://www.spinics.net/lists/linux-samsung-soc/msg27275.html
>
> 4) Tomasz Figa's http://permalink.gmane.org/gmane.linux.ports.arm.kernel/299340
>
> Changes since v1:
>                -- Addressed Tomasz Figa's comments.
>                -- removed CMU patch
>                -- Added PMU mapping via DT
>
> Vikas Sajjan (3):
>   ARM: EXYNOS: Map PMU address through DT
>   ARM: EXYNOS: Add initial support of PMU for Exynos5260
>   arm: exynos5260: add support for S2R
>
>  .../devicetree/bindings/arm/samsung/pmu.txt        |    5 +-
>  arch/arm/boot/dts/exynos4.dtsi                     |    5 +
>  arch/arm/boot/dts/exynos5260.dtsi                  |    5 +
>  arch/arm/mach-exynos/common.c                      |   51 ++--
>  arch/arm/mach-exynos/common.h                      |   26 +++
>  arch/arm/mach-exynos/include/mach/map.h            |    3 -
>  arch/arm/mach-exynos/pm.c                          |   96 ++++++--
>  arch/arm/mach-exynos/pmu.c                         |  238 +++++++++++++++++++
>  arch/arm/mach-exynos/regs-pmu.h                    |  244 ++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/cpu.h           |    8 +
>  10 files changed, 637 insertions(+), 44 deletions(-)
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
