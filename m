From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v2] i2c: exynos5: fix arbitration lost handling
Date: Thu, 23 Feb 2017 15:29:52 +0900
Message-ID: <20170223062952.rkvnp2bkvau47txv@gangnam.samsung>
References: <CGME20170222110438eucas1p2329ece7afd9e22ba185da64ccf4b2981@eucas1p2.samsung.com>
 <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43247 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751165AbdBWG34 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Feb 2017 01:29:56 -0500
Content-disposition: inline
In-reply-to: <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,

On Wed, Feb 22, 2017 at 12:04:34PM +0100, Andrzej Hajda wrote:
> In case of arbitration lost adequate interrupt sometimes is not signaled.
> As a result transfer timeouts and is not retried, as it should. To avoid
> such cases code is added to check transaction status in case of every
> interrupt.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

you forgot:

Tested-by: Andi Shyti <andi.shyti@samsung.com>
Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

in any case I tested it again on tm2e with next-20170223.

Thanks,
Andi
