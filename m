From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] exynos: add C++ support to exynos_drmif header
Date: Sat, 8 Apr 2017 21:45:38 +0100
Message-ID: <CACvgo53Lhk_knDAB22Nkguv5tZucE+FcCcjMf-6dExJVVHJ=eA@mail.gmail.com>
References: <1491402144-3298-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20170405154852.ncs2nhquiz2wy23m@imgtec.com> <e15aabd7-bd99-aa70-118b-4fb0ae2c644e@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35988 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750982AbdDHUpk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 8 Apr 2017 16:45:40 -0400
Received: by mail-wm0-f54.google.com with SMTP id o81so13814038wmb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Apr 2017 13:45:39 -0700 (PDT)
In-Reply-To: <e15aabd7-bd99-aa70-118b-4fb0ae2c644e@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Eric Engestrom <eric.engestrom@imgtec.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, ML dri-devel <dri-devel@lists.freedesktop.org>

On 5 April 2017 at 17:23, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> Hello Eric,
>
>
> Eric Engestrom wrote:
>> On Wednesday, 2017-04-05 16:22:24 +0200, Tobias Jakobi wrote:
>>> Add the usual extern "C" when compiling in C++ mode.
>>
>> Thanks, but why specifically this header? The other exynos/*.h headers
>> also lack the c++ mangling guard.
> I'm currently writing a small C++ project using the
> exynos_bo_{create,destroy}() calls, and noticed this.
>
>> A quick grep shows that only 15/101 headers in libdrm have it.
>> Can I interest you in fixing a few more headers? :)
> Not at the moment.
>
FTR, only the installed headers (~50) need the extern C guard.
None of that is not a blocker for this patch, so I've just pushed it to master.

Thanks!
Emil
