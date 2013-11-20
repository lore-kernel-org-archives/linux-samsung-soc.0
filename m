From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 4/4] PM / devfreq: Consider hibernation in pm notifier
Date: Wed, 20 Nov 2013 18:51:41 +0900
Message-ID: <CAJ0PZbSkDegFSwJoEHsZGGbXxtTDt419rdK+cn+E+bzmux9U7w@mail.gmail.com>
References: <1384867831-15383-1-git-send-email-jhbird.choi@samsung.com>
	<27161890.Zx6CiZOMr8@amdc1032>
	<20131119220829.27502.62997@capellas-linux>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f182.google.com ([209.85.128.182]:40150 "EHLO
	mail-ve0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752357Ab3KTJvl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Nov 2013 04:51:41 -0500
In-Reply-To: <20131119220829.27502.62997@capellas-linux>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sebastian Capella <sebastian.capella@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jonghwan Choi <jhbird.choi@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, Jonghwan Choi <jhbird.choi@samsung.com>

On Wed, Nov 20, 2013 at 7:08 AM, Sebastian Capella
<sebastian.capella@linaro.org> wrote:
> Quoting Bartlomiej Zolnierkiewicz (2013-11-19 06:50:05)
>> Hi,
>>
>> Are you planning to add hibernation support to ARM?
>>
>> If so then this should be stated somewhere in the patch description.
>>
>> OTOH if you are not going to add hibernation support to ARM I see
>> a little sense in adding hibernation support to ARM-only drivers..
>
> FYI, we at Linaro and a few others have been working on adding
> hibernation support for ARM.  I have not coordinated with Jonghwan
> however.

That is great.

We once tried to upstream hibernation support and forgot it for a while, too.
http://lists.infradead.org/pipermail/linux-arm-kernel/2010-December/036101.html

I have not coordinated with Jonghwan Choi, either.
However, it appears that some others are trying now, too.


Cheers,
MyungJoo

>
> Apoligies for the earlier toppost.
>
> Thanks,
>
> Sebastian Capella
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
MyungJoo Ham, Ph.D.
System S/W Lab, S/W Center, Samsung Electronics
