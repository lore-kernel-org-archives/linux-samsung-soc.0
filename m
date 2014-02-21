From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Fri, 21 Feb 2014 16:21:36 +0100
Message-ID: <53076F00.7000001@samsung.com>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHyWG1ac6isTRSB3VWfxER9cSuDJHwY3b7svyEk9EozpWQ@mail.gmail.com>
 <53075239.4010603@samsung.com> <2200834.G3JJLYQl5i@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:61977 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932097AbaBUPVm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Feb 2014 10:21:42 -0500
In-reply-to: <2200834.G3JJLYQl5i@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>

On 21.02.2014 15:48, Arnd Bergmann wrote:
> On Friday 21 February 2014 14:18:49 Tomasz Figa wrote:
>>
>>> Now that we have a broader agreement on this, I think we can go ahead with the
>>> following steps as an initial approach:
>>> 1. Have a common machine file for both exynos4 and 5 files, mach-exynos-dt.c.
>>> 2. Introduce a generic compatible string "samsung,exynos".
>>> 3. Append this to the compatible property list for existing boards.
>>>
>>> If this plan looks OK, I can send across patches doing this.
>>>
>>
>> Looks good. I would also merge common.c with this resulting
>> mach-exynos-dt.c, as it would be the only user of the code there.
>
> Sounds good. While the naming is not important, I would just call the
> file 'exynos.c', in line with some of the other platforms we have.
> Both the 'mach-' and the '-dt' part of the file name are redundant.
>
> Alternatively, you could merge it all into common.c.

exynos.c sounds good to me.

Best regards,
Tomasz
