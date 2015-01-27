From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/2] exynos: Don't use DRM_EXYNOS_GEM_{MAP_OFFSET/MMAP} ioctls
Date: Tue, 27 Jan 2015 02:56:49 +0000
Message-ID: <CACvgo51_iy9sJHg3i-HQ-e_qaw+j5Jb8K_CFPiJEZNHggZMmwg@mail.gmail.com>
References: <1421449054-2808-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1421449054-2808-2-git-send-email-tjakobi@math.uni-bielefeld.de>
	<20150126104238.65da492e@hwh-ubuntu>
	<CACvgo52r33R99JkOkWxHGEO+1zvAjfBb2nJfk6Kqt57M3iA5FA@mail.gmail.com>
	<20150127100534.3619e1bd@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:47621 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751671AbbA0C4u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Jan 2015 21:56:50 -0500
Received: by mail-yk0-f180.google.com with SMTP id 131so5394288ykp.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Jan 2015 18:56:49 -0800 (PST)
In-Reply-To: <20150127100534.3619e1bd@hwh-ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>

On 27 January 2015 at 01:05, Hyungwon Hwang <human.hwang@samsung.com> wrote:
> Dear Emil,
>
> On Mon, 26 Jan 2015 19:05:51 +0000
> Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
>> On 26 January 2015 at 01:42, Hyungwon Hwang <human.hwang@samsung.com>
>> wrote:
>> > Dear Tobias,
>> >
>> > Thanks for fixing it.
>> >
>> > Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
>> >
>> Hi Hyungwon Hwang
>>
>> I'm a bit confused about the use of s-o-b here. I've assumed that
>> libdrm follows the kernel style [1] for those type of things ?
>> Would you have anything handy which I can read on the topic ?
>
> I also think that DRI-devel mailing list follow the kernel rule.
Sweet I'm not loosing my mind (much).

[...]
> Was it wrong to add s-o-b here? Should I have used "Reviewed-by" here?
> I am sorry, if I broke the rule and confused you.
>
Don't think any apology is due, I was just hinting that the patch has
the s-o-b already :P
Where as "what I should have used" that depends on your intent and/or
the action undertaken.

Thanks
Emil
