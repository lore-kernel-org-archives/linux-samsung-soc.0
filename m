From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 0/9] drm/exynos: cleanups and small fixes for libdrm
Date: Mon, 22 Jun 2015 17:13:55 +0000
Message-ID: <CACvgo50ejEukcc+kQNJ114mJCRxRA32rP-q0kXG8EDJd1h4Acg@mail.gmail.com>
References: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f45.google.com ([209.85.216.45]:35445 "EHLO
	mail-vn0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838AbbFVRN4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jun 2015 13:13:56 -0400
Received: by vnbg129 with SMTP id g129so6797758vnb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jun 2015 10:13:55 -0700 (PDT)
In-Reply-To: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

On 12 June 2015 at 18:15, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> Hello,
>
> I've split off the Exynos specific bits, so this is just some cleanups and small fixes. Everything can be reviewed without knowledge about the Exynos platform. My hope is that I can get at least some of the patches from my last series upstream.
>
> With best wishes,
> Tobias
>
> Changes in v2:
> - Made it clear that the error handling is currently 'unsatisfactory', but that this is going to be adressed in a later patch.
> - Point out that removed code also wasn't used anywhere in the past (by inspection of git history).
>
Big thanks for the update. It will make things clear a week/month down
the road - when we've forgotten pretty much everything in the area :-)
Considering how trivial these are and the silence from the
Samsung/Exynos folk, I'll be pushing these later on today.

If some of the dead code ends up required, we can always bring it back.

Cheers,
Emil
