From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Convert to devm_kzalloc()
Date: Tue, 14 Feb 2012 14:52:58 +0100
Message-ID: <4F3A673A.9030001@samsung.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <CAM=Q2cv7JjCaYQFFtGmEXwN7yeQHWh3tDMac_Bq4v8oe2K+j1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27143 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755380Ab2BNNxC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Feb 2012 08:53:02 -0500
In-reply-to: <CAM=Q2cv7JjCaYQFFtGmEXwN7yeQHWh3tDMac_Bq4v8oe2K+j1Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org

Hi Shubhrajyoti,

On 02/14/2012 02:03 PM, Shubhrajyoti Datta wrote:
> Hi Mark,
> 
> The changes look good to me.
> Reviewed-by: Datta Shubhrajyoti <shubhrajyoti@ti.com>
> For your changes.
> 
> Some other doubts though not related to your patch.
> Just curious.
> 
...
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
>> index 4c17180..e6f982b 100644
>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
...
>> @@ -1061,7 +1060,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
>>        release_resource(i2c->ioarea);
>>        s3c24xx_i2c_dt_gpio_free(i2c);
>>        kfree(i2c->ioarea);
> Do we need both  release_resource and kfree

No, instead of release_resource() and kfree() you normally use
release_mem_region() to free resources acquired with request_mem_region().
See this patch for instance:

http://www.spinics.net/lists/linux-samsung-soc/msg08325.html

--
Thanks,
Sylwester
