From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 02/24] mfd: max77686: Add power management support
Date: Wed, 9 Jul 2014 15:44:40 +0100
Message-ID: <20140709144440.GD2635@lee--X1>
References: <1404505467-26526-1-git-send-email-javier.martinez@collabora.co.uk>
 <1404505467-26526-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:55718 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755249AbaGIOos (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 10:44:48 -0400
Received: by mail-ie0-f178.google.com with SMTP id rl12so6327677iec.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2014 07:44:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1404505467-26526-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Tushar Behera <trblinux@gmail.com>, Andreas Farber <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 04 Jul 2014, Javier Martinez Canillas wrote:

> The driver doesn't have PM operations defined so add a suspend
> and resume function handlers to allow the PMIC IRQ to wakeup
> the system when it is put into a sleep state.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/max77686.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Patch looks good.  I guess the set needs to go in as one big lump due
to interdependencies, so for my own benefit (to prevent re-reviewing):

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
