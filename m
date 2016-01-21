From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 0/8] rtc: max77686: Extend driver and add max77802 support
Date: Thu, 21 Jan 2016 11:50:59 -0300
Message-ID: <56A0F053.6070405@osg.samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
 <20160121003047.GF3367@piout.net> <56A02791.9010409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:32990 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965248AbcAUOvM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2016 09:51:12 -0500
In-Reply-To: <56A02791.9010409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

Hello,

On 01/20/2016 09:34 PM, Krzysztof Kozlowski wrote:
> On 21.01.2016 09:30, Alexandre Belloni wrote:
>>> I believe all patches should go through the RTC tree with proper acks or
>>> wait until the RTC patches land to pick the defconfig changes.
>>>
>>
>> I think Olof would prefer the last patches to go through arm-soc.
>
> That would be preferred but merging them before the 5/8 would cause a
> loss of functionality on these defconfigs making it non-bisectable

Exactly, that's why I suggested merging all through RTC with proper acks.

> approach. I think it would be good to preserve bisectability in that
> matter so either:
> 1. a tag from RTC on top of which these patches would be applied in arm-soc,

I didn't suggest that option because I thought it would be a lot of burden
for such a trivial change.

> 2. take them to RTC tree with our acks.
>

Or another option is to not pick the defconfig changes and I can repost
those again once the RTC changes land into mainline.

But of course if up to you to decide since I'm not a maintainer :)
  
> Best regards,
> Krzysztof
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
