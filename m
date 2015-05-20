From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 2/2] drm/exynos: WARN_ON if ideal_clk is zero
Date: Wed, 20 May 2015 17:14:26 +0100
Message-ID: <CAPj87rPSzvvUiMrau5kjxnQf=gk6d75JpXU2V7q2CSs_tHCZHA@mail.gmail.com>
References: <1432132428-13519-1-git-send-email-gustavo@padovan.org>
	<1432132428-13519-2-git-send-email-gustavo@padovan.org>
	<0ed39f733f049e17b350b9ec5b22c389@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:38806 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754143AbbETQO1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 12:14:27 -0400
Received: by igcau1 with SMTP id au1so43617697igc.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2015 09:14:26 -0700 (PDT)
In-Reply-To: <0ed39f733f049e17b350b9ec5b22c389@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, InKi Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 20 May 2015 at 17:04, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> Hmm,
>
> I wonder if that really 'fixes' anything, because now we get a WARN_ON which
> is immediately followed by a div-by-zero. Furthermore we then still use the
> result of that operation as input for a hw register (bad idea?)
>
> I thought of something like this. Change fimd_calc_clkdiv() to return a
> signed value (this shouldn't be a problem, since the returned number range
> is small anywary). Let fimd_calc_clkdiv() return -1 when it encounters the
> 'ideal_clk == 0' case. Move computation of clkdiv in fimd_commit() to the
> top of the function (right after the {h,v}total checks). If 'clkdiv == -1'
> case is encountered, then do WARN_ON and return immediately from
> fimd_commit().
>
> Should I prepare a patch for this, or does someone see an issue with this
> approach?

Commit should never fail; as I said earlier, the right fix is to
reject these modes during checking, by making sure that any mode which
passes mode_fixup() and/or mode_valid() never trips this condition.

Cheers,
Daniel
