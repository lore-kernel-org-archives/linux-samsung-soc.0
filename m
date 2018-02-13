From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/3] Add soc nodes to exynos4 series DTS
Date: Tue, 13 Feb 2018 19:05:46 +0100
Message-ID: <20180213180546.3s76x4tnierehl5z@kozik-lap>
References: <CGME20180206113006eucas1p148766268255c129223e32f221afc1b94@eucas1p1.samsung.com>
 <1517916582-13814-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38725 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965168AbeBMSFv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 13:05:51 -0500
Content-Disposition: inline
In-Reply-To: <1517916582-13814-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com

On Tue, Feb 06, 2018 at 12:29:39PM +0100, Maciej Purski wrote:
> Hi all,
> 
> this patchset adds soc node to exynos4, exynos4210 and exynos4412
> DTS. The main goal for these changes is unification of all exynos
> DTS. Soc nodes are already present in for example exynos5 series.
> 
> Best regards,
> 
> Maciej Purski
> 
> ---
> Changes in v2:
> - rebased onto "ARM: dts: exynos: Use pmu label in exynos4412"
>   in order to fix pmu warning
> - move "cpu0_opp_table" outside the "soc" node
> 
> Maciej Purski (3):
>   ARM: dts: exynos: Add soc node to exynos4
>   ARM: dts: exynos: Add soc node to exynos4210
>   ARM: dts: exynos: Add soc node to exynos4412
> 

Thanks, applied all three.

Best regards,
Krzysztof
