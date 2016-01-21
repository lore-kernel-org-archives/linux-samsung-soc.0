From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 6/8] rtc: Remove Maxim 77802 driver
Date: Thu, 21 Jan 2016 12:12:51 -0300
Message-ID: <56A0F573.2040403@osg.samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
 <1453310088-29985-7-git-send-email-javier@osg.samsung.com>
 <56A03AEC.1090008@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33050 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758455AbcAUPM4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2016 10:12:56 -0500
In-Reply-To: <56A03AEC.1090008@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/20/2016 10:57 PM, Krzysztof Kozlowski wrote:
> On 21.01.2016 02:14, Javier Martinez Canillas wrote:
>> The max77686 RTC driver now supports the max77802 RTC as
>> well so there's no need to have a separate driver anymore.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>   drivers/rtc/Kconfig        |  10 -
>>   drivers/rtc/Makefile       |   1 -
>>   drivers/rtc/rtc-max77802.c | 502 ---------------------------------------------
>>   3 files changed, 513 deletions(-)
>>   delete mode 100644 drivers/rtc/rtc-max77802.c
>>
>
> Oh yes, I like removals so much! :)
>

I knew you would like it :)
  
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Thanks.
  
> Best regards,
> Krzysztof
>
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
