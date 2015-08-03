From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] PM / devfreq: event: Remove incorrect property in
 exynos-ppmu DT binding
Date: Mon, 3 Aug 2015 09:38:28 +0200
Message-ID: <55BF1A74.50105@osg.samsung.com>
References: <1733224792.341671438577931309.JavaMail.weblogic@epmlwas06d>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:55741 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752750AbbHCHie (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Aug 2015 03:38:34 -0400
In-Reply-To: <1733224792.341671438577931309.JavaMail.weblogic@epmlwas06d>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@samsung.com
Cc: =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?7YGs7Ims7Iuc7Yag7ZSE?= <k.kozlowski@samsung.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello MyungJoo,

On 08/03/2015 06:58 AM, MyungJoo Ham wrote:
>> Hello Myungjoo,
>>
>> On 07/23/2015 10:30 AM, Javier Martinez Canillas wrote:
>>> Hello Chanwoo,
>>>
>>> On 07/23/2015 10:19 AM, Chanwoo Choi wrote:
>>>> Hi Javier,
>>>>
>>>> On 07/13/2015 03:58 PM, Javier Martinez Canillas wrote:
>>>>> The exynos-ppmu driver is only a clock consumer and not a clock
>>>>> provider but its Device Tree binding listed #clock-cells as an
>>>>> optional property.
>>>>>
>>>>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>>>
> []
>>>>>
>>>>> Example1 : PPMU nodes in exynos3250.dtsi are listed below.
>>>>>
>>>>>
>>>>
>>>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>>>>
>>>> + Devfreq maintainer (Myungjoo Ham)
>>>
>>> Thanks for the review and for cc'ing Myungjoo. The get_maintainer.pl script
>>> didn't tell me that so I think Documentation/devicetree/bindings/devfreq/
>>> sub-dir should be added to the DEVICE FREQUENCY (DEVFREQ) entry in the
>>> MAINTAINERS file.
>>>
>>>> I think that this patch will be more appropriate on devfreq git tree
>>>> than linux-samsung git tree.
>>>>
>>>
>>> Agreed.
>>>
>>
>> Any comments about this patch?
> 
> Nope. It's applied.
> 
> 
> Thanks.
> 
>

Great, thanks a lot.
 
> 
> MyungJoo
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
