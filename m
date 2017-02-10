From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Fri, 10 Feb 2017 08:39:58 +0100
Message-ID: <1b67bbf6-dd31-c473-8284-dba9a0ffe440@samsung.com>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
 <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
 <20170209162736.nfyfd5dpjkjq65w7@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <20170209162736.nfyfd5dpjkjq65w7@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09.02.2017 17:27, Wolfram Sang wrote:
> On Thu, Jan 05, 2017 at 01:06:53PM +0100, Andrzej Hajda wrote:
>> In case of arbitration lost adequate interrupt sometimes is not signaled. As
>> a result transfer timeouts and is not retried, as it should. To avoid such
>> cases code is added to check transaction status in case of every interrupt.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>> +
>> +		switch (trans_status & HSI2C_MASTER_ST_MASK) {
>> +		case HSI2C_MASTER_ST_LOSE:
>> +			i2c->state = -EAGAIN;
>> +			goto stop;
>> +		}
> Why not using if() instead of switch() as in the rest of the driver?

Following reasons (not serious ones):
1. With if() the line should be split anyway to keep 80 chars per line
limit, and the result looks less readable, so no gain:
        if ((trans_status & HSI2C_MASTER_ST_MASK) ==
             HSI2C_MASTER_ST_LOSE) {
            i2c->state = -EAGAIN;
            goto stop;
        }
2. It is ready to handle other status values as well, without repeating
long if() clause, in fact during tests I have added more values, but
finally they went out.
3. In the rest of the functions if() is used because code tests if some
bits are set, here we test if some bit field have specific value,
slightly different thing.

Of course I can change to if() if you prefer it.

> And there is arbitration lost checking already with int_status &
> HSI2C_INT_TRANS_ABORT. Any guess why it doesn't trigger?
>

Nope. This patch is just a result of comparing register values during
good and bad transfer.
I have looked for similar issues over the net, but without ultimate
answer, some hints are that master can check status of SDA line too early.
Anyway it works correctly with gpio bit-banging driver, it suggests
there could be something wrong in hsi2c logic.

Regards
Andrzej
