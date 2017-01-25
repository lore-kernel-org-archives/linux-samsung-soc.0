From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Thu, 26 Jan 2017 07:48:48 +0900
Message-ID: <20170125224848.34lxht4xnuvhxrqd@gangnam.samsung>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
 <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
 <20170125205554.m7vmhs4tq6bzti52@ninjato>
 <20170125205715.xaaphsyb7hwowurq@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <20170125205715.xaaphsyb7hwowurq@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-i2c@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

> > > In case of arbitration lost adequate interrupt sometimes is not signaled. As
> > > a result transfer timeouts and is not retried, as it should. To avoid such
> > > cases code is added to check transaction status in case of every interrupt.
> > > 
> > > Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> > 
> > Looks good to me, but I'd like some review from one of the Samsung
> > people?
> 
> Ooops, you are from Samsung as well :) Still, I'd like one more ack or
> review from someone with the HW.

I am using this patch already:

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>
Tested-by: Andi Shyti <andi.shyti@samsung.com>

Shouldn't we cc for the stable Kernel?

Andi
