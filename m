From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: exynos: Add DISP power domain to
 Exynos 5433 SoC
Date: Thu, 30 Nov 2017 11:19:37 +0900
Message-ID: <5A1F6AB9.6090200@samsung.com>
References: <20171129112638.15813-1-m.szyprowski@samsung.com>
        <CGME20171129112649eucas1p16bc5ac7a6237eba11fc42ec2bd38dc52@eucas1p1.samsung.com>
        <20171129112638.15813-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51626 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752149AbdK3CTj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 21:19:39 -0500
In-reply-to: <20171129112638.15813-3-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>

Dear Marek,

On 2017년 11월 29일 20:26, Marek Szyprowski wrote:
> This patch adds support for DISP power domain to Exynos 5433 SoCs, which
> contains following devices: a clock controller, two display controllers
> (DECON and DECON TV), their SYSMMUs, MIC, DSI and HDMI video devices.
> 
> OCSigned-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
