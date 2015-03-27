From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] drm: Exynos: Respect framebuffer pitch for FIMD/Mixer
Date: Fri, 27 Mar 2015 12:08:02 +0100
Message-ID: <CABxcv=nZoXGRyRbOAtFApNVb3CG42-1DVzsNRqpRCNQ+qW80VQ@mail.gmail.com>
References: <1426598698-31095-1-git-send-email-daniels@collabora.com>
	<CABxcv==Z0ccmR-3Hasnkmg14m3hBJEwha=6c6288jQPUhyQt-g@mail.gmail.com>
	<5514187E.60405@samsung.com>
	<5514A118.2000609@gmx.net>
	<5514B6CB.7060301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:33218 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752076AbbC0LID (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Mar 2015 07:08:03 -0400
Received: by wixm2 with SMTP id m2so31947696wix.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2015 04:08:02 -0700 (PDT)
In-Reply-To: <5514B6CB.7060301@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Tobias Jakobi <liquid.acid@gmx.net>, Daniel Stone <daniels@collabora.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Inki,

On Fri, Mar 27, 2015 at 2:47 AM, Inki Dae <inki.dae@samsung.com> wrote:
>
> Right, this is not documented but if you have ever checked exynos drm
> driver tree, then I think you could know how we use the prefix. Of
> course, I don't like to force the use of this prefix but if you and
> other people use prefix in the manner of them, exynos drm tree would be
> a little bit messy. i.e., DRM: EXYNOS, drm: exynos, drm: Exynos,
> drm/exynos, drm/exynos: fimd, drm: exynos: fimd, DRM: EXYNOS: FIMD, ...
>  so many cases....  Do you really want this?
>
> So I will always say "please, use right prefix" Otherwise, I will change
> it while merging as is.
> And I see that other drm drivers have their own way which is not
> documented but just implicitly.
>

I agree with you that people should follow the convention for subject
lines used in a subsystem and that it is tedious to tell them to fix
the subject and resend but I do agree with Tobias that you should
rethink your mail filters.

For example I've a filter for all the emails that are directly
addressed to me or that I'm cc'ed to. It's true that you may get some
emails that are not interesting to you just because people cc'ed you
in random patches but I think is better to have false positives than
to have false negatives. Specially since you are a kernel maintainer
and people expect your feedback / ack for patches to get merged.

> Thanks,
> Inki Dae
>

Best regards,
Javier
