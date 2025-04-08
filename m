Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBDA26A0E0
	for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Apr 2025 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114027; cv=none; b=SKbwY7Tczraj87pqj8lwGUy+ACQ2ODedSjgWYr+YmIIAGQ894RzstYIf0R+orWLDR9iMmQytwmEnMlp4LO8Hf+1qYs0TUK6Vt1XMspq45AHLWt70Quo8dlJo08uJwSIngE5fLSN1bnSEb/LukrSyRjnuBJFj4fxK0T0Mi5MzEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114027; c=relaxed/simple;
	bh=wcqcXnqgwA/2UFVEPkOb/WW5TyibBYqvJ5HM/5PHHSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKA7IMvVhFXgOKVAbTZs7+T6dk9axh7OtDB1CBj+HPAiY7bmECfyfXGqSoDUhJwwxnLmE2yUJ2RiHZVEM0MGmeYhPLmr4G1WIETQLEzPKK08OIC4fm8aissS8p7NzyIzYUSTxtoCMDfUbFO6oquUyRk7cJzdmFDCdT7LbyxLCMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGSHs8Ie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGSHs8Ie"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BFijw010549
	for <linux-samsung-soc@vger.kernel.org>; Tue, 8 Apr 2025 12:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okr4ff8snDUBXMIQ3O2Kjam3
	gElpjdiFVfB7cr7ArbI=; b=UGSHs8IecqIbnMxL8cE1GcJ8I8WeNKJR9JUc1AsP
	p2wvlCfST4uFdb8kTot56MzlQCypCTyqcHkcu2J3Qmv04DDP3odCH20qUYjQ/iTS
	kwXyL9wAxYAOKtbt689MAPkn7omIy0lc0PpDQJaXZgEyWtU8KXMEpVqisIDfCHRT
	bnq8uH65plRDMMdvgxhTBO752R41Uy/u53ibTzjTFWiJQAxUePstp8LhNa0vLEOa
	AbeGPbXj9HaHmT4/4Vm/khvxuTFXxbU9EUMvBR76FsXMDx9zvgfxxfbUUAd93t2U
	SsRWUWH/PFGqGXW7N15KN9AEjSCq4Ll8kmt8vWaOufuYjA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1fjf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2025 12:07:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso62668786d6.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Apr 2025 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114022; x=1744718822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okr4ff8snDUBXMIQ3O2Kjam3gElpjdiFVfB7cr7ArbI=;
        b=mXmmnlreynyKjigV4y0jKHy1qr6yhlfg/viPOz3izUmRvRKEXgk6mZVZtBUasQMv00
         SF35ZZ1NHrv2/vFhETqOE61mhY0+7kKOlvGUQu05C6Aqj1Fm4JkM+/sdxpNAu84RsOYk
         8qYL68nKLIEr74vmnUqoaNRDrMPJ5NA0zVoO3owlMApMfjnUUrr45LyFjp50NRPmE7JP
         cRUw60E0t7uefA91lxxt2gM6tQgJ2uHpLMtXy3lGdeAXP5OyeOQZLvLqYuyJd55wl4Fn
         EiMjc3+9XoQqJJnAgBnBuZi/Aoau8D87BzlwGy5eh8oIHe5XQU5IQCNPjRcOjY7Q6j+l
         C2aA==
X-Forwarded-Encrypted: i=1; AJvYcCV9tUUFqBNXewLneLPkMT9S+IUykaV/DUQcshpwvKq8R2D3Kvx+nAQnzu8eRPpU3h2Ix0Pbh0IFbSNAw2evQHVRRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf9/JnjTS+lzBhgCjmVwzbs5snY9fIoALHkLcLFprJuF3Z3ur2
	4GCh4Hj4wobZf3f/l4m/ARlgP6egb0tY3IsGC5ZpXu6q5GsXvOgRnQahef2/J+16Oke41Wt3mMa
	mHYQgUTunqpBnUlhfonkd9triU1Sd33uYhD+cy+ROeR4ket8TX7sIh2cNyFTSMMwJtlQzew==
X-Gm-Gg: ASbGnctsGDWXBN6OHVwlMYBz6KNZnvR31Zi6IWFRlaeXkDQZo2PsCtVvt6ZaklbCT+y
	TsWA4l0XlKdcl5+rB6dJT5+ETgwlZ8Wp1Z/KW0CZrOT0Kr/2eoXrAkGtiLGpHeyJXZ7/+xnoRh3
	Rpl2zY1hAMQ7hspIg57QExHJT6SoINgAZDmx/7C56oN8e2DpPzUogmDsrrooIA5DKw3W4g1kRlu
	p78ZuXs7mAOqyA5xeuaLQjqLpLLw4cHJ/KXdS+779WHlpBk0sgvwSKTaoMVQVBQV2WcNnbHMPrm
	vox7Bc1C5ceqfJUOYosKWy1vLo6WPTUTQRiTXmETOa6scXsLg+xPiFytp+41b7AqnY1btct6YlE
	Qmus=
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6f0584a4650mr222250526d6.8.1744114022415;
        Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9w2RBz2reqBHaAnbyBnIgRXepoq+7WOMXuECx/UyL5hge9Ble8kyyEI6oTqzp8dfXIATI6A==
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6f0584a4650mr222250096d6.8.1744114022090;
        Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e66377esm1493456e87.209.2025.04.08.05.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:00 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:06:57 +0300
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
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 06/34] drm/bridge: display-connector: convert to
 devm_drm_bridge_alloc() API
Message-ID: <o23cjtq5i6m5xwjj7ymknorjsv32e27anugbek42nao643kdct@6nghdmm746ij>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: zQx1P_b8W34aDt9qcE69arWi_8gkWxFf
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f51167 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=IO8BAnyXGLrJ2ajCqTsA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: zQx1P_b8W34aDt9qcE69arWi_8gkWxFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=930 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085

On Mon, Apr 07, 2025 at 04:23:21PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
