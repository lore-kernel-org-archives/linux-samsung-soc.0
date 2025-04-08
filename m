Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A981268FE7
	for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Apr 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113561; cv=none; b=g5fZMMKJqxKUhVLPl3zbqrffee5hbU0FzZV2lBDl7R35cNRwZ4p3+tbPazBV7etRHNFztMokRKPKtM0MXGui9h++NfwSaRig0TiArNzdnSDttyvIs5t/DevWITydo+0fDzhZ53L1Itdyf8hvAg9CLKZQAd2a5UfZfr1YNMxDY4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113561; c=relaxed/simple;
	bh=ywAtJrOZahSuq67rgk+Cy/2yM9z9HliyPt1CSsso76k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYpYQEdu3WZUYWW+v2ycoUBrdcgxzOrLnKYVqAYv2p1LH+oRnWpUtM9niSDYIAaCphziTYJv0RTnM2RwTx3xQqAsTMcptY5UPJZCIgAjBB8NK+5n1/7mpqI26ycMHDUiR9jO5JTG5VuKrNjMSOdN3xmIrwOmilVE+lbmQBOYL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qq0eafbl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qq0eafbl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BEVjI014995
	for <linux-samsung-soc@vger.kernel.org>; Tue, 8 Apr 2025 11:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SfYGShmqcwDU8m6aPQIeDmLf
	R7GexvsEqe4YAvcqLMU=; b=Qq0eafblor3qJaHW7n07AL9wxfveW1I8JCHLiC+H
	V9piv80KGismzTB5g0giCp2vGl5NiuE7MPsCrHob7HF3WBxcbnvH4rsyfI7Yblve
	d4oodt5CF5fF6IXEi0rv6AqzVcmFMl7ZC1dboI/ZcG+wydrdymBzznPgskQc4DA9
	ljYD+HmmufXng68S2WBHECRg873kfgxI9H9JUsg+hUbihvlrKD0WuyVt6Hhc6Ri7
	1wYLucM3v118dxFdb/2QCDt2lAEYCyF/CfSofY0qFHsugaZE7mRqZyjO8xHL1Adt
	QF3D+iZw6JMSAiSbMUhcFQk3AO/1eQvB+vYKhBfJfKx4Ew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbufnsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2025 11:59:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e905e89798so74796126d6.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2025 04:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113558; x=1744718358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfYGShmqcwDU8m6aPQIeDmLfR7GexvsEqe4YAvcqLMU=;
        b=gupjqV5Brm6RY5SPP7MnVhhn/HQF2sW6Bw3rATSA8FkIURzXGcAX8NEpBStB82bSCk
         9bXOXwl8iMbEhMeIZ3fnfzounNwSSLyw2UTRlr29K0vsaxQEhT7+Zmlh5MPYnMigKp+E
         B0CDR1X6UYgGXZRZxqBeCtLszCrUfuYfy3yZQb65zbOoqEIeyhW8vPy0/Qrj1qeK0vnB
         GrOupEjTOWRpYyDV3GkcqqwvwIve4KmQZ1wQE3H9bXxPY7KetKJC2jVo3onZGoIFgFvI
         /cEY+EqOlyvx7E9frAaBaxqmI97liRNHcJ/N3safvC3rmvgkQcwBn4uV61IWG1+gUyLM
         Sudw==
X-Forwarded-Encrypted: i=1; AJvYcCXlN1vLFGRI+o/N1+3BPM42gYiyiBwDAQ1SjBEHEdGTeROjm+2PYazLaIe31Iq8AAV8lfNImmmpg9fSPYhtTS7tvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGIbtsXb6DRoYeHM7R0K57Hmlu+lVhwqYUDoOAzg37D08IBgYL
	xhp/45wvO9nKLtN1Y58J/cUP0zt8ajYdzzyQuqOcEq1J51DUFldDLb/fMbHKBaq2iSJ42uLCnLA
	DijTAY9pnm8TIPRSn6YeZ9I02o3vR3VBvHvsxAYbbLzBiP94kbtDEnB/wBmmQEcznVW/Xng==
X-Gm-Gg: ASbGncvhDEtQqBVpDx7bb2kKfqCpPKyLqL50MhwBV7dtvgI5myGfC5dLiOPm6Th20Ss
	dmRMKRy/m8S0c4xxD8x3iC6WTQML4/j/CaGf7R0tG25fKcyGNqM1HcbKwaxKkFd6z88JnVnC4Ni
	CGRBwToIxHoIt0Hnm7KaA/CbeS//Jy8IUL+GO1H6K5DWBj9CHoCMhYmTxTlZiNEbg7AxWfSSxaa
	G4d2pKfwe+P7d/H02v/S9JrnMCSQzdAa4j+CbEXLTXcNnWJnqsN7ZoEBc6Y4CVxGi2sBxMHN2TC
	Ok4ndkmiimDrtMl4kE6Njti1d5jzH7OAfhI9zMLS/nSQsHX99L/lj2k6vjOSjgl5LAUSrH8kwXf
	w2bM=
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6f0b7471828mr249820846d6.19.1744113557870;
        Tue, 08 Apr 2025 04:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUpzBYgQ78WcZ+1SeialBgHtwM9sX7c9zUkOnk8QyfR5MRu/+7FIzLJ9zYjIy/Tt3IVQbLfw==
X-Received: by 2002:a05:6214:20a1:b0:6ea:d629:f48b with SMTP id 6a1803df08f44-6f0b7471828mr249820476d6.19.1744113557475;
        Tue, 08 Apr 2025 04:59:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc04sm1517615e87.164.2025.04.08.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:14 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc()
 API
Message-ID: <6aeiyzkrjgq44lhdjsh6o6rzibwmpcgxjwwx4vefoyk5n3p7h6@uipdbbcxwsbn>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-18-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: l0pBYvebk_I3E6Y93MgS0bFryw8KxQrW
X-Proofpoint-ORIG-GUID: l0pBYvebk_I3E6Y93MgS0bFryw8KxQrW
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f50f97 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MqdoT2xZwiyagvIbdbwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=933 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080085

On Mon, Apr 07, 2025 at 04:23:33PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
