From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v10 5/6] rtc: max77686: Use ffs() to calculate tm_wday
Date: Fri, 19 Sep 2014 12:52:27 -0700
Message-ID: <1411156347.24444.31.camel@joe-AO725>
References: <1411122377-10426-1-git-send-email-javier.martinez@collabora.co.uk>
	 <1411122377-10426-6-git-send-email-javier.martinez@collabora.co.uk>
	 <1411137561.24444.5.camel@joe-AO725> <541C838B.7070207@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay0114.hostedemail.com ([216.40.44.114]:49553 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932108AbaISTwd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Sep 2014 15:52:33 -0400
In-Reply-To: <541C838B.7070207@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Fri, 2014-09-19 at 21:27 +0200, Javier Martinez Canillas wrote:
> Hello Joe,

Hello Javier.

> On 09/19/2014 04:39 PM, Joe Perches wrote:
> > On Fri, 2014-09-19 at 12:26 +0200, Javier Martinez Canillas wrote:
> >> The function max77686_rtc_calculate_wday() is used to
> >> calculate the day of the week to be filled in struct
> >> rtc_time but that function only calculates the number
> >> of bits shifted. So the ffs() function can be used to
> >> find the first bit set instead of a special function.
> > 
> > This isn't the same logic.  Perhaps you want fls.
> >
> 
> Right, the removed function has the same logic than fls() - 1 but the value
> stored in data[RTC_WEEKDAY] is:
> 
> data[RTC_WEEKDAY] = 1 << tm->tm_wday;
> 
> so for this particular case, it doesn't matter since ffs() == fls() always.

I didn't look that far.

I just wanted to show that the logic wasn't the same.

Perhaps you can specify that ffs==fls in the changelog.
