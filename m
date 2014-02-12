From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 03/14] mfd/rtc: sec/sec: Rename SEC* symbols to S5M
Date: Wed, 12 Feb 2014 09:04:31 +0000
Message-ID: <20140212090431.GQ15081@lee--X1>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:36015 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbaBLJEj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 04:04:39 -0500
Received: by mail-wi0-f182.google.com with SMTP id f8so6475663wiw.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2014 01:04:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1392123837-5517-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com

> This patch prepares for adding support for S2MPS14 RTC device to the
> rtc-s5m driver:
> 1. Renames SEC* symbols to S5M.
> 2. Adds S5M prefix to some of defines which are different between S5M=
876X
> and S2MPS14.
>=20
> This is only a rename-like patch, new code is not added.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: rtc-linux@googlegroups.com
> ---
>  drivers/mfd/sec-core.c          |    2 +-
>  drivers/rtc/rtc-s5m.c           |   64 ++++++++++++++++-------------=
----
>  include/linux/mfd/samsung/rtc.h |   76 +++++++++++++++++++----------=
----------
>  3 files changed, 71 insertions(+), 71 deletions(-)

Hmmm...

> -	.max_register =3D SEC_RTC_REG_MAX,
> +	.max_register =3D S5M_RTC_REG_MAX,
>  };

<snip>

> -	SEC_RTC_REG_MAX,
> +	S5M_RTC_REG_MAX,
>  };

You only just introduced these 2 patches ago!

It's not a big enough of a deal for a NACK though I guess.

On the basis that this set is going to go in as one big set:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
