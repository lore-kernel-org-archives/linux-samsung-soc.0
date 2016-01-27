From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 07/10] rtc: max77686: Use dev_warn() instead of
 pr_warn()
Date: Tue, 26 Jan 2016 22:53:53 -0300
Message-ID: <56A82331.5050403@osg.samsung.com>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
 <1453836020-29579-8-git-send-email-javier@osg.samsung.com>
 <20160127012230.GE14296@samsunx.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54295 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752569AbcA0ByC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 20:54:02 -0500
In-Reply-To: <20160127012230.GE14296@samsunx.samsung>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

Hello Andi,

Thanks a lot for your feedback and review.

On 01/26/2016 10:22 PM, Andi Shyti wrote:
> Hi Javier,
>
>>   		if (tm->tm_year < 100) {
>> -			pr_warn("RTC can't handle year %d. Assume it's 2000.\n",
>> -				1900 + tm->tm_year);
>> +			dev_warn(info->dev,
>> +				 "RTC can't handle year %d. Assume it's 2000\n",
>> +				 1900 + tm->tm_year);
>>   			return -EINVAL;
>
> Because we are returning an error value, why not use dev_err()?
>

You are absolutely right. Since the driver was using pr_warn(), I used
dev_warn() but dev_err() would had been correct.

If you don't mind I plan to do it as a follow up patch to avoid having
to resend the whole series only for this change.
  
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
