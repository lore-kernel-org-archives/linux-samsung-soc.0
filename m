From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] drm/exynos: Fix multiplatform breakage for ipp
Date: Thu, 16 Jan 2014 10:37:17 +0530
Message-ID: <CAHbNUh3zmFKXDPTe4J3jegpduBqSa7L1Oh0z92ov3iEL2BUzng@mail.gmail.com>
References: <1389787053-18228-1-git-send-email-tushar.behera@linaro.org>
	<CAK9yfHxAcTVV3CpkKkGkywscRTXb8G7r5FobH8MJD-XFchAnDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:48849 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750736AbaAPFHS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jan 2014 00:07:18 -0500
Received: by mail-oa0-f45.google.com with SMTP id j17so2390278oag.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2014 21:07:18 -0800 (PST)
In-Reply-To: <CAK9yfHxAcTVV3CpkKkGkywscRTXb8G7r5FobH8MJD-XFchAnDg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Inki Dae <inki.dae@samsung.com>, Arnd Bergmann <arnd@arndb.de>

On 16 January 2014 10:33, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Tushar,
>
> On 15 January 2014 17:27, Tushar Behera <tushar.behera@linaro.org> wrote:
>> There is no need to include "plat/map-base.h" in ipp driver. Remove
>> this and enable this driver for multi-platform.
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>
> drivers/gpu/drm/exynos/exynos_drm_gsc.c also has this header file included.
> If this file is needed there, then you may have to add !ARCH_MULTIPLATFORM
> as its dependency.
>

Yes, true. There are still some users for this header file within
exynos_drm_gsc.c, so we need to make the compilation conditional. I
will add that and resend the patch.

> --
> With warm regards,
> Sachin

Thanks.
-- 
Tushar Behera
