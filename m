From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2] i2c: exynos5: fix arbitration lost handling
Date: Thu, 23 Feb 2017 10:20:47 +0100
Message-ID: <0eaf7f86-1380-ee3b-b094-3300b6ae881c@samsung.com>
References: <CGME20170222110438eucas1p2329ece7afd9e22ba185da64ccf4b2981@eucas1p2.samsung.com>
 <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
 <20170223062952.rkvnp2bkvau47txv@gangnam.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <20170223062952.rkvnp2bkvau47txv@gangnam.samsung>
Sender: linux-i2c-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 23.02.2017 07:29, Andi Shyti wrote:
> Hi Andrzej,
>
> On Wed, Feb 22, 2017 at 12:04:34PM +0100, Andrzej Hajda wrote:
>> In case of arbitration lost adequate interrupt sometimes is not signaled.
>> As a result transfer timeouts and is not retried, as it should. To avoid
>> such cases code is added to check transaction status in case of every
>> interrupt.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> you forgot:
>
> Tested-by: Andi Shyti <andi.shyti@samsung.com>
> Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Oops, my fault.
>
> in any case I tested it again on tm2e with next-20170223.

Thanks again for testing.

Regards
Andrzej

>
> Thanks,
> Andi
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
