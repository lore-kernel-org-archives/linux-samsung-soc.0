From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 16:31:39 -0300
Message-ID: <56E7119B.9060900@osg.samsung.com>
References: <1457982308-29848-1-git-send-email-javier@osg.samsung.com>
 <1457982675.11972.119.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53803 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755658AbcCNTbs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 15:31:48 -0400
In-Reply-To: <1457982675.11972.119.camel@perches.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

Hello Joe,

Thanks a lot for your feedback.

On 03/14/2016 04:11 PM, Joe Perches wrote:
> On Mon, 2016-03-14 at 16:05 -0300, Javier Martinez Canillas wrote:
>> The clock and source clock looked up by the driver may not be available
>> just because the clock controller driver was not probed yet so printing
>> an error in this case is not correct and only adds confusion to users.
>>
>> However, knowing that a driver's probe was deferred may be useful so it
>> can be printed as debug information.
> []
>> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> []
>> @@ -501,18 +501,27 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>>  
>>  	info->rtc_clk = devm_clk_get(&pdev->dev, "rtc");
>>  	if (IS_ERR(info->rtc_clk)) {
>> -		dev_err(&pdev->dev, "failed to find rtc clock\n");
>> -		return PTR_ERR(info->rtc_clk);
>> +		ret = PTR_ERR(info->rtc_clk);
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(&pdev->dev, "failed to find rtc clock\n");
>> +		else
>> +			dev_dbg(&pdev->dev, "probe deferred due rtc clock\n");
>> +		return ret;
>>  	}
>>  	clk_prepare_enable(info->rtc_clk);
>>  
>>  	if (info->data->needs_src_clk) {
>>  		info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
>>  		if (IS_ERR(info->rtc_src_clk)) {
>> -			dev_err(&pdev->dev,
>> -				"failed to find rtc source clock\n");
>> +			ret = PTR_ERR(info->rtc_src_clk);
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(&pdev->dev,
>> +					"failed to find rtc source clock\n");
>> +			else
>> +				dev_dbg(&pdev->dev,
>> +					"probe deferred due rtc source clock\n");
>>  			clk_disable_unprepare(info->rtc_clk);
>> -			return PTR_ERR(info->rtc_src_clk);
>> +			return ret;
>>  		}
>>  		clk_prepare_enable(info->rtc_src_clk);
>>  	}
> 
> Maybe the debug logging messages could be object->action like:
> 
> 	rtc clock probe deferred
> 	rtc source clock probe deferred
> 

I found your suggested messages harder to read and more confusing. The
action that happens is a probe function deferral and that is caused by
a missing resource needed by the driver (clocks in this case).

But your messages seems to imply that the probe deferred action happens
to a clock, it sounds like "rtc clock disabled" and that's not correct.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
