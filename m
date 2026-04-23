Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396283EDADA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948159; cv=none; b=A6rMuDKvehEwbX+t8oNUzUpVVO5UTVQXc+NrCKC15hdghxfMgjXxOgstR5OUPNQswKSZ7g93a2YSoGUNBzbk5/CdDmwxy0BvPTrzgE2YdsQNJO1k2JthRNMTWHTdBRIaM+ojTtom7nrZTOJyXL79giDZsp9uJNj2Yw2gaHSwnMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948159; c=relaxed/simple;
	bh=Ge4aYiy2aawexHZUk69tmUY0pOxBVZCqbad5pQluOrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JR965jkOWS4/Xg4MR/XI6y+NSwa+4Vrd47qYaB2A6lBOwrXCuqMQ4GdnwLRVuDUXqDMXiQzN6COpp3o2HLoeka8TxgiEgQvU/J7aHidZfeQbvyfFplRO0T7vjAjbPSG+phSJkvHqe1RmphNVzlEDekCf3wD2VZPAlUoZRFIj8is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFCmdbSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4vUkXFN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFCmdbSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4vUkXFN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uE4t3044044
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7qCN6fA46LhWWbVU/958hHw2
	V513lfnGpAmb4yh0Leg=; b=fFCmdbSfyR4XRLkYWI7N0Tk+PjH+OUN5AhQQ62C1
	NejbCSHDJFuHdR9JsGONxsS2qNPi8uecZxrL5IALiMQxx+wQiNuphOJcfp5E8q9S
	fF/a4MG4M0jRNGEiAR8yWqA+IK3BZ9XAnUM2O7nHmiHv67WIFxlWGCcNYdaR9JyG
	nzaSHAyLLVuyd7ErqfQPNLn5fcEU2pkJybXPxN1K1ekb8qm9/LfmyLhltoKVJKyb
	+4bnEIEu2cSE4RDXfCzHHo8BnEhXG7ue92bfANCDf7pki1CvO7/Q8Pqy8y7BYNfA
	8hk/fetWEbNmajZGVeNgXM/fIq48KlUrsYscWVnczkm09Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3wpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:42:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50eb8bad331so45783501cf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 05:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948156; x=1777552956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qCN6fA46LhWWbVU/958hHw2V513lfnGpAmb4yh0Leg=;
        b=E4vUkXFNWxvPlcH7MnnQWHV/Q+rPn0I8xhlso7+R+t/I0jq6eDZ9nguaKC9cQHLcmA
         fAj8A4yv4CNpEOeuRjpWduum/h/X4GkhnvAASgP9ri1DmTszWSkn0GJWcTG6PdZfy2vO
         SVXpJhFfNQgapyOM0gZ2WSb11ma2cLCrH5FWEljr1JVULsG0gjObLTqUAsjzZgvC/+pG
         JEgXKz2cxMlvZVUCqeRw3Z1M8oAsv6zjGIHK8chqJmZbesv1dCmN0qaPT+w+t8S/dr4m
         U6RJcpBNqVUEuQyupMJQFWTHFfBQOEYXIPWdKD9JrXdqnXOrNX4fpX78YNXGrw6oj58z
         9AbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948156; x=1777552956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qCN6fA46LhWWbVU/958hHw2V513lfnGpAmb4yh0Leg=;
        b=fjThcnPSwrJ4YIVvNmffbddm7yrZ5Cf3NWj2pfglrndY04zbZaXBQ64WPUe3miaU+3
         oqfq3itQO+PlqeR/c8LrgKIVFXe3QYGuCrizeM2nO4+XR0YAS6FrhL6Y6ot6yZqwHAgz
         0skfTtN+xlNeFRGFIOHf7K2SjAlF7735N6rcxa5Q71QPWtY5s9bMwoRXDFvwk3TZsfbM
         24qdoptTTtjpkrlRCfa6oRE3UDFgRH/YJD9FG7MxQzNNJQor3qbmwOhPcFZ+Le3LyhjJ
         TXgYjb8smoIpkOH8tJdi5Clgpi4krKAM5Qh/TDCPOExxYpMXZhrlqNx3/KyKiJPWzljH
         NhtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GSyzdNOFDP1uEePmhe71U6cUxp6aLu8aZWoCvZhZcINEU5cS6OdMqNH0soE/WVIyd8P36/Br0HgvkSNJxBF8BNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTlqhtm30pTVbbRg1Mymapfwg5aqgxbEYo20Lz3ygKJSrlXWWl
	IFg806zoMfhYLFMYosTrm+K51BZGxznQYVQxNYF/kfoE2XtkKOkyDu/GXtpwjaCd5x/pI0YA7uy
	qGYzjNFCruQ0sf/7zwmadouu7w5cXCBwOgzroiUHi8vXIfhCiDDvVrt09Fb5thyu7ob6ko5ow6g
	==
X-Gm-Gg: AeBDieuKjypt0zlTkjj6dkUWFURtPWJx1c3FsPEQDNa2jRUeBX/KDcsr+RcxOJI6a/u
	JUaHcQi+AZstvgJr+qatQk0pqsacG6/Ce+h8EMfKKpdkQTE64hxOtlLdaBcc/6oGBv7Jy8cZfuk
	YTz4ew+eqVmK/aikSpSKR3lQtfBoujq/TXtGWYYJEtz7mvxWv+IF87GhVYnesIRI2JVzE/hUuSy
	LctyfgCBSAuMZI4CGcdqW7rHHpBg9LNulGv+NRrnIlbiJU/qSJOnjNedBKYVU7h/08i0D3lpybQ
	bMTIRktYgaXKhBZaBe7VSPLZEn9QjDdk08YxPvMHyNQUCtnXI3ePSIRwZG7rQGJJGAttPHU2nL7
	BHEZ7rJgPxpJZlrXcfOfWY7igalvkSQ320TmKHQJe42hBeYiJVnBJwP2dfLHUu2t7q9+wZXSLYX
	r2dFUn1ljCpQpOnASo6GNi2TSqt2t80a0raMH6G7/0KgmUTQ==
X-Received: by 2002:a05:622a:1496:b0:50f:c2f8:406e with SMTP id d75a77b69052e-50fc2f8479dmr91072981cf.48.1776948156392;
        Thu, 23 Apr 2026 05:42:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1496:b0:50f:c2f8:406e with SMTP id d75a77b69052e-50fc2f8479dmr91072081cf.48.1776948155831;
        Thu, 23 Apr 2026 05:42:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e147bsm5123482e87.52.2026.04.23.05.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:42:34 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:42:32 +0300
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
Subject: Re: [PATCH 35/41] drm/rockchip: lvds: remove now-redundant call to
 drm_connector_attach_encoder()
Message-ID: <wapbiwxou64emxlt6oz5slst3nvcgvs35hvhpz7v3wmwp33bzc@mvdog4t7un6m>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115334.444750-1-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423115334.444750-1-luca.ceresoli@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX5SoLP/HMnQRg
 T4qjfPnZqJjrzxO3pDEcf1ktc3sTnAgDrof88CU/LPOz0tXgY7oTK0hnzXvM8eZrCFHJOQreB4Q
 QE9aB8HEmvf6+ZksI67ZPIafT+TbzDNSIF1pkRZHBjn8+sjVVzRnRYaepAQX+TIMzaHQL+Fj9ek
 ovGteE64xHJYPDrpXzZ8Q067Z/Q8cRwI8fMqzSR0qnhCAtGZ1EaPnm8dqo9YU7zK0AtJrXyQ3qa
 uE8N57W+sL75XFFTLvcVdWMCmUV4NSiASsEYaNwY6QdRnvuKliW0pLzYtibH7+1WhsbaiVTwqCM
 WQHRFCDsuBqZqRLMjkNwMGcmc8Y0C9tqPgDrPYVC+QLJRWc/uAktk0HEWlWbRt57YFckslhW318
 5K8zLUueP9lJSTgbv+AcPLSwDgWbCGTzkmWweggNiEN+jS99RiIMuf52/0/kMOyQ0fpkvrw5+37
 0wmHQhnE8A2/9h2UOyw==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea13bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=Gxjqsh2QC4DOxsvvGYoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: yUTzzKXPutvO19rGeQ3W18rTit8QRgc7
X-Proofpoint-ORIG-GUID: yUTzzKXPutvO19rGeQ3W18rTit8QRgc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230126

On Thu, Apr 23, 2026 at 01:53:28PM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 6 ------
>  1 file changed, 6 deletions(-)
> 

stray duplicate

-- 
With best wishes
Dmitry
