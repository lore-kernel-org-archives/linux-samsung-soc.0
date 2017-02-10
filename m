From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Fri, 10 Feb 2017 12:01:22 +0100
Message-ID: <ed0b9f20-98e2-69bc-3491-ce5534532fe4@samsung.com>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
 <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
 <20170209162736.nfyfd5dpjkjq65w7@ninjato>
 <1b67bbf6-dd31-c473-8284-dba9a0ffe440@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11216 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753011AbdBJLB3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 06:01:29 -0500
In-reply-to: <1b67bbf6-dd31-c473-8284-dba9a0ffe440@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org

On 10.02.2017 08:39, Andrzej Hajda wrote:
> On 09.02.2017 17:27, Wolfram Sang wrote:
>> On Thu, Jan 05, 2017 at 01:06:53PM +0100, Andrzej Hajda wrote:
>>> In case of arbitration lost adequate interrupt sometimes is not signaled. As
>>> a result transfer timeouts and is not retried, as it should. To avoid such
>>> cases code is added to check transaction status in case of every interrupt.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>> +
>>> +		switch (trans_status & HSI2C_MASTER_ST_MASK) {
>>> +		case HSI2C_MASTER_ST_LOSE:
>>> +			i2c->state = -EAGAIN;
>>> +			goto stop;
>>> +		}
>> Why not using if() instead of switch() as in the rest of the driver?
> Following reasons (not serious ones):
> 1. With if() the line should be split anyway to keep 80 chars per line
> limit, and the result looks less readable, so no gain:
>         if ((trans_status & HSI2C_MASTER_ST_MASK) ==
>              HSI2C_MASTER_ST_LOSE) {
>             i2c->state = -EAGAIN;
>             goto stop;
>         }
> 2. It is ready to handle other status values as well, without repeating
> long if() clause, in fact during tests I have added more values, but
> finally they went out.
> 3. In the rest of the functions if() is used because code tests if some
> bits are set, here we test if some bit field have specific value,
> slightly different thing.
>
> Of course I can change to if() if you prefer it.
>
>> And there is arbitration lost checking already with int_status &
>> HSI2C_INT_TRANS_ABORT. Any guess why it doesn't trigger?
>>
> Nope. This patch is just a result of comparing register values during
> good and bad transfer.
> I have looked for similar issues over the net, but without ultimate
> answer, some hints are that master can check status of SDA line too early.
> Anyway it works correctly with gpio bit-banging driver, it suggests
> there could be something wrong in hsi2c logic.

I have just found in spec of newer version of the chip configuration bit
NO_ARB_FASTSDA. Citation:
> This bit deactivates the modified logic of the
> abnormal operation when the SCL is falling. Then,
> other I2C device quickly lowers the SDA line, and
> SDA has fallen before the first PCLK period
> elapses.
> 0 = Skip the master arbitration checking during the
> first PCLK period after SCL falls
> 1 = Restore original logic

I have no hardware with newer chip to really test if this solves the
issue, but I suppose it could, the only problem is that this bit is not
present in current chip version, Exynos5433.

Regards
Andrzej


>
> Regards
> Andrzej
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
