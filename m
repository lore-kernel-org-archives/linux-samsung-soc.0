From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 2/3] drm/exynos: remove superfluous error messages
Date: Wed, 1 Apr 2015 12:33:56 -0300
Message-ID: <20150401153356.GE7013@joana>
References: <1427894943-9010-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1427894943-9010-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:33685 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751053AbbDAPeA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 11:34:00 -0400
Received: by qcrf4 with SMTP id f4so31626267qcr.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2015 08:34:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1427894943-9010-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com

Hi Tobias,

2015-04-01 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>:

> The messages are redundant since 'check_fb_gem_memory_type'
> already prints out exactly the same string when it fails.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
