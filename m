Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F79F20C038
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759263670; cv=none; b=MqV/e40O7YosaCnVM56KxdH9Pvn62zlhltBF7lIUuYwHUs29wmlaITug0dCgdx6jCwJGdJtHKWrrEZxSKA5ixnt/+OrPdgvmybLRom7VuhYWNiAZpC7FEb3DJ9YZqkyx18lISm/0e8S0zK7bTlga/XUjwgegXCiOPA5J9kzeXT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759263670; c=relaxed/simple;
	bh=rxceyoBHzvM4ZjFAVY6FkDDrXnSA/1H3WOTMIrvT6vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIeXwOHiPJSZ8nZEXoMcyDFNPUVBDW7z/+N/WrmgmHVOnQ0nsRdV9qHcYtQrxX0kSqD+OA+GMwROtNRXf1dTy/ntEUer39nBPTJfXZRpEp66ERx25YVsmp+qQ+Hi0uAeh7xuIh3k4VyJfj/Omv1mwSLRzah05rDAiXKE3LIJY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKIFGfsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKIFGfsA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBbEXV017818
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VFb0crc/qOwGeBvP/JtK6gr
	pmOtlDvuwQF4VkTnYOY=; b=OKIFGfsAMS6m9Xdz77R/OpPAtDirEHauS58EhqBK
	TFdGF65sxJhhca0WWxoGIJzqTzensMRHi1C4MUxrjEccLsQPnreEXG/IYa96Epp5
	vp2O/DWSYZSHs/H1Tcw4yEavtsgQB+LCBGFbhwfq7vmCvhoch6shAXdozWriH1vd
	SGRy2WHwYItvrIRcm2jYNTe/BAZROnuMzfXh79HwM4h/oA7e5RSs1p7Hxtx0y+wD
	0MlAkDlzFu54pcauGfmFnSyJJB/MwnHpl+KEvIaoUsXbqsuwFSOQZWe3U0MkjR9q
	xp1n2t3tcxIZ6Pg9Z+nVVQS/wRiH2YNRsJxFZecGEJpOSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80ttgq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:21:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df7cdf22cbso7351971cf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 13:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263667; x=1759868467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VFb0crc/qOwGeBvP/JtK6grpmOtlDvuwQF4VkTnYOY=;
        b=PibSBipU5LE3qK3UA+vo3Xvo8JFRDfHtpFCor7APqoLtDK7RjpgYSjidCR8hnlHeBv
         h3dsZHqZfq4FFVwS4qnOyb7hhsSCtqkZm13ollny5fNyDa+pBIe0nyCW+zr5JuVn5l67
         g+lT+xlLp+F2GoCcKK1YLCyIoaE7GXUnqOOCocZOXNPPIkP96xw+HU6xO4qAkN+AUSEe
         DMcJWvgYM/a7XzJuXxd2723qPgXTdRsUSWvspsXtjTVYaiZ+ajmUBdxuubuS8fhHPh64
         teLxseqK9/L/xJAVzbTcarqxg/hOBJfnpNFW3x7fEDqRCsZxFgvNZw4Mg8pPjkqn4C/x
         +EvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyaz/QKmmY3la2931F4eANqQSL3ZtaONMwk+jNG/3bV36RsBylOKmi6ogTxU2JC2Cs9rqy9IKbqZ2cSPqKiengRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFTXvykUOxyptkBPMgCMK9ZxV8rG3mhCjAMTNQtL5Ae2PmITOe
	zDILGhs/tazvR1231Z5AdldSgrVOi6SY0p3PfbL1Aqv7vX5LXCwvEkcO6sHL/F8aCy9HewDfQEE
	keU+oI4g7xgXGNzKQx1onqhMnMY8nczmMijBfsCRqeTpN1ORcz87TllNxtcTwSBnORr+q3zMjGQ
	==
X-Gm-Gg: ASbGncuPTwJG9o3itwSPLdzUBkAQeRPNpHbQ9/C49op5vysjbRUfqVEJEMP9Jvy9Xt7
	L6Musrn1pcXigy3nq/483AuvSwNU1bJI6FSJFz7XEBRiW1MleXqiFO04ptuc40gyiv9+bkZDAWM
	neqPKJGv845pCx5oXT9PEK47LqXaC9gksiVFvIx8xXvqtQABgqNR8SQB6Hl2j78FPha3D9c9HeB
	j6garPr3sNR3wtDtk9HAGFyMM6M09wZOiEH8DXon+cacJ92o2Ob13HbgmQ3lSrV0jIpiWw+5zi+
	871JJHogRcxI+pVPLaY7fMCUeGDdUgF/tT6MIp8EWQbO1KAPNWuC+1/vxrDhIgRE4ieBzszdeHP
	+zRU+HEPrmW8NzLvQreBFAmIOgXWhLmHjIDVcNIdebjUG6Y3v47qVC2dWlg==
X-Received: by 2002:a05:622a:5d4:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4e27faf2456mr85876241cf.33.1759263667297;
        Tue, 30 Sep 2025 13:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs3xT3p2rzPd59HRBIpsMj0tVPI+tZJQCN5NZbJA76QgFcZCY2wPZXNF7YjDhP63JSlWg6Kw==
X-Received: by 2002:a05:622a:5d4:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4e27faf2456mr85875861cf.33.1759263666813;
        Tue, 30 Sep 2025 13:21:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a32113sm5289277e87.102.2025.09.30.13.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:21:05 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:21:02 +0300
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
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <4r25h5uaamfkprrmvrtdqfjlcgcnkfyca2o5q53hteta7rlrbq@xqlrjxhi7z2u>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-12-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXwVyeYU2nwydF
 wKnFHgtnHn3f86mKSGrVUjrt62QIKvlaoveljFOw1T6F5M/gOWJpghNdnyNBS47/xWZkCvPSDNN
 GYV0T2yVuAnjrcAbV19CGn3gGO0Ae/cN+LiyGwi9eNixYbiCH3Jb2/Bp2SyUsanCKtrWhMy9Tw4
 VIfG18KdzZLt4O471pQ1Lv78H5TSiT8VaBR9+FFmSQn2nEswXX9Ytz52d4MhTkHWrxj0C7Ue9GE
 9OrK0/wmcgqJ6YH0+JVij98SCWDxRoiPk8GPWEYQ8cAztbLjb7a/EHt4dMiQRNK8gcmnl2KP3Vx
 fKbVluOSSsOQdIi9WERGj6sMqArxRYJ0NI0a5IbHUqs57k+vJDvluP9zDhu0swqvy4kdXe01kVp
 b17ttDHbMnbsAWUBf3MysNe97RsUdA==
X-Proofpoint-GUID: DERDc0ZTwvA2zL_KrZ_hA8S4l66B6TBS
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dc3bb4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=2L4VR2zxEnLzMnak7dgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: DERDc0ZTwvA2zL_KrZ_hA8S4l66B6TBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Tue, Sep 30, 2025 at 05:09:13PM +0800, Damon Ding wrote:
> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
> 
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
> 
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
> 
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../gpu/drm/display/drm_bridge_connector.c    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

But I'd suggest pulling this to a top of the series to let others also
take a look at it.

-- 
With best wishes
Dmitry
