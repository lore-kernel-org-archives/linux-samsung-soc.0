From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Use pmu label in exynos4412
Date: Tue, 13 Feb 2018 19:03:43 +0100
Message-ID: <20180213180343.ibncip7d6o55juhm@kozik-lap>
References: <CGME20180206112602eucas1p28e3a797fe752adc65dbe7571aa02a8aa@eucas1p2.samsung.com>
 <1517916352-13614-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:51748 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965158AbeBMSDr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 13:03:47 -0500
Content-Disposition: inline
In-Reply-To: <1517916352-13614-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com

On Tue, Feb 06, 2018 at 12:25:52PM +0100, Maciej Purski wrote:
> In order to use soc node, we need to reference soc child nodes by label
> in exynos4412. Define pmu label in exynos4.dtsi. Use it in exynos4412
> instead of redefining the node.
> 
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi    | 2 +-
>  arch/arm/boot/dts/exynos4412.dtsi | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
