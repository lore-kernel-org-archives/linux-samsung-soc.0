From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 0/2] ARM: dts: Fix imprecise external abort error when
 accessing Exynos MFC
Date: Wed, 25 May 2016 08:51:05 +0200
Message-ID: <6479e0c0-97fb-ca3b-1337-6ed11410d94f@samsung.com>
References: <1464111662-15336-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:9568 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124AbcEYGvL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2016 02:51:11 -0400
In-reply-to: <1464111662-15336-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Andrzej Hajda <a.hajda@samsung.com>

Hello,


On 2016-05-24 19:41, Javier Martinez Canillas wrote:
> This series fixes an imprecise external abort error when accessing the
> Exynos MFC registers due the power domain configuration requiring the
> aclk333 clock to be enabled during a domain switch.
>
> There isn't a dependency between the clock and Linux Samsung SoC trees
> because the CLK_ACLK333 clock ID is already defined so the patches can
> be picked indepedently by the relevant subsystem maintainers.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

I'm really curious what kind of async-bridge is there, but this patch
really fixes the problem with mfc power domain.

> Best regards,
> Javier
>
>
> Javier Martinez Canillas (2):
>    clk: exynos5420: Set ID for aclk333 gate clock
>    ARM: dts: Add async-bridge clock to MFC power domain for Exynos5420
>
>   arch/arm/boot/dts/exynos5420.dtsi    | 5 +++--
>   drivers/clk/samsung/clk-exynos5420.c | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
