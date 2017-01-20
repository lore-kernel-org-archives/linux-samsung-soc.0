From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: Disable pull down for audio pins in
 Exynos5433 SoCs
Date: Fri, 20 Jan 2017 17:16:34 +0200
Message-ID: <20170120151634.a63dpa2qelcdnkux@kozik-lap>
References: <CGME20170120065702eucas1p1dd0b370aa6cba11d26ce2ed1651f16b9@eucas1p1.samsung.com>
 <1484895413-9080-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35953 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751276AbdATPQl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 10:16:41 -0500
Received: by mail-wm0-f67.google.com with SMTP id r126so7403480wmr.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2017 07:16:41 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1484895413-9080-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Fri, Jan 20, 2017 at 07:56:53AM +0100, Marek Szyprowski wrote:
> Common definition for I2S, PMC, SPDIF buses should not define any pull
> control for the individual pins. Correct this by changing samsung,pin-pud
> property to EXYNOS_PIN_PULL_NONE like it is defined for other Exynos SoCs.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks, applied.

-- 
Best regards,
Krzysztof
