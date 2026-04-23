Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB9F3ED5DB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948202; cv=none; b=KVcpu2p2Ypay4b/GxD9N4+frZz3h+zJTyXayrlFqPm7Se3ueUFKVTpJQ3hekfmYYPQcmNkSYyi+8MSOsZnRZ6cR9zrtx4VHyD0r/+v5hbxV8kaDq025MXABSLi46yyFLZtIeO6pIf63ppgOsmHwOTyXbeFrZFzQj0KAe4O2UyaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948202; c=relaxed/simple;
	bh=invPGYQ7NdzxSWBArDuv9hg22Fo9hiwrNySrMfHzM1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dz6j44ablYXyTDJMCwt6wQSiRzmDsgAH5nc1YJrSMCMin66+nYyw5A3FBBvg98/gM1E7S5nbucd55baILjrgqMuCdJxawLeD/vKxMcIufUiyNqEbIpo0ZS/AihIjG1XN4VqxrwPB/tV9q5VqGLhCwi4CX1PGCiESopBbrKmmsf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kz7jLeBz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBzNxx68; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kz7jLeBz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBzNxx68"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uKE33413515
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BWsj0dSc6URl6GzhKqtvvsA5
	lvMVdCA8oRPUY5tXRI4=; b=kz7jLeBzJhutORDVFx2iCKLx6BbKBMv6ZD/OAzXy
	A0y9fL8VJ5azBC4WAyY4ur8i751/Cb6BI3cUXuKQsmwXwY34+fQJImLA7H/88D4v
	1BG5/aKfbFE/R3yiLswxqHx22LbWVldKcz8Z7n+9vvLF6H0umWX04940IYnC18qK
	tqpEoazA4Gx/aTQtT+TClBki1rUGdP2FhQ9RJS7+TJ/lTUY5IZeO+dCzFtwCvg78
	NWGFar9sZDj1b7ftpz2facMTIbdcJTW1sSKycWLMr7MmGIEbOm3qQC3OGbd5TyaF
	4WBlrARrtwmAMfi0rdEMVIqZqVfGqYskKA29CbPTq0GlIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6c02j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:43:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d6061bd722so623010785a.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948200; x=1777553000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=;
        b=XBzNxx68BMtEqy5eaEmme7eGtn+S/wAJiiOv1lbEEZK0ga+USBKWku6fuFlzN7YGUu
         OSJ8VB8I56ceD87LJmDjncGto5TaxoRr3hHSuUxohS5ZJzSO4jq/A/NH6gIDd4hy/5UP
         AQHNUGnl8QuNFeqPyCDeWEsbO8XrVjvylbo40tmXfLHxLdX0xCmhUDIKxbT3/SF3O+NC
         PFXFskwGcBKRMmIp1KI2GdTcIvj/U/NbJIDvVIy6OgtQHFYutHwfsVQREKZfxWghJVtk
         WBkNLCyy48/mHS3XrD7pey+H9i3enf/+73+k7BpLRn6sv+iQIg4z6To0sFLp9lsXNWBv
         1fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948200; x=1777553000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=;
        b=Y3Xgr8wPD06BNxyO1DKW/sYEKPnSzpzgArVPPE0bn7aqpzI+zKsKWl3GESY9CNqovr
         Y/FAQJTFjDnJm9saSezc8GREWsdt6wNJyzTMi6O/vFfVNzWGGkqlfw6PFPyghZZa2xVQ
         MsiisGVHu2a/5xUD8qvotcKBqVGPerQXrW3dGP6nIQs+Qzaiy57LI8DEAAognmiOs5TZ
         2UFNjUBdRmpmYXSksisqCqa6w4cQ7QpXGmNLNVDU3VaCznmjvvgAxKbCWL2kdRkY4B0b
         lKHuNpV8SPbFFNu6GS7m4N8RVYhIH3KbLGHBYODwk2dcLy2sbQfsiQxuf0oJtmWvz9CU
         2Wjw==
X-Forwarded-Encrypted: i=1; AFNElJ8UIP3mg/mUih7GNiuXuvsDoPFqhkU5iycDqgY0yRH0NvvK72tkr+egipx04965/P4Pb3nMqalClAYyTizms8+04A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv8GpBu1P32gUWMahxa0HXUJQO/Ms5Yi79niIPxds/KS4/Xzn4
	GIcDwL/1rUsTlyDEV/YaS4Scl7MMHDEteDgpRdktPCdzjAJs03RfsiiRSLCbuOK1wjDU63f59eL
	4/VSrSxT9u/Kj+LtpG2E0XYUdiER1irQl7UZZPbQ9Ae6uGGzcWWuHfmedMTkaYV67J7eMDJxp6A
	==
X-Gm-Gg: AeBDies3iFpuFc+WPxdpJT+W0FHTF+h7+jmTlcZTd+p0w0Ojv2aTXnCW3/ufKbVXgM4
	r0doubTsR29uiK8rme10IQRjFo3FlN431FmQJCQlaZpA0Gb8etCfcYWbe+jgQNk+zkE3qx6Yii2
	uOSNR/bYiMYU2fq2tYfOYjXkqsc30YzphrsDyFlZr82lyOnItsHB0a4o3xgzniwmvw/J9M4QnRB
	zf3u+kl5wCUQWPPSThXWasTBsgZyQ2zszh8fjN64aozO6N2aTwG2k4X8EhviEBu6qIhLaQfDT+j
	xB1Oe/rhh7+wqHM1Vj+iswsVedT12kvw4EbIl6u3jxgwCZyxJxYmYrbficQKN/lFrVADm5xV8+s
	7DzkynOuPSjT3BlR2KrWZpnDQtkgezFv+Wzc/8ph0KYbejWsSnaO3zClPgmO6RI65fd1qaf0IpO
	GS2c6J4An/UX+1s7q0c+nIdZ3A2MmYLLz9UqUPy8v4UQZhHw==
X-Received: by 2002:ac8:57c1:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-50fb6f016cemr157722161cf.27.1776948199552;
        Thu, 23 Apr 2026 05:43:19 -0700 (PDT)
X-Received: by 2002:ac8:57c1:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-50fb6f016cemr157720991cf.27.1776948198942;
        Thu, 23 Apr 2026 05:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12d5sm5133222e87.41.2026.04.23.05.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:43:17 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:43:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
Message-ID: <kxltg2wx2zwuliguszipn3hldalok36finlqwxe4qh3e2mr3hv@ymc7gwkozlzo>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69ea13e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=W9-MdjkIhrGOmg5mk6gA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX0Z/wI7QsDN7L
 qkZR4ZZf8BwPz+kX9qg1ruf+m/eVy4HnJSEV9m+JIoucxQg/sf8YqxlzhLW1nw6g1aLjBeDHDnQ
 bMZzzpE/ZpzJ1YXceg7lBLfXPH8FWpdhs8ZW3OP6e+Ldo/uT3+2QDP6s+rb24IhLhKQ8SD+Cs30
 5DGmfdDdEyDbaA6wYY9WOdWuvwVxYEzi7m2KOXY4ai3hAmeTb+5Zky2zkn+Zs51UONRJwPGofmz
 DWiDNH6cO9eawnyHyskYIQGPKZNEyqoSnEg8CRGqm2gHJ1PSMBupIeCCBgr5BCeLn/FPffcrnvw
 cCYU8kc1tWBEubQRmCiu9oMUm3yecV/wVlT/z5q5u59Tnm/NN2CCVKSwMzbr77/fQ8FXtKk131Y
 8dy960qzeVrb06hZmAmMPIqtItI7ufeJbkpv+2Tltu1kTbQc/Z3ME14leYtm/eJW2nhZpa0SxKv
 iAz2C9XKScYiK4On9Jg==
X-Proofpoint-GUID: AzJ5u9luqE1iPYNLD2coyJ5p5LDrdGlr
X-Proofpoint-ORIG-GUID: AzJ5u9luqE1iPYNLD2coyJ5p5LDrdGlr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230126

On Thu, Apr 23, 2026 at 01:55:50PM +0200, Luca Ceresoli wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
> 
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
> 
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
> 
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
> - rewrote completely, fixing potential ERR_PTR deref and ending up with
>   a cleaner patch
> - also wrote more extensive commit message
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c    | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

LGTM now.

-- 
With best wishes
Dmitry
