From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: remove num-slots from exynos platforms
Date: Wed, 5 Jul 2017 06:51:26 +0200
Message-ID: <20170705045126.GA2360@kozik-book>
References: <1499160322-73008-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34042 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750867AbdGEEvg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 00:51:36 -0400
Received: by mail-pg0-f66.google.com with SMTP id j186so29760444pge.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jul 2017 21:51:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1499160322-73008-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>

On Tue, Jul 04, 2017 at 05:25:22PM +0800, Shawn Lin wrote:
> dwmmc driver deprecated num-slots and plan to get rid
> of it finally. Just move a step to cleanup it from DT.
> 
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

I do not see this property deprecated here (yesterday's next):
Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt
Something is not merged yet?

Also in separate patch, please update example here:
Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt

Best regards,
Krzysztof
