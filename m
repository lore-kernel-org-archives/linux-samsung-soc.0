From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/2] drm/exynos: use drm generic mmap interface
Date: Wed, 01 Oct 2014 15:17:50 +0200
Message-ID: <542BFEFE.20708@gmail.com>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com> <1410961726-2533-3-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:35206 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751053AbaJANRz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 09:17:55 -0400
Received: by mail-wg0-f46.google.com with SMTP id k14so463822wgh.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Oct 2014 06:17:53 -0700 (PDT)
In-Reply-To: <1410961726-2533-3-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

Hi Inki,

On 17.09.2014 15:48, Inki Dae wrote:
> This patch removes DRM_EXYNOS_GEM_MMAP ictrl feature specific
> to Exynos drm and instead uses drm generic mmap.

It looks like libdrm_exynos is still using DRM_EXYNOS_GEM_MMAP, but this
patch just removes it. This basically means that any application using
it is now broken. Do you have any plans to fix this?

Best regards,
Tomasz
