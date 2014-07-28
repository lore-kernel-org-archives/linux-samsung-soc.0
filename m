From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] regulator: s2mpxxx: Move regulator min/step
 voltages in common place
Date: Mon, 28 Jul 2014 07:57:44 +0100
Message-ID: <20140728065744.GD5273@lee--X1>
References: <1405422173-15050-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:36281 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914AbaG1G5u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 02:57:50 -0400
Received: by mail-ie0-f172.google.com with SMTP id lx4so6225949iec.31
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2014 23:57:49 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1405422173-15050-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

On Tue, 15 Jul 2014, Amit Daniel Kachhap wrote:

> This is a cleanup patch and moves min/step voltages in a common samsu=
ng
> header file so that they can be used by other s2mpxxx PMIC drivers. O=
nly
> few required macros are added currently and others can be added if ne=
eded.
>=20
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
> Changes since v1:
> * Added Cc to maintainers.
> * Added Krzysztof reviewed-by.
>=20
>  drivers/regulator/s2mpa01.c         | 32 ++++++++++++------------
>  drivers/regulator/s2mps11.c         | 50 ++++++++++++++++++---------=
----------
>  include/linux/mfd/samsung/core.h    | 21 ++++++++++++++++
>  include/linux/mfd/samsung/s2mpa01.h | 12 ---------
>  include/linux/mfd/samsung/s2mps11.h |  9 -------
>  include/linux/mfd/samsung/s2mps14.h | 10 --------
>  6 files changed, 62 insertions(+), 72 deletions(-)

=46or the MFD changes:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
