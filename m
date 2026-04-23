Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFBC3EDAD4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948320; cv=none; b=pOPIWRQIchlY/4QhEw9VlDOkBI66XahDoWGKkpUsEviaz5qoJCf1CTPB/2+460ZrN0puS3dFIrGU8rUD2/ZzTq8j/pZTXdcqOD6OSaZ0kGnEpFNAuH1mhRUv7THz9RPjlA2LRS3+WvQjLfhzHmWPhpEujhBtOTQFDOWxKqk8U9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948320; c=relaxed/simple;
	bh=BRXUU6ztqr1lsb3f4orzbSrY/H/lvrHRoUjqXtc+p8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBh0TjTnAAz05stWfL/pSqx4vsrBWwwfJkkz+hSFUXxz65QVaxgeo2AfcVGG8/S+soWkkZJHPSKh69+F7AMWeTwNqyi9IeS+zzeOPrhau+ORVlqEk+5VUzvmPc+0xN7yrNzDonrXfF+KfiQtLbRmtk459z2TdWorDSKsh1Sbaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4KeQ6v7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbtvhBlB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4KeQ6v7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbtvhBlB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tq3w028801
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dRf9flM23evHV+dCjZ11/3wA
	eY0NjlVmUaCb2MHl7Rc=; b=f4KeQ6v7smM+6vkjRyPOX9wXEYAtm4U3Svh9O4LA
	F+Ut9ODMjODxPNbgXzx8vYsDdabudfLWLc0zHnFv+oEKiz89nUOO2sQPOHS/+ZM3
	zQT6oMIVkCq5Wp4R3VTgnkYwX6xePFRT1MC0rIMz32csoNRax4q/mT6Yr/+zL+9C
	7OuvYNvRF7g+TmXzCH7lNo60EkNeNnDFHwVPY44uYX+2fEK1axSGxBuE/TKbVwb/
	fm24A7Rzdi8ERqvvgbrmTj90vCgNjVgjSS7A0elPrw1hQn9gGEzfn8Ty8iz4A8An
	nqvE0T5Xjg8h9sNYtk4IJbU+TIpW+LIBNd98FbPRTRXSOQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm1jnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:45:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f1fe60919so11761446e0c.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948317; x=1777553117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=JbtvhBlBjNtksg6F/W2dD7QD6yVL48MbpjPzt3iBjceZbCdgGJuXoLcc09417f6ZkR
         IHnKY2+d4zHgiZTsu2gUvGOyg1oXjk9Ht2lr7gVabwlUgk8NY5ewW9pOxfhWZ+TUojUs
         DeYG2TzP0ULHzkPzf07OT6o9ajtpeAp4nfLsw8D0Hl5kEJCA26OqCvYKwxRA77rZor3m
         LjB8x8MwTiNdnnt3pDw2TtRi5XlcJXxLgZ7BLiGsbnLAMbdetpgQ+AdxUTDW4oh2GE/q
         wAccZNrYK6ohAaAC5kaiua/WU3loQM4R3Dzk7TLUpD4vNtcyHy5qs3KuzULOzh8umYdI
         Duvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948317; x=1777553117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=amK8DuLd/YgJ8lZKfD5QvJ+yxQBr+743nvQdjrahzYoJ9hyrx6tE9S0e7ZZIxvtMMH
         p2fU5rpUNJUFsuBwJ88ppmKjNTBrZTZfG/GtUCAHiCfd8ai2lbZGxSyntjVPxE2JgOKx
         QJ17fRjO3GM/X7KNHbqIlItNiCsM1ZXKNo2BgfX9Kae9MlZ1YvfI1FDFfZ2IFOgCJTLW
         qus8NgkkAVr+wcppeZdmPtbp6uchb8hYAmbEG3KQYmualZZ6CbdOrw92xqAsAji71hpJ
         2q3gK3sHY/SrA0rqM6dayJvZS3E4WdxHJFPkwashwN0guRiJ1qITmQihaeilNj+nfCYX
         S+SA==
X-Forwarded-Encrypted: i=1; AFNElJ9auR8NCOlE/ShIoeIzJOTYkDcoDMXfmBAQl6y/5IgCE8MdHi4BXUypvrav3+8O37a9yYtB9K7cMWJ3VL2jyoxSUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17En2I1yCDMUF3azPRYd8UxiwNCn4SxVF75KEem5EnxQqeAIL
	TQ4l9MzycezBZ2oPYc2ZQVv18/8HIVFNHEIP4eMgk0wbwtxhJxBTOahmvuL5xgknT9I/3fb58QT
	d8cjtqyiATXyME0mmTU1P9CB29eDWFB+tuixDAR6FlYr+r8a5wAwGGbDu4T3NIAPS6eJzYdq79A
	==
X-Gm-Gg: AeBDievD+aBBM/t6rp9I+5R5M0PE9J5tLCGTCiDsNaMmyTmNOPtxqZ/g/mK1uLE1CJ0
	64pOB/x7OJEUo6dQWM0s7D0UHwzUhGmMDPsBt37breHZWnebYwhuhl15t3snaPw1U/u1UCPtqyV
	tyMOrOvZTYe5qnmivvulFe1YznTr7TfvzXiRpIZnkRYD3APi89AnRWvxveS4kbSmBpwV5MpBWWL
	ie+/Z543lWcZuQAfF0DzG5f0sbGfvqOtfEN96N5n5NOKqEUpHpwmYva2GI+Nlz76yD8B6NmGcRn
	V0mE+lbUnWshcAWo2W+W8Y8Gh+ZkntxKVjB6VzKuyjkKH+eBGoezeBDx21TdQz3nv3u+O/sHDEH
	9baVryag0QxubkCoHOxH43GiQTHwIGj530NAoG0LLMinvsmMkjNCZkjcivyOQVC7n9bRfK9aHgc
	dSJTFHHnmzIHDsPZLGA0hY+xah7gRF5FUrdWO16mbX2HX8fw==
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838598137.13.1776948317066;
        Thu, 23 Apr 2026 05:45:17 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838537137.13.1776948316554;
        Thu, 23 Apr 2026 05:45:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb75b033sm41855241fa.39.2026.04.23.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:45:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:45:12 +0300
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
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
Message-ID: <wanzalswb3lez6kyklprqojcnidab5fkxgu57lfka45w2rt4ic@xdatq5o7yiub>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69ea145e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SkVVgs_SJVxU13IceqMA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: A9CBoEyxmCHiGfWJh63Zr03LmhdUovyM
X-Proofpoint-ORIG-GUID: A9CBoEyxmCHiGfWJh63Zr03LmhdUovyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNyBTYWx0ZWRfXyV0MwzYTYcEG
 rUHm6Z0DkfAGgKCKxC9+5vv/VILsG4Ci6DEjJyLJpFBrd83va5bJfSrsSr4ySN7+RozQYkm4qFf
 tna70Pnuk54cNdiOb/iMBSPO63hTr36NIuLBsGXiXi8hISpoP2qmQ7oYFdkW9NcEX99Frmp+PHa
 wsQE99NTPBnqntTjQjcH83i4WWD8VEqDALIVj4Q+iJBprbzKgW31EmAUXcduqESFqL5gQB1cJgg
 nIs4bhArLytGxlewmwjGVFd4E1UrzTPm0EWYyD421QT+bXUC97atd6GPqfypP+dOty19armEigt
 HXVHCRi4SiwK92hr4SVr7iuUZo8MB0BFC0oFtEJEDlJ7jMITnzD6DKYhC4noYC5P1Awq/aUx0h6
 F2uK7YwnGHMjxE4lo9yx1+W92HYf35k3ycfioRcxb0KU2RPAPxe6Fr0SsWJGy+vXchuffP/6zag
 1r9xQu0IK7Ivhw2IFog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230127

On Thu, Apr 23, 2026 at 11:16:54AM +0200, Luca Ceresoli wrote:
> This series simplifies using the bridge-connector by removing the need to
> attach the newly created connector to the encoder.
> 
> == Series description
> 
> Currently all users of the bridge-connector must call
> drm_connector_attach_encoder() immediately after a successful
> drm_bridge_connector_init().
> 
> This is an unnecessary burden for users. Move the call to the end of
> drm_bridge_connector_init() so all callers can be simplified.
> 

I don't know which one is more correct in this situation, but let it be
R-B for the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Feel free to take the msm patches through drm-misc-next (A-b).

-- 
With best wishes
Dmitry
