From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 3/3] drm/exynos: mixer: add 2x scaling to
 mixer_graph_buffer
Date: Wed, 1 Apr 2015 12:34:52 -0300
Message-ID: <20150401153452.GF7013@joana>
References: <1427894943-9010-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1427894943-9010-3-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50]:33071 "EHLO
	mail-qg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752218AbbDAPez (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 11:34:55 -0400
Received: by qgfa8 with SMTP id a8so45744714qgf.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2015 08:34:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1427894943-9010-3-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com

Hi Tobias,

2015-04-01 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> While the VP (video processor) supports arbitrary scaling
> of its input, the mixer just supports a simple 2x (line
> doubling) scaling. Expose this functionality and exit
> early when an unsupported scaling configuration is
> encountered.
> 
> This was tested with modetest's DRM plane test (from
> the libdrm test suite) on an Odroid-X2 (Exynos4412).
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
