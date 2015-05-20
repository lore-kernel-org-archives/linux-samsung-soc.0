From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 2/2] drm/exynos: =?UTF-8?Q?WARN=5FON=20if=20ideal=5Fcl?=
 =?UTF-8?Q?k=20is=20zero?=
Date: Wed, 20 May 2015 18:31:00 +0200
Message-ID: <f39b3a317226c930bfda80f11b82cb53@math.uni-bielefeld.de>
References: <1432132428-13519-1-git-send-email-gustavo@padovan.org>
 <1432132428-13519-2-git-send-email-gustavo@padovan.org>
 <0ed39f733f049e17b350b9ec5b22c389@math.uni-bielefeld.de>
 <CAPj87rPSzvvUiMrau5kjxnQf=gk6d75JpXU2V7q2CSs_tHCZHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:38149 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752896AbbETQbD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 12:31:03 -0400
In-Reply-To: <CAPj87rPSzvvUiMrau5kjxnQf=gk6d75JpXU2V7q2CSs_tHCZHA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, InKi Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015-05-20 18:14, Daniel Stone wrote:
> Hi,
> 
> On 20 May 2015 at 17:04, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> 
> wrote:
>> Hmm,
>> 
>> I wonder if that really 'fixes' anything, because now we get a WARN_ON 
>> which
>> is immediately followed by a div-by-zero. Furthermore we then still 
>> use the
>> result of that operation as input for a hw register (bad idea?)
>> 
>> I thought of something like this. Change fimd_calc_clkdiv() to return 
>> a
>> signed value (this shouldn't be a problem, since the returned number 
>> range
>> is small anywary). Let fimd_calc_clkdiv() return -1 when it encounters 
>> the
>> 'ideal_clk == 0' case. Move computation of clkdiv in fimd_commit() to 
>> the
>> top of the function (right after the {h,v}total checks). If 'clkdiv == 
>> -1'
>> case is encountered, then do WARN_ON and return immediately from
>> fimd_commit().
>> 
>> Should I prepare a patch for this, or does someone see an issue with 
>> this
>> approach?
> 
> Commit should never fail; as I said earlier, the right fix is to
> reject these modes during checking, by making sure that any mode which
> passes mode_fixup() and/or mode_valid() never trips this condition.
But then in this case it wouldn't help to call drm_mode_vrefresh() 
during fixup, since it still returns zero, so we're in the same 
situation as before.

I even wonder if fixup is doing anything at all. See my previous log in:
http://www.spinics.net/lists/linux-samsung-soc/msg44683.html

This is with the old code in fixup that should set vrefresh to 60.

And we see that it's actually called:
[  135.978878] [drm:fimd_mode_fixup] vrefresh 0

But then a small while later:
[  135.979048] [drm:fimd_calc_clkdiv] vrefresh 0

So apparantly nothing was fixed up here anyway?!

With best wishes,
Tobias




> 
> Cheers,
> Daniel
