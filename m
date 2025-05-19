Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F663278E79
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659533; cv=none; b=a9dFdN9QL1v60YZyQKnBwslTd0WEKmBqrd8wGi/chc7t3UvN/Yo8btgCSwH19Rn9C2bSMB0YlLkjIdteL2ajRABI0sDI1xkyo6vmpdTGDLEp1FJfCbvoF/ZKNrWWNX2tcU1ckhpLb9Wxn+Zbul+1pF9yHW7HcpcHSJcZ33TIQRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659533; c=relaxed/simple;
	bh=Vv3Q70AU7dfNnHPVeuV/+a/UgXM5GhdvKCfzwHZA8CE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JnUu45OkGdN5R6p6yy659/uNs6cBVGgcrz+iqpg8MY+YF+XLx1LkFGzCPl74yRlp3ObTf3grs9WJR1VLip341rAQhJLYOdYM0wQyEHhJqukky7p9vmZHh1EhpwQz3CaGyPPC7XSL6gJo8Qn9IusE03Lz86IcIH5UpnUsXfgIEjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2bqKB8j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2bqKB8j"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso32117265e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747659528; x=1748264328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDAeoWtbnKB6P/zjHBNTMfXxf0ibh6HhQEV5pECfZLA=;
        b=l2bqKB8j+lwaPMv08B89aPd9QiOt5s/GTummpLIS7NjZCzkkAfXTC9QOKbVO9p0yHx
         MhlgUqLHSQROP6sj6jEg11v6NB7ny4qiTAedPEwePGZwNaxxDfhvHFzmn2BRIaF/aZAn
         jTllDW9fhdMSSS9EzA2kBHExiA7T3VEqEdD8/rgxk2VJINo6HAxWltgYPPH/NNaZ2G89
         xtLzrPn87N4WwyVXTKCQrfazUwDyY0A+x5bYflBdnEbwmkxWbGsMZecEwuDRfdIFP7io
         pbP5PqcVdL7eAjU9DSKO+GGX2WOjheX7zBHxa8cd6dsRYwRqVQ5+3NFgYO3fJl+ETW5W
         Lk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747659528; x=1748264328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xDAeoWtbnKB6P/zjHBNTMfXxf0ibh6HhQEV5pECfZLA=;
        b=bmnBoB5enbg3ybL8u6cbNK4mGvKWHddL7nwy6GaUwJCgEJQegx6dSKVU2T6IssrvHK
         Sw28I69Fwo4TOzfJRPva1mZcfANJ0uo0LXLqQmOwU1uKB2qtvRRvo+ukRXOoq4NGPb/z
         2x7fR8kDlT9YPUGTOM3P16LVQDRspGLp1vgtCztBXJn6ml50kykPfxRirAZJ7qTNlt+p
         d7NNh7lxeDtjCPM32THH1WdACjsz/7FpmexeKhfZS08WcXZH+HWrRddqzCcRW5XpL+eR
         2M1n6MaTRAoXpps6mTm8oDfalS0gJoDwGp6gdAaDOHvrTEC14VeOWl8eSp2Y9Zt7GfCj
         ht4A==
X-Forwarded-Encrypted: i=1; AJvYcCUk1lr2kI0k4e11u81di8imzIA5RjUXuOjTT4oZiHQeRH+prAaRMkdjMoE72lM2WaPCg8sHFRNQ6wOlTssas5mMhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx150ksuiOeE9Q+gFP7WgKep07APBwloNQFQJWpnrDpjNmyqPdP
	66qq34RsQzSApKMxea2LvsVW9oiMywaLK8/T+4YkRV3h5i99YfAVwlpzWcDtwUNq5a4=
X-Gm-Gg: ASbGncsytjWv+aMsbT5Y6hvDQPvpWcOuFAOddTpLZ4zjYWOUs8X+urj9IvHcZ6N6SlC
	OrDJPaln9LnQbnoONzOXYuDpL1aE+LO94zyuGBl351MEREdkyYXRE8hHayTy6LLItzNSZHjaV9F
	08I9r2iEJaWHpE4ah3DoVdflDjDMvgiXPayMeQoOBvQwkCvPKyV26Zipm8D1FSxFCNjDhI44mUt
	9MYZQm757pM31Wncqj8XV+dCvoGEoU7q5H63IA+/BOAZW4X3N+Sr+Yja0BG8/EBnnXOAcA7+Gya
	qfRF/ZwfaM5v5KVoUPu1G9p0PiWq13bZQyrRZnUGCRpm31vtzSlEsbOPCom/q4iFGBoG/yWa07G
	a+uZfjyOkNT1haWuuD+rgHCmtUuRL
X-Google-Smtp-Source: AGHT+IE2jbS/WrOWl6VOpZZrzWvyYrqiY2DC7a8nSQu7OpS2BKTDXTieUo3VSWC+NsQLBWWeGzDgow==
X-Received: by 2002:a5d:64ee:0:b0:3a0:b23c:15b9 with SMTP id ffacd0b85a97d-3a35c808c9fmr10886861f8f.4.1747659528291;
        Mon, 19 May 2025 05:58:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18? ([2a01:e0a:3d9:2080:ce80:58bb:54b7:ad18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6265fsm12524381f8f.43.2025.05.19.05.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 05:58:47 -0700 (PDT)
Message-ID: <491d2d64-b06f-43ec-ba74-a623613beec6@linaro.org>
Date: Mon, 19 May 2025 14:58:47 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] phy: exynos5-usbdrd: Add support for the Exynos990
 usbdrd phy
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
 <20250515-usb-resends-may-15-v3-2-ad33a85b6cee@mentallysanemainliners.org>
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
In-Reply-To: <20250515-usb-resends-may-15-v3-2-ad33a85b6cee@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/2025 16:43, Igor Belwon wrote:
> The Exynos990 usbdrd PHY is a combo PHY which supports USB SS, HS and
> DisplayPort outputs. This commit adds support only for UTMI+ (USB HS).
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   drivers/phy/samsung/phy-exynos5-usbdrd.c    | 32 +++++++++++++++++++++++++++++
>   include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 917a76d584f0856f1e445630e2cf97b3c3e46b13..dd660ebe80458a13413ca9735339b4e1095af8ea 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2025,6 +2025,35 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>   };
>   
> +static const struct exynos5_usbdrd_phy_tuning exynos990_tunes_utmi_postinit[] = {
> +	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
> +			     (HSPPARACON_TXVREF |
> +			      HSPPARACON_TXPREEMPAMP | HSPPARACON_SQRX |
> +			      HSPPARACON_COMPDIS),
> +			     (FIELD_PREP_CONST(HSPPARACON_TXVREF, 7) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPAMP, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_SQRX, 5) |
> +			      FIELD_PREP_CONST(HSPPARACON_COMPDIS, 7))),
> +	PHY_TUNING_ENTRY_LAST
> +};
> +
> +static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
> +	[PTS_UTMI_POSTINIT] = exynos990_tunes_utmi_postinit,
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
> +	.phy_cfg		= phy_cfg_exynos850,
> +	.phy_ops		= &exynos850_usbdrd_phy_ops,
> +	.phy_tunes		= exynos990_tunes,
> +	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
> +	.clk_names		= exynos5_clk_names,
> +	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
> +	.core_clk_names		= exynos5_core_clk_names,
> +	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
> +	.regulator_names	= exynos5_regulator_names,
> +	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
> +};
> +
>   static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
>   	{
>   		.id		= EXYNOS5_DRDPHY_UTMI,
> @@ -2228,6 +2257,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos850-usbdrd-phy",
>   		.data = &exynos850_usbdrd_phy
> +	}, {
> +		.compatible = "samsung,exynos990-usbdrd-phy",
> +		.data = &exynos990_usbdrd_phy
>   	},
>   	{ },
>   };
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
> index 1a2c0e0838f99821151661878f022f2129a0c19b..7754697e581077ec0fd60b63649728896ca145c9 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -662,6 +662,9 @@
>   #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
>   #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
>   
> +/* For Exynos990 */
> +#define EXYNOS990_PHY_CTRL_USB20				(0x72C)
> +
>   /* For Tensor GS101 */
>   /* PMU ALIVE */
>   #define GS101_SYSIP_DAT0					(0x810)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
