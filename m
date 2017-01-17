From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Tue, 17 Jan 2017 15:47:24 +0900
Message-ID: <20170117064724.cxn57q3yis3dynvz@gangnam.samsung>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
 <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-i2c@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrzej,

On Thu, Jan 05, 2017 at 01:06:53PM +0100, Andrzej Hajda wrote:
> In case of arbitration lost adequate interrupt sometimes is not signaled. As
> a result transfer timeouts and is not retried, as it should. To avoid such
> cases code is added to check transaction status in case of every interrupt.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> Hi,
> 
> I am not I2C specialist, this patch is a result of debugging issues
> with SiI8620 MHL driver on TM2 device. I guess the main problem is
> with SiI8620 chip, but exynos5 i2c is also guilty - with i2c-gpio driver
> it works correctly - there is only one arbitration lost at 1st transaction
> (which is properly handled - transfer is repeated succesfully). In case
> of exynos5 there are much more arbitration losts. Lowering bus speed
> decreases frequency of losts but do not eliminate them.
> Any help/hint, what could cause such issues?

I'm having the same issue on TM2 and your patch fixes it. I'm
not sure, though, that's the right fix.

In any case I will look into it.

Andi
