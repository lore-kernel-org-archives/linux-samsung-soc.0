From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5433: Add IDs for
 PHYCLK_MIPIDPHY0_* clocks
Date: Wed, 25 Jan 2017 22:06:31 +0200
Message-ID: <20170125200631.ubt3x6jhoi367ex6@kozik-lap>
References: <1485345118-3082-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115214eucas1p1517ce7ca8fe88e4742a1306630b91d09@eucas1p1.samsung.com>
 <1485345118-3082-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34304 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751016AbdAYUGh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 15:06:37 -0500
Received: by mail-wm0-f68.google.com with SMTP id c85so44854071wmi.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2017 12:06:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1485345118-3082-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Jan 25, 2017 at 12:51:57PM +0100, Marek Szyprowski wrote:
> Add missing identifiers for phyclk_mipidphy0_bitclkdiv8_phy and
> phyclk_mipidphy0_rxclkesc0_phy clocks. Access to those clocks is needed
> to setup initial clock configuration for display subsystem in device tree
> in order to avoid dependency on the configuration left by the bootloader.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 6 ++++--
>  include/dt-bindings/clock/exynos5433.h | 5 ++++-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Sylwester,
Could you provide a tag with this?

Best regards,
Krzysztof
