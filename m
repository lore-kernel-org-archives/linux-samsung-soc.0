From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] regulator: s2mps11: Add set_suspend_disable for
 S2MPS14
Date: Wed, 5 Mar 2014 17:55:19 +0800
Message-ID: <20140305095519.GD10380@lee--X1>
References: <1394011373-4057-1-git-send-email-k.kozlowski@samsung.com>
 <1394011373-4057-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:48330 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751919AbaCEJz0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Mar 2014 04:55:26 -0500
Received: by mail-pd0-f177.google.com with SMTP id g10so844367pdj.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2014 01:55:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1394011373-4057-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

> S2MPS14 regulators support suspend mode where their status is control=
led
> by PWREN coming from SoC. This patch implements the set_suspend_disab=
le
> for S2MPS14 regulators.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/regulator/s2mps11.c         |   26 +++++++++++++++++++++++++=
+
>  include/linux/mfd/samsung/s2mps14.h |    2 ++
>  2 files changed, 28 insertions(+)

=46or the MFD changes:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
