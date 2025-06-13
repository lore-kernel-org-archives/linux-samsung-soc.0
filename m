Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F01279DA8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806326; cv=none; b=ANbz88/mjgmDrwjf6wBy2y14D0BxHqSarA+WFDeKFZcZIPNo5Jg0CS9ZWv0ImW2j/YNPbvrZQj08gyC+8YTP40/47iVtDfUEm+q3cyjQMGx+pOm61EgPvyyvB23y3gux/ABMhX3LWiUt/L9EO2cYLcASNEPJnSikds0WUawkhjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806326; c=relaxed/simple;
	bh=wNSRut0sTN6qfD7rKMY0nSX8URxRcKLIVnKCHfd9jhY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UAyJgejFCFrzn50RWRlcjmttojxfy+mDavOVEoHh1s03IsGDApfZiBKcgioGCxw6Ja5Odp98JknEbbvdqgKinDBjyD5M592nIe4pwsGJfXCvl9niZbh1Op0rXAaF7r+v6+UrTfgsVWy1g7XufJDqVDk993QfOWQteOgFKSKXRSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jvprU0rU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvprU0rU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so10446145e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806323; x=1750411123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvOAxba2/00VE8ZUtElUxztZVVpqTN92ajrYDHddxwI=;
        b=jvprU0rUum5QMEvO+ttE7zxeIUqDplX8QeidSP5oXyyBxKGVSgAS8NmqZrMV/bZciq
         sUhLmTEmCvx22euRnW3jcDawa2X+dN4YfGZzZ4H0P4kW5mo+j98j2da2H44RrK77BnPd
         NgBDT5UbA2OC9D7BC4VvaXFDSK3foAZEP5qwetnKA+D0jbL4Mfp/yyqbLAT9foUXnAwM
         ZrUD8+UBG9Q4ufhVJiDhQ2PxQGx+mu6HSp8ZPjw8/AHy/0xYbTflDHqAccz2yz7tL0oN
         RewUZgz8qTcyPdhi0rMMy5MjTdwjb4xYnMnbAKlnoQMRdcr3JVQP/1qHUpHyO8UHGLAo
         6jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806323; x=1750411123;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rvOAxba2/00VE8ZUtElUxztZVVpqTN92ajrYDHddxwI=;
        b=hghNHRAV8IZroy00vDw8h0xzgTOs2pz7d8JDIbFERYYl+BrxDndP/qp2MVeOCIGt6B
         CjcpfF5YtM0H3D9IG7hFEWZtAX59i1VadvvwyhRPkGpfS8O8fBNzyJp10CVrIgXXZzbO
         5ZrFToSPk7y7LInVFDlJoTy3yRJS27BNaxu6YECyXLMnVUAUUMsvOWS3LKWIsELlvVhz
         W6exVsH/NrCoW/u6p+AozB8RuB0gIVxNNkeUNnJvDL0l+Wey2Wn+NB7E7Y9MBCbiebVv
         W5zRLFVp8JkZUr005V25VKWd23bPmTHQrgqIl9gPYpjN/bFHFYJmfrH/vdPHEKtH8esD
         STLA==
X-Forwarded-Encrypted: i=1; AJvYcCVqvtQ+lD9vw+TgNw2YDTzCR0tUzMd56qdZvQFgztA78fXHpIPflPX6jzwSKkgbjaH1rSRuT0xTk3wFbO0Vpcb0uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxtPZR8mZ8dPQ9NsWO9d/1bH+eNgBZ4P7fdpJz1jrlAjvsz/Qp
	WdLqowxyd3nvFsyjPK93qipXE5NwnJOAAUJFjnHWVMnmATjM9JYutipVZP21JCnAT2Q7cpmZhyJ
	FnaP84XQ=
X-Gm-Gg: ASbGncvJXXsheD8Al8mni56s//ioV5M0gpxdeUevbxswkg2sCe1VmhCCHF6XlQt4TCo
	7pwbEzCl+Y7KkNkWjls3Nw8wXXrsKSbp0z8ZFr0czoEHIMk9eoVBsbi8VVV8O+KC1kUSy9wMqjF
	IcgFKMezBHAOLKKHjmkrbA1/pJ63+dnUxkjaPoKgJ2YELMo71UthrgsWKqiTgiNsJl2wkJqJneO
	nmm63m6qdkRXVAJK/pBCRShYvQtapAOlSA6stBxJAWuagjbUjpBT/tpZO4OPgagepLu4JdtLrwD
	wsFCnz/wkThSOclOwjnZhLEyts8fGJ7AsOurFToXmHvQUImm+BcFkhLOI8EoY/KJOcb1SK2G0J7
	obKydVSNPQdkL8luIhxZlIkSM+J1/d537cfDzrYs=
X-Google-Smtp-Source: AGHT+IF88GdW/9+83jn7KWBiIwltmYkzKMHV54Iv3aLyXMYm3AtrpaFf6Fm3vYfY7PC7NerjrZzM+A==
X-Received: by 2002:a05:600c:348a:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-45334b7a9fdmr21567635e9.29.1749806322733;
        Fri, 13 Jun 2025 02:18:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b6debasm1768202f8f.93.2025.06.13.02.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:18:42 -0700 (PDT)
Message-ID: <4f30104b-aea6-4820-9b08-047297da149a@linaro.org>
Date: Fri, 13 Jun 2025 11:18:41 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] phy: exynos-mipi-video: introduce support for
 exynos7870
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
 <20250612-exynos7870-mipi-phy-v1-2-3fff0b62d9d3@disroot.org>
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
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-2-3fff0b62d9d3@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2025 17:09, Kaustabh Chakraborty wrote:
> Add support for Exynos7870 in the existing MIPI CSIS/DSIM driver. The
> SoC has one DSIM phy and three CSIS phys.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>   drivers/phy/samsung/phy-exynos-mipi-video.c | 52 +++++++++++++++++++++++++++++
>   include/linux/soc/samsung/exynos-regs-pmu.h |  5 +++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
> index f6756a609a9a0774ecb6e27cf96726891683636c..b184923b9b400f0d536a913bdf32f3156c0a1854 100644
> --- a/drivers/phy/samsung/phy-exynos-mipi-video.c
> +++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
> @@ -213,6 +213,55 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
>   	},
>   };
>   
> +static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
> +	.num_regmaps = 3,
> +	.regmap_names = {
> +		"samsung,pmu-syscon",
> +		"samsung,disp-sysreg",
> +		"samsung,cam-sysreg"
> +	},
> +	.num_phys = 4,
> +	.phys = {
> +		{
> +			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
> +			.enable_val = EXYNOS4_PHY_ENABLE,
> +			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(0),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
> +		}, {
> +			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
> +			.enable_val = EXYNOS4_PHY_ENABLE,
> +			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(0),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
> +		}, {
> +			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
> +			.enable_val = EXYNOS4_PHY_ENABLE,
> +			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL1,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(1),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
> +		}, {
> +			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
> +			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
> +			.enable_val = EXYNOS4_PHY_ENABLE,
> +			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL2,
> +			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
> +			.resetn_val = BIT(2),
> +			.resetn_reg = 0,
> +			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
> +		},
> +	},
> +};
> +
>   struct exynos_mipi_video_phy {
>   	struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
>   	int num_phys;
> @@ -351,6 +400,9 @@ static const struct of_device_id exynos_mipi_video_phy_of_match[] = {
>   	}, {
>   		.compatible = "samsung,exynos5433-mipi-video-phy",
>   		.data = &exynos5433_mipi_phy,
> +	}, {
> +		.compatible = "samsung,exynos7870-mipi-video-phy",
> +		.data = &exynos7870_mipi_phy,
>   	},
>   	{ /* sentinel */ },
>   };
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
> index 1a2c0e0838f99821151661878f022f2129a0c19b..8fd59994bca76a6bf21306337f0b47ccb5a22adc 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -662,6 +662,11 @@
>   #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
>   #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
>   
> +/* For Exynos7870 */
> +#define EXYNOS7870_MIPI_PHY_CONTROL0				(0x070c)
> +#define EXYNOS7870_MIPI_PHY_CONTROL1				(0x0714)
> +#define EXYNOS7870_MIPI_PHY_CONTROL2				(0x0734)
> +
>   /* For Tensor GS101 */
>   /* PMU ALIVE */
>   #define GS101_SYSIP_DAT0					(0x810)
> 

Looks good:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
