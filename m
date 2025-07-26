Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F97220F2F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753531434; cv=none; b=eG/MDWl4dHWktWat4pAeJqsgNgs7qk7LuSeaL/QAFYyqSKGEEEOJszsnME1l7qygD0Q2hfA5prbQL/MuAEULScqxBUp3+bOICF45RG/BkxPEesiUN5f9f0+/evxqmYNarX1kxs5r86OfIR5PCmvA2OL9zqrCIagCxMlWZRr1e3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753531434; c=relaxed/simple;
	bh=RxHShZlOwAJanRp5Ay0Ovd6Lx245nW7fyFNBhkmorK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur5GTI7DPoIg4BqA9gcje5ZN2mv0A7Ajowmw+Wab5rgNLyVTYgkX0O6i91D5ZYoT22hTotC1ZHB6grb1HBBv3LP0tAVzAoIs5jIv7aQ4h9djYIV9HjO9urOaIdT3fh/s8cWq5KUztVOZMqCA0xR85norXhA0qTzExbti/vW52K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6+UkxTW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6+UkxTW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QBdIRM011297
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1D6BmR83TK96SbIkz00tF236
	OzVTpRaO1A1uvpbe2kU=; b=o6+UkxTW9yXrNwNRUGXnacOqvHp4+4zOl/lOH+rD
	eIiLIB3ZeSD0ltmuqE029Glavkd3ATJLxAJxi/1fEBNsUvQl2H206QImn/vkyEUG
	CZ7wDU/bRB0ERd2Ko+g21RL7Nb/SODcCrErqZUl3/0ulLg4dZQyvn0zagOhI3Ccy
	Bgq/FImLNqQm3rEbe/9Xq5GSrDwK0biq5ZpImS92MFZPyc1fWAs8jF/vmb/Z7qd8
	37Ah6SKo8QYGFlQ0YMn2sdVW9EIvHl2BhmWnN6iseHjFwE5bZaqeo7K4suU9+F1Y
	E1iEb5F5idMvFr6HIybVTcBWUV+hYJFc6I4iffu+GU39Ug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mqk0sty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:03:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-704817522b9so45009006d6.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 05:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753531423; x=1754136223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D6BmR83TK96SbIkz00tF236OzVTpRaO1A1uvpbe2kU=;
        b=II4kITm/8TfFHh3MUfqwS7GGtsxZ8lNCyMNXgb3lPyejYLDllQnqvUS2L6M7R2Z8MG
         +Tadh2p+Cc1mgNtpuZch9IT1Q1UYk3bOrVHiDP8m0pjlKAox87LOmh9ur9D78Ulm1Y1c
         zPItL+Mf4o6qdb5TaFyLllFapvdphAGfWqrqJgWsncaTJZp8OqGd3NuI+o68/SUtQ3fr
         bMA+5+sGouf6/ytz3KVbVH888hGnuU3Og30cmdVFjcKaX/g8Bf+3st4qUj21kZZyZOtO
         tNPOL96iLVCoBM6VpEao/UoQ6tJNaFHIEc+QzT7cb7574ShY6cwUQIr1ZzGrXDjIzh2n
         4HPw==
X-Forwarded-Encrypted: i=1; AJvYcCU21kLF+ZloHpIovN5+4bTvWHymzKlixB7/PeCU2X621dHzvMVzycAyomwpNECLfjy4lFw4AgHLNzbxE+/OtVF0Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmvHk4NarSVsMqOZeK4oQAVEDOjdmg77jIudVkWDok26XmhswO
	t0J1BTuXsKDNBu6ShsqPI/2Z+NWW2Jr3/h+gNPUabRbWdP0efrY+tlJzvyMSTpT9nCK8jPTzFoR
	gtWwu1XBPo+Mcr39/+a1GPsuACyW/qjXE40eH21ZigJ9qZPacIHwmcjpg755EeR4Ibw5MW09rhg
	==
X-Gm-Gg: ASbGncsDAijej0558hX8IXZui95HWyZfsf14tXsend4cFeUUO+6Z2x2JTZrtlS8rN+G
	WVuDgHcNQdhktClpNbqhfw8F+7Wnw45iAigzh2pbx2fVcY6TogbgM09JIUn5C4UWXJY3mPT+Piz
	dxdNkKz4BcIUABPQFZSunJdO6GmssGPn6gYLnF8cTXHFGTwfe6fNb20I8Q1Sz+So1B0/zaY9EBM
	JOcGxhkYnyPgpgFCqnCpqemNCRYbLvJNbITjsFFtmThA9MgxEqJkZA/E5S564OwDIuTX1Hqr2br
	mcX4lgpubGTX7h0f9jlIs83NQ6FNbymLNlybrFVhsJkYXaJhXYkJapt4XE4nQepIYJJyhJ0rpdZ
	jnxWgNCfp9p2qdJnzKulmNqrPcMwm3Z5jMRjbaMPo9JhISXwa4pp3
X-Received: by 2002:a05:6214:4e06:b0:707:2230:b6af with SMTP id 6a1803df08f44-7072230be23mr48058026d6.44.1753531422895;
        Sat, 26 Jul 2025 05:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXvFtpJkzYIeiG9nyGHhRK7mR3gLP3VEEBXF+lBE97EG8zozjWb6VOoTWSf2I5TC70nhrV3g==
X-Received: by 2002:a05:6214:4e06:b0:707:2230:b6af with SMTP id 6a1803df08f44-7072230be23mr48057536d6.44.1753531422345;
        Sat, 26 Jul 2025 05:03:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f40b339bsm4061511fa.23.2025.07.26.05.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 05:03:41 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:03:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 09/14] drm/bridge: analogix_dp: Add support to find
 panel or bridge
Message-ID: <kulhumudepz3lqm6c36wbqtc4gv35pyqki7el63bovnvxcsjkk@nbxijrujm2vz>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-10-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-10-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfXxQiK4T0NJzlS
 BtAuagyEOeapJu85ttVK9Iati4ko5VO0JP+OT64lyqHtA9iQBUZSUFwqn8TazOdo1kCxM7L+4ZR
 wS0aYC9S3ByHpGLHxi8rYK6B9K5KVCf4d/+zf0cIKbqeCpde4MUxk0KR6moD6L1wyWhCmn5uIcF
 2+PClD4NvhLKRKfTQUl3laID5W5GABwmNMIhbbgGYwkMLCqPfmVHWXkF4rbgr91fgLnMbmqnbxL
 I4mXQDfTc93LnOXws4r1EsmtsvyXQgSF+G6xtbgBP7Naa3gOBsYQVoGLOqHCVzV5a6LnbyMi3Px
 mO3GqW/h/9t5HIKZqrGV2A5L/28lxNIwOjnWh+mb6We07AEzQMVvypxL5EgYqEbtExPpZMa2jdJ
 j/q24bNsFJJMkQzajqeVUEemjYOmUnPK3lG5BQJBKllaiPHptWnZCKtHpgUn/fY27p84u5AK
X-Authority-Analysis: v=2.4 cv=fqPcZE4f c=1 sm=1 tr=0 ts=6884c420 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=cGmNtDV8R6BPqPJYracA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: qjUUWCuDc7EpXwzLqc8yfYkk9XOwGb86
X-Proofpoint-ORIG-GUID: qjUUWCuDc7EpXwzLqc8yfYkk9XOwGb86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=966 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260104

On Thu, Jul 24, 2025 at 04:02:59PM +0800, Damon Ding wrote:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
>  include/drm/bridge/analogix_dp.h              |  2 +
>  2 files changed, 50 insertions(+)
> 
> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp)

Nit: the API does more than just finding the panel or bridge. Also the
drivers use it in a more of 'analogix_dp_finish_probe()' manner.

> 

-- 
With best wishes
Dmitry
