Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B332045B7
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753634299; cv=none; b=Q2Yx7NcFmSpY+0S7467t1Fd6wGbIr5XpqCxvlWKp/1cpvIrr6ScE6Q2Gg141+swQORbUTXRQTYyO/phpwfMITTU1StBwf5Sz5kkRfQJ7HfYB8JEFUs7xV4SkkWOMf+krqTiGwET51Gd9lcysiNnOmNaLKZiXFPq14EwnRFmvGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753634299; c=relaxed/simple;
	bh=SbQN6/gxL6ryBJIJPghxBq7pmkT53NiI07RDIHXLrWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6z9sz5gUvp/N7kIxOPTg/thKfL/uswWDw3+LGX29pBO4WgyFfOAmQJEWx9Ggd+9rPgnBpgSCJQlLmBZG7YKukBo0xKxh/x7++cvAe4Xzohkxov9M112v7CVPuBA7Q03D7bZa/pySKOB3MiYQAxCG8eES4OZYFKrl/BJUAIK324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHsn4DjW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHsn4DjW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RERuPv011201
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 16:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8CPqWy085vO5YMl3J65GS5HS
	Q4F1909nZKI8lDdr2tU=; b=jHsn4DjWuxDfu0b9/M6Bv+x/MbgkKnNhwclXEBy0
	rFcnwZqlB0JbpAFh95IpmeDioV7wnjBh/mflwYb93hgp2V+YfFUunNIjKc2jzhrN
	Sf1u0ePk1VNFCxNXRhLVaZVExziYAGI+sPVZtO39U+dB3Y6R2vjl3r0KNkdxiYNT
	7iGGp1ByVTjbe+zcG+O9EgcXXup50X8qh7jdQgPaQG4HeY4UwivfsB4yagnStAp+
	xuy4DNhB7MTnRJ3fsF9nuQV4J/ldz7NAP0kXNy74Qz91dQg0fr4uzabrg/MCbSLx
	DK8CEJx72l4YFt6GmEicNDT+0JS6nNhEABQST6vEXroM5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2abja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 16:38:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70708748fbaso61355736d6.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 09:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753634295; x=1754239095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CPqWy085vO5YMl3J65GS5HSQ4F1909nZKI8lDdr2tU=;
        b=U4hYGcsDz+KSrl+k6bN70K0s6cJe9Sp+ZYjY/Z723v1j0Zu33Gb9Jwfu+dHu/+afEa
         kYBM4yKUzlPlj6Hslt86xvT5GuE9xoXN4N95+xw9xKzoB5pEq0i3XSLpwmI8bcRWF1JO
         +nkiFpFhpS/Vdx4BAyI55Cgyux3COj3CrpmKV6a8uy/3LfSwCVR0InwC+aE757A6uRxo
         dWfFe2dx921lFj7yj3LsGkioEl52dhW1mEMnKJIJ18D1gZoklVgnRdEGrgA2nxg0lbmk
         thP6uUejOnR9eOietZmqI5JMzkkmCbkj5i2KgvPIK4iu9C+4zjEZMfheN2bSiZtolM6Y
         Ya7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNweVaYKWAzKw8q2nvVxMqmYD0ik6GKZMUWsW+Ib1Qz86uAjTgSDuoxF+uTUZ7JITGQYuqx6H7y/HMEWiQ/fTA1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwB9/I4szcvwSqCu0BmaiDY042QPcqozj5zL46Vycts1QrpMK
	BAna8qYx8TrQOAA5earC75hG/ANVCwfTdIHz9QQC4sVC2Jv7I6GbERUUskTXrH1duz52lfTEQza
	Wt/zdqgbk50CxBhoRJtc7y9rBbYGQdN79SqNnpAtKdyOVnqQG/5YzQu9QIaz1YrLwXMbIr91v9A
	==
X-Gm-Gg: ASbGncvHDFPLAo97Bj/Xu65w4m5gZXOT6QZvHj6ZSPkmuEG3QCPRFZfqaWJ3glu6dyx
	ywcQFaM38WTxxpIlBsssI664pNshd/MLPJqBgqDi/rzlca+9y9K3uM7/2z2rrbKO+op62mx/M2m
	uTqshWJ4sHqz11q3+0a/ygMqY5GiCCsrsrF73S3hYE81XmqQvpZCApFEf2pKgUeYSevTGlPEnM9
	G5HxbQBlvIVohJH/i5On/E5kSgQiFzTa5U9VLo/qDzD+ec9c4SD+rPsgrONBN97QFbf6n2/sETc
	ZnqxMFPv6tmxjtRsytCVN6H0DOvkWrw4/sppeMUEtaK9HPwm6m3gz6q2fUtWVxO908hegL+dZRr
	303oh59xhNhR3Knra9VcB7BVfyg0wfjkJZynoxDQ/Q7H6KjrPBhxm
X-Received: by 2002:a05:6214:2688:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-7072051a1f7mr122236616d6.2.1753634295507;
        Sun, 27 Jul 2025 09:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfTJn1vhErN8vQII0dL2PBrMXA9vXoTP4b+ejzxx/zw0K1BvXLsKAiCyK3uSGd5H4OalWKoQ==
X-Received: by 2002:a05:6214:2688:b0:6fa:8c15:75c1 with SMTP id 6a1803df08f44-7072051a1f7mr122236246d6.2.1753634294947;
        Sun, 27 Jul 2025 09:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f427e0a2sm8710101fa.83.2025.07.27.09.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:38:14 -0700 (PDT)
Date: Sun, 27 Jul 2025 19:38:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Message-ID: <opsrp4mlhwzoldthsna5wx32b755wl3uxrbqvocvnl5ssduf3k@76a7fycatbho>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-2-faee244f1d40@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-2-faee244f1d40@grimler.se>
X-Proofpoint-GUID: VWxp_JSz4wlLBVqwuMEQODxJ7UCjDDAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfXwJTS35Pq4tO6
 EFisCwa/8Yt1rn1HkKBj8lGNVwv//mugwag32YQwGSEViz6AwBQCklVHA9WUJN367BCrPm0XfT/
 ChOwuvrcT3XS8ORZy90C/abTErPN9+TFiUK/R7TB36F3E9uo6uTAHQ9ZCV01CE8nhLQFFjSRzZx
 c406+DPYd95LATvsR+YMWFtomgt5ctc+QAeA362FeT0XcYjeLbDU4HSfiSzlltEKo/+sxci+7F4
 k97O1273gqFA3tIwvu+LoZHZZ5q90c5Pwn+XersdUWQDKzdcrp9P9FsYwRYjufaIuXQ4oxe0O/Q
 MkgJ1yJR78S68aSk2qZF6NiW8IegIC1CovLXJ16KYl/Fqovy7q43NdfjwNIg1p4UgUVE3L8k0En
 zfwChceRB20ngZBno7b2S8MOGeciN4VsglXkce9Km04WK4n+63KtLVJ0yFvtabfLtL1W6DSV
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688655f8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EIN_TQxVNm9RAPmfLKYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: VWxp_JSz4wlLBVqwuMEQODxJ7UCjDDAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146

On Thu, Jul 24, 2025 at 08:50:52PM +0200, Henrik Grimler wrote:
> In case of error during resource acquisition the driver should print
> an error message only if it is not deferred probe. Use dev_err_probe
> helper to handle this, which will also record defer probe reason for
> debugging.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v2: no changes
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 930117bbba87285e62107389606897740516eb0a..0e0bb1bf71fdcef788715cfd6fa158a6992def33 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -825,10 +825,9 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  	}
>  
>  	ctx->gpio_reset = devm_gpiod_get(ctx->dev, "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR(ctx->gpio_reset)) {
> -		dev_err(ctx->dev, "failed to get reset gpio from DT\n");
> -		return PTR_ERR(ctx->gpio_reset);
> -	}
> +	if (IS_ERR(ctx->gpio_reset))
> +		return dev_err_probe(ctx->dev, PTR_ERR(ctx->gpio_reset),
> +				     "failed to get reset gpio from DT\n");
>  
>  	ctx->supplies[0].supply = "avcc12";
>  	ctx->supplies[1].supply = "avcc33";
> @@ -836,9 +835,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  	ctx->supplies[3].supply = "cvcc12";
>  	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
>  	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(ctx->dev, "regulator_bulk failed\n");
> -		return ret;
> +		dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");

Drop the braces, use 'return dev_err_probe(...)'

>  	}
>  
>  	ctx->client[I2C_MHL] = client;
> @@ -911,10 +908,9 @@ static int sii9234_probe(struct i2c_client *client)
>  					sii9234_irq_thread,
>  					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>  					"sii9234", ctx);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to install IRQ handler\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to install IRQ handler\n");
>  
>  	ret = sii9234_init_resources(ctx, client);
>  	if (ret < 0)
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
