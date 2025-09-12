Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C72D660B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675360; cv=none; b=sYpEucNhgKdGjr4eVnAZp8kolt+Z+n49dRsj6qfhlPuw60qpKqlhSWtWkHRy7KDFJswbsMOif4SskSiUCSj8x+48fGDzxpn+0M9wUZ1ZwSHoDUxomvaNRhEk4V4iublusrjQnmnlfWAWKFeIU2BhuJWIa7VUAwJF6ZMHuZocXg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675360; c=relaxed/simple;
	bh=IU5ZftM008FJbyCiKcJzDG0K8Zhj34fPHy4gag5Ncuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQbd516fnWKZD0drzOsxUuZ2p06qQIrwQGUeKLY7BK4cWW3KgVCm7Fh2JQ7KEAJMvf/xQU3q3QYPWQCtsQ4DVBVczgxwk0Hmkb5uQ+CLhGhjIWlmsp5HoxrN5+U2jAxSejJJTiAJmKBaHpZajrFRoYmxONAIIdKd13xQTsN2Cwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl+MZNeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl+MZNeR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fL7J009110
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RXs862lHntqXQwNUIePs3juX
	TkdDKRSL4lc3ieGUpc4=; b=bl+MZNeRJm2odMXHbz5MBmppwbDpNzrIZUDhXYto
	oiHlHMedpKDBvrKEV9cQVUoTs3htou36PF/hMhh2kQ2OWZjice3mAmYehnUKCDxw
	9Qk5tAJ7EuA/S1VSGHIbv0dBNL3Qa8P2zzCd1xPRK9J9l0OIJBUiBQGgJUNxURtl
	54AzGO30qSd1N1QJtKRnyLUIMsuYPa2tuwlZ00w8d1/bxQcz27udyvhOciGRVu3Q
	fa+OYXWq3b/k1YX/UvASSsDig9EMaLum0zGnMGFbAoBDVOw21J+YsVeb/zdZuSzP
	JKUUO3z+3kf8nud9zavD8wMGa61CFYaEHfrHXPyn5gRx7w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj13ctk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:09:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70de0bdb600so29017296d6.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 04:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675357; x=1758280157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXs862lHntqXQwNUIePs3juXTkdDKRSL4lc3ieGUpc4=;
        b=rIUYa/XU01bOtpdZWGINIcm5ir1XtqBk6yRt2oaD7JUwnxsB8omkzI0mbTf0mIk/RB
         zuDeqmNbo/JS2/P+Z0NOPv7FnHpn5YFh92Am92lyT35vqb/fPyCBFAiW8E+P36HkcbwW
         NoW4q6CpWaVSiJHfuVa8qfcRZnLaPN2Nq099ZV/3sK/y4hZpR1Mt4aLN4p+8wwV114R7
         DlgAXRIZVfWG9SMOWKoiIuoiNZUxf41SbhkOIyaA95KR+i+GGB+dRVkeIWZoxJ5U+7rv
         gHsaM1ySCWZeSBoKepbWFB9i3iHBOogPGr0dxFslodeqPC/dWgREhMXXsUI09ripfs4E
         DjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCULuRK2LKBYTcbdVyP5j5wBd1EmAe3w25tyZeHxfJzXUhuvDMc9hZbTQKiSnJh3lud3YkpKVphjhJI8yIce7xPsDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7buv/0cTLWr8DNoPz9yrvX+rlqBfGzvsjfLozInmQOMB4vj1p
	8bSQyUCrqBBlrcYpKYxF7RKGfK8QWna5C6vLrPMOKwnGXVvLtCxE1L4CEaTIhHV06vhQN3yTO04
	+UeMsomDbLGg5fLa/NZICCobfgBrlUthV+JWTWAA6JQhgHFLU/uD7TFOjhLQFDur19h9Jh3QQ9Q
	==
X-Gm-Gg: ASbGnctAmcqJS3c5muumfc6AeQ5nNqtquXDvOA4rDFG41aDgiheW5Lp0MgNPuBJYC0J
	7GFcU3GGCeIOKBJ5/a7VfipdM1fV4CjMavUkk0gpn8GHSq+V+4Ab8QrCOhHE/fAhvijRjhT2TmX
	rnCZ4d/IngYgSYB/6WTRrsrMjMQpIugyp2E83t5FN/Q4ZsLl/9kfGw1I4HFWwks/3CSRkD/sz1y
	jGtG28/fMtOfhugE5ZFuJ3A5fRvXI7gD3JunZwucP1Kl0DOj8LSngt/dpPzBj9TEOKtiiV5r4XG
	MKcMZzEN8PGvRKp0raJKCm+Aucz4xI3AAtanPp1KihlwajEESU3FlwGNnLJmRlE0piBvwvOBHSf
	HjrK3/p19n81/9/LjQScYUAErpVhD3l6Dra70ly5u8n2kkJW8XEfR
X-Received: by 2002:a05:6214:5292:b0:729:3942:651e with SMTP id 6a1803df08f44-767c46ccbd0mr29918316d6.48.1757675357064;
        Fri, 12 Sep 2025 04:09:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwpwkiF7tmyFiOg9b2iM6+kt1wZ6fedFzLrjDmSArDmyBGneXRRy71xO9JbYjDDc2/GjMUTg==
X-Received: by 2002:a05:6214:5292:b0:729:3942:651e with SMTP id 6a1803df08f44-767c46ccbd0mr29917766d6.48.1757675356530;
        Fri, 12 Sep 2025 04:09:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a8212e3sm7522231fa.41.2025.09.12.04.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:09:14 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:09:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, dianders@chromium.org,
        m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 15/17] drm/bridge: analogix_dp: Remove panel disabling
 and enabling in analogix_dp_set_bridge()
Message-ID: <tywxkfjhulxsgdphngtfs24whslbkmnza7yx2sb7c4ulea6val@46pi6e2sjs6c>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-16-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-16-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: MOc_3BDu789ZoQFdIo5fO16jgsDvuSak
X-Proofpoint-GUID: MOc_3BDu789ZoQFdIo5fO16jgsDvuSak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX1oUTfaq2XdKq
 Dq2w6kf+k5gn8UW5xfnvp2DyWcz/7LpmnUWF3HHGZDkaVtlcHdeLTRtjk/eBqogv0LZE6c6mNg4
 +PTDKv62skWRMA4il5QctMWS1lGQDw0ypGSM0MIwtGh/Pa/AJ3jJb8PuG7LZjD3emlcdVq/Yg1i
 D76p9lo+UfWI0YZYsbci7DopfjDKSXghvJdJ0laMo10yBDi8vgNExRqF/LNBniKy48bGN7rcbAs
 RON6ncdncMDH6/MiwAnaMqRbY9jH0W8lfS4EL06/0uFqtUPSkCKvpKQu8ueLuixM8AbPJBJ9mRU
 38f2xRhWJOCptmlNfIy7qJ8QT19ZdBPCM7iiswPHijrPt99rKeWtx1YClY0kmzUIr65ya4aVvov
 aMflIcba
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3ff5e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=xk9nQhndt_Gh6lZpDTgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On Fri, Sep 12, 2025 at 04:58:44PM +0800, Damon Ding wrote:
> The &drm_panel_funcs.enable() and &drm_panel_funcs.disable() mainly
> help turn on/off the backlight to make the image visible, and the
> backlight operations are even needless if drm_panel_of_backlight() or
> drm_panel_dp_aux_backlight() is applied, in which case the enabling
> and disabling process just add necessary delays.

Not necessary, it can actually be turning the panel off and on. Maybe
it's worth squashing this patch into the panel_bridge conversion as it
will point out that these functions are still being called at a correct
times by the DRM bridge framework.

> 
> Therefore, it should make sense to remove panel disabling and move
> panel enabling after analogix_dp_set_bridge() finished.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 66d0cca1f268..c98058e9c917 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -749,9 +749,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>  {
>  	int ret;
>  
> -	/* Keep the panel disabled while we configure video */
> -	drm_panel_disable(dp->plat_data->panel);
> -
>  	ret = analogix_dp_train_link(dp);
>  	if (ret) {
>  		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
> @@ -771,9 +768,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>  		return ret;
>  	}
>  
> -	/* Safe to enable the panel now */
> -	drm_panel_enable(dp->plat_data->panel);
> -
>  	/* Check whether panel supports fast training */
>  	ret = analogix_dp_fast_link_train_detection(dp);
>  	if (ret)
> @@ -1156,6 +1150,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
>  		if (analogix_dp_set_bridge(dp) == 0) {
>  			dp->dpms_mode = DRM_MODE_DPMS_ON;
> +			drm_panel_enable(dp->plat_data->panel);
>  			return;
>  		}
>  		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
