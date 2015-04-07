From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: sec: Fix RTC alarm interrupt number on S2MPS11
Date: Tue, 7 Apr 2015 08:37:28 +0100
Message-ID: <20150407073728.GH3461@x1>
References: <1427985376-20420-1-git-send-email-k.kozlowski@samsung.com>
 <1427985376-20420-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37012 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752676AbbDGHhd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Apr 2015 03:37:33 -0400
Received: by wiaa2 with SMTP id a2so7535009wia.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Apr 2015 00:37:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1427985376-20420-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Thu, 02 Apr 2015, Krzysztof Kozlowski wrote:

> The RTC on S2MPS11 is the same as S2MPS14. However interrupt numbers =
of
> RTC alarms 0 and 1 were inversed between these two devices. So when
> rtc-s5m driver requested S2MPS14_IRQ_RTCA0 interrupt, it matched to
> S2MPS11_IRQ_RTCA1, not RTCA0.
>=20
> Fix this by using consistent RTC alarm interrupt numbers and adding a
> BUILD_BUG_ON for future generations.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mfd/sec-irq.c           | 14 ++++++++++----
>  include/linux/mfd/samsung/irq.h |  2 +-
>  2 files changed, 11 insertions(+), 5 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index ba86a918c2da..806fa8dbb22d 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -61,14 +61,14 @@ static const struct regmap_irq s2mps11_irqs[] =3D=
 {
>  		.reg_offset =3D 1,
>  		.mask =3D S2MPS11_IRQ_RTC60S_MASK,
>  	},
> -	[S2MPS11_IRQ_RTCA0] =3D {
> -		.reg_offset =3D 1,
> -		.mask =3D S2MPS11_IRQ_RTCA0_MASK,
> -	},
>  	[S2MPS11_IRQ_RTCA1] =3D {
>  		.reg_offset =3D 1,
>  		.mask =3D S2MPS11_IRQ_RTCA1_MASK,
>  	},
> +	[S2MPS11_IRQ_RTCA0] =3D {
> +		.reg_offset =3D 1,
> +		.mask =3D S2MPS11_IRQ_RTCA0_MASK,
> +	},
>  	[S2MPS11_IRQ_SMPL] =3D {
>  		.reg_offset =3D 1,
>  		.mask =3D S2MPS11_IRQ_SMPL_MASK,
> @@ -484,6 +484,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  		return ret;
>  	}
> =20
> +	/*
> +	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11
> +	 * so the interrupt number must be consistent.
> +	 */
> +	BUILD_BUG_ON(((enum s2mps14_irq)S2MPS11_IRQ_RTCA0) !=3D S2MPS14_IRQ=
_RTCA0);
> +
>  	return 0;
>  }
> =20
> diff --git a/include/linux/mfd/samsung/irq.h b/include/linux/mfd/sams=
ung/irq.h
> index f35af7361b60..667aa40486dd 100644
> --- a/include/linux/mfd/samsung/irq.h
> +++ b/include/linux/mfd/samsung/irq.h
> @@ -74,8 +74,8 @@ enum s2mps11_irq {
>  	S2MPS11_IRQ_MRB,
> =20
>  	S2MPS11_IRQ_RTC60S,
> -	S2MPS11_IRQ_RTCA0,
>  	S2MPS11_IRQ_RTCA1,
> +	S2MPS11_IRQ_RTCA0,
>  	S2MPS11_IRQ_SMPL,
>  	S2MPS11_IRQ_RTC1S,
>  	S2MPS11_IRQ_WTSR,

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
