From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 18:07:36 -0300
Message-ID: <56E72818.8050407@osg.samsung.com>
References: <1457987157-1177-1-git-send-email-javier@osg.samsung.com>
 <1457987453.11972.133.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53829 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932387AbcCNVHo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 17:07:44 -0400
In-Reply-To: <1457987453.11972.133.camel@perches.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

Hello Joe,

On 03/14/2016 05:30 PM, Joe Perches wrote:
> On Mon, 2016-03-14 at 17:25 -0300, Javier Martinez Canillas wrote:
>> The clock and source clock looked up by the driver may not be available
>> just because the clock controller driver was not probed yet so printing
>> an error in this case is not correct and only adds confusion to users.
>>
>> However, knowing that a driver's probe was deferred may be useful so it
>> can be printed as debug information.
> 
> Hello again Javier:
>> +			dev_dbg(&pdev->dev, "probe deferred due missing rtc clk\n");
> 
> Again, intelligible English would not use "due"
> but would use "due to" or "because of".
> 

Ok, I'll post another version then. I hope the third time's the charm...

Alexandre, do you have any other comments before I re-spin this patch?

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
