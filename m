From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [RFC] Sort out S5P SoCs support in mainline
Date: Sat, 31 May 2014 03:50:13 +0900
Message-ID: <5388D2E5.5080006@samsung.com>
References: <021f01cf7a61$69853e30$3c8fba90$@samsung.com> <13875033.1X6R9lksgc@wuerfel> <5385C3CC.6010509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:36683 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754324AbaE3SuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 14:50:18 -0400
Received: by mail-pa0-f49.google.com with SMTP id fa1so936872pad.36
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 11:50:17 -0700 (PDT)
In-Reply-To: <5385C3CC.6010509@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 'Olof Johansson' <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

On 05/28/14 20:09, Tomasz Figa wrote:
> On 28.05.2014 13:04, Arnd Bergmann wrote:
>> On Wednesday 28 May 2014 19:41:41 Kukjin Kim wrote:
>>> Hi all,
>>>
>>> I'm wondering who need to support following SoCs/boards in mainline.
>>>
>>> * S5P64X0/SMDK6440 and SMDK6450
>>> * S5PC100/SMDKC100
>>>
>>> If nobody is using them, how about to remove them from mainline?
>>
>> I talked about this with Tomasz Figa before, he also thinks they can be removed.
>> I don't see any reason to keep them myself, and will apply a patch to remove
>> them. Of course, if later somebody comes around who does need them, we can
>> revert the patch to bring them back.

Yeah, agreed.

>
> Or better, if later somebody comes around who does need them, we can add
> them properly, using Device Tree and existing generic code.
>
Of course.

> Anyway, for removal of both s5p64x0 and s5pc100:
>
> Acked-by: Tomasz Figa<t.figa@samsung.com>
>
> Actually I have played a bit with the code to see how much can be
> removed and ended up with following branch:
>
> https://github.com/tom3q/linux.git v3.17-cleanup
>
> Feel free to do _whatever_ you want with patches there.
>
OK, thanks.

Let me remove them from mainline when 3.16-rc1 is released...

- Kukjin
