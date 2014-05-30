From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] drm/exynos: remove unnecessary exynos_hdmi.h file
Date: Fri, 30 May 2014 09:15:36 +0100
Message-ID: <20140530081536.GE2619@lee--X1>
References: <000a01cf7bac$8f805f60$ae811e20$%han@samsung.com>
 <20140530081403.GD2619@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:62875 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782AbaE3IPm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 04:15:42 -0400
Received: by mail-ie0-f181.google.com with SMTP id rp18so1424690iec.40
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 01:15:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140530081403.GD2619@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Inki Dae' <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Dave Airlie' <airlied@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel@stlinux.com, 'Tomasz Figa' <tomasz.figa@gmail.com>

> > The exynos_hdmi.h has been used for the dedicated i2c drivers
> > that were already removed. Thus, the unnecessary exynos_hdmi.h
> > should be removed.
> >=20
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.h |   23 ----------------------=
-
> >  1 file changed, 23 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmi.h
>=20
> https://lkml.org/lkml/2014/5/29/810

Oh, I see.

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
