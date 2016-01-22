From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 02/10] rtc: max77686: Use ARRAY_SIZE() instead of
 current array length
Date: Fri, 22 Jan 2016 08:43:25 -0300
Message-ID: <56A215DD.5030904@osg.samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
 <1453407813-14646-3-git-send-email-javier@osg.samsung.com>
 <56A1F8BB.9090803@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:37636 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752776AbcAVLnh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jan 2016 06:43:37 -0500
In-Reply-To: <56A1F8BB.9090803@nvidia.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org

Hello Laxman,

Thanks a lot for your feedback and acks.

On 01/22/2016 06:39 AM, Laxman Dewangan wrote:
>
> On Friday 22 January 2016 01:53 AM, Javier Martinez Canillas wrote:
>> It is better to use the ARRAY_SIZE() macro instead of the array length
>> to avoid bugs if the array is later changed and the length not updated.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>>
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
>
>
> Similar stuffs are there on multiple places:
> u8 data[RTC_NR_TIME];
>
> :::
> ret = regmap_bulk_read(info->max77686->rtc_regmap,
>                                   MAX77686_ALARM1_SEC, data, RTC_NR_TIME);
>
>
> Should we say:
> ret = regmap_bulk_read(info->max77686->rtc_regmap,
>                                   MAX77686_ALARM1_SEC, data, ARRAY_SIZE(data));
>

Very good point, I'll change those on this patch as well for v3.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
