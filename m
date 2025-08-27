Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4762DEA90
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333648; cv=none; b=hUw3yWPzygb3Ed2ei6ri2mPvs0PEUHkg9fpmaCVLUnKqdzbyGCJp0Ua7rRf/kB6NApZS1nkvt0TZKRgqNs2c4dU6iGmhvcO/72VOH42OnUo20yf+S5/Wi7nDYb+cQDpzwuZWaVm46icRKbQlO678bEPPIJ3ZQIfdUkcRzc62E1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333648; c=relaxed/simple;
	bh=39TfirOm0CvaijkhQPEcSMxZAXyiBUqSqGTWwYkVIEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISBkeWAdFO/FGdQk//UUFUeBE9fxIIAsaXRSZ0WxnDOtLv+/HN3wth6GihwscyypfPX7lmHrWyHupZdjohWztTS72zl7XlyyQasyM1wLdRL0kKFCY0oYf/IyxPHVKSwdGgnu+6NqErrFTimokdaIF+FKXubE8GmJzqwU5gv/2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3nSP7Gc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3nSP7Gc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGDUpG029068
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 22:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=coI2WbZxINU7lzeYxnfoWTr2
	sAMMNa2PgUU+5RmzHvA=; b=N3nSP7Gc5TMt+IIn+qZ9uGuYzVafaBp1ac2JStUp
	K7rRbNrItFfkrE4pn3NSwfK3EJKU+G54f3mtlHj6FVmTiyk34UhAcW763bLSlDn6
	lE8nZPvaSrrbDD1z8NV8GMsE+EejI9+PUuTSSHiKEagz9bQN6sfvpB5/sPOKcU3B
	hixfH4Wr/PN3um5++i/3CX9NXOAeLZ9SXBULzqfYPbTbm7cJ0YT0lWqwC5hM7lYu
	l1sOWd/H9mcZguQFv0ANnTeWef+C8qNF9wb0KmfE+GAKuhHp+eDVTrDi1PKjuj3Y
	LyVxJjOjvzkfxEw8ajNN66YMc9YGBbuSSUh3zv0iLcgaEQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5ume8ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 22:27:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2f7851326so10481101cf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2025 15:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333644; x=1756938444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coI2WbZxINU7lzeYxnfoWTr2sAMMNa2PgUU+5RmzHvA=;
        b=cBgB6D2NEyxmHQv5PEC0S0rdn3d661aS6H0eeF9uLzN4oixwSZS699fohcdFgH7ukb
         1HEo2rBsykZdhsUWPdxQjMQaueuQ79SxiUYLgsTqxF3qeeMdqTQTschZpAlQVzSNR7Az
         bZvuXPGlsOHp1sEva+xTMFqGSspY56DzC1a2ZAMtyFWD93WEXqwr67nVAAWYbdqPSM2u
         9rrzAiIpJYOsczckx0ZD5OjXH8uMtrmiaHz1rnjCxl6600uiW4W7G0zQwU2XPH2wtN25
         QAhgZXY33p9QgKh/qMDF+NiHk0KmEJJa+nA8QZY+VwFrHOjfgvnbr8A1yb+60n/aRxzp
         3fBg==
X-Forwarded-Encrypted: i=1; AJvYcCXdczPSScCrwp+zRXmiXLD9fHKvZZFtXH4NI17D+LGBs8WZefK+qQOJnj/o5YBaIj53pedXeKqjSthu5a0FFZ8egg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj8TRun/AI6JDnQ/EAFIo/vqnt7TyGERiFIFUlGm/5/hpOjS15
	7z8HzoVMFsuirkj+9nmPIo/9sTA8avysQElTR+/zvuTfBe2i+fiFPQuSsYhBmCYSUS9hxxM9ZWz
	rKAsPPiTlX22M7zLi7Qp0tFTK4c+SueCLZQPjF13toCHh8iCXkTh1Lglf55JqlLUyH6Se1kJmnw
	==
X-Gm-Gg: ASbGncsjVmZV/5m+PnK/SbxG3Bg7ORsBq4mbgM5jPPGdYQw2h14FX0QsxaL9jk0v1Ut
	Mm9/jo6p7B8Ab1B4KVinbSM6G3a98WCk+lVPWLNiAWs06VsYXPoIaFPxWAUCv7lw3wEB2KaYFXL
	Krup9oYiJ5+tid+YRh1xlzjbWB1bpJjcfyjaj8pZoVKv+1xe5Fin5EN67Y8I7kBfx4G3Y9Es4iK
	HYEQo0qgv/Zb6WQ2GVmPQNcge2RTMc4om816YRsf1j0/SDe2vHi6l30YY2QJNk+HK3blc5vr8mT
	6OuY3aUnAS350iHrTiUpCSmfri8WwOYXnwvA66Ycaa4NBuVpd2RtiRaarDEPoBjH1KfVy1fD3iO
	S7BRdyJJ9ge4FtJhES8MSMXuwlAGNH9iAsKa2vZCE5zfDYBb61vfe
X-Received: by 2002:a05:622a:4c8e:b0:4b0:8f6e:d70a with SMTP id d75a77b69052e-4b2de073d4amr102607061cf.22.1756333644064;
        Wed, 27 Aug 2025 15:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfGaJaSCsOEz0+c7R0GpHgMKXCo1cAu/f4pCkJRC2KgnMVotYeSkSM/eNVsc6qfr/OnO8xNw==
X-Received: by 2002:a05:622a:4c8e:b0:4b0:8f6e:d70a with SMTP id d75a77b69052e-4b2de073d4amr102606571cf.22.1756333643552;
        Wed, 27 Aug 2025 15:27:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336818f1d41sm14139131fa.51.2025.08.27.15.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:27:21 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:27:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/39] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
Message-ID: <hab6s4wyauqiej5ankh3gppdqkm2ymlevhrnklfe76kqjmmjqy@fptmzxpqv5av>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68af864d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=wpE8WlYdICmIRzy2dDcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX6Y5Rcy3gzPtM
 2fquEC3rYRwx+b45IMWRHMi9DN4Sek5GEchGvxnm1EXZFQTZ7/ciShc1/zhGloRaivj/BCtBaQi
 rCicNpf30Z7ewn8FZddDa7T4NcCatwBlQlII5319LTJkynBwCaCJNL7KAlolkghGLu99bAPE02v
 xk/O8BMgzfX/bF+tmxrRoqAZErDXxOLUK3uhT5dqVyCSSz350wurJygX3h6c+P9ZQiuimHKi4AM
 xC7Z4NFjKHlL6B6Llkep9aLy0bEA0HjAMrd2zl2rWG18IZdnW9tJsqtpVWyLUzTkHL3rKoXmQOX
 neOyv9wkqC5QZIv5i7NIA1MmX9QFp0ZaA/e8PRQ2/l5eJbn+vGATtUEfxys0U8D2l8m3ZLP5PE5
 saW6m9eC
X-Proofpoint-GUID: 3VOxdufu_w2Bw80_6ubct_5KzRrCJ2Xl
X-Proofpoint-ORIG-GUID: 3VOxdufu_w2Bw80_6ubct_5KzRrCJ2Xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 03:43:08PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_connector_state() function calls the deprecated
> drm_atomic_get_existing_connector_state() helper to get find if a
> connector state had already been allocated and was part of the given
> drm_atomic_state.
> 
> At the point in time where drm_atomic_get_connector_state() can be
> called (ie, during atomic_check), the existing state is the new state
> and drm_atomic_get_existing_connector_state() can thus be replaced by
> drm_atomic_get_new_connector_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 660b081ff5d8c39061cebfb5ea122ac1e51677ad..30b7ec05a1af07075e40cd2822ecfd67df004ba2 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1128,11 +1128,11 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  	struct drm_mode_config *config = &connector->dev->mode_config;
>  	struct drm_connector_state *connector_state;
>  
>  	WARN_ON(!state->acquire_ctx);
>  
> -	connector_state = drm_atomic_get_existing_connector_state(state, connector);
> +	connector_state = drm_atomic_get_new_connector_state(state, connector);

I'd say, drop patches 1-2 and use this function directly as is now.

>  	if (connector_state)
>  		return connector_state;
>  
>  	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
>  	if (ret)
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
