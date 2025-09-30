Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F524168D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759264182; cv=none; b=bhSrXozeOmyzvvqR6ipVqxpinBYEKnn2OqcLzrp8xRvp7o3muXb1ja+ehN63TeYs0ehaU1KyVwJreGvHIjcjz6FwkSI/FC+09eoz2ihrejjgmNU8TxNUXvV6MmDop46xdsIrc/aBrb9Zd7YxqBRmpH/FHZ/2C8DbvxDU7Wz7vqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759264182; c=relaxed/simple;
	bh=MyyNOT6Z8gPlEd2B1CWD4Q7bqvrx7M4Qx6OSp4ALGqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8xtEXCnyMXW9R9ORn2eFIoCRip9o8KE33bcZQ+wg8bv5j0fo/F3jBpptFoCwjoOI6l1c6diNQE6iGw2gJGCc0zQ3vUHWGXrhcoQZEccbKMygrnsZjyo+JcUunx90roj9g+ItZ4YVGGTYmoVXJJ2ucX7EG485CorvBHO4Iejp80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5LOIFdV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5LOIFdV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UK6SD9010709
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R5sl3ZNZwJRriIGWPQB/a/Ct
	xB1WoaSGeN5QScEiQ7Q=; b=o5LOIFdVBZ//v/2E1TnvIcqUjzye/Ka5ijY8xeC0
	d9YkC/9/1wv4SoPLu4fEQ0ZW1lZln041JrDY8SwcqEguun2K84mIpjGkPm7JkD7v
	zjCVofucFtUpNFoX33CWX21J4ED2mYM8MHunzDINF63/Rbi8Sz1Z/letyLi34kQL
	t6dSAeW3005RM/Q9mur/Fg4XuhGi6fa1fTXYw4ygq/8axfnxp+9bTI6CnKXIOnQx
	Wnk8uIyreZgUPFfe9wgn4hsqEbVhMbJSqUBcHtLj4/8EdPE12sPGoqHGfRFtqKR4
	EDhz5ZYVUf46AOpEPYCN7YccyVCzqeVUb6SP7Ni0pR4QbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mctqn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 20:29:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de23c3b40aso127782371cf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 13:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264179; x=1759868979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5sl3ZNZwJRriIGWPQB/a/CtxB1WoaSGeN5QScEiQ7Q=;
        b=PeHQmVG+ECcAMGl2DX3Jxrzef9mjRAgPDMoE3cOIO7BIvCbpIWdJ8Z5/TjKssOpTZQ
         4q6UA4EQ4xI9oblLmVh6iSh3SU4R0dFJIg2M2QXxFedOsoOHbUG30ghxnw/PcFkN7f0m
         cH79Ys7S7a2scyj+plnCWsBa2LLak9w4xV2B3dcGigo0mL8Msl/vXdL4XAPa+II0rmJl
         SuyrKTv50OLaPDYhLE32FUtqXaxbY0J4vlT5b0BUpLj7gy2zku9vxcgvlMUU6vHHcMM9
         SUPJRdcARvweANMblY71pweL4vllxW8FC22EfYsJfGVhw4itwzFGBgQgIE//1K3Qtv9P
         yf+w==
X-Forwarded-Encrypted: i=1; AJvYcCXqxy6/oW8qkWWis2lUq50b5r4FzbnlCD4wXPi92r9poJNNAlDHKS0GTiQ59Qvaz1T83Kdb355ny/w1JGJH0KqCYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Bd92IE1npB+m52L6OvqJT3AIbw/aBRav99f8C12FJSlW5Wff
	TjC7ZTggIlRd1PR5NjXDKMvcSEZwZJ22BL3QcYLAYj28vR4NDqgHRXJJ/LFxggCnpdr1cpS0H0h
	HAW4MWEmBIewtgXNEY26mXDtbf5NOQM92UeIgHSkLZYYdfnccwTjmnqqi1QQgx3ToVjZreci1tg
	==
X-Gm-Gg: ASbGnctLul+AbWDeFpbGZvSexSQwegog9wrwE4+EXxgyK+nwwPMDcW6T4NfIpyD8qK5
	N0V7f7JpRQUha9bJopUHvzE3QNlEj0Ickz4j+6wKzWknUmQs8oTLBFo/F6HDhk/Bn9WsxLfyGdZ
	pPxlTNtI/T/Pb7uPZ6a8M5cymVfk3CrM3uU0B6NTT5mlpHHq2z5qMeQtcHuU6i4yBAImg5NTcQG
	I092zYk/dRl6uezlC2JyR85Q2q5w6kHubUv8wdadYWXcOq86NJtS+ZylE5Dw8GE8FeGD08+85Cn
	QhvO/G+iim3caGV7Yrf49+JsFRbmOhcSXSgjyifShOc7MA670DfVaDezTNaCdG7plXzIdFQkufj
	CXmi/H0pAR/WJnM81Fs81SjxojwiFDIEaI42aP2lQsFfUcFYsAs4988zPKw==
X-Received: by 2002:a05:622a:58c3:b0:4b5:ffc4:d87b with SMTP id d75a77b69052e-4e41e25672cmr12692921cf.63.1759264178875;
        Tue, 30 Sep 2025 13:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWqYNQ5DcdbJzz/fom5G6oGKnCTXV+GrXUnR7tUKQp7CbjCVYz/Y9aUaVBAEusZAM09X6HlA==
X-Received: by 2002:a05:622a:58c3:b0:4b5:ffc4:d87b with SMTP id d75a77b69052e-4e41e25672cmr12692511cf.63.1759264178263;
        Tue, 30 Sep 2025 13:29:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665671csm5160974e87.75.2025.09.30.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:29:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:29:35 +0300
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
Subject: Re: [PATCH v6 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Message-ID: <hvakijaevs7ucwvlnf6x6aqj5k465g2rc3ba7zexjmamy7mxg6@gnyhlf5jj3wn>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-1-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68dc3db4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=6YOL-LhRVAKcL1tHTEcA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: u2pVd78S2IGF5iJdosY7Sg37ekNoX36R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfXzIC7xBLzAXaQ
 BesIMOcDgx2mV4OFhofuYmqfgYlCwPvAVgPxquPMrZvmsLFutO6IDaAjYDG+rgACE0sWO1IGx9j
 3WWKQtE03iVhQu2FGoXA1Lkzsq2OAQTHup6tSD5+noxjmJZ6s5bwL3SDJxL7Z41z4OqCOi7IJ4Z
 tPMzbg/PSGAYkywLxz68A9MW7JT3VWsZunyRAvO5UQIrQUy4NBZmeMOPiAzIp7VFmuSK+dB21kj
 Lx2cGMwubN8i5K1ZcUATi/uF20WNF5pQnhqXTkEdiUkrklpqiWAVucbrq0zVay2UGkDysuF+z7p
 S0Hv9P6OIkuiaCDxmMyha+2u9pDmGUrVJpJ1ypZkrTdXmYIpUmt9lFC83Fmlw9bW8BDyZrM39Qg
 JhbQPfFRQuRpOIAj7t/5PlTTdJ2k5g==
X-Proofpoint-GUID: u2pVd78S2IGF5iJdosY7Sg37ekNoX36R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

On Tue, Sep 30, 2025 at 05:09:02PM +0800, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3 is to add a new parameter to store the point of next bridge.
> PATCH 4 is to make legacy bridge driver more universal.
> PATCH 5-10 are preparations for apply drm_bridge_connector helper.
> PATCH 11 is to ensure last bridge determines OP_EDID/OP_MODES capabilities.
> PATCH 12 is to apply the drm_bridge_connector helper.
> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
> PATCH 16 is to attach the next bridge on Analogix side uniformly.
> PATCH 17-18 are to apply the panel_bridge helper.

Note, only patches 1-13 made it to the list:

https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/#related


-- 
With best wishes
Dmitry
