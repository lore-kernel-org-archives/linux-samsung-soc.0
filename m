From: Kukjin Kim <kgene.kim@gmail.com>
Subject: Re: [GIT PULL 10/10] devel-samsung for v3.10
Date: Wed, 10 Apr 2013 00:32:23 +0900
Message-ID: <51643487.9020402@gmail.com>
References: <51630A55.6030703@samsung.com> <51632451.3050801@gmail.com> <2f2f01ce3514$33d10f00$9b732d00$%kim@samsung.com> <516404FE.4000907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f48.google.com ([209.85.210.48]:61373 "EHLO
	mail-da0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1765118Ab3DIPca (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 11:32:30 -0400
Received: by mail-da0-f48.google.com with SMTP id p8so3093140dan.35
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 08:32:30 -0700 (PDT)
In-Reply-To: <516404FE.4000907@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>

On 04/09/13 21:09, Sylwester Nawrocki wrote:
> On 04/09/2013 01:20 PM, Kukjin Kim wrote:
>> Sylwester Nawrocki wrote:
>>
>> [...]
>>
>>>> Sylwester Nawrocki (2):
>>>> ARM: SAMSUNG: Export MIPI CSIS/DSIM PHY control functions
>>>
>>> This one was supposed to be a fix for 3.8-rc IIRC. But anyway the whole
>>
>> If so, this should be sent to stable 3.8 tree, but I'm not sure this is
>> really bug fix.
>
> It prevents build error when MIPI-CSIS driver is build as a loadable module.
> That means with some valid kernel configuration the kernel cannot be build.
> Hence IMHO it is a bug fix, and sending it to 3.8+ stable indeed seems a
> good idea.
>
OK.

>>> file this patch touches is going to be removed in 3.11.
>>>
>> It means it is still needed for v3.10 :-)
>
> Yeah, true. :) Just wanted to note that I have already some RFC patches
> for the MIPI CSI-2/DSI DPHY driver using the generic PHY framework.
> However this framework is not settled yet, I assume it would be completed
> for 3.11.
>
I see.

>>>> ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
>>>
>>> And this one is needed for 3.9, sorry for not mentioning it in the patch's
>>> description. Together with [1] it makes my s3c2440 SoC based test board
>>> booting again with 3.9-rc6.
>>>
>>> [1] http://www.spinics.net/lists/arm-kernel/msg236643.html
>>>
>> OK, let me drop it in this branch.
>
> Thanks!
>
You're welcome :-)

>> Arnd and Olof, please hold on pulling for this branch. I will sort out soon.
>>
I re-sent pull-request instead of this.

Thanks.

- Kukjin
