From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/4] pinctrl: samsung: Remove support for Exynos4415 (SoC
 not supported anymore)
Date: Mon, 16 Jan 2017 12:56:08 +0900
Message-ID: <587C4458.7020804@samsung.com>
References: <20170114123642.15581-1-krzk@kernel.org>
 <CGME20170114123733epcas4p20d5ea05c5d705528138ebdefc56be69a@epcas4p2.samsung.com>
 <20170114123642.15581-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34265 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbdAPD4Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Jan 2017 22:56:16 -0500
In-reply-to: <20170114123642.15581-4-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-gpio@vg

On 2017년 01월 14일 21:36, Krzysztof Kozlowski wrote:
> Support for Exynos4415 is going away because there are no internal nor
> external users.
> 
> Since commit 46dcf0ff0de3 ("ARM: dts: exynos: Remove exynos4415.dtsi"),
> the platform cannot be instantiated so remove also the drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c  | 75 -------------------------------
>  drivers/pinctrl/samsung/pinctrl-samsung.c |  2 -
>  drivers/pinctrl/samsung/pinctrl-samsung.h |  1 -
>  3 files changed, 78 deletions(-)

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
S/W Center, Samsung Electronics
