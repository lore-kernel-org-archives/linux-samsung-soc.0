From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] drm/exynos: Fix multiplatform breakage for ipp
Date: Thu, 16 Jan 2014 10:33:56 +0530
Message-ID: <CAK9yfHxAcTVV3CpkKkGkywscRTXb8G7r5FobH8MJD-XFchAnDg@mail.gmail.com>
References: <1389787053-18228-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:47563 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbaAPFD5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jan 2014 00:03:57 -0500
Received: by mail-ob0-f180.google.com with SMTP id wm4so2187639obc.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2014 21:03:56 -0800 (PST)
In-Reply-To: <1389787053-18228-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Inki Dae <inki.dae@samsung.com>, Arnd Bergmann <arnd@arndb.de>

Hi Tushar,

On 15 January 2014 17:27, Tushar Behera <tushar.behera@linaro.org> wrote:
> There is no need to include "plat/map-base.h" in ipp driver. Remove
> this and enable this driver for multi-platform.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

drivers/gpu/drm/exynos/exynos_drm_gsc.c also has this header file included.
If this file is needed there, then you may have to add !ARCH_MULTIPLATFORM
as its dependency.

-- 
With warm regards,
Sachin
