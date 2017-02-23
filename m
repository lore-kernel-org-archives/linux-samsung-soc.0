From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v2] i2c: exynos5: disable fifo-almost-empty irq signal when
 necessary
Date: Thu, 23 Feb 2017 15:31:12 +0900
Message-ID: <20170223063112.mlmsdzqm7bwxlf4e@gangnam.samsung>
References: <CGME20170222101123eucas1p25482d192dd5d119aaf6ddc15a01c60c0@eucas1p2.samsung.com>
 <1487758280-22801-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59396 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdBWHDW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Feb 2017 02:03:22 -0500
Content-disposition: inline
In-reply-to: <1487758280-22801-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Andrzej,

On Wed, Feb 22, 2017 at 11:11:20AM +0100, Andrzej Hajda wrote:
> Fifo-almost-empty irq signal should be disabled as soon as possible,
> to avoid unnecessary interrupt storm. The best moment is when there is
> no more data to feed fifo.
> This patch fixes system stalls caused by IRQ storm.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Looks good,

Tested-by: Andi Shyti <andi.shyti@samsung.com>
Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Thanks,
Andi
