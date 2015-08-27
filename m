From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 00/14] drm/exynos: rewrite fimg2d error handling
Date: Thu, 27 Aug 2015 22:46:45 +0200
Message-ID: <55DF7735.7040502@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de> <CACvgo51Je-ACgn36cUpRF8XKrftYhk12Pf0NuvGGZWoPp8EDCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55382 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751728AbbH0Uqu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Aug 2015 16:46:50 -0400
In-Reply-To: <CACvgo51Je-ACgn36cUpRF8XKrftYhk12Pf0NuvGGZWoPp8EDCQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

Hey Emil,


Emil Velikov wrote:
> Hi Tobias,
> 
> On 24 August 2015 at 15:13, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
>> Hello,
>>
>> during the discussion about the last patchset touching the
>> fimg2d code, it became apparent that the error handling for
>> the command submission is currently unsatisfactory.
>>
>> This series rewrites the handling. All functions that submit
>> command buffers now first check if enough space is available
>> and only then proceed to build the command buffers.
>>
>> In particular the command buffer is no longer left in a
>> half-finished state, since parameters passed to the functions
>> are now validated before command submission. For this some
>> validation functions are introduced.
>>
>> This should also increase performance if the bottleneck is
>> the submission part, since adding commands to the buffer
>> is now more lightweight.
>>
>> Last but not least some prefix was added to messages printed
>> by fprintf and printf, and the G2D context struct was moved
>> out of the public header.
>>
>>
> Thanks for going with my earlier suggestion and untangling all this.
> 
> I've went through the lot and it looks great afaict. Fwiw for the series
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
thanks for the review and the help on IRC!


> As pretty much none of this is hardware specific and/or requires
> additional knowledge of the kernel module I'm inclined to pull this in
> even if we don't get too many reviewers. We better keep it around for
> a couple of weeks in case others are swamped with unrelated work atm,
> yet willing to take a look.
Sure, I'm going to wait and do some pings from time to time :)


With best wishes,
Tobias

> 
> Cheers,
> Emil
> 
