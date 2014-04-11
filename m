From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH V2 0/3] Add PMU and S2R support for exynos5420
Date: Fri, 11 Apr 2014 18:47:11 +0530
Message-ID: <CAGm_ybhWjc7=OUJ5BTvQ-K6S_RwYVgGV8+vi6iUgKEJb0qSymw@mail.gmail.com>
References: <1395900785-11334-1-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:59602 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754438AbaDKNRM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Apr 2014 09:17:12 -0400
Received: by mail-oa0-f52.google.com with SMTP id l6so6152871oag.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Apr 2014 06:17:11 -0700 (PDT)
In-Reply-To: <1395900785-11334-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>

 Hi,

 Any comments on this series.

On Thu, Mar 27, 2014 at 11:43 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> rebased on kgene tree for-next branch
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
>
> changes since v1:
>         - Addressed comments from Tomasz figa.
>         - restructured/consolidated as per Tomasz figa's PM consolidations for exynos
>
> Abhilash Kesavan (1):
>   ARM: dts: Add node for GPIO keys on SMDK5420
>
> Vikas Sajjan (2):
>   ARM: EXYNOS5: Add PMU settings for exynos5420
>   ARM: EXYNOS5: Support Suspend-to-RAM on EXYNOS5420
>
>  arch/arm/boot/dts/exynos5420-smdk5420.dts    |   11 +
>  arch/arm/mach-exynos/common.h                |   10 +
>  arch/arm/mach-exynos/pm.c                    |  148 +++++++++++--
>  arch/arm/mach-exynos/pmu.c                   |  307 ++++++++++++++++++++++++++
>  arch/arm/mach-exynos/regs-pmu.h              |  230 +++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/map-s5p.h |    2 +
>  drivers/clk/samsung/clk-exynos5420.c         |   32 +++
>  7 files changed, 722 insertions(+), 18 deletions(-)
>
> --
> 1.7.9.5
>
