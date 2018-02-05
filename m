From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos: Add soc node to exynos4
Date: Mon, 5 Feb 2018 16:02:59 +0100
Message-ID: <CAJKOXPec6=SiwgcRBixwt+DjhyKvoK+nPYOSpHuUGgWL8vDHbQ@mail.gmail.com>
References: <CGME20180205112603eucas1p17d1b5ef274e9541b785320a59f855c2a@eucas1p1.samsung.com>
 <1517829936-26311-1-git-send-email-m.purski@samsung.com> <1517829936-26311-2-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752843AbeBEPDC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 10:03:02 -0500
In-Reply-To: <1517829936-26311-2-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On Mon, Feb 5, 2018 at 12:25 PM, Maciej Purski <m.purski@samsung.com> wrote:
> Soc nodes are used in other exynos DTS. Exynos4 boards should use them
> as well.
>
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi | 1727 ++++++++++++++++++++--------------------
>  1 file changed, 872 insertions(+), 855 deletions(-)
>

This brings some new DTC warnings:
arch/arm/boot/dts/exynos4210-origen.dtb: Warning (simple_bus_reg):
Node /soc/video-phy missing or empty reg/ranges property
arch/arm/boot/dts/exynos4210-origen.dtb: Warning (simple_bus_reg):
Node /soc/pmu missing or empty reg/ranges property

arch/arm/boot/dts/exynos4412-itop-elite.dtb: Warning
(interrupts_property): interrupts size is (32), expected multiple of
12 in /pmu

Best regards,
Krzysztof
