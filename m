From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/exynos: support exynos5422 mipi-dsi
Date: Wed, 10 Feb 2016 12:34:43 +0000
Message-ID: <CACvgo51WTYAYon4e4+hT7_vaeSDDR41pA0QmnjZ1FM3QR8vvOg@mail.gmail.com>
References: <1454163110-20103-1-git-send-email-parkch98@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:36615 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750801AbcBJMeo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Feb 2016 07:34:44 -0500
Received: by mail-wm0-f52.google.com with SMTP id p63so26359328wmp.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Feb 2016 04:34:43 -0800 (PST)
In-Reply-To: <1454163110-20103-1-git-send-email-parkch98@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <parkch98@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Chanho Park <chanho61.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, ML dri-devel <dri-devel@lists.freedesktop.org>

Hi Chanho Park

On 30 January 2016 at 14:11, Chanho Park <parkch98@gmail.com> wrote:
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c

>  static struct of_device_id exynos_dsi_of_match[] = {

If you feel extra gracious you can constify the array and all of it's
entries, for good measure.
Likely in another patch of course :-)

Regards,
Emil
