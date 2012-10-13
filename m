From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 6/6] arm: exynos: removing exynos-drm device registration from non-dt platforms
Date: Sat, 13 Oct 2012 15:46:02 +0200
Message-ID: <3753436.Oasjq2fFLk@flatron>
References: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com> <1350074555-26018-7-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:42514 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752818Ab2JMNqB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Oct 2012 09:46:01 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so3198254wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Oct 2012 06:46:00 -0700 (PDT)
In-Reply-To: <1350074555-26018-7-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com

On Saturday 13 of October 2012 02:12:35 Rahul Sharma wrote:
> As exynos-drm is a software device, its registration is moved to the
> exynos drm driver. This will provide generic solution for device
> registration for dt and non-dt platforms. Corresponding patches are
> posted to dri-devel list.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile              |    1 -
>  arch/arm/mach-exynos/dev-drm.c             |   29
> ---------------------------- arch/arm/mach-exynos/mach-nuri.c          
> |    3 --
>  arch/arm/mach-exynos/mach-origen.c         |    3 --
>  arch/arm/mach-exynos/mach-smdk4x12.c       |    3 --
>  arch/arm/mach-exynos/mach-smdkv310.c       |    3 --
>  arch/arm/mach-exynos/mach-universal_c210.c |    3 --
>  arch/arm/plat-samsung/include/plat/devs.h  |    2 -
>  8 files changed, 0 insertions(+), 47 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/dev-drm.c

Hmm, shouldn't this patch belong to the series adding registration in the 
driver?
(http://comments.gmane.org/gmane.comp.video.dri.devel/75121)

It doesn't look to be directly related to adding dt support for exynos5 
hdmi.

Best regards,
Tomasz Figa
