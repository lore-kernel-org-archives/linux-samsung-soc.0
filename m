From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: Properly propagate flags in __PLL macro
Date: Tue, 03 Oct 2017 12:29:39 +0200
Message-ID: <281d54d4-6156-312e-63a3-ec879ec5beb4@samsung.com>
References: <CGME20170914143824eucas1p1e811c6c4c32a2253aebad9a27d4182d5@eucas1p1.samsung.com>
        <1505399897-4840-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56426 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751124AbdJCK3q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 06:29:46 -0400
In-reply-to: <1505399897-4840-1-git-send-email-m.szyprowski@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 09/14/2017 04:38 PM, Marek Szyprowski wrote:
> All users of __PLL macro already provide flags parameter, so don't
> overwrite it unconditionally with CLK_GET_RATE_NOCACHE.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Patch applied, thanks.
