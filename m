From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH v8] mfd: max77686: Add Maxim 77802 PMIC support
Date: Thu, 24 Jul 2014 16:00:50 +0100
Message-ID: <20140724150050.GD7063@lee--X1>
References: <1406205564-11048-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:47848 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759097AbaGXPA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jul 2014 11:00:56 -0400
Received: by mail-ie0-f181.google.com with SMTP id rp18so2288885iec.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2014 08:00:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1406205564-11048-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thu, 24 Jul 2014, Javier Martinez Canillas wrote:

> Maxim MAX77802 is a power management chip that contains 10 high
> efficiency Buck regulators, 32 Low-dropout (LDO) regulators used
> to power up application processors and peripherals, a 2-channel
> 32kHz clock outputs, a Real-Time-Clock (RTC) and a I2C interface
> to program the individual regulators, clocks outputs and the RTC.
>=20
> This patch adds support for MAX77802 to the MAX77686 driver and is
> based on a driver added to the Chrome OS kernel 3.8 by Simon Glass.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Assuming nothing has changed since I Acked this:

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
