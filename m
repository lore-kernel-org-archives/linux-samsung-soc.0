Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107B2279DC1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805951; cv=none; b=JDneFggX0mry0PMiDaDilUTtY/v2rkVywJrqoD/s0rfWJ+RLvWzelrI47JYe8BQ6Z0LXb2xzKG7uI9z1MNvcZRyTNOvsoEmIQtmG6SC92P1ShBqc2xsKhSqWm2xTR+AzJt122Hc+E1GBi7ijHpYpJzaqx83VcZkFPNEkLOjB9GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805951; c=relaxed/simple;
	bh=rhBgtIz5rbF4vZpFi/4hzu5iAms/cKtPyMWFvJqcEMU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eGLyZcO4ZhXX4T4L2A0Suce7htV5EXFQAenhcJ4eYZ3pvWlaGz8XGrzkrCQM2Hla06Mgp5LGYVKxaDTSscXQCk2aalDGYvlHuOLW8RZqWx7JpZMJS7U/KKvPGS9BHraR4RT1Kv7+8IuxUuzw/aHifxaJSFgOd/xByWpbUUXOkVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V8tlO3Sw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V8tlO3Sw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cf214200so16153965e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 02:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805948; x=1750410748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaEX4dDgKDNxKZX0+vcnih4XjDWoAZY8oCSw4SAHFH8=;
        b=V8tlO3SwRlknI3jgXnyOSk6WaUnBTGw00l5DTX5LpBcwuZJHrn0w+R/AEUY2FKjh7i
         0F7zqd0bRK00EWKdkW678WFj8m+bhB+nqKQUrYeyNb1roJVvsApTqAYm+w2E4nLKp5tF
         E/qmK+Ml4eFPPnXI+jYs4W3DL3OotV8+0/ZC45gjTGNvv89XXh+CmgS6eiCLNYmclK2r
         GegUi3G5qvpCIa2o518lst7FTjLkFX/RHL2bmuTdUtSD0aU2yGSE6VfKU9pch+Lckclc
         fTvGuD/8ccZCAK/ikSC7zaxC/xL7iAfIwCOBYEzRrw2BLsrUIb8G+RXr3BVP1K0MHb16
         8cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805948; x=1750410748;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yaEX4dDgKDNxKZX0+vcnih4XjDWoAZY8oCSw4SAHFH8=;
        b=tF8hI20Zl9pw3ZGak/6mnAUVDw+01rqqCHNOTJZvynI55cEjrp8UzNemJQE+J9QDBZ
         9ib5L6jhAaXvark2zqOeFfeBUmXE8dPqCSJ+SiAKXhTe17n5aUtsKQ/8Qk2SyJA9VxdV
         mPrXqAd6j5DLZgdNfzcRIkcyJ4mmqP0n4Ddax0igYiS71GSPE/5m0S6EUKgoBnfSKXAJ
         S1UxnVnVw67we76pq9Gaw6/JITNSnGdve194OamMzto2lMAFFWWha1HIBaRTgdkg8+gs
         BJ2QI9cFPMjVGyiwn0a7C3+duPx4JeZ1+DxQIpT6ak8dbYTi585B9Kg4Ekjqe0rJ78um
         YceQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2aW89+cIrlQxUsd95qjZLFVQqzejZfpychlVQbOn7ahPxtGE6rvqbP2AcINKgmb35jI+vY/gfNCPlUk/VYVkXtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhVUznNMoUZJWxnA6o36GzKbY56vpWcPfF7Q99YGWNz2VQ3tYR
	Sju88m8CHl362TMQ5onnewXHLAmnD+fBwE4jfQKTsg6panQP0oT7OLqkPTt7Uuj4B2Wcw2Jxw62
	oUlsbsY4=
X-Gm-Gg: ASbGnctXRnwTFA5qlZy7dl/sWnc9LVTeFk5foqzmH+Gd0/+nzbCjePMnlxrmEmvhR4b
	4ph0Zi6S4h/Sj9BvlVtcJd+a9QxzkOfZDqK/4w31mHx8lhEUC+TIDSFIKUWPm5Vqsy/lWTvDQkz
	tS2zKlC3vBWS0HLtljGbbnpYnL3dYjLAVwHp0Ya6eU6aUvDRjdFoDqqeLbFHN97NGtiwxH7tsws
	+ljK1ZBjsva2Thv/xfHxV+NxCaHWyOickwSj07IOmYAsZENwrDzRuW7sVrpO28RBnSC5IymaLlu
	hyDq2YJlx/Hk6vJr5zhrHWqQ17CDjbMx6Dv3+98K/L6nxB2deOJAm1iqKlE5otziRFHXVtoxCmi
	wBzReyBJby4N+6ZPnh/oOJn25BVzX6+WuewdoJOlgx+OGB+WUNQ==
X-Google-Smtp-Source: AGHT+IGfNqq5N/dXfqPTy6lk5lwkJCrvfc3vLmcZOn5YDfPCKU4e2XDDXROymQQp9fqDHIQhZiR3NQ==
X-Received: by 2002:a05:600c:34c7:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-45334ad3f41mr21047235e9.11.1749805948257;
        Fri, 13 Jun 2025 02:12:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2446b0sm45162715e9.21.2025.06.13.02.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:12:27 -0700 (PDT)
Message-ID: <9455a4e1-6352-4832-ac9f-2816f889c3a4@linaro.org>
Date: Fri, 13 Jun 2025 11:12:26 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 9/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB SS combo phy nodes
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
 <CGME20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca@epcas5p4.samsung.com>
 <20250613055613.866909-10-pritam.sutar@samsung.com>
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
In-Reply-To: <20250613055613.866909-10-pritam.sutar@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> Update the USB 3.1 DRD controller and USB31DRD phy nodes to support
> SS combo phy for this soc.
> 
> The USB 3.1 DRD controller has the following features:
> * DWC3 compatible
> * compliant with both USB device 3.1 and USB device 2.0 standards
> * compliant with USB host 3.1 and USB host 2.0 standards
> * supports USB device 3.1 and USB device 2.0 interfaces
> * supports USB host 3.1 and USB host 2.0 interfaces
> * full-speed (12 Mbps) and high-speed (480 Mbps) modes with USB device
>    2.0 interface
> * super-speed (5 Gbps) mode with USB device 3.1 Gen1 interface
> * super-speed plus (10 Gbps) mode with USB device 3.1 Gen2 interface
> * single USB port which can be used for USB 3.1 or USB 2.0
> * on-chip USB PHY transceiver
> * supports up to 16 bi-directional endpoints
> * compliant with xHCI 1.1 specification
> 
> USB3.1 SSP+(10Gbps) is supported in this commit and SS phy in combo
> phy only supports PIPE3 interface and it is added in index 0 of SS phy.
> UTMI+ and PIPE3 PHY interfaces are specified in "phys" property,
> UTMI+ (index 0 HS phy) and PIPE3 (index 0 SS phy).
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>   .../arm64/boot/dts/exynos/exynosautov920-sadk.dts |  4 ++++
>   arch/arm64/boot/dts/exynos/exynosautov920.dtsi    | 15 +++++++++++++--
>   2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> index a21386bd9af3..40588f7c9998 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
> @@ -88,6 +88,10 @@ &xtcxo {
>   };
>   
>   /* usb */
> +&usbdrd31_ssphy {
> +	status = "okay";
> +};
> +
>   &usbdrd31_hsphy {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index 4efc005cae80..5ee7fad346b9 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> @@ -1048,6 +1048,17 @@ pinctrl_hsi1: pinctrl@16450000 {
>   			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
> +		usbdrd31_ssphy: phy@16480000 {
> +			compatible = "samsung,exynosautov920-usb31drd-ssphy";
> +			reg = <0x16480000 0x0200>;
> +			clocks = <&cmu_hsi1 CLK_MOUT_HSI1_NOC_USER>,
> +				 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
> +			clock-names = "phy", "ref";
> +			#phy-cells = <1>;
> +			samsung,pmu-syscon = <&pmu_system_controller>;
> +			status = "disabled";
> +		};
> +
>   		usbdrd31_hsphy: phy@16490000 {
>   			compatible = "samsung,exynosautov920-usbdrd-hsphy";
>   			reg = <0x16490000 0x0200>;
> @@ -1109,8 +1120,8 @@ usbdrd31_dwc3: usb@0 {
>   					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
>   				clock-names = "ref", "susp_clk";
>   				interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&usbdrd31_hsphy 0>;
> -				phy-names = "usb2-phy";
> +				phys = <&usbdrd31_hsphy 0>, <&usbdrd31_ssphy 0>;
> +				phy-names = "usb2-phy", "usb3-phy";
>   				snps,has-lpm-erratum;
>   				snps,dis_u2_susphy_quirk;
>   				snps,dis_u3_susphy_quirk;

I think at least patch 6 & 9 should be squashed.

Neil
