Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06069156C72
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2024 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873544; cv=none; b=J/IahVNh9t7cHlO4Siayc1ZhQ1ol2EmsfdyXe0aX/g3+3Nk0PaHLUXX44JLAo4vcOwduhPUL8Ga0Byu5yCj4PHbGoicNyHhdFSrGEA9fNsqnblwOrUbly8J5him76tFzD6iZScs91m3GQrH5M2iHA2CimovwUfiQKRopo5nmR8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873544; c=relaxed/simple;
	bh=kYTOdYLfumByQtT4lm725ivrBjreeVTVPxGOeWmX+/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9sJB182RgE4t2r7lmhExZlVv0lcH4FuBnFL2XnYwTa91H5dP5sfRmtkSw0ldzjt5QyFHVjGgBuzwSQz+TY4mtH7a9usQM4vPqxqyv+DgSMpaqiPG+B8M+TU8RnSGQK/Sct46LTGnIt9stUc6CVEdpPkoRxFO/D4+W2Ks8frUo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wm9gViXh; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wm9gViXh"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5ee645cf763so664595eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2024 01:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732873540; x=1733478340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/VnXj0xSm64G+xnhmGLSxnRi7eiVgvL2X5pSK2r9No=;
        b=Wm9gViXhsZyJNbf9g5OwcrHY/H7XIEoTUjZf2h5O+fnnA7yi/TbH3WGRkSUZZ18+7/
         7uiNhWnhTbpTr32Uy4Pw8A0a81GWTAemukRRYQbWiNIFy+oSgqVj85s6lqeiW9oJWAAb
         zaEy4Ww9p6uErf/4DLAFgKXyU318c1GTj88lACZmIwytsco45J+G/cr33NFG1tiXGT62
         z+h1/TVzl59xKQQInqdGfEHuI5l5O/SQ1LlRLYgQCDofC81A9ATWxecwtpDBG+IID/YG
         QkpNsSabIy08xx+l75sVe0/li+2oAaCgxlTfWFAAsww1YLRvt9pbPFDQj7+BarRhuNaE
         Jxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873540; x=1733478340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/VnXj0xSm64G+xnhmGLSxnRi7eiVgvL2X5pSK2r9No=;
        b=jpegmWEuPlQNgon2c8j/gk87xkqXMI4fXZ/Ig362D4Xk6XjAFDJnW1QRq3ZxUcrNDW
         ad9cDMsj5Udv/u4ra7asQn6sWkec9k09w8KIyS0I+zGKpvJZllv6n0xfMNKglvg1lfV+
         2dzEoWKUMJKrXrbaVqldi2EpEIHshCLh0ElOhaag91WJ63dA4YwAiWP/gXCV+lHe1ilh
         /b8WVU1bI53pi8BZ7rleag+jN+wCvtoBRieWlpwZNenAH4h+8nblw/FSOeCY0G9wen5r
         dRrij6hlfUQQtr1MWYml5PplySNCcKlGUfA1+GiSGdMbfxnTUESnpvqsfvwI5wQstiN7
         y95g==
X-Forwarded-Encrypted: i=1; AJvYcCVXyHO3DKAg2gGwg7xMbbpjIu2G3TL+96na7C1uzHXuW13goeJiakeIZ2IWvOqZ22aL1IiJA7tIxzfoR/aTwjjYPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSW9Ql9y+muPCN25m4xhbiB9dXYaC0ajrqt/hcg3+bi3j9ywXn
	VWnGtf+11jVaHq5ZB5yNpjTaXSdCKAXs/7T1zWVV3lg/GQ0dseRedJIpT40czFkm2HHJSXdnAqB
	oeJ9BtfReKFFjE1yg3fGDMTCqS/TMqfsNp98WNw==
X-Gm-Gg: ASbGnctgTVMwldiS503DL4gKIaoeK5WKQi3BYF5J750od0Ofz/4+hnezDivMKTD+u3b
	pPBU4s5kSinpLB2BSWQbyXF13iD2OJwaa
X-Google-Smtp-Source: AGHT+IHnxS6dF7DDI6r75yOFHU8KPB1OwTru3sBOUtig1dAA1cBoVlmH0MuchExTRQ+k+9Oap9bXnNBRkMu1gCqUvYY=
X-Received: by 2002:a05:6820:2183:b0:5ee:ebcb:e6e9 with SMTP id
 006d021491bc7-5f20a168f5cmr5503129eaf.5.1732873540094; Fri, 29 Nov 2024
 01:45:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-7-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-7-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 29 Nov 2024 09:45:29 +0000
Message-ID: <CADrjBPpZgmE-rwRmbB3BFAL+s0G0rwBiPJ-ZMEVF8BNQ=tviVg@mail.gmail.com>
Subject: Re: [PATCH 7/9] phy: exynos5-usbdrd: gs101: configure SS lanes based
 on orientation
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> USB SS lanes need to be configured based the connector orientation -

small nit: "based the" -> "based on the"

> at most two lanes will be in use for USB (and the remaining two for
> alternate modes like DP).
>
> For the USB link to come up in SS, the lane configuration registers
> have to be programmed accordingly.
>
> While we still need a way to be notified of the actual connector
> orientation and then reprogram the registers accordingly (at the moment
> the configuration happens just once during phy_init() and never again),
> we can prepare the code doing the configuration to take the orientation
> into account.
>
> Do so.
>
> Note: the mutex is needed to synchronize this with the upcoming
> connector orientation callback.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 72 ++++++++++++++++++++++----=
------
>  1 file changed, 51 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index c1ce6fdeef31..1a34e9b4618a 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -23,6 +23,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/soc/samsung/exynos-regs-pmu.h>
> +#include <linux/usb/typec_mux.h>
>
>  /* Exynos USB PHY registers */
>  #define EXYNOS5_FSEL_9MHZ6             0x0
> @@ -209,6 +210,10 @@
>
>  #define EXYNOS9_PMA_USBDP_CMN_REG00B8          0x02e0
>  #define CMN_REG00B8_LANE_MUX_SEL_DP            GENMASK(3, 0)
> +#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE3      BIT(3)
> +#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE2      BIT(2)
> +#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE1      BIT(1)
> +#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE0      BIT(0)
>
>  #define EXYNOS9_PMA_USBDP_CMN_REG01C0          0x0700
>  #define CMN_REG01C0_ANA_LCPLL_LOCK_DONE                BIT(7)
> @@ -383,11 +388,13 @@ struct exynos5_usbdrd_phy_drvdata {
>   * @clks: clocks for register access
>   * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as requ=
ired)
>   * @drv_data: pointer to SoC level driver data structure
> + * @phy_mutex: mutex protecting phy_init/exit & TCPC callbacks
>   * @phys: array for 'EXYNOS5_DRDPHYS_NUM' number of PHY
>   *         instances each with its 'phy' and 'phy_cfg'.
>   * @extrefclk: frequency select settings when using 'separate
>   *            reference clocks' for SS and HS operations
>   * @regulators: regulators for phy
> + * @orientation: TypeC connector orientation - normal or flipped
>   */
>  struct exynos5_usbdrd_phy {
>         struct device *dev;
> @@ -397,6 +404,7 @@ struct exynos5_usbdrd_phy {
>         struct clk_bulk_data *clks;
>         struct clk_bulk_data *core_clks;
>         const struct exynos5_usbdrd_phy_drvdata *drv_data;
> +       struct mutex phy_mutex;
>         struct phy_usb_instance {
>                 struct phy *phy;
>                 u32 index;
> @@ -406,6 +414,8 @@ struct exynos5_usbdrd_phy {
>         } phys[EXYNOS5_DRDPHYS_NUM];
>         u32 extrefclk;
>         struct regulator_bulk_data *regulators;
> +
> +       enum typec_orientation orientation;

typec_orientation is defined in #include <linux/usb/typec.h> so it
should be added to the includes

Apart from that

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Validated that a super-speed USB link is established between Pixel 6
phone and my laptop with this patch applied and that adb works.

regards,

Peter
