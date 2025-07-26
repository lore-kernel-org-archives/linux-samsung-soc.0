Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C25645
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753488777; cv=none; b=FaS17ZCM2ngfNcJYRhE8kwV8ERdZbx/ZteS0a0ck4BxrImbf81TGkRsollAnN9xYl3MfAdIg7V6owmARG8lHnR//BBSmhx/cXrbsCQxd+SPg21zVnK9CM0ULgKnumneVJVC4pNGa3W2PO85VCskm5fsI4xTwt1Qup63nghxd9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753488777; c=relaxed/simple;
	bh=EPGGGTD7cN5q6eseR9hSqcJxHvinkh0G4fVaE4dqQI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b57xm/40fnTgUUV0Svn6a2pjgqgaxqN8epH3ZBu/HApXIbBd1/Kr9aOAzAu7zypgMM7w0kOYaFlNqT5AW0UWrJxWvNISW5zWTu81OwKoGwOuUcolMB8xEMrCGMP/pLqYyBgE8diTD4uZcwvIplYIXNnKHnTMXE3C5uLuS1Nr29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkcdKEWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkcdKEWc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJGr7Y018456
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DoBs6OVTwFF+JmRKLxgaU515
	KdcbQmUXJDbYvNv8Tsk=; b=AkcdKEWch4hN0ZdD5TgDOmbaOcmN27fIS/ZlHbWe
	3ULXqdAcgmVi41jdu/XZjfaiA3D7okA2KiiMsqLdEVWadDDOTywEvW0cb9vaNYcH
	BZte5R7/RAjP9G30k/XrAEZQoSPGAzuoI1m7cBtt+qwTY0JWPGJSJOIr6Cq+GyFo
	NFbF/T6c/D7WKznCMg8bU3AWiToqyIHXEdleQLztsN9ljT5ZMoeIebuFk4agoqoI
	cSCm9nKK3HTqFL/9Vh/zr3Th+7Z94MSdGtRntAg4M8H66eC/jQzOk0nZrKgO6EOP
	wXNcFxn88yKgJLj8/B3MvF9G6u1enWDcHWWnp4BGwfzSeg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s3rbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:12:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70717c4f6a5so38515996d6.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 17:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488774; x=1754093574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoBs6OVTwFF+JmRKLxgaU515KdcbQmUXJDbYvNv8Tsk=;
        b=U/g1lmaY693pGmAEX9aXeQ6lPrdLANQU5RvVxi0zISTmhKiM/xVosMxiBG5sxUpINF
         AyFaXHVHLKZwffghZxtKDLAElNyZ8XcTlj7rA0iXWtrc+oCqW9hRUaUFD1WBKe9G6AgC
         MaEm4sDyXJ7frD4ZaO6BiJVhzszVvrwTOlj2cCpsVM8qWN+sGmOIo7PkglXmrFHXHzU0
         +Mp9MWFpzxxOSG1lugXMUJSnvJ/OA45JcYA04PegU6BvqsZnTAkYleqoeew3eSD9uRC3
         cBrGOFPFYtGE2lAKEmZ5fd8Di4+JH1iuvEV6f978S5VZ9wHqXN/XU1Zh3p8AeWNr32Ns
         l6cg==
X-Forwarded-Encrypted: i=1; AJvYcCV4HT5BxX7hPLDfktSa5jIwvlXRY1NKahF5xhZMJ3beRoj8EZNClydmCTs6rYmkfg+YE6J4+aZCXdwrjdCEIuMNgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6AM2IzGYQDqPAify/hzwX6WzTFV0q7QA2SwM+VCMdtAT38pA2
	O/H890FStZLjQGPmO9FXj/qQZxj6lUY/A10EOj1J//qw19NjUuomvTFGuOq52NJfVYMOHvFsDpy
	HnScEiuWPATgrzHAgThx6MzcorxFN9sILYG6RiXCHU3uLEk5iDcLCcsxhlEyKmSsSg2YuxB7c7Q
	==
X-Gm-Gg: ASbGnct/PElDKcXEwA7shtinkZH2Myv38qSVj74ttLcPP1hI4x9E3egDFOZWLbmY59M
	gK3zi//NGonQN9Qq2zawkjdzb6jOCSYmsJ/eYMfH/lzTZLEomeOw7eqDqnxx5DQ3W5gMlGMLyVj
	Nva+BCpz1Ivb0zvdINf52Sq/2npPr3NkqzxYHChO3jWnRY/XqhTHkmfrrxHcD64+analE0xF1fi
	fnfEqALKpKi8WIm70urmkbAyLwRcYDMePGPzlosf/d5TBUM0yGBv/Z6ZyWBHAq43clLFMYklnfd
	ha16WmK1L3Ezh9X9Qqwkecs7m/psnYShuCQnibpOI2pY2EUMmwkT1t4oAK+HEw9fbNS+AFVkQli
	EXxhW0JdTz/dAOaeTaURiw/MtdyVzK/H1zfwiRPeGWg4g6swJgREJ
X-Received: by 2002:a05:6214:e4a:b0:706:ffcd:d3ef with SMTP id 6a1803df08f44-707204d91f1mr65699796d6.11.1753488774211;
        Fri, 25 Jul 2025 17:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbddedN9+X5RQ+51/olzP++4eSaSJsPJ6FulQapEa8W/10AV19KAs7kk0J58zSr+jFJwBgmQ==
X-Received: by 2002:a05:6214:e4a:b0:706:ffcd:d3ef with SMTP id 6a1803df08f44-707204d91f1mr65699336d6.11.1753488773736;
        Fri, 25 Jul 2025 17:12:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b633760e6sm186357e87.160.2025.07.25.17.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:12:51 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:12:48 +0300
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
Subject: Re: [PATCH v3 03/14] drm/rockchip: analogix_dp: Apply
 drmm_encoder_init() instead of drm_simple_encoder_init()
Message-ID: <6psjcrhbnk7czdrdtxh65kr6qvygkwogvert75dg2svbm2cqd3@uhffyfdxqpec>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-4-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-4-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: L3cp_OI9I0KT6P4VDl-8WP1rUX78hhIg
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=68841d87 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=HslhmZ87janovOCoqE8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: L3cp_OI9I0KT6P4VDl-8WP1rUX78hhIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX1fVl24YlZ0oF
 /j8BgMe350ul1S+hwFItd8Hu/LiTxAxImtr+mFucwcCiQGR/c4XdJhmZrNNxjWfC3n8zVbnD3o7
 z41TfZnkQIkLFlNiDxy65InqyjWzZgOWMAjHC/XwwRf4Cq5sNeYB4C/5eIZNEj4tZiEsckklFJ7
 SKNHayGFhQ2ESLAeAV0osi9llqTr0T0+I8B5VLm3mumjCRsit4yYsSsW07IDKvVXktZv8cp1rF9
 65TI6i7MK6TIH7lrCGXmeZ6Z5v21m36GE4EbmkPkJFyuiBMa0czmWCvUgkfmwVMPfv+Bu8hKfzM
 h9NOiJFa4sBlSp0KJoeoBQrqIr0990winmwzm0DGS/rUFI6rAhNaaNaOuRVrKXB/MSxT4CWnCB4
 l6KL3fNqZ4D4RQq85/N5vgMmJK1mP+b4T6qRbP/2QqS3G/Hz5J4ighxwJsaELAjURO79/5hK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=670 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250208

On Thu, Jul 24, 2025 at 04:02:53PM +0800, Damon Ding wrote:
> Compared with drm_simple_encoder_init(), drmm_encoder_init() can handle
> the cleanup automatically through registering drm_encoder_cleanup() with
> drmm_add_action().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index d30f0983a53a..4ed6bf9e5377 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -29,7 +29,6 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  
>  #include "rockchip_drm_drv.h"
>  
> @@ -377,8 +376,7 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>  							     dev->of_node);
>  	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>  
> -	ret = drm_simple_encoder_init(drm_dev, encoder,
> -				      DRM_MODE_ENCODER_TMDS);
> +	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);

It's not possible to use drmm_encoder_init() here. Per the documentation
the encoder data structure should be allocated by drmm_kzalloc().
However this drm_encoder is a part of struct rockchip_dp_device. It's
allocated by rockchip_dp_probe() via devm_kzalloc(). This means that it
can potentially be freed before the drm device is completely released,
creating a use-after-free error.

>  	if (ret) {
>  		DRM_ERROR("failed to initialize encoder with drm\n");
>  		return ret;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
