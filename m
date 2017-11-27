From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: Remove duplicate definitions of SSS
 nodes for Exynos5
Date: Mon, 27 Nov 2017 19:23:20 +0100
Message-ID: <20171127182320.4zxmiotk7gcth244@kozik-lap>
References: <CGME20171127123722eucas1p209c2fd2b0f8bedec45b135348e5573cd@eucas1p2.samsung.com>
 <20171127123711.12081-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:40089 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752856AbdK0SXX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Nov 2017 13:23:23 -0500
Received: by mail-wm0-f67.google.com with SMTP id b189so36810750wmd.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Nov 2017 10:23:23 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171127123711.12081-1-l.stelmach@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com

On Mon, Nov 27, 2017 at 01:37:11PM +0100, Łukasz Stelmach wrote:
> Move Security Subsystem nodes common for Exynos 5250 and Exynos 54xx
> to exynos5.dtsi to avoid duplication.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |  6 ++++++
>  arch/arm/boot/dts/exynos5250.dtsi | 13 +++++--------
>  arch/arm/boot/dts/exynos54xx.dtsi |  6 ------
>  3 files changed, 11 insertions(+), 14 deletions(-)
> 
> Changes in v2:
> - Rephrased commit message
> 

Thanks, applied.

Best regards,
Krzysztof
