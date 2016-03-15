From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 22:59:11 -0300
Message-ID: <56E76C6F.5020803@osg.samsung.com>
References: <1458005918-7893-1-git-send-email-javier@osg.samsung.com>
 <56E76A57.7070104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53890 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750912AbcCOB7Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 21:59:25 -0400
In-Reply-To: <56E76A57.7070104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com

Hello Krzysztof,

On 03/14/2016 10:50 PM, Krzysztof Kozlowski wrote:
> On 15.03.2016 10:38, Javier Martinez Canillas wrote:
>> The clock and source clock looked up by the driver may not be available
>> just because the clock controller driver was not probed yet so printing
>> an error in this case is not correct and only adds confusion to users.
>>
>> However, knowing that a driver's probe was deferred may be useful so it
>> can be printed as a debug information.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>> Changes in v3:
>> - Change debug messages again as suggested by Joe Perches.
>>
>> Changes in v2:
>> - Improve debug messages as suggested by Joe Perches.
>>
>>  drivers/rtc/rtc-s3c.c | 19 ++++++++++++++-----
>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
>> index ffb860d18701..d01ad7e8078e 100644
>> --- a/drivers/rtc/rtc-s3c.c
>> +++ b/drivers/rtc/rtc-s3c.c
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
>> +			dev_dbg(&pdev->dev, "probe deferred due to missing rtc clk\n");
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
>> +					"probe deferred due to missing rtc src clk\n");
>>  			clk_disable_unprepare(info->rtc_clk);
>> -			return PTR_ERR(info->rtc_src_clk);
>> +			return ret;
>>  		}
>>  		clk_prepare_enable(info->rtc_src_clk);
>>  	}
>>
> 
> The error path starts looking complicated. This has now 4 indentation
> levels...
> 

Yeah, I don't think we can get rid of the 4 indentation levels since
the function already has 3 and a check for the errno code is needed.

> I agree for removal of error in case of probe deferral because it might
> be misleading but I don't see much benefit of a debug message.
>

But yes, we can at least get rid of the else statement. I don't have a
strong opinion about the debug information, I left it to avoid someone
to tell me that I was removing a useful log.
 
> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
