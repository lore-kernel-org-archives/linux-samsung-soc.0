Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA71D516C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759263524; cv=none; b=UOsYE6b2zf/XwV8Sfl40Lem/sNOrAX2+2HLKAURpqJ92HUpaWFFJrlwKPYMJQhXceoFlMKSGx/pOofpIZd4pdZ8lmkhNICz+gR13+JMUns2I3mNqDdZit8dPosym/t/TVuSePd/qgl7oqXFYq4IhSDq0WxwMTR1p9DDANeL1WZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759263524; c=relaxed/simple;
	bh=cYYH3/yTc9wBXPcA74vYb9yfUr6t5bEcM/coGFu1oMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMOkyWHnxN5lNyasBExnOEzltoxl4z09cqjqcB4Cje6oM74vVhdW4QSOpjM9JK5sz7eY8HDNsH5oTmghNw5xOOWpAURaEIC2BzKPnBO20nUO/cBgw+8WNf1ZX99Te0jqim9QZc+IWjJ6NeGuE6y6xCidCld3+qBwWPL2jmfsWZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phrIoJPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phrIoJPh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBvGGf009314
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1prKZ4v8aUicNJIrRPB93Z2q
	BSZpWbI16ikZz4dczC8=; b=phrIoJPh//YjDsPd6tBBkta/NYufyjsIgztdxLMZ
	AZvqOF5x6Cq7k7hO3vWlIFKi/Q2l3CWCZ11YULAuW0t0OZ2b3pl1O6nmoSAG/bwC
	CtM3r5IUdX/w8EzIqd8MAT3aJxZEMkPVQb1yO63P53KW7/XTuzgjHBdgQP4bqgRg
	cfd7QNe1bDajr5SObgGIQKwRT8CWlory66hqslK3qw9GPJaZUJa7kxlc+Jom+3Lv
	JEt1iGDAxu74RjzeriRN0JIGkq3+4tnjVbc9ygx8n83DhmbX3WOnWKfDb+7IvjPz
	xDLpEU2gkmxtKgNCeVzbUsmQvgS762iIdaQf7uEdPYnU8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977t49g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:18:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de801c1446so103409431cf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 13:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263521; x=1759868321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1prKZ4v8aUicNJIrRPB93Z2qBSZpWbI16ikZz4dczC8=;
        b=jM7a9xMqPuHK7nU1VGxrvtHDc2EUI5KV53nrPpPEt5Pg89WStfj2OGLfYSuYpWt3dN
         rNx6Bnqz4xK8LhZsNtsCqpU8vWDo5GG13pJYwkAS1vHrberqsOF03x3FvhvCQFIaOmbh
         pOriTfoTlHZqIH1dgyRfdP9xzDfY8nLU2PrNxygsp7dhNa6B6YHTqP8UNihRSFLhL2y2
         dx5QHw//WwMa5vijtWf6OpyOPvilfyfLAuoOoY+TpTNPau9gFejCh6OU8+6VYdUQZwww
         2ycVAKWe4eLz3KL6eQK0rLWZAzFU0vZEUmb87pf161jZAgcvHcm+x2v2hWBxDoaJDhLP
         wU2w==
X-Forwarded-Encrypted: i=1; AJvYcCVHRDe32+warDHHB3h4TArhb5w/hFKgkBmfZ9QiFg680GrvBXa+tETTCuMWdDFWVnSHQ4U1QuJX5YFZ5zdp0pilAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTTOMMhbhGOOfQPJ9deS5anSE7Xhq9TZkbVRmp/goeI3HjiRk7
	Se/7Iaz6LVSjHQZNT8vkbfa8ls3ePuN0hTCgoY/T+cF/ewiFRT1lqZHDNuMOqhXPf9HmwS4rR+X
	cWMiF+t/gqylO2k91ixhfpd4rrcNGpYwuhOzvKshmA+wjXNX43/f5fTWlmgUuIMOz+0jemhGlOg
	==
X-Gm-Gg: ASbGncuWQNS6x30UnIJ89XhwQ7rPcbgQkJAa2Y0c68KSoF9SkrBA8LRGKEQMYy7VVXP
	w869R/Z38dzOX65fEXbNWjZBnBbVok7JwZ8A09r4PrL45mxa6qTMH3T+qfQr/cC5H+JkyT9yvwi
	CBNQdVq3ojjsA1zXpC6a/T8y4i9W2NsVNanTb0bCIb3R0ezmHqYgAvL5PxiMrXueqv8JsHHcnr3
	uhW4npifV8z7L8OwoCgBwsFaxjZ3GjYhzkBcJ5oAeBRsx0colulFRsIOwEqt/jIzqptDfTxfcVX
	/wGvKc8X3g9RQqTEy7bqd/D8WAJI1VYwlUc6/lDo73LhCsu27pJtzadujsVpgJHT3eHkHw0iPnr
	8jx1toKsqTblhnhaYFQMdjeDDcYpizEF5arBYk+l06VaQmtIvRHA2bSbayg==
X-Received: by 2002:a05:622a:4cf:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e41c54839bmr12914441cf.11.1759263520680;
        Tue, 30 Sep 2025 13:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxICdUQhJwxyOP6ey50e51aF0tOi4+IPIxh6uK7udyhkmudoTzU3ziqUxuPBP2Y+j6k4Wbw==
X-Received: by 2002:a05:622a:4cf:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e41c54839bmr12913881cf.11.1759263520062;
        Tue, 30 Sep 2025 13:18:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb528259dsm35069431fa.31.2025.09.30.13.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:18:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:18:35 +0300
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
Subject: Re: [PATCH v6 10/18] drm/bridge: analogix_dp: Remove unused
 &analogix_dp_plat_data.get_modes()
Message-ID: <hh4kn3qmwdbfev27xrs7eng7adfyli5xt7oiy7xgmviz2pzyql@rgggrhqckdjy>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-11-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-11-damon.ding@rock-chips.com>
X-Proofpoint-GUID: IYLvtU0vV3ZI-IrQCa0U52h4GOG1Xehg
X-Proofpoint-ORIG-GUID: IYLvtU0vV3ZI-IrQCa0U52h4GOG1Xehg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX/jAqr1+bYkJM
 VzRrkWRPWRvZMlbArJtKBYDn1LVA5y4EoFDDg29VLuWtRq5R6ibWdPXAPh7cW3cldZ13ldHv3V7
 zGCRds4zsddgH/+spj+GHmkYDYs8t/heP/UldE5hkhrBSko4Wi2B4qrzymVr1SJVpPY3bsKe20s
 bLldy5V3nVqjfjBHI/2DKWtUXoojiJJ3GRFmKeME3cwLR4yfwpGJVLasXFe+bhsywe3C+ZF5MwR
 LpQ3+YoqMSRsQpRPSFekgvRY3ETIep3YVFJwivd16G73gFxLsSl4/4Trlqky57Mpd/Py5ESjCp5
 mlGaIwps4aYEzRtnFZTZ5Pm3dxM05wCA57buGE5S6JtIGqJtkEiBqWHe+pCrNCs0msTp5c/NLVf
 Uvc+TQsOsZWuupTlaB2EGClAovXTZw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dc3b22 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=eBbjTLbptxnSh8XXWekA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On Tue, Sep 30, 2025 at 05:09:12PM +0800, Damon Ding wrote:
> The callback &analogix_dp_plat_data.get_modes() is not implemented
> by either Rockchip side or Exynos side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ---
>  include/drm/bridge/analogix_dp.h                   | 2 --
>  2 files changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
