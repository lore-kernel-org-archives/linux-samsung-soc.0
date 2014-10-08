From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v9 0/2] Adds PMU and S2R support for exynos5420
Date: Wed, 8 Oct 2014 11:57:07 +0200
Message-ID: <CABxcv=k==kP_+fc58a6ji_O572Cxzj_EmxmRo3kbc48k-qBO-w@mail.gmail.com>
References: <1412673723-15551-1-git-send-email-vikas.sajjan@samsung.com>
	<CAGm_ybjP1WQfbyWR5GwQ6QnUjsy4qB_678+L=jgmMzz-rWkb0w@mail.gmail.com>
	<016401cfe2d3$23f3f0c0$6bdbd240$@kernel.org>
	<CAGm_ybiZQgok1oa3aar0ymgfu8KUn1j3LLqHiwQ81Mnh8zVHXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:63320 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754718AbaJHJ5J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Oct 2014 05:57:09 -0400
Received: by mail-wg0-f45.google.com with SMTP id m15so11375188wgh.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2014 02:57:07 -0700 (PDT)
In-Reply-To: <CAGm_ybiZQgok1oa3aar0ymgfu8KUn1j3LLqHiwQ81Mnh8zVHXQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hello Vikas,

On Wed, Oct 8, 2014 at 11:26 AM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
>>>
>>> Can you please pick this series.
>>>
>> Yes, sure I will queue this series after -rc1 release.
>

Not related to your series but did you figure out why the
aclk200_disp1 and aclk300_disp1 clocks are left unused?

I'm carrying your patch to flag those clocks as CLK_IGNORE_UNUSED to
prevent being disabled by the CCF. And while that allows me to test,
I'm afraid that it may not be the proper solution since it could just
be hiding the real cause of the issue.

Of course this should not block your series from been merged but I
just wondered if you found the cause since it would be nice to have
s2r properly working on exynos5420.

> Thank you.
>
>>
>> Thanks,
>> Kukjin
>>

best regards,
Javier
