Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4CC359A91
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791942; cv=none; b=uUrgtecVhERt11HvtnrWZGM7uP/LZ5Kt9B9kaDtI8VjDj8FaIW0VgRTAxM0rm8o4BQSu4vT2IvQINioOLxlRa3MexohLQhEYNqCONi4berQ+kcm/redVbgjDZOg7VgeEZwPzVHh3HCV53wqx9ePEckdAXgp+UNyva0TuIgMsEWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791942; c=relaxed/simple;
	bh=BzoNyfrEyJCPCGtVdG90MFhEGrkW+3rXdDVn4rAVtCQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XnmsXrmaYdJqeoZZHJxtMxeo66n6sHYPa0FN1qMWCVOBCtnNXwhjPqEuBX7Wwb/9xYTEnTN+z4YSyElXBy8OX9SzskLj/A8+nsug+JbwJiAhdYJpgk8B6raGSAbmHvLSsFzIHVXlJRW7Kh+uh139LHBqzBQDBPeaYvofBtpLsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkEbkyp+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkEbkyp+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so5873156f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772791940; x=1773396740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=;
        b=RkEbkyp+IlxwTYBP4J9U1cpYsLrr8l2MpdyGeEwmiLIm49wf7VV7uvhQ44Hex0GISZ
         MlpBea/xvw/RJt10vH2+amcJ/C4Oqpczp6Ve0Z/jrtPcnlA093+tm7HUr5J0fL2JNYmT
         lcPx1E/taz9mUk51wkOhkhHUaOIqHh/C3etPvXY4V5LKNk0YMh3kGZqrfSf0E1RG7RNZ
         lipyKonamRd53lhNzBrID/8F3ke13aiy4kfZzQmx7lyVsgT8lIoCQRKmk3g49z+sLfYD
         EhrqDxrCUGsBAjqEJCWTyNpOQTw6roftgOuu/ZYccUTutCdnf3FBKIUKA3s3XHlObsdI
         0tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791940; x=1773396740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv4dJ/4VMXcAmevXlUG/734DLVWUrC6bvT8eqbpexP4=;
        b=nRIcxy4rA+XPrPMFYj45blu3wUWrsOhPyILucNvoFDhDXq6g430IP7YDHotNOmmv90
         V7iihtMV66MD26dIsPC+l3ITdwiLG5uEuztaDoOumHtxeSt/kQs55PxySofSXvs4Z2zv
         vPXA/lPNIeq4BFn6yNhxELzB/O+7ruBs6KZm3FUQtDdQ3Z2focyO724tjV5gRLALdkDI
         WXmUEmznUU0RQpGB6M7wZMVq2laHxl+cYBXv3JYHPK4qfKCnRe1odheawVi3+AB5eucs
         TTaL3u58agid6kWq9vuc2KT7TUHA7RYbyZKpVo1sqgovmpIXYjWCOy2/7TZc/yMDz/TP
         E7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWnjU3rlbXp1lDeGIB8Z2hZmVCaMnWVK7E954yefYbag9VR17zPeUMiYhatDs+M+aONxdckg7uopre/JtlDZz8zrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGkGFWgujXDMHSQMrZyrjUF5guscFHY6bD3P/6qA+r+vYyyRaJ
	EkWCugLGR7KyV2BnyYG11zswIAeDMVkKsTdNYd8lE+tY5RtvIjOEpuIlXCHez+QaeD4=
X-Gm-Gg: ATEYQzzP7Jj81nxs3SBHVUHMybdZztAWLjE0GTbVwba8antlDJ8ZbSEQxLLq1ur8m8w
	KR894J7PN0PGObEV4dQSwgiUrvYsvSMHDp//Bl1i9CLjeIBGmihCFKMalo6LKhRkX4Da2UZ7+S2
	BMFCm6j9Od5GupqWZKT+4Wyl5wWeT1AXfdQDmi8Zo9B9h5P1oT5+msu3JJq4FeIfsyF7x25mJp4
	k8swLmWVI84Qfi5mkgg6ZvRZ3wHPAJrPxvtpGTF4f13Pt/vi6KscQd4EIK8scq74na/0tPV+9EV
	vKSoFa1qQ7AP2IAprLbNyPCDatBAR4/hDEeumxlz2frtcSq6g7ccA+I6o21PK6vgCwKwexFMMvs
	HIQcbxuKNYS4NfrO0pPBKnuqAfCl3MflZEvDukp6CWv2/9tNN73z+wDmw0J3WtF37tQ9jq+8vmm
	DcSiPlcqgnE06aKSFOUxETLUrJyqbafEk43d1cq903NW9qR5BwUwl8Cyl4CAjY81pUIXpJLbrWz
	s5O
X-Received: by 2002:a05:6000:1acf:b0:439:d752:8bf9 with SMTP id ffacd0b85a97d-439da8a0219mr2636932f8f.58.1772791939641;
        Fri, 06 Mar 2026 02:12:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm2529820f8f.6.2026.03.06.02.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:12:19 -0800 (PST)
Message-ID: <6b4ea910-1a73-421e-8a38-8827a506b937@linaro.org>
Date: Fri, 6 Mar 2026 11:12:18 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3
 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <f9c6eddebebcd2e128edd2dbc51706e23589f9e8.1772643434.git.geert+renesas@glider.be>
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
In-Reply-To: <f9c6eddebebcd2e128edd2dbc51706e23589f9e8.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/26 18:10, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> While at it, replace the magic number for IRQ_TYPE_LEVEL_HIGH by its
> symbolic definition.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> index 8ef6319390331fcf..ab3acef2b147e62c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
> @@ -53,10 +53,10 @@ pwrc: power-controller {
>   
>   	timer {
>   		compatible = "arm,armv8-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
>   	psci {
> @@ -84,7 +84,7 @@ gic: interrupt-controller@ff200000 {
>   			interrupt-controller;
>   			reg = <0x0 0xff200000 0 0x10000>,
>   			      <0x0 0xff240000 0 0x80000>;
> -			interrupts = <GIC_PPI 9 0xf04>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
>   		apb: bus@fe000000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
