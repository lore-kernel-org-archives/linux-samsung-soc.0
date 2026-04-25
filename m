Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F96236073E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Apr 2026 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777116444; cv=none; b=gSL4icSQcxKeRye/sTc9tXCz8LH+4R2IqTfrbLofMba3cqt2UIw9jrvMvmHzBekk6BhsTv2gJyFtsFEyZNeXxeywKKpp/FasfPV1UQqJ6mBCXozPzqjjd5ee303G8v7veTg5FQkndh+82Nng5/rhIvIg7rz98A7MDA85faPOdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777116444; c=relaxed/simple;
	bh=Z4onE+DqINXfgEc1uDHkjT+qinu6KrIeHMSFCHHMHyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlyJV1fxqXgOsl++bpLdlTQtXdVhOshVvx4KVhZPT4WLvfIwpgIMN6Br1zDxie0kpk5iGS2+M1FOVo001WnjQRsZWhtpzCdO2NCUBP4qS+Ia1MQ0hmT7GG5Awl1YLRcMfwF3vfzDsrNM/40iLJ9NUdWKhF36KC67KeplUWWL9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVUs1NDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGoq6xGQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVUs1NDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGoq6xGQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4n5lj3846108
	for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Apr 2026 11:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fmLIjn9rXrvUt58W7li1vLjk
	EXxPp633KH6ZWld0lpg=; b=oVUs1NDli2CZHbhP0Uzwp/lzSspjG7iwolA1Ftv0
	cIyuUL/XS+pJmXPUA9igxQftAdMKvZwJ4xVC62pGFz+41u+LhtAeHEuh6DfF/7je
	Ll3Q59Qmg+4dR/2AUfp8Pa6noxqRVs6u7ApIgsFHNdZTk4H502X7KmIjge7yX1MB
	6g+GmriWruNXdAwPoqSYr1vwWnN7CkdVzEPA/SU3mcXQ6uz/MdFUBhKQMpMd9YjR
	pr4m35HQzFtF8RB+/oweJKngb8vw9wsDJMQ/0qL6pnMy9eQzOq7HlaV4JkKbomh1
	strOYyCSKNmBiAhs78AmmfpTCtBsGX7P8BVb7T7dKGfBcA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw98n9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Apr 2026 11:27:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56eeff9a41bso16109563e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Apr 2026 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777116441; x=1777721241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fmLIjn9rXrvUt58W7li1vLjkEXxPp633KH6ZWld0lpg=;
        b=aGoq6xGQuSmpUbOUEsLhwr+pdkJ+VIVetPsQKbssbJ+b02bDOKfvyPjrxXgtajERgR
         4/on5oSdEsG6MHN5T7AYV03okhqKxc+NHU6PwC+WYG0N8D89vGWY0bOnNk7K0WqmCAtz
         6QD9+GLNk6eRJ+7qehU60/HCBXX8joQzhkpamkT28oy10WERqa8XgYr9wN3xhUfw/Gv0
         WqmWf0AvIZQCA+t052jK3Zp9kL0QWks0ZfwgZaIuesOkEVA7lF8uFFdV70F/0UzpRawN
         1yxOY8pwx9qI9RncFqtcLjQ6sFlO2yHwt0ZIZOiyCSCuxn1CD9u0COUpfRVsWzOPCkGt
         6+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777116441; x=1777721241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmLIjn9rXrvUt58W7li1vLjkEXxPp633KH6ZWld0lpg=;
        b=B6Bftj5Ohv91xOV0wB/yH9SC5iQV8voeU0AvylHMe5ITykna8PP0kYwY9frxjNwE9d
         usuSTELVRpdqXzABsdNrv75alg4BPQsx6snT8ZVSLeGfMVNZJ0miqC4UAMdKEq7Fn4CC
         xq2nHtS+wEwxxaLiFg/eFDkonjsa8g7wrG/MMmKPkDkM1lc+f1m81Fw+dLGYT1QI9mCh
         RuRq8Nqhd2mBKNTdsXg3AkAOCCrgImJBU0Pw8ADNPPg1cxz9aT0Pv0RbDWGGgzoetdX8
         /6PfgSoDOxzsJrXUntbwSStRJE63HucEK2bXoAEP5FOMVzVokxavgdzzYiCaTsmjAnUc
         tCaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gUfd7jpmxbLFR4RnslyYMAfZouhSutEDrsSfbCgHXmVN4joxbkv355znd6bPCHdSWJWbgNFj/tdDN/cFDgmihFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rxW0gqWCoPk596q6xyPsqMjGpuYbOhhWFETE5XU9Ua5bNJ20
	R9VrvdBosYtPt5i7TFTUYunLbzlzJ7GFcEWT+jzwk1SAlKcrxdFfeGBVbCeXYM8LBW1x0hiuP3Q
	/IsbM18vyQVI1o1XVfyF6eCsbmzbfYQWGdQyq/wvSnHIHq5lNmKSzT6mPDnH2FAXdFyapJ9x6Cw
	==
X-Gm-Gg: AeBDieu03RzWhV2YbELiwb8oP6KSIFQwgeFlmdItOGd3hsawgyh/3kalckjMc41jC9o
	d4HkOrL1exoV8Rijre2MSXrLl8Dn3vCj3asCK5rL6ktPchmTcxp4qRPw+H+hzCcYwHM+X08HJaq
	CoLLHU6z4Ef2Qwi6pZwYRb7HxSUKfpxXPeGp6e8bs4DFRrL8HA/jiF7ELoQBrz4flyUvK3iDqMa
	3qmakdfYS/c6MjWkOQ1kF4Bzj8f9p2vjKVWchTwrCswn5RUlWPpmHUQKPRjfXhOWuAxuabCVCCI
	TxufcnSkYAg6vTYWIUnbI7qSf76lRc6WJO4ArEVPen9LlNHgk2459YpOaqRaJujNomdgwgIWc2a
	NNcnHVP6+L6Hmw5KFTFWCyNG+5UKL59yCRtaNwx6BnqlwxpZgmVuA5OqW9VFyNK++HlZ7WqFp6S
	nsy+ZU7n3HSRGjozmw/COxd+vUwKf+ixoLBYAt8l7NzO794Q==
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr18831219137.13.1777116440661;
        Sat, 25 Apr 2026 04:27:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr18831208137.13.1777116440223;
        Sat, 25 Apr 2026 04:27:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm55448141fa.4.2026.04.25.04.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:27:18 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:27:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 5/5] ARM: dts: exynos: Add display support for
 exynos5250-manta
Message-ID: <4hbwdx7xfdko4pmmjq55ttfmiszjbtx56wb4io3p7dhq2dydh3@j4dgwilyumg2>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
X-Proofpoint-GUID: 78UGEWKgnEAg7ctU-ighCGHxP5sTFkQw
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69eca519 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=5VA55DBcQVjzkzcLKVwA:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExNCBTYWx0ZWRfX5mXSQAiMg857
 wuQaifbwgZUNJlQ8tnVtgsRrxBJ7Ih5MrWiS+zI3roaBYYE6vVv7OpBmEVUurfxhny+Xq6Vc23R
 7h/sCkpljobVbHs1AaAj6hfbc9xutmcULDX50PBxFVvP3nRpOvMuCjox5lavdWYCgvygJsnaqWo
 8EDsTaUSEjt6pOWvudFjLOCqnfGO3QoJ0LxtZr4KUbV4BghL1OsaMhUiTptXP6Uc4NYCNLC+FO+
 F6helNr+qtVzTBYBSx5uBJMBXxsvRDKWhtkgwkqq3dYaBd07hus6PeWeh1vYqYuTTLDnC5mV0NS
 nP2koNTA7YKT75jilHvUc58o3+8YDRTJi76w29vxhEAnvQ2SNGgfehVBsVizHinmzxz4Mf12zt5
 AWIk5MTFvu35k5vu7rfMnH9kukQROkdvPdC1RYk7uAyCiLEWTLov+qFMVx71Qwx4CYTOlYNRJ2P
 bzmlJ1RQQAYcB8f5uJA==
X-Proofpoint-ORIG-GUID: 78UGEWKgnEAg7ctU-ighCGHxP5sTFkQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250114

On Thu, Apr 23, 2026 at 11:14:41PM +0200, Lukas Timmermann wrote:
> Adds the necessary entries for panel and backlight as
> well as the fimd controller.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  arch/arm/boot/dts/samsung/exynos5250-manta.dts | 99 ++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> index 76d3657eb22f..eb97a28ff4e3 100644
> --- a/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> +++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> @@ -25,6 +25,29 @@ aliases {
>  		mmc1 = &mmc_1; /* WiFi */
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 1000000 0>;
> +
> +		brightness-levels = <2 255>; /* TODO */
> +		num-interpolated-steps = <254>; /* TODO */
> +		default-brightness-level = <102>; /* TODO */
> +		post-pwm-on-delay-ms = <97>; /* TODO */
> +
> +		power-supply = <&backlight_reg>;
> +		enable-gpios = <&gpg0 5 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&led_bl_reset &pwm0_out>;
> +		pinctrl-names = "default";
> +	};
> +
> +	backlight_reg: regulator-backlight {
> +		compatible = "regulator-fixed";
> +		regulator-name = "APS_EN_18V";
> +		pinctrl-0 = <&aps_en_18v>;
> +		pinctrl-names = "default";
> +	};
> +
>  	/* Voltage source unknown */
>  	bmp180_vdda_reg: regulator-bmp180-vdda {
>  		compatible = "regulator-fixed";
> @@ -105,6 +128,28 @@ multi-led {
>  		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
>  	};
>  
> +	panel {
> +		compatible = "samsung,ltl101dl02-002";
> +
> +		backlight = <&backlight>;
> +		power-supply = <&panel_reg>;
> +		enable-gpios = <&gph1 7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&lcd_en>;
> +		pinctrl-names = "default";
> +		no-hpd;
> +
> +		port {
> +			panel: endpoint {
> +				remote-endpoint = <&dp_out>;
> +			};
> +		};
> +	};

No, the panel is not just being attached to the device. I asumme it is
controlled over the AUX bus, so it shoud be a child device of the
AUX bus.

> +
> +	panel_reg: regulator-panel {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LCD_EN";
> +	};
> +
>  	pwrseq: mmc1-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  
> @@ -146,10 +191,36 @@ &cpu1 {
>  	cpu-supply = <&buck2_reg>;
>  };
>  
> +&dp {
> +	status = "okay";
> +
> +	samsung,color-space = <0>;
> +	samsung,color-depth = <1>;
> +	samsung,link-rate = <0x0a>;
> +	samsung,lane-count = <4>;
> +	samsung,dynamic-range = <0>;
> +	samsung,ycbcr-coeff = <0>;
> +
> +	ports {
> +		port {
> +			dp_out: endpoint {
> +				remote-endpoint = <&panel>;
> +			};
> +		};
> +	};
> +};
> +
>  &ehci {
>  	status = "disabled";
>  };
>  
> +&fimd {
> +	status = "okay";
> +
> +	assigned-clocks = <&clock CLK_MOUT_FIMD1>, <&clock CLK_MOUT_VPLL>;
> +	assigned-clock-parents = <&clock CLK_MOUT_VPLL>;
> +};
> +
>  &i2c_1 {
>  	status = "okay";
>  
> @@ -396,6 +467,12 @@ ldo25_reg: LDO25 {
>  	};
>  };
>  
> +&mali {
> +	status = "okay";
> +
> +	mali-supply = <&buck4_reg>;
> +};
> +
>  &mixer {
>  	status = "okay";
>  };
> @@ -489,6 +566,14 @@ wlan_irq: wlan-irq-pins {
>  };
>  
>  &pinctrl_1 {
> +	aps_en_18v: aps-en-18v-pins {
> +		samsung,pins = "gph1-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>; /* TODO */
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>; /* TODO */
> +		samsung,pin-val = <0>; /* TODO */
> +	};
> +
>  	bh1721fvc_reset: bh1721fvc-reset-pins {
>  		samsung,pins = "gph1-2";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> @@ -509,6 +594,20 @@ bt_wake: bt-wake-pins {
>  		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
>  	};
>  
> +	lcd_en: lcd-en-pins {
> +		samsung,pins = "gph1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
> +		samsung,pin-val = <0>;
> +	};
> +
> +	led_bl_reset: led-bl-rst-pins {
> +		samsung,pins = "gpg0-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>; /* TODO */
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>; /* TODO */
> +		samsung,pin-val = <0>; /* TODO */
> +	};
> +
>  	msense_reset: msense-reset-pins {
>  		samsung,pins = "gpg2-0";
>  		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
