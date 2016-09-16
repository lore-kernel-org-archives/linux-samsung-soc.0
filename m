From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: exynos: Fixes for v4.8, secound round
Date: Fri, 16 Sep 2016 16:31:32 +0200
Message-ID: <6792013.IrD9SrjCDf@wuerfel>
References: <CGME20160916071017eucas1p155978eec97e20211d9c54ef670e319eb@eucas1p1.samsung.com> <1474009808-8520-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:49821 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935097AbcIPOcK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 10:32:10 -0400
In-Reply-To: <1474009808-8520-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

On Friday, September 16, 2016 9:10:08 AM CEST Krzysztof Kozlowski wrote:
> 1. A recent change in populating irqchip devices from Device Tree
>    broke Suspend to RAM on Exynos boards due to lack of probing of
>    PMU (Power Management Unit) driver.  Multiple drivers attach to
>    the PMU's DT node: irqchip, clock controller and PMU platform
>    driver for handling suspend.  The new irqchip code marked the
>    PMU's DT node as OF_POPULATED but we need to attach to this
>    node also PMU platform driver.
> 
> 2. Add Javier as additional reviewer for Exynos patches.
> 

Pulled into fixes, thanks!

	Arnd
