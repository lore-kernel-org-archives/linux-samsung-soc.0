From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v10 5/6] rtc: max77686: Use ffs() to calculate tm_wday
Date: Fri, 19 Sep 2014 23:44:26 +0200
Message-ID: <541CA3BA.6060905@collabora.co.uk>
References: <1411122377-10426-1-git-send-email-javier.martinez@collabora.co.uk>	 <1411122377-10426-6-git-send-email-javier.martinez@collabora.co.uk>	 <1411137561.24444.5.camel@joe-AO725> <541C838B.7070207@collabora.co.uk> <1411156347.24444.31.camel@joe-AO725>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:41880 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757728AbaISVod (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Sep 2014 17:44:33 -0400
In-Reply-To: <1411156347.24444.31.camel@joe-AO725>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Joe,

On 09/19/2014 09:52 PM, Joe Perches wrote:
> On Fri, 2014-09-19 at 21:27 +0200, Javier Martinez Canillas wrote:
>> On 09/19/2014 04:39 PM, Joe Perches wrote:
>> > On Fri, 2014-09-19 at 12:26 +0200, Javier Martinez Canillas wrote:
>> >> The function max77686_rtc_calculate_wday() is used to
>> >> calculate the day of the week to be filled in struct
>> >> rtc_time but that function only calculates the number
>> >> of bits shifted. So the ffs() function can be used to
>> >> find the first bit set instead of a special function.
>> > 
>> > This isn't the same logic.  Perhaps you want fls.
>> >
>> 
>> Right, the removed function has the same logic than fls() - 1 but the value
>> stored in data[RTC_WEEKDAY] is:
>> 
>> data[RTC_WEEKDAY] = 1 << tm->tm_wday;
>> 
>> so for this particular case, it doesn't matter since ffs() == fls() always.
> 
> I didn't look that far.
> 
> I just wanted to show that the logic wasn't the same.
> 

No worries, thanks a lot for your feedback. Probably it would had been good to
mention that in the commit message.

> Perhaps you can specify that ffs==fls in the changelog.
> 

I won't say I'm thrilled to do a whole re-spin of the series just to change
that ;)

Specially since I already did too many revisions and this series have been
floating around for months but is up to Andrew to decide if is worth it.

Best regards,
Javier
