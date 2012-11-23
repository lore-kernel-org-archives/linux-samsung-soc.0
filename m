From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 4/7] i2c: s3c2410: Convert to use devm_ioremap()
Date: Fri, 23 Nov 2012 12:13:38 +0530
Message-ID: <50AF1B1A.4080009@linaro.org>
References: <1353650353-17576-1-git-send-email-tushar.behera@linaro.org> <1353650353-17576-5-git-send-email-tushar.behera@linaro.org> <CAK9yfHyAWtuRFuygK2L53GrAaZ3k7rasTRt+N6TtU2+N-UHVTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:38975 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755139Ab2KWGnK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 01:43:10 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so6321058pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Nov 2012 22:43:10 -0800 (PST)
In-Reply-To: <CAK9yfHyAWtuRFuygK2L53GrAaZ3k7rasTRt+N6TtU2+N-UHVTw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, w.sang@pengutronix.de, kgene.kim@samsung.com, patches@linaro.org

On 11/23/2012 11:44 AM, Sachin Kamat wrote:
> Hi Tushar,
> 
> On 23 November 2012 11:29, Tushar Behera <tushar.behera@linaro.org> wrote:
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> ---
>>  drivers/i2c/busses/i2c-s3c2410.c |   13 ++++---------
>>  1 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
>> index a274ef7..3446af2 100644
>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>> @@ -996,7 +996,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>>                 goto err_clk;
>>         }
>>
>> -       i2c->regs = ioremap(res->start, resource_size(res));
>> +       i2c->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
>>
> 
> request_mem_region and ioremap and be replaced using a single
> devm_request_and_ioremap() call.
> 

Thanks. I will redo the patch.

> Also you may squash patches 2-5 into single convert to devm_* functions patch.
> 

Ok. In that case, I will squash these patches to a single patch.

> 
>>         if (i2c->regs == NULL) {
>>                 dev_err(&pdev->dev, "cannot map IO\n");
>> @@ -1016,7 +1016,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>>
>>         ret = s3c24xx_i2c_init(i2c);
>>         if (ret != 0)
>> -               goto err_iomap;
>> +               goto err_clk;
>>
>>         /* find the IRQ for this unit (note, this relies on the init call to
>>          * ensure no current IRQs pending
>> @@ -1025,7 +1025,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>>         i2c->irq = ret = platform_get_irq(pdev, 0);
>>         if (ret <= 0) {
>>                 dev_err(&pdev->dev, "cannot find IRQ\n");
>> -               goto err_iomap;
>> +               goto err_clk;
>>         }
>>
>>         ret = request_irq(i2c->irq, s3c24xx_i2c_irq, 0,
>> @@ -1033,7 +1033,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>>
>>         if (ret != 0) {
>>                 dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
>> -               goto err_iomap;
>> +               goto err_clk;
>>         }
>>
>>         ret = s3c24xx_i2c_register_cpufreq(i2c);
>> @@ -1073,9 +1073,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>>   err_irq:
>>         free_irq(i2c->irq, i2c);
>>
>> - err_iomap:
>> -       iounmap(i2c->regs);
>> -
>>   err_clk:
>>         clk_disable_unprepare(i2c->clk);
>>         return ret;
>> @@ -1100,8 +1097,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
>>
>>         clk_disable_unprepare(i2c->clk);
>>
>> -       iounmap(i2c->regs);
>> -
>>         s3c24xx_i2c_dt_gpio_free(i2c);
>>
>>         return 0;
>> --
>> 1.7.4.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
> 


-- 
Tushar Behera
