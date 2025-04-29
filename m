Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB12BD5A0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928582; cv=none; b=IPdSDX14uXCm8ELeQxp+6/gCPnWtFLkfupWelPp8m+geZ6CNd9LnwO8ev6ktVmYNreZfiWm6x6QCuN2baOFvHRL3pe8UfasRP373uiT7PPyH8QX7Zsr2DuTpO3wwbvP1AUrTciHhN3zZlUUSxnguHR/QdcBHWJU9kp7eU8UJGqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928582; c=relaxed/simple;
	bh=JI/M3TugvXmROCbZWvHzHoi236mkIUCGUMYXkYi7au4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+SDxwMuH4BEWalZ9OOa21if/ZEdERTj8rHS9Prj2SNhCNpLLCr3NBPjrtQ2y1RP20cnbCNFk332Ee3D4VmzD+ZGgy2OvyFOh1vNZjdaAGt39FvrvuGgfoenb5i/MpRIh4hIJCg7auFNz0AQz14PCArRbs6sfRi1nolKY+6wxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkGLmgB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkGLmgB1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9lFfr006050
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
	VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
	60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
	sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
	kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
	SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
	DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmmf9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9255d5e8cso1036863185a.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928577; x=1746533377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
        b=ryqe5Cx1PhnCaKpIqXSj0LV6Huu+RiMaLLV8PVr4veyGfL1/BynOMqgH0cdf5QDKUl
         pssXItmYIhpMjyik3eR0ouAqAn6PNMAVCQyRU7YWxMmhXwckzNa6QJh5vydJRd0MTfUN
         fMdvi/gJiGO9isFdksw9+kzDFsjDCJwhy+s8gzFvi+v6kutUhy4frLhwL/XhgumJUqgF
         B/OIWcyRtq/EocTY9Ln/sz8UoAk8bBPhcFOFiPFHvxcNyf2dHLsW2sHwytnJ4nzUpoD5
         qffm7DCLHVT0k7zTWsrq289u0oNozaZuaCKnAMlU7iP64hK48tkSE/dGxP2AFAdQb2U7
         bMzg==
X-Forwarded-Encrypted: i=1; AJvYcCWfrMQJbWfNP8xDnn2DKDeaf4pWWZ164p9kHkG0LbDK355Z3neba7wkQm8NNtSmVn2B1Mtg9QJQM7SKsaOE9cP4nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/6VlU6hzD/rCLaeBTy1XOMAsZdX7k0KQA77cjynPes5dQNBEp
	LYnLUdW7l/3gbKUuhk0tYJ3y45DJoIJoUbpjzmAseGXkfHNWF0OEeUisuAV8GeJGq/C+leptE9W
	JvOy5FI3ohk6c5UXNMPDZiIIhjX4rDHNls1D8v7eE1cYp64V0xmJMloYhVqfSpNJBdjTP1Q==
X-Gm-Gg: ASbGncvyfJx5QBNWxa6yg0GoQmY5+ItP+v3dWWsE17YlhI45F3F/jhDXRhLb5Xu9O1I
	7a0a9F/lrI/3kiQUkrQqCBopl8MIxpd35bc/zRQNkQEmQXUI4nyquYYPQ90AxLI0Ax6cT9KBQYX
	/h+SAlasgxQCmSX2xdgP9PJHhU4rb/WURh9v6rpPSbDH6uB5Jmopg4DOz/fYk1pBt/47+yEowMo
	nXG7AitNsSZRcga5aMHDTbBPp5TVQUqntOMAXiEg4fWHcUXZtt+yEhXrZcGG7E/N143QxX+Whxm
	Zw4WHDGeNG8tPDjfln581lSnvOjsdUsPx5ZQIYuKnk4Tj9r/R8x5hdg/VxQfmK3VH67EJEXWuTs
	=
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556720885a.31.1745928576983;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
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
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Proofpoint-ORIG-GUID: b0fUcV6gIa-19jgsJrrPqe7cBQuUZShU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfXx5Bw+b4gejBm eCUL3qGdWfBOYwdFumQjsTSFylmmXUXt45hq0z9XBWbIQg0MGX+DYNj+8gFOoNEogx5iV5BskZX bKpEEHn1iWmlAgbSKVb0K2YzTEM3vI7NKyLAjmIBLwBXpnWDOrq5cYxfyLM/LwSxoDrwMLNH3ML
 HkH63nwVKqyRv4fTGrcrc6zjvYb5pAIigKnOD1QgP/3JF7/Ntg9JiOEbXqfRASrR/C+VuhFWT2c FO7RRqEu8fhrkRs02CXBklqMfmVz3QWmy9up67h359Wdz/ko6G0JaR9a3LuTXwXRzJ2CUnCG67o e1JQtEoyVEAGGruE2ed/zBsBJEntUEPlXAwrmWq8seSq9ybfnZmp5dqi0QY1W4GZhGHShYaogI0
 pmSmK8svy33laC9Mh4yEQDE3Q8FQn5rgLxPGIu+qRmy2WeH3fUNhcJih3STNJ8iwzLOmgH/p
X-Proofpoint-GUID: b0fUcV6gIa-19jgsJrrPqe7cBQuUZShU
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=6810c181 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=794 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
