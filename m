From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung devel-4 for v3.2
Date: Sun, 06 Nov 2011 14:04:15 +0900
Message-ID: <4EB6154F.2050501@samsung.com>
References: <027f01cc9ab6$2086eae0$6194c0a0$%kim@samsung.com> <201111050020.55071.arnd@arndb.de> <02d901cc9b4a$15a127f0$40e377d0$%kim@samsung.com> <201111050056.51554.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:44251 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750750Ab1KFFEc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Nov 2011 01:04:32 -0400
Received: by ggnb2 with SMTP id b2so4021885ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Nov 2011 22:04:31 -0700 (PDT)
In-Reply-To: <201111050056.51554.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On 11/05/11 08:56, Arnd Bergmann wrote:
> On Saturday 05 November 2011, Kukjin Kim wrote:
>> Arnd Bergmann wrote:
>
>>> Please send the contents split up into separate branches (dt, spi, clkdev,
>>> rename, devel) for 3.3. I think it's ok if you want to send just the
>>> rename patch for 3.2 the way we had discussed earlier, because this kind
>>> of patch really makes sense at the end of the merge window.
>>>
>> Hi Arnd,
>>
>> OK, I will send the rename branch in a half an hour and make separate
>> branches for others which will be merged next time.
>
> Ok, very good. I'm sending the pull requests for the other two branches
> right now, I assume Linus will take them quickly (or not at all if he
> has unexpected objections), so you could base your pull request on top
> of his merge.
>

Hi Arnd,

I remade 'next-samsung-exynos' branch based on latest mainline which 
includes arm-soc/next/cleanup3 and arm-soc/next/devel2 just now so that 
you can send it to Linus easily :)

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
