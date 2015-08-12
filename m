From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 4/4] rtc: s3c: enable/disable clocks for alarm
Date: Wed, 12 Aug 2015 10:09:13 +0900
Message-ID: <55CA9CB9.1050007@samsung.com>
References: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
 <1439292502-22912-4-git-send-email-jy0922.shim@samsung.com>
 <55CA9330.9070700@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43831 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932883AbbHLBJO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 21:09:14 -0400
In-reply-to: <55CA9330.9070700@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, cw00.choi@samsung.com

On 08/12/2015 09:28 AM, Krzysztof Kozlowski wrote:
> On 11.08.2015 20:28, Joonyoung Shim wrote:
>> The clock enable/disable codes for alarm have removed from
> 
> What do you mean in this paragraph? The clock code was removing something?
> 
>> 'commit 24e1455493da ("drivers/rtc/rtc-s3c.c: delete duplicate clock
> 
> Remove the 'apostrophe.
> 
>> control")' and the clocks keep disabling even if alarm is set, so alarm
>> interrupt can't happen.
> ...and the clocks are disabled even...
> 
> 
>>
>> The s3c_rtc_setaie function can be called several times with that
>> enabled argument has same value,
> ...several times with 'enabled' argument having same value
> 
>> so it needs to check whether clocks is
>> enabled or not.
> s/is/are/
> 
>>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> 
> Please add Cc-stable and fixes tag. To backport the patch probably
> you'll have to remove the dependency on previous patches.

Thanks for the point, i didn't think it.
