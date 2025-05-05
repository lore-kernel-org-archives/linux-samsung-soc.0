Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99E20A5EA
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 May 2025 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446349; cv=none; b=rOycKf72McOE7umSpseFDVX4QNPwYlAeSR0+USe1bIMKNTtycURZs0TXkJgxVaWcjCGl3RGdp9s5PD8DgnN2NK7iP7cEzjPQH4bgrS880yEiu/vpsmoQaevT8z0KMWxZnsjuUARnytnv8XYHnYR48X/S+A6j1MY697BFavAtxgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446349; c=relaxed/simple;
	bh=FGuR2WBMXMvdjCd1ovjlhudh3LWd/ZGssire864V+jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDMeYNRszVR7TaJLhmhomXCZ+v35ACJVGcoJRhHQ+uT4VB67ODH7uDzNZho+UHXwchM2zM2Kk2ZN6vwI5vmGaJfp4hJNTOSxdQ/SqQEqKHdZtzMPIFhtLwQTVwBImDwtxEXdd36VqdZRuZnBbDpzT3J4kd99aKBqrSW2fF3JOtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzwHVUWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzwHVUWj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451TYaJ008374
	for <linux-samsung-soc@vger.kernel.org>; Mon, 5 May 2025 11:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fc5osDce5Ixp5n1NZs7mSFVdO0qDnEBm9TZBSOSJaog=; b=IzwHVUWjTSN2aTmN
	0IPLo//J+Zxdxh8FtBA8UKJ7kvNC6g+mk1Nyx6JgENgjB7iSAWdxaJe0sbw/06Yx
	rI0moqbfIK7VFeEzrfag5tOCxAtPLGtRISnnrU3EugHQbuhuTQ1mLn3Qo9ujWUvy
	fLWLGqdXGl1rq9M9oukIM0trKrsS9nx9J8rSek+aOFY11cmZ7bwh/xlxKMwI8ME0
	XZwDaJgrzDkUw3ksftk4vxB6U2C162O2dy0nV66qHrYinprt9IRxBdaiAyl1MUWx
	BJ6yPf5iJzQmpNkxalDBL/TejWUfJFCxnAFOX2Jvul5ILCohX2ayaf4tIxsw5iUu
	QL/3Aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakku99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 05 May 2025 11:59:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e7922a1so925033485a.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 May 2025 04:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446345; x=1747051145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fc5osDce5Ixp5n1NZs7mSFVdO0qDnEBm9TZBSOSJaog=;
        b=IvyvYqoq34KeWAcrSf7Db2xf1AkMiwYSwDf1a+TBQtXMH8Y8O3eB7/+jR6Ka6f2mSw
         E8rwMkkM3XlRUGhxMYaAf1wKq3wyJntJ1c0Z7Zhzaw0mC90AvfYeo2n8Ho1g2Hc1E4uc
         UMA0PF14rcVZq2/H1Ub87WXr0d7QuxvrKso9ZBQ+LvmDWPXrju10oSowDMQBWenTc6NX
         JROuVBrieR0ObNLhjhzu2jBTney/JCTL0UdiBJEreb1KkV0X6bZQm0ZEI6K41qdg4+l2
         uQ4/h3DFt8LHOB/vYnx16MyVkb3oDMaXzINbJaumQGhPxF8uPnqHfcRIraxeLrYEc8+r
         vttQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEDkBC33MPtgxrNlSRBu8eareE82vtR5bAPyZaneyKgAuzDwXuyShoILgI64HxY/7Mf4nLwKR3M8PKvYAAz8eReg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSgow7aHnGF+UsB7gGnBBTo8qWv/YejZR/74Qd2YOlJRHrvUV
	fplJe5tZcoBVfgLdtfmxsb9t6mc+RiFnf6G8zstVK+6iAF+wQ52Qcr+0KPl6XupDfK8pEwtgCUK
	ZHMl1CeZcjluMqYnIscyllGD37BQ8wjVH3n4hP/MpjxgTfOrSUAhuM/e0EzTqH+inVVBCtw==
X-Gm-Gg: ASbGncs8of5Q7T62n61Y67eEaKz1rsAOYsmZL3Jp8GxuXUzglx07yl5SjZIUs3rd7md
	2/kMxmSNLKcBoNRdeJ8ZlPsjD9wBG0uBEFm/wdjZiTa3od/BSU90/IJM6WkPmTuEkG4cHYXpzkZ
	9z6RpD85TTjM3qFJuzspyb+/M+rWcW0t0DpxHfJo1McHe9a9wXRZYe84MuXZOMfpVSnC1FfSmt/
	qdg0qFB6OiQi5znJYten1y07ovS8DAJ0b6HEujIUfI9dcgR8F78+rimhAVVaVH0EJJ9df7rjxKZ
	crx3HbCeEJvzo5f9cTheaQUvsM3keTgdpiRqwk3CkjHI1yRUZxOAe/3J75BV7SjBojk0r5TdFNG
	qmTY4iNJtHLCGtB7f2k7JsLbtY3dsiSGYX80HsvL/6Vc1TrONn5ygag0J4knPXXm51h4i
X-Received: by 2002:a05:620a:4001:b0:7c5:9a37:c418 with SMTP id af79cd13be357-7cae3b1604amr1093368985a.51.1746446344911;
        Mon, 05 May 2025 04:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxsMcGBcuXzdzsMZLmfG4jCCth/aIBhqNnJlAxtHNCdoHctJUXgi2+jH+zw6iGwmYPEzBLZg==
X-Received: by 2002:a05:620a:4001:b0:7c5:9a37:c418 with SMTP id af79cd13be357-7cae3b1604amr1093364085a.51.1746446344392;
        Mon, 05 May 2025 04:59:04 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:aca9:2ffd:84bc:ddc5? (2001-14bb-671-42db-aca9-2ffd-84bc-ddc5.rev.dnainternet.fi. [2001:14bb:671:42db:aca9:2ffd:84bc:ddc5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c8d40sm1695574e87.98.2025.05.05.04.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:59:03 -0700 (PDT)
Message-ID: <9afd098c-edd3-44fa-8efe-99f2e9c9a525@oss.qualcomm.com>
Date: Mon, 5 May 2025 14:58:58 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Inki Dae
 <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Douglas Anderson
 <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anusha Srivatsa
 <asrivats@redhat.com>,
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
        linux-stm32@st-md-mailman.stormreply.com,
        Adam Ford <aford173@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Aleksandr Mishin <amishin@t-argos.ru>,
        Andy Yan <andy.yan@rock-chips.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Detlev Casanova <detlev.casanova@collabora.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
        Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jesse Van Gavere <jesseevg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Liu Ying <victor.liu@nxp.com>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>,
        Sugar Zhang <sugar.zhang@rock-chips.com>,
        Sui Jingfeng <sui.jingfeng@linux.dev>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Vitalii Mordan <mordan@ispras.ru>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Hsin-Te Yuan
 <yuanhsinte@chromium.org>,
        Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Herve Codina
 <herve.codina@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
 <832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com>
 <20250430-arrogant-marmoset-of-justice-92ced3@houat>
 <20250505130648.22ec8716@booty>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250505130648.22ec8716@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExNCBTYWx0ZWRfX5vqldqTA2Kxe
 DpBPDof0sOlX3+qFg2mDn4RqpD//muhHCp5yiwZ+hWfBUDgMjOAqeSc8Jim96mrZrBfaNrdNub5
 egQ3+JsQy7lhaGV/T1CdebytQ+dMyX+2a1yWPcrvKBpzY4FNTTW0UR75dpDgB5ua0tIk/TIlhFh
 +0nob9W3tb0XOF0CzVCUspACIQbeNFkMeT0si1FQ1JuBPa+4FyxbrfiMqA77nOkE7MQlDoiy2BF
 cgq4m3Uf6x8rY4CKbfYmsE4FSqaxIPREJxBh7nCeaAL/V0TTSFM3OLiQEKPiaup88zBb3LBd7+f
 6vpSG8Uu4hOkbCLQ7qEYxdG3LmbvP6Bp0CET9fJJUIAtVtdOI8Gw1LSOeQJV/f1UFwVtUmaInOF
 dF+N+1fGSX5yWXuWI6fSB8hAaB5zpmvazmcZYP+rM60HM43bStR31+ji0GZ0trbxLvEIIw/Q
X-Proofpoint-ORIG-GUID: 2TMPc4TTxknMsDYK965c_CPsuD8GRvCf
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6818a80a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=H8qqLt0gxxJlsNWwv3EA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 2TMPc4TTxknMsDYK965c_CPsuD8GRvCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050114

On 05/05/2025 14:06, Luca Ceresoli wrote:
> Inki, Kyungmin, Seung-Woo, Alim,
> 
> On Wed, 30 Apr 2025 10:08:14 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
> 
>> Inki, Kyungmin, Seung-Woo, sorry for the mishap. Do you agree with the
>> following patch, and it going through drm-misc?
>>
>> https://lore.kernel.org/dri-devel/20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com/
>>
>> If not, we'll revert.
> 
> Did you have a chance to have a look at the patch mentioned by Maxime?
> 
> It was applied to drm-misc-next by mistake. Not your mistake of course,
> but now it's there so if you don't reply anything it will have to be
> reverted, and then sent again to go through all the review process to
> be hopefully re-applied in the future.
> 
> If you agree with keeping it in drm-misc-next, that would be less noise
> for everybody.
> 
> I'm going to send v3 very soon, so it would be good to decide what to
> do before that.

For the record: even though I'm not happy with msm-related patches going 
through drm-misc without additional ack from our side, I think reverting 
those and reapplying them later will create a bigger mess. So, I'm fine 
with keeping drm/msm/* bridged patches in.

-- 
With best wishes
Dmitry
