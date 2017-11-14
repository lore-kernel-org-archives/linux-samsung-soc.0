From: Dave Airlie <airlied@gmail.com>
Subject: Re: [GIT PULL] exynos-drm-next
Date: Tue, 14 Nov 2017 14:22:50 +1000
Message-ID: <CAPM=9ty-Boo8mjREQ8T2AaGYoU5ZcAu70iQpwJy_oawZxoS+Pg@mail.gmail.com>
References: <CGME20171026013709epcas2p2525d1249a7f2ad640ce9028df12e2436@epcas2p2.samsung.com>
 <1508981828-5178-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:55209 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751597AbdKNEWw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 23:22:52 -0500
Received: by mail-lf0-f52.google.com with SMTP id a2so20756261lfh.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Nov 2017 20:22:52 -0800 (PST)
In-Reply-To: <1508981828-5178-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Dave Airlie <airlied@linux.ie>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On 26 October 2017 at 11:37, Inki Dae <inki.dae@samsung.com> wrote:
> Hi Dave,
>
>    Improving Exynos DRM HDMI and Mixer drivers and also adding
>    HDMI audio support.
>
>    Please kindly let me know if there is any problem.
>
>    Ps. we are reviewing IPP v2 driver[1] which controls post processor devices
>        such as FIMC, GScaler and Rotator of Exynos SoC. So I plan to request
>        git pull one more time after review.

Hi Inki,

I dropped the ball a bit here, I do think the second pull with IPP is
probably a bit late,
I think I'd like more assurance that the UAPI for IPP is to be used in
some upstream
shipping project (forks of mpv not withstanding, unless this fork
ships in some distro
or product).

I unfortunately forgot to pull this one, I've rectified that and it is
now in drm-next.

Dave.
