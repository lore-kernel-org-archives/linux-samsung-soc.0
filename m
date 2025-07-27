Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B004212B3D
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753634262; cv=none; b=TIxuVdExAP4rBIMNmhlshtDEhNo8wS0fyt14QN1SGRD8pbXMdg/c9yU636/FVtH2k94Ka9o8NKKqiA9lZijnuE8oo0Ozdgwe1wDkSE9Ta187a2SsIMCv6kJuU3Gs6GOUAqEGT0QVqpaF1s0QNQLQDrH2JG3hbu1Z8695olqmr+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753634262; c=relaxed/simple;
	bh=/hyRTPmAmkAHxy8tJftSKanHmXxH651xE3r4m+wusw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ert0uMzCudVd5S7Eyji7ERo6NM9N0gakZOLBH949w7+Tat36VokzYU2H+fxnZhAvKwrbi1o1Bc85lkVxaQDVG6EhX0ORYiL3FkGyL+2CeOeuuui5hU46o91S44HKnlEiLLzA9z2vgpJtTV/8tQXmiXVetGA5LK1FmIBwyhw1zyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qn/TluVM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qn/TluVM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RDcfPS002055
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 16:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wK/7AANYzXjuDWi34c4pgwf9
	uDLv5k83zXcgqhJz5MM=; b=Qn/TluVMApsDuwbUJbomJ8HoK9g5RC/YolwxcDiJ
	4XjDV8hiixmpZtRAu4metDviUyVQmb6gpW3ZRRE9/nK+bft3S6H2+t6I5lVHmWta
	p89PHGsmKd4l1dGIbiLFcQp8N8FSkdmjGL9acM2a+e5BidkLnCx8KoaDm8MyQkAU
	phNRaM4uEjNzh6zD2LnHQ4tzHycwAjaIQXEhjMh5W8KiLql48ocZLGMdhI2fpGAh
	MuUjXM9F8lns4O7uIE+t+FSC2vt/0cf+VF9NScJ3A5bkfG+2aNbJZRIsNg0Ef4FO
	AQ/ZAIVUgSwDHOaPVIHv3JS52Lllu1Rj0828Eiutp6Yc5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xjbbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 16:37:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-707453b0307so8391486d6.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 09:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753634260; x=1754239060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK/7AANYzXjuDWi34c4pgwf9uDLv5k83zXcgqhJz5MM=;
        b=djg+4nViBURYHq3wySLHZtwA5aoIJ+T+K0TFH6RIlvPU1Rjw7zA26IcQAN/fldmHpA
         Ct1+9D7uHxM/MGMSxr7F6XVuyNCyPBNUJmLGS7SQPiVrJBsznOyTkHZ/DClvAz0M83Ir
         lwePeIHvUTqyNXiVde867voHaC0l06NxzdKcYZX5KCqi+OMcXm4YnjXMmJlK5VnCfZM9
         jkDlteDctU22Vut9s5X+9PnlWBTRiUC5zlTiVZb1BGRfrvHcHuItd6nMvvh00eOtXk/6
         Fi5/zpvEX8EnglVgVKyC/Gp3GF8zTrOVIiyPtbGb4sqp9rBfil5zIdOPyWZMsS8uHHFa
         GyJw==
X-Forwarded-Encrypted: i=1; AJvYcCV92lEpwTKN/2IpEncpgDiUtMjN00sTb+d5RfLtZ1Sl4CK0s40hBGLm5vhVPoWysWP+WvwPs1Y1B8JAbgesnCZQRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxojHNIx9wX38jrpAeDTbokvVjpHZtm699qYZwak/LMYXi06Ksm
	cG49c4CvJPLqVkgRygfuKE/Ve7mw7awGLJvrYZF/v7vqC9Z6zTA2y/ik6c/o4j0Cv/nlgP8pQSm
	SIp5b/lfzN09/BK/Zahz6ayDf6960SP6kI9UpqLy5QCe293liwx+YSqIguWEgYmfEPq2VT0cD4A
	==
X-Gm-Gg: ASbGncvKthPe1s3xfb0IQVcj1a1S6yg39WpQ72tjeCMNzOOPigQzY3JeFtM9J0HeeOI
	bGXSD7VsOoFLIF24KKygTdIggoovwQy3iqO3ubZM3Enlw6k+cgNeNCh3d6rOFiZqE+HBoWQ88Sd
	L+rbJuuv5bmouCvA5vRKvLsWsi0IRLAc9dUer2JC82vzmRLv+ryeQQPxvDp3C4a9zMjtlE1bAiy
	m501E0Fv2y8sLeQ3pK5tCbRWtaS6vFjjc46P0JtviwRBQZdARnxze5o7X0oGrEPJsiCXNKO0HYg
	Ux5juXoDnwHvowjo2iu+ycuRWfLphb9HuGL8MIaPowPX14EVJh3PJ6/HrKzvy2CXjRxzFm66wDD
	aSeIBcfzE9/tcnJLmOvFbmMReLdoQJK+op7IFd+uHCnCzdZmret1l
X-Received: by 2002:ad4:5d48:0:b0:6fd:37c0:2c74 with SMTP id 6a1803df08f44-7072052e0b4mr146241546d6.11.1753634259599;
        Sun, 27 Jul 2025 09:37:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCEzR9cxfhoQf+JRJGJJ+OBE525ZBdzHU5iOMQLP/D8dHXrDVAEtnxnZAfMekTleUclCVblw==
X-Received: by 2002:ad4:5d48:0:b0:6fd:37c0:2c74 with SMTP id 6a1803df08f44-7072052e0b4mr146241226d6.11.1753634259033;
        Sun, 27 Jul 2025 09:37:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f426e396sm8705181fa.70.2025.07.27.09.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:37:38 -0700 (PDT)
Date: Sun, 27 Jul 2025 19:37:36 +0300
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
Subject: Re: [PATCH v2 1/3] drm/bridge: sii9234: fix some typos in comments
 and messages
Message-ID: <dqkflgvnthhej44ocyqkeifixtwjwpyeapq4qpof4ah7kt3ynf@e5svmfyeimga>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-1-faee244f1d40@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-1-faee244f1d40@grimler.se>
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=688655d4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=7HXEQI8gbsEklOhadn0A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: _XhVUKaG3tn-uVBRlMX7K8hfWrGq7udl
X-Proofpoint-GUID: _XhVUKaG3tn-uVBRlMX7K8hfWrGq7udl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfX74Q4Xv1U3jrg
 RuKNC1duvwe65K8sC0I28QK+xgEFt8XQGyCFikEyYzKUdYvOZ60L3zReahwUcs31Vou0aQ8Nbsl
 CwzPWTzoqtHq77uHPlGZMPL/PkwZ7/gUtqhcj+X+29/GTg8gDQbfpLnD1BPCtYlxcyn3KkuZF5E
 rJw5he+SuhsBzP2sXT4qy3C0zAKFbcmeyCiIiEVd93yiGeyx2vgynXsFWf57pQh110//XVIpb8s
 e3KqaAk9grBjUnhNxop9Z/a9S/Ykb18z/45ui6RriYHbMT2OpZOPnonYPCiaRJYgtCXEvZMinMM
 8N0j3v7xD4NSiLXC1xpvvyGQWTrvBpgC0RqyTMtOjNdDBHJgg2gzxMmL/rLJHbH/VrduusyMvlK
 xQ8oj3Ex8VejAmRQiDqbvU6pxpI6POjzoIyavMPk5XxquaH2o1HjHkN4Xfc6YkeyqQgRvM/B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=992
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270146

On Thu, Jul 24, 2025 at 08:50:51PM +0200, Henrik Grimler wrote:
> Fix spelling and formatting so that the code is easier to follow, and
> so that it is more searchable.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v2: no changes
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
