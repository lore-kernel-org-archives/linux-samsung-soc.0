From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 02/14] mfd: max77686: Allow the max77686 rtc to wakeup
 the system
Date: Fri, 27 Jun 2014 10:21:49 +0100
Message-ID: <20140627092149.GH19645@lee--X1>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk>
 <1403806546-31122-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:49392 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752652AbaF0JV5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 05:21:57 -0400
Received: by mail-ig0-f178.google.com with SMTP id hn18so1725136igb.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2014 02:21:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1403806546-31122-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 26 Jun 2014, Javier Martinez Canillas wrote:

> From: Doug Anderson <dianders@chromium.org>
>=20
> The max77686 includes an RTC that keeps power during suspend.  It's
> convenient to be able to use it as a wakeup source.
>=20
> NOTE: due to wakeup ordering problems this patch alone doesn't work s=
o
> well on exynos5250-snow.  You also need something that brings the i2c
> bus up before the max77686 wakeup runs.
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>=20
> Changes since v4: None
>=20
> Changes since v3:
>  - Keep the note that this patch needs another change due wakeup
>    ordering problems.
>=20
>  drivers/rtc/rtc-max77686.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

This patch doesn't actually touch the MFD subsystem directly.  Can you
change the $SUBJECT line accordingly please?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
