Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11BE279DB2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805879; cv=none; b=mLHuxrPrMWtpzEl0DLzFj/t8a/Fflw7Uo0EN7DbPTbBp0ozokgdoS3fJ41Xd0U8P+S/ymDl7NJ8OkIY1cKh2U8gHYtxdZoj99MMDH3wCweQjH24PjBE+K0heDOHnZ+gDOPZ/4JlNnB1OqIxBioUz+weDiClluTdXiL3BSfw/oRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805879; c=relaxed/simple;
	bh=Ycdh6Mx42Kd4GZcxn6FTALt14ZmWACOgludo3NTSD14=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LdEdkRQ58A2FmIGKOMe3E6dxbmGjXSwncXfJghBiopL848sjU1fTkxXG9981/PozfAalWUTu+c2H9hCJMrjRmbVfT5aze5gadxZu3BfCU6W13LlbZYOHkXwzqVo/cLPCocqkyc/fOojVL6M4Nds7p6Pok/a1MR6bwG0OVNx40x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h2AI4VNO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h2AI4VNO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a51d552de4so1165273f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805876; x=1750410676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=629JP4RloYd0AtRr7iHTTkC9nVi9eInO64mnKOCzxxc=;
        b=h2AI4VNOsQ41fKId+ey9I0zYlZl04XZKt1d4aFHSdYxhf2NQW4p3kUghvOkj4DYmEt
         PLCIs7LU1Yae5t9RgzaJu+ZjTmrhSCfclm2qlC2FFk5ueRlqeEXmmc6GivmQnycbGpoj
         TQHApNf8igAo0XzNCDaMW5DETAVfBBl7GTonmbbGIBCj0USgTYEum9CE2aqBuYXfv1Jd
         L7Cq96DEj1qNWP2AEgU9k/NsuDEDZQEKVYwDYsZdY2Kpgscz5EfwPu8RKRoI48NNvKT+
         ScOs28FN5/cTDRfX+uX0GNKcsKcYC+f+mAx0uw2fMw9yu9NQPeUXL+W1pt9SuUn+9m5G
         6+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805876; x=1750410676;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=629JP4RloYd0AtRr7iHTTkC9nVi9eInO64mnKOCzxxc=;
        b=ZabSTRJw05MwkfdpMPaz34EEbaHofE6op3JQxX8NbNZvW8PEKgsiITUsFAjc2h16Kj
         5SDzIBK/AH8VLCra3QXbVo+LaJHFDpattb9997GpArcEwYpsCaYe7LOYsnXcafyeNpHq
         18JJGaKLGead9/6F50MviR0/9Wig+aZKtaQ5Ip+xNMgCdmHTscVJKocMagcY//fFYZPt
         yCELbNM1fErLYd8OrlJCyio2mQg1vmK4TufnDfrR/aOBrOFGwyVCCMI+JpcPT4LD+SLt
         EQQ3tJpXcyp77mhxxHod7erTbd3kYcsK8IUr4hez3Xf0qbZ2rjz3rbPOOP7yoZt4g0Z9
         hUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnJAldXI7a4oFg7YOcsOpuLJoi4Wn6iqIuTfxbty1ERYorNQ042fYhuMkzBJPryL5z0JiA/soD44de8n9S2A0ABw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypZR3ccCd5wNUm3jOLnm34Get4Gu41Ft2m+FgZ3EDTFPexHTyB
	/COsymnkDmbQXbU7/gSzFUnVBOaFU4HvVWoA51rvF9DAOJO50QzsJsAESlQRu+CRrrg=
X-Gm-Gg: ASbGncso5QOGFdySL9nEVCNHZejGKFzXoJiv6keUTFRSCpbP5UqDxkwY65cV8Oxv0I/
	m4MLW7gtCpfIaKl4qVT4Z2bsl6cjpyn8mY1lLV9VvoniM8y92k1+OJ2lK1V2bUgrHlUv4nMvQuv
	KtQFAc8WVgZ3h/NKobBkq0Qd+vYhxq6ibUOv4HSO4ZJOWFg65kALWkyabqoYZ6SiYv7rRNjm/Gi
	0Nubs9R6tu3/z0vCvhH+aoNQu/w/E2HED6Ps5VzozH7atDoaHV0IOlbp0/H+PRHcXKgl4tFgWY3
	LJgYgukTa5gcWnIQt9ZetZRCMGfo4QAqfowkPTnzcyFrdCKHU75iWExkDHctqKGw0gUlz47zvzT
	udy0hKYUpfS5K70m0os8AouH+IPHAVSzDlGmrOcQ=
X-Google-Smtp-Source: AGHT+IEVkOGummRuxHpBo62hdZ3+dBUw2XniYXFN1l2NS66hsifQhIkXqnGbhatOYQWkJjKohoEfGw==
X-Received: by 2002:a05:6000:2585:b0:3a5:2dae:970c with SMTP id ffacd0b85a97d-3a56876b13dmr1880731f8f.37.1749805875958;
        Fri, 13 Jun 2025 02:11:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d74sm1791133f8f.10.2025.06.13.02.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:11:15 -0700 (PDT)
Message-ID: <d6031204-9bb5-4b0f-adf9-109b305e89e2@linaro.org>
Date: Fri, 13 Jun 2025 11:11:14 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/9] phy: exyons5-usbdrd: support HS combo phy for
 ExynosAutov920
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
 m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055053epcas5p377269bcc2c8567c00a2298d86c0d26a4@epcas5p3.samsung.com>
 <20250613055613.866909-6-pritam.sutar@samsung.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250613055613.866909-6-pritam.sutar@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy that supports both
> UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
> those only support the UTMI+ (HS) interface.
> 
> Support UTMI+ combo phy for this SoC which is somewhat simmilar to
> what the existing Exynos850 support does. The difference is that
> some register offsets and bit fields are defferent from Exynos850.
> 
> Add required change in phy driver to support combo HS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 202 +++++++++++++++++++++++
>   1 file changed, 202 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 15965b4c6f78..ac7bc1d1afd2 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -41,6 +41,13 @@
>   #define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
>   
>   #define EXYNOS2200_DRD_UTMI			0x10
> +
> +/* ExynosAutov920 bits */
> +#define UTMICTL_FORCE_UTMI_SUSPEND		BIT(13)
> +#define UTMICTL_FORCE_UTMI_SLEEP		BIT(12)
> +#define UTMICTL_FORCE_DPPULLDOWN		BIT(9)
> +#define UTMICTL_FORCE_DMPULLDOWN		BIT(8)
> +
>   #define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
>   #define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
>   
> @@ -250,6 +257,22 @@
>   #define EXYNOS850_DRD_HSP_TEST			0x5c
>   #define HSP_TEST_SIDDQ				BIT(24)
>   
> +#define EXYNOSAUTOV920_DRD_HSP_CLKRST		0x100
> +#define HSPCLKRST_PHY20_SW_PORTRESET		BIT(3)
> +#define HSPCLKRST_PHY20_SW_POR			BIT(1)
> +#define HSPCLKRST_PHY20_SW_POR_SEL		BIT(0)
> +
> +#define EXYNOSAUTOV920_DRD_HSPCTL		0x104
> +#define HSPCTRL_VBUSVLDEXTSEL			BIT(13)
> +#define HSPCTRL_VBUSVLDEXT			BIT(12)
> +#define HSPCTRL_EN_UTMISUSPEND			BIT(9)
> +#define HSPCTRL_COMMONONN			BIT(8)
> +
> +#define EXYNOSAUTOV920_DRD_HSP_TEST		0x10c
> +
> +#define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
> +#define HSPPLLTUNE_FSEL				GENMASK(18, 16)
> +
>   /* Exynos9 - GS101 */
>   #define EXYNOS850_DRD_SECPMACTL			0x48
>   #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
> @@ -2025,6 +2048,182 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static void
> +exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	/*
> +	 * Disable HWACG (hardware auto clock gating control). This
> +	 * forces QACTIVE signal in Q-Channel interface to HIGH level,
> +	 * to make sure the PHY clock is not gated by the hardware.
> +	 */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= LINKCTRL_FORCE_QACT;
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	/* De-assert link reset */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> +	reg &= ~CLKRST_LINK_SW_RST;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> +
> +	/* Set PHY POR High */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +	reg |= HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_POR_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +
> +	/* Enable UTMI+ */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg &= ~(UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP |
> +		UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	/* set phy clock & control HS phy */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +	reg |= HSPCTRL_EN_UTMISUSPEND | HSPCTRL_COMMONONN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +
> +	usleep_range(100, 105);
> +
> +	/* Set VBUS Valid and DP-Pull up control by VBUS pad usage */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg |= EXYNOS2200_UTMI_FORCE_VBUSVALID | EXYNOS2200_UTMI_FORCE_BVALID;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +	reg |= HSPCTRL_VBUSVLDEXTSEL | HSPCTRL_VBUSVLDEXT;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
> +
> +	/* Setting FSEL for refference clock */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> +	reg &= ~HSPPLLTUNE_FSEL;
> +	switch (phy_drd->extrefclk) {
> +	case EXYNOS5_FSEL_50MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 7);
> +		break;
> +	case EXYNOS5_FSEL_26MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 6);
> +		break;
> +	case EXYNOS5_FSEL_24MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 2);
> +		break;
> +	case EXYNOS5_FSEL_20MHZ:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 1);
> +		break;
> +	case EXYNOS5_FSEL_19MHZ2:
> +		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 0);
> +		break;
> +	default:
> +		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
> +			 phy_drd->extrefclk);
> +		break;
> +	}
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
> +
> +	/* Enable PHY Power Mode */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> +	reg &= ~HSP_TEST_SIDDQ;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> +
> +	/* before POR low, 10us delay is needed to Finish PHY reset */
> +	usleep_range(10, 15);
> +
> +	/* Set PHY POR Low */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +	reg |= HSPCLKRST_PHY20_SW_POR_SEL;
> +	reg &= ~(HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_PORTRESET);
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
> +
> +	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
> +	usleep_range(75, 80);
> +
> +	/* force pipe3 signal for link */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg |= LINKCTRL_FORCE_PIPE_EN;
> +	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
> +	reg |= LINKCTRL_FORCE_RXELECIDLE;
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +}
> +
> +static void
> +exynosautov920_usbdrd_hsphy_disable(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	u32 reg;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +
> +	/* set phy clock & control HS phy */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
> +	reg |= UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP;
> +	reg &= ~(UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
> +	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
> +
> +	/* Disable PHY Power Mode */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> +	reg |= HSP_TEST_SIDDQ;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
> +
> +	/* clear force q-channel */
> +	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> +	reg &= ~LINKCTRL_FORCE_QACT;
> +	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	/* link sw reset is need for USB_DP/DM high-z in host mode */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> +	reg |= CLKRST_LINK_SW_RST;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
> +}
> +
> +static int exynosautov920_usbdrd_phy_init(struct phy *phy)
> +{
> +	return exynos850_usbdrd_phy_init(phy);
> +}
> +
> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
> +	int ret = 0;
> +
> +	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
> +	if (ret)
> +		return ret;
> +
> +	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
> +		exynosautov920_usbdrd_hsphy_disable(phy_drd);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops exynosautov920_usb31drd_phy_ops = {
> +	.init		= exynosautov920_usbdrd_phy_init,
> +	.exit		= exynosautov920_usbdrd_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct
> +exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	= exynosautov920_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_hsphy = {
> +	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usb31drd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +};
> +
>   static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
>   	.init		= exynos850_usbdrd_phy_init,
>   	.exit		= exynos850_usbdrd_phy_exit,
> @@ -2250,6 +2449,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos850-usbdrd-phy",
>   		.data = &exynos850_usbdrd_phy
> +	}, {
> +		.compatible = "samsung,exynosautov920-usbdrd-hsphy",
> +		.data = &exynosautov920_usbdrd_hsphy
>   	}, {
>   		.compatible = "samsung,exynosautov920-usbdrd-phy",
>   		.data = &exynosautov920_usbdrd_phy

With the subject fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
