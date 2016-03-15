From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 23:58:50 -0300
Message-ID: <56E77A6A.2090604@osg.samsung.com>
References: <1458005918-7893-1-git-send-email-javier@osg.samsung.com>
 <56E76A57.7070104@samsung.com> <56E76C6F.5020803@osg.samsung.com>
 <56E772F2.2030507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53897 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932369AbcCOC65 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 22:58:57 -0400
In-Reply-To: <56E772F2.2030507@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com

Hello Krzysztof,

On 03/14/2016 11:26 PM, Krzysztof Kozlowski wrote:
> On 15.03.2016 10:59, Javier Martinez Canillas wrote:
>>>>  
>>>>  	if (info->data->needs_src_clk) {
>>>>  		info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
>>>>  		if (IS_ERR(info->rtc_src_clk)) {
>>>> -			dev_err(&pdev->dev,
>>>> -				"failed to find rtc source clock\n");
>>>> +			ret = PTR_ERR(info->rtc_src_clk);
>>>> +			if (ret != -EPROBE_DEFER)
>>>> +				dev_err(&pdev->dev,
>>>> +					"failed to find rtc source clock\n");
>>>> +			else
>>>> +				dev_dbg(&pdev->dev,
>>>> +					"probe deferred due to missing rtc src clk\n");
>>>>  			clk_disable_unprepare(info->rtc_clk);
>>>> -			return PTR_ERR(info->rtc_src_clk);
>>>> +			return ret;
>>>>  		}
>>>>  		clk_prepare_enable(info->rtc_src_clk);
>>>>  	}
>>>>
>>>
>>> The error path starts looking complicated. This has now 4 indentation
>>> levels...
>>>
>>
>> Yeah, I don't think we can get rid of the 4 indentation levels since
>> the function already has 3 and a check for the errno code is needed.
> 
> Probably handling of the clocks in the driver could be simplified a
> little bit (the if(needs_src_clk) appears in few places)... but this is
> out of scope for this patch.
>

Agreed, I meant without introducing an unrelated change.
 
>>
>>> I agree for removal of error in case of probe deferral because it might
>>> be misleading but I don't see much benefit of a debug message.
>>>
>>
>> But yes, we can at least get rid of the else statement. I don't have a
>> strong opinion about the debug information, I left it to avoid someone
>> to tell me that I was removing a useful log.
> 
> Although dev_dbg doesn't harm... but isn't driver core printing debug
> message already?
>

I don't think it does or at least I didn't find it when looking
at the devm_clk_get() call chain.
 
> BR,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
