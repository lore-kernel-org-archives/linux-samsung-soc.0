Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F742857C7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759263018; cv=none; b=YWcYDncjju7T2brrP5FyY1gASsbyC0IrA6BncSBQlkztyh+Q3r3sgqhTFC04M6gMKK/BgusY0ohzsV2rR8HIh4TiP/DFyCsaQYEffudLgDtquSYlrn4ldxQEOyOTEX7GhT708xljCafu3X69H5iq/KJiQaPy3kPy2d62pTdILYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759263018; c=relaxed/simple;
	bh=B13kSDZYJQFkU0t1zC9c3G3HWldP0y99UADm4IFZCpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q53exqFhxLQT9qSSca2qj9QGvldcQJWYAlj1KY9T8zCw4HbzV2OKUwk9k/AK8O62I6knibvsbFGmcoSfc/z+LT13TmMIMUbyxqE48GwjWNKFTa2podj/B5wi7/67Bn3UIy4hBPKhqWBy7ralpRfI9hd6ldVtxHvH5bDqZA6i5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffJrJ0PS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffJrJ0PS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCmEbS030557
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HUh15XTlHhQ6Q1q/DhGrQFrr
	yiPIaucH02PqHMC1azU=; b=ffJrJ0PSTxvIAskznd1HN89PYvrtK1jPtX4SKcyO
	n9M360aQdp97l/HD2LB0hM7I3AIBClvyVjFNX4Pe/4gDkw4p9PlD04eunPSwsfaU
	bBZ2YMmmJnJdJ/GcYahlQn8cIUTUvbx1ueAUfOYhx8IYeK88/xQZh9o48wuAIdXR
	ijxVM3znvZbccrA6V9xUPuFJsIrCrN59afxk7F0fEZttLODdeHJQTFWQBJf6Bxa5
	gtEUZJv9MH7ZwXBQq/ay7K9XBo1P0u8OSz4pSDBjqaBB/TGe9u3vSOB94F4KoOj+
	jyc8+qidoq5LZ/0oKAzmhM9or2F0L1OrF6O3XA/5b+R9VA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdj2v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:10:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dd6887656cso118275541cf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 13:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263014; x=1759867814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUh15XTlHhQ6Q1q/DhGrQFrryiPIaucH02PqHMC1azU=;
        b=hpsk1dG3Mb7f8SviW5KKL2R2KX+ejS+T3FxF3BQYe2sBryMMQpmKpT4arQIgN4IHsJ
         TU/xZMNnZ1qWL95p09CsI91ouSja2QhFoI2GHNKdM9Tx+Oi+pCpopRouypHENw0dPzjm
         TGwm63hQREdJY/zU+DPkG9O0q6xCxC4auFVUcbjA96yGhWLbS2wMuXCJATFfM6pDL01P
         XunNF1GVYTRN2bwYy57p+HTgilSW92KbkF7OK+Dt4jHtqmfjKKoeF7O7kt6OkmOHi2JG
         qjlln1oz0+sVbisyEMc27Cto2RX1b12lvVB4tOftYydb18LCjeK/8L6ggwexy5fvMRpq
         easg==
X-Forwarded-Encrypted: i=1; AJvYcCVqPuQsUhdC8OBC8AtX8M8y4eNcoqaXvvjWV/zU8ys64eg6mqxCRNRzMBClU4mkHzjMgcsgj5C5YvAllcV0RdZMyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOtQ6TM60Ku93LBMwj3L1OrgFwM8LJvhu8v06oPAHdHRqJBsm7
	iTygxBXwrgN1kjUB2JMTXwugr9+gg7YHcu1e0pdnzugFhXGZOLd+2JVrB26mtIzy9mXYcB9mns9
	Gxr2cb3Sid3RnEi7GaP3AKHgQErbPlmBMD3AioSGuNok3QSekhRYzZIXHmPv759YaQDA+F9fnXQ
	==
X-Gm-Gg: ASbGncsQv1zwQTUoZimWoMwEG5OEEoGVLtStyPyon8sMbtW7ueSeh0wlkKROvD0prQU
	EXBlBbCTget/qJSKARDZNnjSQjcTgwuAXh6OoO5iVtG1RNGvSlWOZg/KvVaHaInsojWs5ayA17x
	QQfiLwvFAf2Hb3HJzihC8GlYhf04Qp1sAChfF9HtBofUEz4HBvAUaupiXzQnkZuUZgPX95O0x3o
	kS4XROPhjBpWkfxDsK5a8oktM0ly54c1+lZZu9SyqSmw7JtXhGK0/fUbI13F9fjNtuA3XWsX7tF
	0EyWBWayu5ku+52IVMBfmRMb1Ku1qjGrtYktbIzBARqv6HFxPln0GdcYn9zNjYWBkdhlZRv1+l1
	k2kN66uqv4cByV4GFOxd+549DBexWVdl53rBOKNtTX5u88bHRqsvAdB+dng==
X-Received: by 2002:a05:622a:3c6:b0:4b2:f4e5:8eb1 with SMTP id d75a77b69052e-4e41eb14998mr12847751cf.55.1759263014261;
        Tue, 30 Sep 2025 13:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkOHi3Cw4K9bHAEsEdXynVuyKt+2OCerw8APvAAWKM2bNTs+Ga5p28b3x5snKdH664Kuc9Vw==
X-Received: by 2002:a05:622a:3c6:b0:4b2:f4e5:8eb1 with SMTP id d75a77b69052e-4e41eb14998mr12847201cf.55.1759263013780;
        Tue, 30 Sep 2025 13:10:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586b0c1f9d4sm2610582e87.49.2025.09.30.13.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:10:12 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:10:09 +0300
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
Subject: Re: [PATCH v6 04/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Message-ID: <x2fpm4rb7ermb2tyjefdwwbvwvzt6uosd45ad7ku3tp3yqkmqc@bayzgz3jsqkp>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-5-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-5-damon.ding@rock-chips.com>
X-Proofpoint-GUID: uRiOdomUV-_RxxnrRQoF95lWS4TPDark
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dc3927 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=_9FxbLpkiinsEApfcMMA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: uRiOdomUV-_RxxnrRQoF95lWS4TPDark
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX/N4d/GbhYquR
 lmK9sy2iePswNnqDDWLkwppEETr/XBA9W6/WPQPHZRgBSUo2HtgVCClJ8cik4AKbhtrS7ra5H+p
 KDDm7Fsp1d48qvzCjE+Wfp9QUY6eQvbhgIrERouxRfaUTrrjPm9HqCzWTB0OmrqJ4ic4nvCxAd3
 gut0qFtVf46lWUGDsi/AC80hhdEncCzm4hrwkrx51WwGFnovFXy+ip4ZDznXhAFucbcS8A9TKp+
 pGXa4gwMkfdqaIF/06XefwxkqGX0NngsNyzK4xyxEyTYeOUlLTEWHB3J2PS772iRe1VxQXNmUFr
 EGYDzbHmq3mBEPJJQZsYTfVlBIrKwaGyBW1XNBgBgwyNoWfv8GHEDc+O8l7NJNlPoM2vQurgcOU
 kyWOyDHXoiFBMMRr5YBWmT47zMM6/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On Tue, Sep 30, 2025 at 05:09:06PM +0800, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
> 
> Additionally, a new API drm_bridge_is_legacy() is added to identify
> the legacy bridge, allowing specialized handling for such cases.

Why do you need special handling for it?

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig                | 10 ++
>  drivers/gpu/drm/bridge/Makefile               |  1 +
>  drivers/gpu/drm/bridge/imx/Kconfig            | 10 --
>  drivers/gpu/drm/bridge/imx/Makefile           |  1 -
>  .../gpu/drm/bridge/imx/imx-legacy-bridge.c    | 91 -----------------
>  drivers/gpu/drm/bridge/legacy-bridge.c        | 99 +++++++++++++++++++
>  drivers/gpu/drm/imx/ipuv3/Kconfig             |  4 +-
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  6 +-
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c  |  4 +-
>  include/drm/bridge/imx.h                      | 17 ----
>  include/drm/bridge/legacy-bridge.h            | 18 ++++
>  11 files changed, 135 insertions(+), 126 deletions(-)
>  delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
>  create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
>  delete mode 100644 include/drm/bridge/imx.h
>  create mode 100644 include/drm/bridge/legacy-bridge.h

I'm slightly concerned with the name of 'legacy drm bridge', It was fine
for 'i.MX legacy', but now it might be a bit of overkill. Maybe
something like drm_display_mode or drm_of_display_mode bridge?

-- 
With best wishes
Dmitry
