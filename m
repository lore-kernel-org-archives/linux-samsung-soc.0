From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/4] Fix problems with Exynos4412 ISP clocks
Date: Mon, 09 Oct 2017 12:34:20 +0200
Message-ID: <cdea0207-adea-d9e3-f95a-64188bd4bcca@samsung.com>
References: <CGME20171002104824eucas1p1f9795b5403b6cd599b1e33e9dc7b604f@eucas1p1.samsung.com>
        <20171002104759.25944-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59761 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753967AbdJIKe1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 06:34:27 -0400
In-reply-to: <20171002104759.25944-1-m.szyprowski@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 10/02/2017 12:47 PM, Marek Szyprowski wrote:
> Patch summary:
> 
> Marek Szyprowski (4):
>   clk: samsung: Instantiate Exynos4412 ISP clocks only when available
>   clk: samsung: Add a separate driver for Exynos4412 ISP clocks
>   ARM: dts: exynos: Add Exynos4412 ISP clock controller
>   clk: samsung: Remove obsolete code for Exynos4412 ISP clocks

I have applied whole series, with v2 of patch 2/4, thanks.
