From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/3] ARM: soc: exynos: Drivers for v4.9
Date: Mon, 19 Sep 2016 17:02:40 +0200
Message-ID: <2663426.T8oUku18qe@wuerfel>
References: <1474216788-17282-1-git-send-email-krzk@kernel.org> <1474216788-17282-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:63255 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750970AbcISPDV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 11:03:21 -0400
In-Reply-To: <1474216788-17282-2-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>

On Sunday, September 18, 2016 6:39:46 PM CEST Krzysztof Kozlowski wrote:
> Samsung drivers/soc update for v4.9:
> 1. Allow compile testing of exynos-mct clocksource driver on ARM64.
> 2. Document Exynos5433 PMU compatible (already used by clkout driver and more
>    will be coming soon).

Pulled into next/drivers, thanks

Just for my understanding: why do we need the exynos-mct driver on ARM64
but not the delay-timer portion of it?

Is there an advantage in using MCT over the architected timer on these
chips? If so, should we also have a way to use it as the delay timer?

	Arnd
