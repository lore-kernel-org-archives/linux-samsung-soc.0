Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28616280CC8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805917; cv=none; b=OiefZPeF6slDCDVMGt0A+V9OAPPtFItmL694jcdH5PbQrZ7dowy/eTloHraMOM+XKGa65eQK3enHeGVN1bmIWgnPA5k1diGg/rrUk+fHSgF0PadGI3yKaAVIcX3s3BzE4x3878ftyEG9hZ+VW4bXPV0Z+vyeAk0fsfKyoIxOU74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805917; c=relaxed/simple;
	bh=wXufrWAcxJYyZmYsGzBHc0tDzqpB192+ayTv3t3LVi8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c9zIqZAe8czMP4XSLJuvtV6sz76mWW96TSUQOLN3OgO3PWs5pEyul0AAKaYSUhoD+gzs8EIm9P4+/eUAv5nfqd3tjZ7URR68EDF+pcNR6aMLo31aI/z5d/5vxhtCJxkWkbHThdia3NFEWNK0NJ5CiNbEATn1Xjd2xkvsJrq8WNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uDkBGS1d; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uDkBGS1d"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a52874d593so1819961f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805910; x=1750410710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ozLG9TWXlp500cW1lxmO9NrJcYLPAvisq6GBk6D5d4=;
        b=uDkBGS1dSfLBlsF2T2x4ZafGa8MTRSdvY5aCB8cV845oLz2sQYRjugK8TWc98StYY9
         64K+Fo/nzfuHoeArF+Wpu9cN8H/wJ3M+BlTzjuNMqAl5A5cuCB47HBwMmh3AudgnhVic
         1MIakgdkaf1YaDWSjumXc7RZnxNs9Xzt5DOMElgu9Js1T2lVP/f+Q4PlTL9yvXtIfYhE
         PNAWUcdl7F5XPUXj5C7LZ/EEEgtE9UHCAq6ePclQcUXjHgGZdAJuPBk51x/uQk0joazh
         c4s3gAn1RFCwYMImJ8HBvX4ro/1Smz1b1KpCYBVd9VVbY6bnXVHjG2gQgj9xP2nBltNK
         fN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805910; x=1750410710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ozLG9TWXlp500cW1lxmO9NrJcYLPAvisq6GBk6D5d4=;
        b=v+xwOB2NWXvRvM2eLU7WmoOJ6S+/f/WfoogVJdI489cGZXUADufraV64aYtOFG9UWl
         2p35RifHCxde+bLKUL2aRB4hdYsgMlgT423feurZyC1JGCpb+IkuIwoY8aOv9g2HYVBn
         Hw0gs+5oRai9q8gjJt2vJSlFD1uoSPPXO8kwPkTh5pwBm6lYz3bxOG6dyFFPt+eyMXFh
         AsLgFAL17JqaDPre4szn5rpvt7nwBT3h8qwJZEo6at1yl+rVU3t3KC7qK1alb+ylNUIa
         svRS8udUabKFrDFmTSuCkEXwsEeIlGSkPAqSwqXSS+dQM8WQ+UtqNy+NnRGaGDANcdHa
         AFWw==
X-Forwarded-Encrypted: i=1; AJvYcCUb4zYfliHaAosLauXVFwqNgttm6PSY3nqh87ZRy0F+sR2jXS5e4IqxAKIYAeLVHaBz8+Tt5rWm5wTBOe1u4kQQmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHADucJOKbfc3dtim/PmYZrlqX859hjV4N3rVRZpBypXoqhroN
	Sgzegs34mlD1cBcluRJRBfB6/UzfVyAuPnpqPe+oMwje0CnJwde8Sf+DaSMrHx9ijH8=
X-Gm-Gg: ASbGncuZZfLnfKW/exjk/FdVpQi60EWlBHP/3Hqu6UgNJnflyZ543rSACrJN3eyhw/s
	jbw2B3SnXOBkMwVzgFpJXKalB/ImQ+FKnkDoli+KKN/qb1Hy54nQdKDYLSartj71YYTLwXvHhd3
	ERQKQfreS3Sz+eUDMCYMO3aAYllhPBRhp7bwoEsscfbTcOnOJ2CSo9SZFjEe1WoKwkkVBMGglHp
	YhGK8xPkDKSrwFup3NdLU0ZoFFZG9ICo7dT5ZEr0UPD/aLGN2kh3zhHfymo86qS6Jpn0nxmTVww
	30QKT9BnqzdvzxCfHD3munN9iqLIzzt35wdVdthmXE9xh96nEdnjM7smi372isvK94rb7oO200G
	f0++f+1udbRxFDkqQwtdgIl/XpKPWJ2Jxfdipq8w=
X-Google-Smtp-Source: AGHT+IE7zzs25YomGG0GJ6Odvys+iqo9vej97SNc1R9zS14YSI75oBU9F4KxDKgapuN6gQnKxG76Sw==
X-Received: by 2002:a05:6000:2504:b0:3a4:eed7:15f2 with SMTP id ffacd0b85a97d-3a56877b818mr2212745f8f.43.1749805910360;
        Fri, 13 Jun 2025 02:11:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25ec9fsm45098505e9.34.2025.06.13.02.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:11:49 -0700 (PDT)
Message-ID: <40033b4b-15da-41e4-98c3-2b5f19a8a5a7@linaro.org>
Date: Fri, 13 Jun 2025 11:11:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 8/9] phy: exyons5-usbdrd: support SS combo phy for
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
 <CGME20250613055102epcas5p44f66699e2e1f3896948b71819ffea181@epcas5p4.samsung.com>
 <20250613055613.866909-9-pritam.sutar@samsung.com>
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
In-Reply-To: <20250613055613.866909-9-pritam.sutar@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> This SoC has a DWC3 compatible link controller and single USB 3.1 DRD
> combo phy that supports both UTMI+ (HS) and PIPE3 (SS) and three USB2.0
> DRD HS phy controllers those only support the UTMI+ (HS) interface.
> 
> Combo phy is combination of two phys. Among these phys, one supports
> USB3.1 SSP+(10Gbps) protocol and is backwards compatible to the
> USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required to support
> USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
> 
> Add required change in phy driver to support combo SS phy for this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 310 ++++++++++++++++++++++-
>   1 file changed, 306 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index ac7bc1d1afd2..97a4f67b0958 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -273,6 +273,36 @@
>   #define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
>   #define HSPPLLTUNE_FSEL				GENMASK(18, 16)
>   
> +/* ExynosAutov920 phy usb31drd port reg */
> +#define EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL	0x000
> +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN	BIT(5)
> +#define PHY_RST_CTRL_PIPE_LANE0_RESET_N		BIT(4)
> +#define PHY_RST_CTRL_PHY_RESET_OVRD_EN		BIT(1)
> +#define PHY_RST_CTRL_PHY_RESET			BIT(0)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0	0x0004
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR		GENMASK(31, 16)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK		BIT(8)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK		BIT(4)
> +#define PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL		BIT(0)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1	0x0008
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2	0x000c
> +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN		BIT(0)
> +#define PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA		GENMASK(31, 16)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0	0x100
> +#define PHY_CONFIG0_PHY0_PMA_PWR_STABLE		BIT(14)
> +#define PHY_CONFIG0_PHY0_PCS_PWR_STABLE		BIT(13)
> +#define PHY_CONFIG0_PHY0_ANA_PWR_EN		BIT(1)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7	0x11c
> +#define PHY_CONFIG7_PHY_TEST_POWERDOWN		BIT(24)
> +
> +#define EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4	0x110
> +#define PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN	BIT(2)
> +
>   /* Exynos9 - GS101 */
>   #define EXYNOS850_DRD_SECPMACTL			0x48
>   #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
> @@ -2048,6 +2078,237 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static void
> +exynosautov920_usb31drd_cr_clk(struct exynos5_usbdrd_phy *phy_drd, bool high)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg = 0;
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	if (high)
> +		reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +	else
> +		reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	usleep_range(1, 2);
> +}
> +
> +static void
> +exynosautov920_usb31drd_port_phy_ready(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	struct device *dev = phy_drd->dev;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	static const unsigned int timeout_us = 20000;
> +	static const unsigned int sleep_us = 40;
> +	u32 reg = 0;
> +	int err;
> +
> +	/* Clear cr_para_con */
> +	reg &= ~(PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> +			PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR);
> +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON1);
> +	writel(0x0, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +
> +	exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +	exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +
> +	/*
> +	 * The maximum time from phy reset de-assertion to de-assertion of
> +	 * tx/rx_ack can be as high as 5ms in fast simulation mode.
> +	 * Time to phy ready is < 20ms
> +	 */
> +	err = readl_poll_timeout(reg_phy +
> +				EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0,
> +			reg, !(reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK),
> +			sleep_us, timeout_us);
> +	if (err)
> +		dev_err(dev, "timed out waiting for rx/tx_ack: %#.8x\n", reg);
> +
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +}
> +
> +static void
> +exynosautov920_usb31drd_cr_write(struct exynos5_usbdrd_phy *phy_drd,
> +				 u16 addr, u16 data)
> +{
> +	struct device *dev = phy_drd->dev;
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 cnt = 0;
> +	u32 reg = 0;
> +
> +	/* Pre Clocking */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	reg |= PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/*
> +	 * tx clks must be available prior to assertion of tx req.
> +	 * tx pstate p2 to p0 transition directly is not permitted.
> +	 * tx clk ready must be asserted synchronously on tx clk prior
> +	 * to internal transmit clk alignment sequence in the phy
> +	 * when entering from p2 to p1 to p0.
> +	 */
> +	do {
> +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +		cnt++;
> +	} while (cnt < 15);
> +
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/*
> +	 * tx data path is active when tx lane is in p0 state
> +	 * and tx data en asserted. enable cr_para_wr_en.
> +	 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +	reg &= ~PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA;
> +	reg |= FIELD_PREP(PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_DATA, data) |
> +		PHY_CR_PARA_CON2_PHY0_CR_PARA_WR_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON2);
> +
> +	/* write addr */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +	reg &= ~PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR;
> +	reg |= FIELD_PREP(PHY_CR_PARA_CON0_PHY0_CR_PARA_ADDR, addr) |
> +		PHY_CR_PARA_CON0_PHY0_CR_PARA_CLK |
> +		PHY_CR_PARA_CON0_PHY0_CR_PARA_SEL;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +
> +	/* check cr_para_ack*/
> +	cnt = 0;
> +	do {
> +		/*
> +		 * data symbols are captured by phy on rising edge of the
> +		 * tx_clk when tx data enabled.
> +		 * completion of the write cycle is acknowledged by assertion
> +		 * of the cr_para_ack.
> +		 */
> +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> +		reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> +		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
> +			break;
> +
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +
> +		/*
> +		 * wait for minimum of 10 cr_para_clk cycles after phy reset
> +		 * is negated, before accessing control regs to allow for
> +		 * internal resets.
> +		 */
> +		cnt++;
> +	} while (cnt < 10);
> +
> +	if (cnt == 10)
> +		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);
> +	else
> +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> +}
> +
> +static void
> +exynosautov920_usb31drd_phy_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +	reg &= ~PHY_RST_CTRL_PHY_RESET_OVRD_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +	if (val)
> +		reg |= PHY_RST_CTRL_PHY_RESET;
> +	else
> +		reg &= ~PHY_RST_CTRL_PHY_RESET;
> +
> +	reg |= PHY_RST_CTRL_PHY_RESET_OVRD_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +}
> +
> +static void
> +exynosautov920_usb31drd_lane0_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +	reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +	if (val)
> +		reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N;
> +	else
> +		reg |= PHY_RST_CTRL_PIPE_LANE0_RESET_N;
> +
> +	reg &= ~PHY_RST_CTRL_PIPE_LANE0_RESET_N_OVRD_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
> +}
> +
> +static void
> +exynosautov920_usb31drd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	/*
> +	 * Phy and Pipe Lane reset assert.
> +	 * assert reset (phy_reset = 1).
> +	 * The lane-ack outputs are asserted during reset (tx_ack = rx_ack = 1)
> +	 */
> +	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
> +	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
> +
> +	/*
> +	 * ANA Power En, PCS & PMA PWR Stable Set
> +	 * ramp-up power suppiles
> +	 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
> +	reg |= PHY_CONFIG0_PHY0_ANA_PWR_EN | PHY_CONFIG0_PHY0_PCS_PWR_STABLE |
> +		PHY_CONFIG0_PHY0_PMA_PWR_STABLE;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG0);
> +
> +	usleep_range(10, 15);
> +
> +	/*
> +	 * phy is not functional in test_powerdown mode, test_powerdown to be
> +	 * de-asserted for normal operation
> +	 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
> +	reg &= ~PHY_CONFIG7_PHY_TEST_POWERDOWN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
> +
> +	/*
> +	 * phy reset signal be asserted for minimum 10us after power
> +	 * supplies are ramped-up
> +	 */
> +	usleep_range(10, 15);
> +
> +	/*
> +	 * Phy and Pipe Lane reset assert de-assert
> +	 */
> +	exynosautov920_usb31drd_phy_reset(phy_drd, 0);
> +	exynosautov920_usb31drd_lane0_reset(phy_drd, 0);
> +
> +	/* Pipe_rx0_sris_mode_en  = 1 */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
> +	reg |= PHY_CONFIG4_PIPE_RX0_SRIS_MODE_EN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG4);
> +
> +	/*
> +	 * wait for lane ack outputs to de-assert (tx_ack = rx_ack = 0)
> +	 * Exit from the reset state is indicated by de-assertion of *_ack
> +	 */
> +	exynosautov920_usb31drd_port_phy_ready(phy_drd);
> +
> +	/* override values for level settings */
> +	exynosautov920_usb31drd_cr_write(phy_drd, 0x22, 0x00F5);
> +}
> +
>   static void
>   exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
>   {
> @@ -2142,12 +2403,15 @@ exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
>   	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
>   	usleep_range(75, 80);
>   
> -	/* force pipe3 signal for link */
> +	/* Disable forcing pipe interface */
>   	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
> -	reg |= LINKCTRL_FORCE_PIPE_EN;
> -	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
> -	reg |= LINKCTRL_FORCE_RXELECIDLE;
> +	reg &= ~LINKCTRL_FORCE_PIPE_EN;
>   	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
> +
> +	/* Pclk to pipe_clk */
> +	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
> +	reg |= EXYNOS2200_CLKRST_LINK_PCLK_SEL;
> +	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
>   }
>   
>   static void
> @@ -2183,6 +2447,22 @@ static int exynosautov920_usbdrd_phy_init(struct phy *phy)
>   	return exynos850_usbdrd_phy_init(phy);
>   }
>   
> +static void
> +exynosautov920_usb31drd_ssphy_disable(struct exynos5_usbdrd_phy *phy_drd)
> +{
> +	void __iomem *reg_phy = phy_drd->reg_phy;
> +	u32 reg;
> +
> +	/* 1. Assert reset (phy_reset = 1) */
> +	exynosautov920_usb31drd_lane0_reset(phy_drd, 1);
> +	exynosautov920_usb31drd_phy_reset(phy_drd, 1);
> +
> +	/* phy test power down */
> +	reg = readl(reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
> +	reg |= PHY_CONFIG7_PHY_TEST_POWERDOWN;
> +	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
> +}
> +
>   static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
>   {
>   	struct phy_usb_instance *inst = phy_get_drvdata(phy);
> @@ -2195,18 +2475,37 @@ static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
>   
>   	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
>   		exynosautov920_usbdrd_hsphy_disable(phy_drd);
> +	else if (inst->phy_cfg->id == EXYNOS5_DRDPHY_PIPE3)
> +		exynosautov920_usb31drd_ssphy_disable(phy_drd);
>   
>   	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
>   
>   	return 0;
>   }
>   
> +static const struct
> +exynos5_usbdrd_phy_config usb31drd_phy_cfg_exynosautov920[] = {
> +	{
> +		.id		= EXYNOS5_DRDPHY_PIPE3,
> +		.phy_init	= exynosautov920_usb31drd_pipe3_init,
> +	},
> +};
> +
>   static const struct phy_ops exynosautov920_usb31drd_phy_ops = {
>   	.init		= exynosautov920_usbdrd_phy_init,
>   	.exit		= exynosautov920_usbdrd_phy_exit,
>   	.owner		= THIS_MODULE,
>   };
>   
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_ssphy = {
> +	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
> +	.phy_ops		= &exynosautov920_usb31drd_phy_ops,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +};
> +
>   static const struct
>   exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
>   	{
> @@ -2455,6 +2754,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynosautov920-usbdrd-phy",
>   		.data = &exynosautov920_usbdrd_phy
> +	}, {
> +		.compatible = "samsung,exynosautov920-usb31drd-ssphy",
> +		.data = &exynosautov920_usb31drd_ssphy
>   	},
>   	{ },
>   };

With the subject fix:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
