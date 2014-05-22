From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] ARM: dts: replace number by macro in clock binding
 for exynos
Date: Fri, 23 May 2014 03:38:48 +0900
Message-ID: <537E4438.4090409@samsung.com>
References: <537C6640.2010404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:51064 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751581AbaEVSix (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 14:38:53 -0400
In-Reply-To: <537C6640.2010404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beomho Seo <beomho.seo@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On 05/21/14 17:39, Beomho Seo wrote:
> Currently, some device node missed clock macro. This patchset
> replaced it's magic number with macros in clock binding for
> exynos4, exynos5250 and exynos 5420.
> This patchset is based on v3.16-next/clk-samsung branch.
>
> Beomho Seo (3):
>    ARM: dts: replace number by macro in clock binding for exynos4
>    ARM: dts: replace number by macro in clock binding for exynos5250
>    ARM: dts: replace number by macro in clock binding for exynos5420
>
>   arch/arm/boot/dts/exynos4.dtsi    |    2 +-
>   arch/arm/boot/dts/exynos5250.dtsi |    4 ++--
>   arch/arm/boot/dts/exynos5420.dtsi |    2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
>

Applied, thanks.

- Kukjin
