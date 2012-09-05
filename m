From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/3] ARM: dts: Exynos4 dts reorganization
Date: Wed, 5 Sep 2012 09:01:18 +0530
Message-ID: <CAJuYYwRWqvzw_MdLa7NfE9ppbPiz8=HTXUW+-mXedvu2GPQWBg@mail.gmail.com>
References: <1346675674-16034-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:41905 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758102Ab2IEDbU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 23:31:20 -0400
Received: by lbbgj3 with SMTP id gj3so76850lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Sep 2012 20:31:18 -0700 (PDT)
In-Reply-To: <1346675674-16034-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com

On 3 September 2012 18:04, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch series prepares existing Exynos4210 DT infrastructure to be
> further extended for new SoCs from Exynos4 line and new boards.
>
> Tomasz Figa (3):
>   ARM: dts: Move parts common to Exynos4 from Exynos4210.dtsi to
>     Exynos4.dtsi
>   ARM: EXYNOS: exynos4-dt: Use exynos4 prefix instead of exynos4210
>   ARM: dts: exynos4: Assume status of all optional nodes as disabled
>
>  arch/arm/boot/dts/exynos4.dtsi            | 232 ++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos4210-origen.dts   |  58 +-------
>  arch/arm/boot/dts/exynos4210-smdkv310.dts |  52 +------
>  arch/arm/boot/dts/exynos4210.dtsi         | 181 +----------------------
>  arch/arm/mach-exynos/mach-exynos4-dt.c    |  18 +--
>  5 files changed, 248 insertions(+), 293 deletions(-)
>  create mode 100644 arch/arm/boot/dts/exynos4.dtsi
>

Thanks, we can build Exynos4412 device tree support on top of this series.

Acked-by: Thomas Abraham <thomas.abraham@linaro.org>
