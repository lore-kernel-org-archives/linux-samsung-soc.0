From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 2/2] drm/exynos: 'win' is always unsigned
Date: Thu, 7 May 2015 15:26:55 -0300
Message-ID: <20150507182655.GB10032@joana>
References: <1430914222-3603-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1430914222-3603-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:33501 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751459AbbEGS1A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 May 2015 14:27:00 -0400
Received: by qcvo8 with SMTP id o8so1818384qcv.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 May 2015 11:26:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1430914222-3603-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, dri-devel@lists.freedesktop.org

Hi Tobias,

2015-05-06 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> The index for the hardware layer is always >=0. Previous
> code that also used -1 as special index is now gone.
> 
> Also apply this to 'ch_enabled' (decon/fimd), since the
> variable is on the same line (and is again always unsigned).
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 6 +++---
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
