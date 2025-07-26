Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8721A2E36F6
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753488869; cv=none; b=UJ0PuaFRrI8gdY+FYHbS4/cykxe45kaZdsESzfOcrSo/PnDLVD4cqkc/eYeJzYdJJ621L5+2GvCKPtIG9cyNFSKbww8GJP35uwmecHwJ41xmt1tXxiNtgOi8Hxnl2neEGDVvZ8tQChvOpPRypMIzaF+w9GafJ9G4J67sZULcjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753488869; c=relaxed/simple;
	bh=pfyxo2L9fxXdUPIRR7R634kUEqbtFvfEmbWXEz0aSYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZljR1pA4T2szetfo+8L9Kf9DOvMRCUpTbdfU2O1nuezd6Vfn8oPhRPR1KxeFh6n2s1Gb+0bxpDv8qmFZ9QrJw0TFxqfriTy5Hu+Vj+NSgxSPlU9kFQ4lNo1Rca1bJn9IgAqdf2zTKlfFhDtf07QbuWF7xxhThirLpxyw4ZFu2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/Pg0FhZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/Pg0FhZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q0B0Wl013012
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fVtEWHvXvUc+qGfFc/Ohqisr
	YtRe8clpA4PwpwpT79k=; b=c/Pg0FhZcPNLb4l+6MQw3GZodRoQJwCs+p0WPYs3
	E4EDW7a2S8tEI6QbhZK2/bP1jkrWrqQVZlxftkJ4GMKATN5tvnYAwM6GoWuhNcnz
	Pe2cjgsabm/NCyhtILNPbSqnlsBkRvUD172jyVcdFOyQw91a5gDmbjYlRbeDzQiK
	ZjunzAkUPbf3NVUlvbRY99+pn5IhRbCaAw6whsDUMAfsiM7nIT5hQ6VgC49Lw2fv
	vP7Tn7l5As55LNfW7T60MNTesDn7ByXWuSvES6zKUW+z4o+7mlEn9H+uQwEc52sG
	POS7p3tykbzveuFwypm8whHqLvxkRMAQIypWApAT34JXUg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484m7wg07c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:14:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70708748fbaso41814816d6.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 17:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488865; x=1754093665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVtEWHvXvUc+qGfFc/OhqisrYtRe8clpA4PwpwpT79k=;
        b=BmPnPPaXHgEbSlSEeIJdzueY3+SqtVg3bqSxQ+mDRNDMDlh1aH4/+EsSKdue18jLTb
         xxJ34SPvtfHZRTBL2/Fd7edOjPYnhglinRclWjC51L+WWS272zLkIxkgLtLrKGep2rsy
         R5rjzWR/jIGGpucMt/Tt8XrCUc7crAHNka3RkAk5iLEuc9LsNSdLjkR04Q2lbuAlK9W7
         WyyNW6o1eCJSMI6LmDBFQGkshXPMrJsUstRXfJTChDEWxrXVcwkg7DvKvPPve/xJS3S1
         6Y84DJUea+W08b2OJ/dPYoEdq+HUh2znWYGyk0Hy2gtY1GBpPXjsVe5akkJDtvt4BP3H
         Ps3g==
X-Forwarded-Encrypted: i=1; AJvYcCVLLCC9EIAs9vxn0/srmKWosA/O9RxFrf2f6vBhwA28zfsm1OZ8AbEfMu5n+g82PoLSKsExTCxGvuKnsjXDn5bP7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ATZ1xsELNo/VTbNywSJMjudgez7qQdK0uy2RwKozcKdhLd66
	n1tVk42IUmlPq8WfABzeWLRiY5VY1v/dlaJjoCO9R+Lo7ILExuLGijVPOdfVP44i0qoktTPMIjm
	5hxI8H9OeQogyrY/CCrx1PB7BRQIk23yeuYcPvNE7Ep4dPI8jeZxfQ/WWthCY0T93HkGULLsyFw
	==
X-Gm-Gg: ASbGnctj3+NBU6bYeXTTaG0MuJGrcBYttHllJz5HIisdQiKQDuKxZHYLWQbQQ2kCfJZ
	EnZoBgL1ZKHwmEmPBxX6QwdRmG1eV4aiR+8LhWy4/cbNV12wteLxHShCKUQu829G5cs4gX1MENy
	mhZema6mBmfUZQO0Qsenez+AdBH2fBaj9vW/8mB1C404VTSwEGtgXAqYJEESiVeE4wkZunkOPI6
	Ba+EYEZWHAIta8ybRWLXFuq5Exjh9ANz5YfTzWLo1qWzlrD3BOl+Sm3O/RY+LZKKX5RSQbAAV/s
	VO0X3GFWF4Cb7U/01vd8a6biJCLP//MFk7qzN1H1LooiBSHCATpp1RYAbWZmOd1i/dhifLFnsS2
	z/ggUDwwyJAR9bjBE4ORYjNntd4zdbOR5t7bHVsk0WFlR+kZjWacV
X-Received: by 2002:a05:6214:519a:b0:702:afa1:b2d2 with SMTP id 6a1803df08f44-70720519109mr48479146d6.4.1753488864856;
        Fri, 25 Jul 2025 17:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8LMLBA6RRSlqAfWuEkNfbGOnD0mlhKsga/BysfgtQevo2p5uY8FU1lkB1NoIIU1STSJSTJw==
X-Received: by 2002:a05:6214:519a:b0:702:afa1:b2d2 with SMTP id 6a1803df08f44-70720519109mr48478786d6.4.1753488864339;
        Fri, 25 Jul 2025 17:14:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63391f37sm190687e87.170.2025.07.25.17.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:14:23 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:14:21 +0300
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
Subject: Re: [PATCH v3 07/14] drm/bridge: analogix_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
Message-ID: <b7szam2wjxhbwnz2bpnejyppek5ag6vxibw7wmlwzdajc46dnv@xh5lc5bymg3d>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-8-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-8-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: a96UEsAhRtXe_0pD7U_Y1n5TjsdQ4Kcw
X-Proofpoint-GUID: a96UEsAhRtXe_0pD7U_Y1n5TjsdQ4Kcw
X-Authority-Analysis: v=2.4 cv=F4tXdrhN c=1 sm=1 tr=0 ts=68841de2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=r8lg0YXQRZsV-nIv6pAA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX8Uu0FMlCa6u6
 sy76xPv/DPTgmqE+F9+Ae6pnLfuKgYMOM9SXu6pUWjOMbYj/LT+flo8sjAbxNmuc9l8WHflG8so
 BcUCh2Ceo0aJB9nol8J63e/Bj12yY9cE+hklhuhwDdQ5QmPRjJTRoM0g6ljyomZnKSPwnHbBz1F
 7KJp6V2UN5zo/JEsoeY41q4TuJWd+YzjAJbJbxr5BFIFDlNk6gQRx2rD2l92U+Pxmr89alz1DYU
 9yPr20Rd3eSUEEBN1aBypWA79Fb7p/ycwQy9AWwaoGD0a47/Biv0LuUEkUAPEWLK4AY/i1u0WzA
 ExeYQo1G47Vjh3XHpx9/ge2cD9J6RByCfdQvRihOVA7sPmHlHE37weJQh9y9bF50W/EN34t1LLO
 X55SzostnB+wrQA5btsEgcsxTzH8Gr+G510F/iRHk/nnD1uHMjIua3DUucGv0uOWTkOuvFwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208

On Thu, Jul 24, 2025 at 04:02:57PM +0800, Damon Ding wrote:
> The &analogix_dp_plat_data.skip_connector related check can be replaced
> by &analogix_dp_plat_data.bridge.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v3:
> - Squash the Exynos side commit and the Analogix side commit together.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 1 -
>  include/drm/bridge/analogix_dp.h                   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
