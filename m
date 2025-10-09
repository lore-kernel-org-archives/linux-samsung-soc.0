Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D46B2868B0
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760049019; cv=none; b=s4mdlpuWeXpNdpgaw6CVj4imEh3vdOyzixzzkQbPZfzu5pxNvzsWlp1LpuM5+WwPN1tC38XJe94ZOw7/dSXj5Mq888rBPzi9+FPfVNcnY7t+bT1XSsvyXJn8ZF8FisytqlgDo02+uNHbf7Ab9hqDkDJ8H0qx7x+b7LFaeAGBg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760049019; c=relaxed/simple;
	bh=ZIL1TqECxPp3d2jUTVf78NM4FAZpOyrgrxPiEWB5hV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZvXAoLO+9nNdSsdkEVNWw0MqtijKqs1aFnOAvYmENVFCcM5drYWiZWFLbhGMaH/DfMxzyHz3WGTn++7t/MylZ2a/UgtAll2SdA2lYAc1SCqun9oPilZ9f4mCgpygr0m1NV0qyOqihySXyhNmbYhnTefiH1hS3B6Pw3deuV5YlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOz0kaNI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOz0kaNI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599F3XVX023272
	for <linux-samsung-soc@vger.kernel.org>; Thu, 9 Oct 2025 22:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7u9Umol56pcPf/8TeFs1AIjO
	6NYonp9MTQXBusmiU+Q=; b=MOz0kaNI3z1KFLWKgm67QvZsO4sKsIlmf3KfrSp8
	x871heTRYJHsSvvYs7zGLng62g2qwVsoLrOrPI/2rc8wC5st46CBRuKREuimw5Vt
	P1KBQZscb6ADHPZ4WDWSwG7E7Y/f6pCBi2hgIWAj3aTmav3nV5jicx/C1rC4knro
	CBsSwuMT1Ev7PilVMh6uY0c2SiQjPVjOhasPsih6JznSzDn/2rfbeR+SuqAAh+uN
	7aEyJby90yISJd3FUYWHZuesr0A9Wu4GL4PWfDQ16CWYce1edLgM1dAY2NlwhcVD
	ZRKfSKmGh9Ct6nAeusAQkEJcrv0JmkDdAHb08IIzOI37Kg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m4f0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 22:30:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dfe8dafd18so88039521cf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 15:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760049016; x=1760653816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u9Umol56pcPf/8TeFs1AIjO6NYonp9MTQXBusmiU+Q=;
        b=jrRy7HoOaR4AV1qZe1krAgPec1IhuYgc51tLAPPrIDpm0H0Ljj6+FIPcYRyV5Wpipu
         6GK7TFYGe40hBCiwgSpld9e4eUuC568UAfIeD3mFc2daHmGEUD1u7zQi2gU57pXweon6
         K3krux7k2Ta1I28YGWLHKdrVU0ecZALyJ66swUy6KOkNNLN9GS1g3mqN8auKzk/um1ll
         2JVmLpriHs+fF6OuMIAixKXbSeMsByaxk7Z2TZVS9V90eExu8MaoU40jsZMRuqNveEnY
         GYrbIXKL7zkCw6KQPghCPcBmZpi66uYBoa97Al0nLBYhC68EptKlFfhmkAKOLUON7Mv8
         Rs8g==
X-Forwarded-Encrypted: i=1; AJvYcCU73abAw0SaLRB9W+1+ZRL5QjRvZbntIMQimphTXV6dZW2XdWOO0Coi24ji/cnxyX8vLR0gTBekfxtqSDKDu7pr8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsVXr5ZteIeJEtpgrwovbERyEQj86Sl9ZgvAgXX7GotPiL/Mh
	64BHMq+P7B7ymbRjRjYh+zeROEX/u+qbspQGF5KLffYoTXWdB/pnH/MrCOo4u8VdNHcUjBhD9rv
	TJ+k2I9hjqdG3fWIN4Ir6h2SPlM6rDQQ5DfMMomy2t5/wRzxWuZfSKj9nHDMf44DqokT94prymg
	==
X-Gm-Gg: ASbGncvtUHsddp0/ysDsjcrP31j0TYUTtgthPXCtoZxCAk42cZ+8uv8WLGI46zAXw1c
	MrCuKMYR4SttZYan1CkZ1jF0FFBbcelLcZquk+WH3uDGzSQx00e2c7wOuuF7MC/WODvjiO4HBjR
	5rzIhVQq7nM62AaW6cKY3EBk9MZPkZrxdIoM3WpFSoXOfCYndg6EMUmCPQbVcCG8ob8yxCAZqYq
	4qUkT9TvCwfF7Cbkr189Ee1VJ3DPgJywWeAkeyL8E8V0Y61S2ZgzDFqIpg0WuaArAyzd2Q6lrdP
	EERkUtOoaPx1DHRoj8yBBoCb14EieEIAl7BLsCtcLIZOeEHYQZJsgZ7cq0RkJUphGmPQhIJCV55
	I4Fj4Yh5l1BICBJaNv+C4YATgGcunsnmboew2QooAh6nd9pKQDjellJ1UbA==
X-Received: by 2002:a05:622a:254:b0:4d5:229c:9d1f with SMTP id d75a77b69052e-4e6eaceb25fmr123334751cf.32.1760049015789;
        Thu, 09 Oct 2025 15:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF77+YGORmN/1V00YnubDd/uwhGM0Ew5duFJ5RpvkZg8bhb7cpDezBj+R100Q6pO/HZIsgBYg==
X-Received: by 2002:a05:622a:254:b0:4d5:229c:9d1f with SMTP id d75a77b69052e-4e6eaceb25fmr123334311cf.32.1760049015316;
        Thu, 09 Oct 2025 15:30:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088579e01sm238719e87.114.2025.10.09.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 15:30:13 -0700 (PDT)
Date: Fri, 10 Oct 2025 01:30:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: damon.ding@rock-chips.com, m.szyprowski@samsung.com,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix connector status detection
 for bridges
Message-ID: <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
References: <20251009193028.4952-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009193028.4952-1-heiko@sntech.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXz1vc9Gjp9Rev
 42/fkfLYPHSbyIO9FYHwszTE5t0ZZxakhj96OEPwXqewuHdsHNeuH0YEO0nXdFlB/PSHg45eLbV
 lWH/L3tv997itZ/QMQMw8vSoz3prI757NJ5eM+BiqFBIAwaAoui6vdNDJV7Z4hC5bAFLB8c3T4p
 Ce0ydoPsqcm5ZkmIKflGj74VTBgtN8Q/ehoBIjNPibbwT+MkYSTMhy65D05eJUhixJPEamIx1rc
 N4enCpEB1Pl7fMfFRvicKJyKDswqqYdTk7gQmt/JTnFDd07G5K+3XsILQbZPb6+oAdhnNry6X9/
 SFd3TIMPYJHBCsMhMuVn84pPdGBXIZa8M6Em4xytLUxcTV2uLiPeJ7EMvI2DFehNuxOvcMCUniS
 IoSmYC1jjHOvnS5NusCVJ0q2obPDng==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e83779 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=Zt2WjO-vMssICJJY_9YA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: u6XTt5UtCJxmK3UlPcVUMwN0SJudKsyM
X-Proofpoint-ORIG-GUID: u6XTt5UtCJxmK3UlPcVUMwN0SJudKsyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 09:30:28PM +0200, Heiko Stuebner wrote:
> Right now if there is a next bridge attached to the analogix-dp controller
> the driver always assumes this bridge is connected to something, but this
> is of course not always true, as that bridge could also be a hotpluggable
> dp port for example.
> 
> On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
> connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
> for DisplayPort targets is more complicated than just reading the HPD pin
> level" and we should be "letting the actual DP driver perform detection."
> 
> So use drm_bridge_detect() to detect the next bridge's state but ignore
> that bridge if the analogix-dp is handling the hpd-gpio.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> As this patch stands, it would go on top of v6 of Damon's bridge-connector
> work, but could very well be also integrated into one of the changes there.
> 
> I don't know yet if my ordering and/or reasoning is the correct one or if
> a better handling could be done, but with that change I do get a nice
> hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
> Analogix-DP ends in a full size DP port.
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index c04b5829712b..cdc56e83b576 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
>  	struct analogix_dp_device *dp = to_dp(bridge);
>  	enum drm_connector_status status = connector_status_disconnected;
>  
> -	if (dp->plat_data->next_bridge)
> -		return connector_status_connected;
> +	/*
> +	 * An optional next bridge should be in charge of detection the
> +	 * connection status, except if we manage a actual hpd gpio.
> +	 */
> +	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
> +		return drm_bridge_detect(dp->plat_data->next_bridge, connector);

And it's also not correct because the next bridge might be a retimer
with the bridge next to it being a one with the actual detection
capabilities. drm_bridge_connector solves that in a much better way. See
the series at [1]

[1] https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/

>  
>  	if (!analogix_dp_detect_hpd(dp))
>  		status = connector_status_connected;
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
