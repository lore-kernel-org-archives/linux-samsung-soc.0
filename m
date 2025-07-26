Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6C80B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753488911; cv=none; b=bNBhXoQUHMkEtx/bhNtfVdg5VqSuw5TLLzy1RaKvlC95RFNdM57VdAwxBTCeUkyk46u0XjnLqtpKj5FCX1z9uGpE4pTaTZJmKG66P8xQmwx0ODThPFYxIqlpYFX5eK/NZ7G/1afzDl66D0+9q6Al/UDbOX4G09pkutVkpWn5bw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753488911; c=relaxed/simple;
	bh=E8MY0MEYREs0aE/K+PkdhfREa5nigD8HeuZ9Ki+MYhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOkfL3866oL9GGFQdpp/VqcY5ST/5o/uHUZIe00ub8Wc5HMsiFXec2sIpgPgjnxTHMU8GqlJe0yMaeGD33Amwtq3J2VFbSpSY45sWbiCTsQVqAC6Wot1kcS5waJcev7pS8qq2aX2JwHG8w/jhj6IUz0j76hRI+68rqH67f+K+No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtUz99jy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtUz99jy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJFIFQ023710
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EtYLr/SHernycwo/uLJDpSmW
	e/0fY0sBOUuxVsASxyo=; b=YtUz99jy4hrPtvY31jcLkeAuD8BdeWHNdkfy6UYV
	2VbnSKPbS8S6BXSvbrAQAKy5QvUUbO/LgJeBEqDWq9NyYHtpzohVGT17gDrFYl04
	1II9/temRvO2Q1rcgeRtwpKpWOnAgndJpLjCLXO66x4hwpbHreCCJMb1KVprJ3l7
	zG9Y85rggGeq8SUG8GZYjNAApYZV75MJdaS3oOk0NIHKIjZMmvLwSsC7454HuQzY
	IsOdPnVtrsEbkrKGFGZlVmgiYuBd5TThQYdcSogkC1pVDcf39gYdQLNoQiUF8JUZ
	2sDXjdq/EgTAQov5j/LtyoeiBlnOJseAWEs31sIrAD7LgA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2rbxwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:15:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-707053d60c4so71441656d6.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 17:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488908; x=1754093708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtYLr/SHernycwo/uLJDpSmWe/0fY0sBOUuxVsASxyo=;
        b=DVZ5A9cff8L67zmEv6bAVupMroaKMJyCKt7akCtfBuAe8RbAqzpRT7eR+UWbTwmt2H
         hBQlccXWh876Q5O6U+1THamRvmzsj7ouuLFLLlnsh8pmii6YHQqU6ujvsR6xAgLJJiCy
         Uv5tAraZ3AHwaJMn7rrhh1L1dtu9WthTry//ODaIAXEvIjEmypYJPiF6cAtK83/xuMgO
         Kg7Cf4XaSTjjSyyVsuftAu+/oHyFeZQEZraHMnSBe3Qj3oRZu3q/T5pcjSDNqgFq07XV
         R86c0mWQbrC4lQ3pCmQK4/K51gAuJs3dqcAYh5RTnb5ErHZZ4BGXfXPffJvu+qFS4Q7s
         az0A==
X-Forwarded-Encrypted: i=1; AJvYcCX6cJRl7mc6MLSrFJFZYtKUPL3QmmQceWy++cfhoywqLJRQQzNQGxbBfvOVrULzrcbAXELdIdKnvis0Khwkw6BerA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPhG1ChTZpbpScq6yf9k9wfMOFwBDkqJz5SYiDLFMep3tFa8A
	b3FgUOWyl5QD7fxI9rVP3JIcVrI+JbTuiwXeT0HOoHy/XVcOtNGViOFZW6G+hViL6g8lcSOg35c
	d5BaoR/DVuOH2udEBcHux0+0YCkSU+EJDGakvc6NLUpEuyHNwa5i8+KQvgThMCatsGNp18tMAWQ
	==
X-Gm-Gg: ASbGnctCscrEPvUKcpXCEU1useSpKM02keBOB8BwnyFY9Kg7eMzRBoTQczC7vcSSRHt
	HLnzxrqw9ykk0RIaVj4M3g86mFDvF/jcxHcFMs+p7mY/RLslpheEHQv8hPKHXv7FUmID4C6Lk/t
	Y6ZQy5SOsFstSnu9xWEFY2qJ/UhvLdX+eh+mxYD1Fx5yO0FI5sAcdbVo97JGzAk06+5gbEEnRuS
	NiN1vhdfP4laoAQsZlMq3bO4HWcCfdEyXoJFvQ++mWBTwj2p/5nG0ooSeomDy6KsVKaXi8Zj3o/
	RIlQhFBDn2dVOgX3qJb398Ll7daniXT95EKyFhEI0WK6QaNwwKgmfWsiIaDoJQ+PllyDZBCcocz
	O5daL6YJwYxgYan9LCbyRLcuEesu05sIWHeWHVrN/YnTf7X1OzwhB
X-Received: by 2002:a05:6214:76d:b0:700:fe38:6bd8 with SMTP id 6a1803df08f44-70720534e2fmr63158426d6.19.1753488907806;
        Fri, 25 Jul 2025 17:15:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA7feK2RtwupaGDRpvYsF4Rqy8R6n6ic8d0JslPO41UFKrxITuNTj+z6HJSoPo9gemAdVjoA==
X-Received: by 2002:a05:6214:76d:b0:700:fe38:6bd8 with SMTP id 6a1803df08f44-70720534e2fmr63157946d6.19.1753488907363;
        Fri, 25 Jul 2025 17:15:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316d99asm197710e87.31.2025.07.25.17.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:15:05 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:15:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 05/14] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
Message-ID: <fkfivnqxpecqpqlk66nadp2lpmr6jxgudraiyu7skebb5qhnpd@i2jga7s4gqeh>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-6-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-6-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=68841e0d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=r8lg0YXQRZsV-nIv6pAA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: TqNhgw1XlU9FggpQin2CnGra05aVxDx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX/0JiTDHxlL6z
 z9viSwIyuTdTbsBD4AGyRbi7qwvIi5yIlolmmL/ZEP5stIl9/l8g+c5Ddzac/lz9rWhj15qI6bz
 Dr6A+sCke/K4ane7vao38jRIURQxfcwSzbAqg/5yGYn3PV70BGFWOiyG8/i7okFuFGNdo1zaz0X
 mUVmBznSIA3iWxTkdT/syHsHMH9MmE1u6EjxLZrujA+700XZg/6wy/zXnwlYUFEeUx1y9PM451h
 AG+SEcZNNYMyf6sJAGwDjHiDAp0cVjuogZjfcGjoBuYC2dUOvb1XtOiSZQkKfvSaZBq4qcGByIH
 D5bw7ew2T30DKLhEfqfRbSHNucKmtxW5Q7/Az131+s+YARRe056JmXSy1LQp/BAkcwHsICfPG85
 wx7gjp+Ik/yLGfwj1pqO6AbuwQ2aFJnUrY6KNM2Q6xu8//qhSTYDzPcl8svao0Y3MRyPlnss
X-Proofpoint-GUID: TqNhgw1XlU9FggpQin2CnGra05aVxDx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=836 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208

On Thu, Jul 24, 2025 at 04:02:55PM +0800, Damon Ding wrote:
> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
> directly.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v3:
> - Fix the typographical error for &dp->plat_data.bridge.
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
