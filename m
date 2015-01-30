From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [RFC] drm/exynos: move hdmi clk disable out of pm ops
Date: Fri, 30 Jan 2015 09:05:46 +0100
Message-ID: <CABxcv==cDEE22Ptp=jSqgt3SNAUN-MVWvK_B2Bwzsk_+fpnkbA@mail.gmail.com>
References: <CABxcv=nNKrF45TL3_1BZHMzfKj1xPm6TzUGRSZ3WgJxzyUSmxQ@mail.gmail.com>
	<1422538273-3097-1-git-send-email-gustavo@padovan.org>
	<54CAE64A.2040906@samsung.com>
	<CABxcv=n7=ujyOoy1rTL-SQg=-hnCXVHbLX_npp5tn5BpTYFTZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:39431 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751681AbbA3IFr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 03:05:47 -0500
Received: by mail-wi0-f177.google.com with SMTP id r20so1077973wiv.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jan 2015 00:05:46 -0800 (PST)
In-Reply-To: <CABxcv=n7=ujyOoy1rTL-SQg=-hnCXVHbLX_npp5tn5BpTYFTZA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <liquid.acid@gmx.net>, Inki Dae <inki.dae@samsung.com>, Prathyush K <prathyush.k@samsung.com>, Kukjin Kim <kgene@kernel.org>

Hello,

On Fri, Jan 30, 2015 at 9:03 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
>
> I haven't the S2R case since it is broken in mainline for Exynos5420
> (even with $subject applied) but $subject fixes for me the system
> crash we have discussed before [0]. That is when mixer_poweron() tries
> to access the mixer register without hdmi_poweron() enabling the
> "hdmi" clock.
>

I forgot to add the reference to the previously discussed issue, sorry
for the noise...

Best regards,
Javier

[0]: http://www.spinics.net/lists/arm-kernel/msg393206.html
