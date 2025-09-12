Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CFA2FF167
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675255; cv=none; b=Lz52kgJcm2+AYjRzrNN9FL7MDKCTnhJDle5JkTQMi8n0j3BQOKkT0AK1MDArWzgsCtCQZ9IhsrGGce9yJulNq0xGVjEZwsvWpm8o7s5TveeQymG3noUjzb2zKjUuZffOUvWmVUVPnfFDWpKm6cDrkQ83dPoobT67vMlHNInmGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675255; c=relaxed/simple;
	bh=n1rlD6zh8aCgRgvGePDHX/y4HVdSbut1KCX3GCzNwrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeP3Tt3tanRM46c2klrMBH6fk0xTN7yKD1r7T9a/HYeucVl/prv+vCEkW7eQP3uaeuTtQqYfCydd3CnKGGV+S0FwdQSztGY/p2Wb/V/3U2GMZ3QXDbkIN5MnUgS0ZcHcbs7dAbQpj0dIwQ4fU/gjSoNCn24TiKIsziw38K8w+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaVkP+Qq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaVkP+Qq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fY1w011119
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wuz/SrWcESRGcCo6gCYLmsKe
	MNM5PGRQfy8MjBCPiko=; b=IaVkP+QqorLtlosBQlebP9mE3Uv5KNkPPk1P8+JE
	Zq9dpAgX+ekM1Zs0k/O2YbThYvj3Sx0Qwp2kKBJaM3FvKYVmgHKgOeH58p9OkycZ
	+jzas3wHOArWzLbMyOid5tMhfksUCpGsj200QR7a93K17uIMHkWg+l+PDsf/cOEU
	/rFEnbA7GHi+j/STB5y8mnnmBF+wMs/fS4aZh4hxR0a9iSKfvZQ3hWSn+UgPmWMX
	vG619QtR/QeZ9jImLqttdZdEEsagjpIAtlT2EtoAU3Z7qNuXuJDHFMV4Kaomvq7Z
	kbsyNFy+0n6rbFNxRZEL2VMUyBx12fkNcEcRHGWBCnFhrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mb79g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:07:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3aac677e1so19318181cf.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 04:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675251; x=1758280051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wuz/SrWcESRGcCo6gCYLmsKeMNM5PGRQfy8MjBCPiko=;
        b=DBzs1DZbeL1sFbllNkXyHNUgd5PP6KmICIb7bt+T0svJxZg3PQWHgk01AADtqO3nWi
         kcGpz3f98gTmvbkFd+KJDt5yRPXXNDzrGLpXA/gHcNH6grQe4f4c6u2BbDpvb73IKZlv
         N7F92PFf18Rz2807OZaY4CjpScbFXM8Ig13p+luZBy6MfEPDEXdcTf2q1u6LBprj6U7U
         /8VTRj+9tgSGvS8M0oPWmznsNF5/Yeyso+nVKig98jRWUao4a+5X7HWHVI3CrwIRcMRd
         8NJ0qCkPj+xhxr6TSvpJqSSa8BFpH0CWf2YZESrZPJFTMe53/OftN1EIxI5xgWvOG66M
         LKBw==
X-Forwarded-Encrypted: i=1; AJvYcCWh0w3WfRZ24ook8Q7hp9nW9obRmofHdeGP2WVA94kwDqCsTVZLEgziBlKJutCJA5W8c8PTPo8DktDWjtqovWZkww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygs/2zicqBxZNWuB6pr9VHVkddkbi3yRHC8bWBonEZGRFOBWy1
	wsFjQOpv4uD+I1nGW/ITXk+QNJn0P8GNGQpmX+MZQM5bom50oPuetVLDw731uGDinQvLx288T9q
	aOh/uz68WrxkuIeX+EveZCBmDehkfzHRRWLlCS6WEmestvaEc8KdazfP5wV4zdPxZNlFBoMjRMA
	==
X-Gm-Gg: ASbGncvmObt9OcD0g0OX+/0pzj/kxPqKCRVj/WeuoZ8pFBPjg3KjGWwEyIeHOBWQbsz
	AofeaU/9JQv68N2qZ0p7FeEElPZvwwBpbONfaqTtWkSQ3njzuRSDPhl7g2NBmfQrm3CWMgbZM2A
	brQ+6PGgSkx4ODa9Ofmci47RJ7M96W7lSBFI8DmiQvzz1Jf5Udj4z2ICcgplfiAjrX0JaY36mCQ
	nqoH/YBXOMyndO+ekuowsam51I5/beCM6qSjjAVfalwRr4wgPVa9B0sSERaUeA4U5qsefRiqKmq
	Ayx78SCTQ727MhWr0uCyGZhkW+7y4RETnTR3Zv6tpii+DSFkNpifQVLNDxxmxlIJdepTGvrCEvL
	XYMuVz4Onvcr4ViqyUeEe9uViDC5WgDpN/iWjKlJ46nQ7P49bxJGj
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id d75a77b69052e-4b77d0c8726mr26900861cf.65.1757675250838;
        Fri, 12 Sep 2025 04:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEiDGwKFNmyX2dYy+yuf7JY3W0Iytw1CrXm3NUr783uLSdnhKB6N+spTNVyCrcHKwChFTEdw==
X-Received: by 2002:a05:622a:11:b0:4b4:9773:5866 with SMTP id d75a77b69052e-4b77d0c8726mr26900321cf.65.1757675250170;
        Fri, 12 Sep 2025 04:07:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a8211c9sm7300031fa.37.2025.09.12.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:07:29 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:07:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 00/17] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Message-ID: <s76pkp6cir2s2x6xzhnuhkmvirn3l7gnrhlpuachldbeqztwoo@xqnsyyjxctxy>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX9PUz1awZJ+l3
 ag6df19zl2eBNpj88iOTgLnOF3MWuqlGpa3pplkC/tGGduXStLUUX6Pp1HR/lGL3CeWZnuC4A/q
 Qju+PWqlVzgg+HlYx+GeKXRzAgTQPqcM2KYvej4jnXwSoXlPUks5Ar4VdEpD7yI3zo/hiAnjqMz
 THUyFn1B3ACsXEc5tJMzAjIw2ro+LjFv4ddLoZCGGlQ0Tm05lg0ZUj1SBvuB+aU28LtlT7uxqFK
 91HM/7ppYrRj0Y1ByctYfvgI8IUENX54CKRY22lpr3KHzXTEuWJanxWyZWmrXOpFlcbjmLurkvS
 bZnynl0xZXJlFKChbchTMjJ7wNb4RWNsVFXwJs4S3zDF8AU40yYyCQBe9HcUihwtcuc2tt6LYQc
 /oYQmMO5
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3fef5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=TUyDhR3qWEo6SlV7cHcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: aPtFYoEPrHRinxTfDht76Zku2D7AZcD4
X-Proofpoint-ORIG-GUID: aPtFYoEPrHRinxTfDht76Zku2D7AZcD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Fri, Sep 12, 2025 at 04:58:29PM +0800, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-9 are preparations for apply drm_bridge_connector helper.
> PATCH 10 is to apply the drm_bridge_connector helper.
> PATCH 11-14 are to move the panel/bridge parsing to the Analogix side.
> PATCH 15-16 are preparations for apply panel_bridge helper.
> PATCH 17 is to apply the panel_bridge helper.
> 
> Damon Ding (17):
>   drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>   drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>     &drm_bridge_funcs.atomic_enable
>   drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>   drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>   drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>   drm/bridge: analogix_dp: Remove redundant
>     &analogix_dp_plat_data.skip_connector
>   drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings
>     node
>   drm/bridge: analogix_dp: Move the color format check to
>     .atomic_check() for Rockchip platforms
>   drm/bridge: analogix_dp: Remove unused
>     &analogix_dp_plat_data.get_modes()
>   drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>   drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>   drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>   drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to
>     attach next bridge
>   drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>   drm/bridge: analogix_dp: Remove panel disabling and enabling in
>     analogix_dp_set_bridge()
>   drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>     in analogix_dp_unbind()
>   drm/bridge: analogix_dp: Apply panel_bridge helper

This patch didn't make it to the maling list.

> 
>  drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>  .../drm/bridge/analogix/analogix_dp_core.c    | 394 ++++++++++--------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>  drivers/gpu/drm/exynos/exynos_dp.c            | 168 ++++----
>  drivers/gpu/drm/rockchip/Kconfig              |   1 -
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  74 ++--
>  include/drm/bridge/analogix_dp.h              |   9 +-
>  7 files changed, 342 insertions(+), 310 deletions(-)
> 
> ---
> 
> Changes in v2:
> - Update Exynos DP driver synchronously.
> - Move the panel/bridge parsing to the Analogix side.
> 
> Changes in v3:
> - Rebase for the existing devm_drm_bridge_alloc() applying commit.
> - Fix the typographical error of panel/bridge check in exynos_dp_bind().
> - Squash all commits related to skip_connector deletion in both Exynos and
>   Analogix code into one.
> - Apply panel_bridge helper to make the codes more concise.
> - Fix the handing of bridge in analogix_dp_bridge_get_modes().
> - Remove unnecessary parameter struct drm_connector* for callback
>   &analogix_dp_plat_data.attach().
> - In order to decouple the connector driver and the bridge driver, move
>   the bridge connector initilization to the Rockchip and Exynos sides.
> 
> Changes in v4:
> - Rebase for the applied &drm_bridge_funcs.detect() modification commit.
> - Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
> - Drop the drmm_encoder_init() modification commit.
> - Rename the &analogix_dp_plat_data.bridge to
>   &analogix_dp_plat_data.next_bridge.
> 
> Changes in v5:
> - Add legacy bridge to parse the display-timings node under the dp node
>   for Exynos side.
> - Move color format check to &drm_connector_helper_funcs.atomic_check()
>   in order to get rid of &analogix_dp_plat_data.get_modes().
> - Remove unused callback &analogix_dp_plat_data.get_modes().
> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>   the downstream device is a panel, a bridge or neither.
> - Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
>   ROCKCHIP_ANALOGIX_DP.
> - Apply rockchip_dp_attach() to support the next bridge attachment for
>   the Rockchip side.
> - Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
