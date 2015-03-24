From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] drm: Exynos: Respect framebuffer pitch for FIMD/Mixer
Date: Tue, 24 Mar 2015 09:57:03 +0100
Message-ID: <CABxcv==Z0ccmR-3Hasnkmg14m3hBJEwha=6c6288jQPUhyQt-g@mail.gmail.com>
References: <1426598698-31095-1-git-send-email-daniels@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:33630 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751814AbbCXI5F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Mar 2015 04:57:05 -0400
Received: by weop45 with SMTP id p45so157730112weo.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Mar 2015 01:57:04 -0700 (PDT)
In-Reply-To: <1426598698-31095-1-git-send-email-daniels@collabora.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Daniel Stone <daniels@collabora.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>, t.stanislaws@samsung.com

Hello Inki,

On Tue, Mar 17, 2015 at 2:24 PM, Daniel Stone <daniels@collabora.com> wrote:
> When performing a modeset, use the framebuffer pitch value to set FIMD
> IMG_SIZE and Mixer SPAN registers. These are both defined as pitch - the
> distance between contiguous lines (bytes for FIMD, pixels for mixer).
>
> Fixes display on Snow (1366x768).
>
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Any comments on this patch? It would be great to pick this sooner
rather than later since it fixes (at least) display output on Snow and
HDMI output on Peach Pit/Pi.

Best regards,
Javier
