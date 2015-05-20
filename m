From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v2] drm/exynos: calculate vrefresh instead of use a fixed
 value
Date: Wed, 20 May 2015 17:50:55 -0300
Message-ID: <20150520205055.GB4438@joana>
References: <1432147477-12650-1-git-send-email-gustavo@padovan.org>
 <555CDC6F.9070000@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f48.google.com ([209.85.192.48]:34102 "EHLO
	mail-qg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754070AbbETUvB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 16:51:01 -0400
Received: by qgez61 with SMTP id z61so26016525qge.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2015 13:51:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <555CDC6F.9070000@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, daniel@fooishbar.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

2015-05-20 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > When mode's vrefresh is zero we should ask DRM core to calculate vrefresh
> > for us so we can get the correct value instead of relying on fixed value
> > defined in a macro. But if vrefresh is still zero we should fail the
> > update.
> Even with this we still need to consider crtc->state->adjusted_mode in
> fimd_commit(), otherwise vrefresh computed by drm_mode_vrefresh() is
> never actually used.

You are right, I think we should pass crtc->state->adjusted_mode to
fimd_calc_clkdiv(). I'll send a v3 with this change.

	Gustavo
