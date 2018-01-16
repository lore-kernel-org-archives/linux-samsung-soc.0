From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [2/3] i2c: exynos5: implement bus recovery functionality
Date: Tue, 16 Jan 2018 09:35:45 +0100
Message-ID: <8d4c93bf-c27d-7a64-fb4e-3957760ff9b7@samsung.com>
References: <20171130143007.30258-3-a.hajda@samsung.com>
        <CGME20180115205258epcas4p10580d705351de6206070a670e9e4caca@epcas4p1.samsung.com>
        <20180115205250.p5mbn3ib2paj53pv@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47036 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750802AbeAPIfu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 03:35:50 -0500
In-reply-to: <20180115205250.p5mbn3ib2paj53pv@ninjato>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

On 15.01.2018 21:52, Wolfram Sang wrote:
> Hi,
>
> On Thu, Nov 30, 2017 at 03:30:06PM +0100, Andrzej Hajda wrote:
>> In some circumstances I2C clients can be in abnormal state, to allow
>> recover them from it I2C master can pulse SCL line until SDA line
>> goes up and then generate STOP condition. Exynos driver does not have
>> possibility to manipulate I2C lines directly, but it can provide similar
>> functionality using manual commands. Replacing I2C adapter reset with
> Really? READ_DATA looks like 8 clock pulses, but you need 9.

This is why I have used word 'similar' :) Unfortunately chip does not
provide method to send exactly 9 pulses.
But according to [1] it is the worst case scenario, usually less than 9
pulses is enough.
Another solution I see is to READ_DATA twice, this way we will have 16
pulses.

[1]:
http://www.analog.com/media/en/technical-documentation/application-notes/54305147357414AN686_0.pdf
>
>> bus recovery significantly incereases I2C bus robustness in case of timeouts.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>
>
>> @@ -642,7 +666,7 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
>>  		ret = exynos5_i2c_wait_bus_idle(i2c);
>>  
>>  	if (ret < 0) {
>> -		exynos5_i2c_reset(i2c);
>> +		exynos5_i2c_recovery(i2c);
> Bus recovery is only defined for stalled busses, i.e. when SDA is stuck
> low. It is not a suitable method to deal with general timeouts.

You are right, I though I do not have precise info that SDA is stuck
low, but I guess status HSI2C_MASTER_ST_LOSE indicates is, I will check it.

>
>
>> +int exynos5_i2c_recover_bus(struct i2c_adapter *adap)
>> +{
>> +	struct exynos5_i2c *i2c = adap->algo_data;
>> +
>> +	i2c_lock_adapter(adap);
>> +	clk_enable(i2c->clk);
>> +	exynos5_i2c_recovery(i2c);
>> +	clk_disable(i2c->clk);
>> +	i2c_unlock_adapter(adap);
> Why do you need to lock? Aren't you protected by the call to master_xfer
> which then detected a problem?

If the problem is detected in master_xfer driver uses internal function
exynos5_i2c_recovery,
but function exynos5_i2c_recover_bus is called by i2c_recover_bus, and
the latter can be called from any context,
this is why I have added locking.

Regards
Andrzej
>
> Regards,
>
>    Wolfram
>
