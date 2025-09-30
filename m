Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853222E004
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759264348; cv=none; b=J/lrNbKQak8qMsdzIyCBxyZOVIa6NYVsQXQ3P6HvgKDsz1yPMt4qMSrZGvRtJP/rqAL17N9ExlJMpN7RSNyN1tB2JHwt4GA2Rsz/6t0o8oveSO22o0naxZejHQipTS3g7WDStpJqLHENZmGmU9AN9Fg19hDPkGmQkD3GOgMEKuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759264348; c=relaxed/simple;
	bh=N+B6oZWZlGACcgCKE91/I5EsJwXOd2f0A3VW+CBf6Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLnZ1yO/Z0AZkkGJQZjnJeQuHLE4u2J0B9Hye0aBMnkNDWOsyns/ltmgA6nxCT0U+grYMk7dgB+fezfUXWkdfj1okam1sQUyr+NR+zocRAVnaXQYsEsR/tJo/rFIZoHyp65byKdkFehiLnzHvewTmFUqmk+NUgLqxWGgHl1b0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOGafGbM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOGafGbM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCB7g0018092
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aQIv8HbSGU/ItL07DFk6fn1p
	HIrebqBCTmh7KKahI5w=; b=cOGafGbMemrEy2Yp9eUfawzJXf6Q3VhICbNjmOkF
	ZQlv89/gJcQ7aiAnGhnt7WtH9I94mOdfDhXrfWQ7cYlIKq8ZwyhqFIEP7gxNScp+
	HKS1hy/sLSced/c5RpJZFqqrGC/XYZ0lcT6/CYa5dktC2CdtUeLXlnMATvI+iqKG
	7a/vhWiA+zZuxZU/vUq+EP6h2Py0g/SttYNjLwE95YkMubbYblZz3b11AuSF2bdm
	gVPCIpzCK6b9PyUK/v9b0XNC0L8tbhuo81DoZb85/IJVoNsainh6NwDE9gJi6dp6
	/+mr7+cL+r5c6nDDV2XPfMl+/jyVqfLWLlRceevEMNtY/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hj3f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:32:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de4fb840abso7682371cf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 13:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264345; x=1759869145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQIv8HbSGU/ItL07DFk6fn1pHIrebqBCTmh7KKahI5w=;
        b=xC5ztZFLFVjNgSSLfln7cQ57yaKljL/Pm8cHFfbk4XhUPeUHpLDAnmiKBLHEyq8spw
         MoElc2XI+TjkJI3FcBPai26V+yWRNmen24b0Sz685rkTZnitiTWBg5wTPZyKmQbruF+1
         9UbPmiqhUXmmrUH4l+TLlHl9useC6gt9qhwiQopWReB3r/Lli0LRzPIacBlNkuO1B8/s
         VtL39VzKszJSXMRUYdMKBfmWT4o+j9W2yR/tfKKDN4HVvKFc9o5TwsOKtNlb5k3GJunV
         Y3fQfWMVfyNpWrX00KCk3tB/Md+RSLw56LDLKNAtRT5v1FjiZv+YoADqL/5npZehHGz9
         eiQg==
X-Forwarded-Encrypted: i=1; AJvYcCXdc4SxZ1E8/x5d4yfe4vTvpMjJrLQfhScrH7qy9Yifn1hcWxi8JWNxZOK8YzLdI60eq21zgdyq9s0U//rAvIOyGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXPkcaIrk1sjDBrcxsTkpt7o2TuaSjzTmiGYdHhN4WN09eyx6L
	WzZPSgxXev7jqtn9VjvoIS5HiKXIwcVkWgYgcocjgnxt6WIM/aZtTabhibscDwrI54nUZzhZB2f
	sNY4MIuco0GhvwuGcBt8kx8+fvSuc3d8JqScO5+8VS+FOAOeFGOOY9zH5F0kZRwXRHUx70cAIAQ
	==
X-Gm-Gg: ASbGnctc2tIuJQpmna+q1Edenn1c7WGFhpWTS2T8qzJ0wE8Zk9EtJDktC0hKZe54sYY
	c1HzUeaLRysUjOpLj7dgqwtCcMCjtdwvE+nifVKebWWs6lsuY+b9xFRF6k/v0LSjIxUjEt8qWuW
	lAQqMvpB/PPZFRbmR7+QiP2Y8fnEquCFTDA87mhFnRQsVl1ZAgYOHeXRmLVDmF760Ck1bIYZ8Gm
	TZFisukk3WXlowkgzNN3JYGz4ptzTXR+7tOMwS7X1Bc8gN36v+2vpppuC9um+V23OfNXArB35Zw
	H37u/D7R4HXMjO/9Afh7iereZGYgN2b+t1966Dv2wLegBC0Tqf6JuqD2t71snqilABgp5FVZva2
	BIpQD/uxK00JUMQ4EMCiKrF0SSdOz88i9UPhmEZJsNMjZBa63Ewks1omPpg==
X-Received: by 2002:a05:622a:245:b0:4be:9bf7:74f6 with SMTP id d75a77b69052e-4e27d7c5f55mr67498891cf.4.1759264344543;
        Tue, 30 Sep 2025 13:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjMsa1KUO+Xb2y8JXrARVlbLY0nhFqxX54cw9WXubdWIf7Qf3oigc8c9WVQu/MUBv6yKFVYQ==
X-Received: by 2002:a05:622a:245:b0:4be:9bf7:74f6 with SMTP id d75a77b69052e-4e27d7c5f55mr67498601cf.4.1759264344072;
        Tue, 30 Sep 2025 13:32:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fab10sm5324346e87.45.2025.09.30.13.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:32:21 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:32:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 16/18] drm/bridge: analogix_dp: Attach the next bridge
 in analogix_dp_bridge_attach()
Message-ID: <qqomsrix67lmx7rth7tg44bxjltw2d7s4dwojqd26duf45uf32@krpb756s6q6q>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
 <20250930094251.131314-3-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094251.131314-3-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX8s+Wvzl7FJ15
 SC1zEAL3PcDepNMSc4kicni16feoZsxq2ItETcmEcCYir8iwp/57aKR9KAX5pUMvjPv1FTOWKey
 m+NhiAlvjdKsfZtd/fTJ9A9bIc8To+00qV95AcF397YT9pHukj6Lvvx41UkM4V0vofi8WoXUaaF
 tLIcmzDC1U0wtOuEDg7SZczsWDLBesYmrHy8bsndCIATjuTpWnh+s1cze/fJW9fh/fF2KQRcI5n
 +VkzA/4PwK6Rod4kRIyJcdj7zKDQF4ZNRBQAGx2UoZ40CUl5GpvbTfrScrySOopQ4KEl2b33AmR
 /bb3AnPLtY9vZRGXNzTkROOA1SnqvXv3tQRVLNMy6Kelur3LzycpKhK+2NjNiUBTJEzR9eA1k3r
 QDTkHDYNYEit6xdQK2yfBYx+nZm/vg==
X-Proofpoint-GUID: zGWxTDu4ULoxqliFo6XIvHtTg9lGOBMv
X-Proofpoint-ORIG-GUID: zGWxTDu4ULoxqliFo6XIvHtTg9lGOBMv
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dc3e5a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=z1Cm9R5qtz1vL6CzoToA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Tue, Sep 30, 2025 at 05:42:49PM +0800, Damon Ding wrote:
> Uniformly, move the next bridge attachment to the Analogix side
> rather than scattered on Rockchip and Exynos sides. It can also
> help get rid of the callback &analogix_dp_plat_data.attach() and
> make codes more concise.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v6:
> - Move the next bridge attachment to the Analogix side rather than
>   scattered on Rockchip and Exynos sides.
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c |  7 ++++---
>  drivers/gpu/drm/exynos/exynos_dp.c             | 18 ------------------
>  include/drm/bridge/analogix_dp.h               |  1 -
>  3 files changed, 4 insertions(+), 22 deletions(-)
> 

So, here is the rest of the series. In-Reply-To header is different for
some reason.

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
