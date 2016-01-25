From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 00/10] rtc: max77686: Extend driver and add max77802
 support
Date: Mon, 25 Jan 2016 20:45:37 -0300
Message-ID: <56A6B3A1.8040202@osg.samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
 <20160125160633.GB11740@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48704 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932395AbcAYXpq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2016 18:45:46 -0500
In-Reply-To: <20160125160633.GB11740@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

Hello Alexandre,

On 01/25/2016 01:06 PM, Alexandre Belloni wrote:
> Hi,
>
> On 21/01/2016 at 17:23:23 -0300, Javier Martinez Canillas wrote :
>> On a recent disussion [0] with Krzysztof Kozlowski and Laxman Dewangan,
>> we came to the conclusion that the max77686 and max77802 RTC are almost
>> the same with only a few differences so there shouldn't be two separate
>> drivers and is better to extend max77686 driver and delete rtc-max77802.
>>
>> By making the driver more generic, other RTC IP blocks from Maxim PMICs
>> could be supported as well like the max77620.
>>
>> This is a v2 of a series that do this, that address issues pointed out
>> by Krzysztof Kozlowski. The v1 can be found at [1].
>>
>> I've tested this patch-set on an Exynos5800 Peach Pi Chromebook that has
>> a max77802 PMIC and the RTC was working correctly but I don't have a
>> machine with max77686 so I will really appreaciate if someone can test
>> that no regressions were introduced.
>>
>> On an IRC conversation, Alexandre suggested to use the field support in
>> the regmap API to avoid needing a translation table. I spent some time
>> to look at it and I'm not so sure if it fits that well in this case.
>>
>> It's true that we could model each register as if it has a single field
>> and provide a different reg address but I'm not sure if that would make
>> things more clear or cause more confusion for future code archaeologists.
>>
>
> Yeah, Mark suggested that regmap_field may be what we were looking for
> but I'm not convinced it really fits.
>

Ok.
  
>> In any case, I think this series are a move in the right direction since
>> removes code duplication and a complete driver and also allows others to
>> reuse the driver for another RTC chip. We can later simplify and use the
>> regmap field API or extend the regmap core if that could make things even
>> simpler but I propose to do it as a follow up.
>>
>
> I don't have any objection or other comment on that series. So
> basically, I'm waiting for v3 and I'll apply it.
>
>

Great, I'll post a v3 tomorrow then. Thanks!

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
