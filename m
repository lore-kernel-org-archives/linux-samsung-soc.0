From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/4] drm/exynos: fimd: Add support for S3C6400/S3C6410
Date: Wed, 05 Jun 2013 20:14:32 +0200
Message-ID: <1938938.aAbuguuIAt@flatron>
References: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com> <2251148.tVTSO69sfP@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:60463 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756426Ab3FESOh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 14:14:37 -0400
Received: by mail-bk0-f46.google.com with SMTP id na10so1094139bkb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jun 2013 11:14:35 -0700 (PDT)
In-Reply-To: <2251148.tVTSO69sfP@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, inki.dae@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, t.figa@samsung.com

On Sunday 19 of May 2013 13:26:57 Tomasz Figa wrote:
> Hi,
> 
> On Wednesday 01 of May 2013 21:02:25 Tomasz Figa wrote:
> > Much of the code in Exynos DRM subsystem is generic enough to use
> > it for older (non-Exynos) Samsung SoCs as well, after minor
> > modifications.
> > 
> > This series starts adding support for previous SoCs to Exynos DRM by
> > introducing S3C64xx support to exynos_drm_fimd driver.
> > 
> > Adding support for remaining SoCs between S3C64xx and Exynos4
> > (S5PC100,
> > S5P64x0 and S5PV210) should be rather straightforward, but at the
> > moment I can test only on S3C6410, so I limited my changes only to
> > this SoC.
> > 
> > On Tiny6410 (Mini6410-compatible) board based on Samsung S3C6410 SoC,
> > using my to-be-resubmitted patches for Device Tree support:
> > 
> > Tested-by: Tomasz Figa <tomasz.figa@gmail.com>
> > 
> > Tomasz Figa (4):
> >   drm/exynos: fimd: Hold pointer to driver data in context struct
> >   drm/exynos: fimd: Add support for FIMD versions without SHADOWCON
> >   
> >     register
> >   
> >   drm/exynos: fimd: Add support for FIMD variants with clock selection
> >   drm/exynos: fimd: Add support for S3C64xx SoCs
> >  
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 90
> > 
> > ++++++++++++++++++++++++-------- 1 file changed, 68 insertions(+), 22
> > deletions(-)
> 
> Any comments for this series?
> 
> Best regards,
> Tomasz

Ping.

Best regards,
Tomasz
