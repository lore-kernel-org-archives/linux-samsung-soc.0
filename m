From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] drm/exynos: remove unnecessary exynos_hdmi.h file
Date: Fri, 30 May 2014 09:14:03 +0100
Message-ID: <20140530081403.GD2619@lee--X1>
References: <000a01cf7bac$8f805f60$ae811e20$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000a01cf7bac$8f805f60$ae811e20$%han@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Inki Dae' <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Dave Airlie' <airlied@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel@stlinux.com, 'Tomasz Figa' <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

> The exynos_hdmi.h has been used for the dedicated i2c drivers
> that were already removed. Thus, the unnecessary exynos_hdmi.h
> should be removed.
>=20
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.h |   23 -----------------------
>  1 file changed, 23 deletions(-)
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_hdmi.h

https://lkml.org/lkml/2014/5/29/810

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
