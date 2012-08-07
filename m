From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V4 0/2] arm: samsung: Move FIMD headers to
	include/video/
Date: Tue, 7 Aug 2012 15:33:42 +0100
Message-ID: <20120807143342.GD18957@n2100.arm.linux.org.uk>
References: <1344342872-7904-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:56448 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752518Ab2HGOd7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 10:33:59 -0400
Content-Disposition: inline
In-Reply-To: <1344342872-7904-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

On Tue, Aug 07, 2012 at 06:04:30PM +0530, Leela Krishna Amudala wrote:
>  arch/arm/plat-samsung/include/plat/regs-fb-v4.h    |  159 --------------------
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |    2 +-
>  drivers/video/s3c-fb.c                             |    2 +-
>  .../plat/regs-fb.h => include/video/samsung_fimd.h |  152 +++++++++++++++++--

Isn't include/video for framebuffer drivers?  Isn't this more a DRM thing?
Wouldn't include/drm therefore be more appropriate?
