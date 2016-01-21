From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/8] rtc: max77686: Use usleep_range() instead of msleep()
Date: Thu, 21 Jan 2016 11:52:26 -0300
Message-ID: <56A0F0AA.6080202@osg.samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
 <1453310088-29985-3-git-send-email-javier@osg.samsung.com>
 <56A02845.3010008@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33001 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965293AbcAUOwb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2016 09:52:31 -0500
In-Reply-To: <56A02845.3010008@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/20/2016 09:37 PM, Krzysztof Kozlowski wrote:
> On 21.01.2016 02:14, Javier Martinez Canillas wrote:
>> Documentation/timers/timers-howto.txt suggest to use usleep_range()
>> instead of msleep() for small msec (1ms - 20ms) since msleep() will
>> often sleep for 20ms for any value in that range.
>>
>> This is fine in this case since 16ms is the _minimum_ delay required
>> by max77686 for an RTC update but by using usleep_range() instead of
>> msleep(), the driver can support other RTC IP blocks with a shorter
>> minium delay (i.e: in the range of usecs insted of msecs).
>
> s/minium/minimum/
> s/insted/instead/
>

Fixed.

>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>   drivers/rtc/rtc-max77686.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Thanks a lot for your review.
  
> Best regards,
> Krzysztof
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
