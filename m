From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] regulator: Rename files for max77686 and max77802 drivers
Date: Mon, 15 Feb 2016 11:44:24 -0300
Message-ID: <56C1E448.4080306@osg.samsung.com>
References: <1455250463-5955-1-git-send-email-javier@osg.samsung.com>
 <56C0245F.1080209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48401 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753298AbcBOOoa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 09:44:30 -0500
In-Reply-To: <56C0245F.1080209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: k.kozlowski.k@gmail.com, Andi Shyti <andi.shyti@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>

Hello Krzysztof,

On 02/14/2016 03:53 AM, Krzysztof Kozlowski wrote:

[snip]

>> +++ b/MAINTAINERS
>> @@ -6904,7 +6904,7 @@ MAXIM MAX77802 MULTIFUNCTION PMIC DEVICE DRIVERS
>>   M:	Javier Martinez Canillas <javier@osg.samsung.com>
>>   L:	linux-kernel@vger.kernel.org
>>   S:	Supported
>> -F:	drivers/*/*max77802.c
>> +F:	drivers/*/*max77802*.c
>>   F:	Documentation/devicetree/bindings/*/*max77802.txt
>>   F:	include/dt-bindings/*/*max77802.h
>
> Looks fine, but can you also update the max77686 entry with extended
> wildcard?
>

This has already been picked by Mark so I posted an incremental patch:

https://patchwork.kernel.org/patch/8315731/
  
> Best regards,
> Krzysztof
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
