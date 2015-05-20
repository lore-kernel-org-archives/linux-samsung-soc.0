From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 2/2] drm/exynos: WARN_ON if ideal_clk is zero
Date: Wed, 20 May 2015 18:14:25 +0100
Message-ID: <CAPj87rNHx9B4eLV8nnO=5mKg=QxbF7eTUUVqKsr04SHN6pBsXQ@mail.gmail.com>
References: <1432132428-13519-1-git-send-email-gustavo@padovan.org>
	<1432132428-13519-2-git-send-email-gustavo@padovan.org>
	<0ed39f733f049e17b350b9ec5b22c389@math.uni-bielefeld.de>
	<CAPj87rPSzvvUiMrau5kjxnQf=gk6d75JpXU2V7q2CSs_tHCZHA@mail.gmail.com>
	<f39b3a317226c930bfda80f11b82cb53@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:36488 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754430AbbETRO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 13:14:26 -0400
Received: by iepj10 with SMTP id j10so44280799iep.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2015 10:14:25 -0700 (PDT)
In-Reply-To: <f39b3a317226c930bfda80f11b82cb53@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, InKi Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 20 May 2015 at 17:31, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> On 2015-05-20 18:14, Daniel Stone wrote:
>> On 20 May 2015 at 17:04, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> wrote:
>>> I wonder if that really 'fixes' anything, because now we get a WARN_ON
>>> which
>>> is immediately followed by a div-by-zero. Furthermore we then still use
>>> the
>>> result of that operation as input for a hw register (bad idea?)
>>>
>>> I thought of something like this. Change fimd_calc_clkdiv() to return a
>>> signed value (this shouldn't be a problem, since the returned number
>>> range
>>> is small anywary). Let fimd_calc_clkdiv() return -1 when it encounters
>>> the
>>> 'ideal_clk == 0' case. Move computation of clkdiv in fimd_commit() to the
>>> top of the function (right after the {h,v}total checks). If 'clkdiv ==
>>> -1'
>>> case is encountered, then do WARN_ON and return immediately from
>>> fimd_commit().
>>>
>>> Should I prepare a patch for this, or does someone see an issue with this
>>> approach?
>>
>>
>> Commit should never fail; as I said earlier, the right fix is to
>> reject these modes during checking, by making sure that any mode which
>> passes mode_fixup() and/or mode_valid() never trips this condition.
>
> But then in this case it wouldn't help to call drm_mode_vrefresh() during
> fixup, since it still returns zero, so we're in the same situation as
> before.

fixup can reject a mode entirely by returning false, which is the sane
thing to do here if the clock is zero.

> I even wonder if fixup is doing anything at all. See my previous log in:
> http://www.spinics.net/lists/linux-samsung-soc/msg44683.html
>
> This is with the old code in fixup that should set vrefresh to 60.
>
> And we see that it's actually called:
> [  135.978878] [drm:fimd_mode_fixup] vrefresh 0
>
> But then a small while later:
> [  135.979048] [drm:fimd_calc_clkdiv] vrefresh 0
>
> So apparantly nothing was fixed up here anyway?!

Ah. That would be because fimd_calc_clkdiv uses &crtc->base.mode
(passed by fimd_commit), instead of crtc->state->adjusted_mode. Does
making that change help?

Cheers,
Daniel
