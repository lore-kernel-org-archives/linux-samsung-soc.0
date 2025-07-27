Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8AF14A82
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753636065; cv=none; b=e9i9I53w7lBUcJI8aoYhPpgVM+/5ORl3zhWAEv+nakHsmBQeu/loLYhfkjGAgLC4Q9A/c7gvzBHbbhSeoOMJky6fBOzXlpavxdYa9z1d7iPxRyuvIS+EiU1b8Z44uthK9PnfoyHySVuATEwv4L9vBockVuNpe4ZBKsElKuZU+54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753636065; c=relaxed/simple;
	bh=wdvQvZOCUJ/q5uIVaqvSjkbGbQL15jJ/+mzkMqjWgSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnuH1oqRJ7oLp4U44W+qix8hLp4xrGAwz8eJmkMMWPedgM0XicBllf0XUV4+6fbuPO8Boxf8GIYOgA5baTHWO4EnN2Jkj80Xqq7yqCeoq+LkWffeU8y4HdCOVjjv8v2O4w11iBIcL54g7UOuEyYj0IfNptp10N2qHf2Ls1NPmVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjWlHz6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjWlHz6V"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RCpvXL029754
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 17:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixTGCGDVVyYZCVMPENu9+cSJ
	CMoukZrCFUWQs6e8nEs=; b=GjWlHz6VsRKE///7RZP+5J6nheAUZYr6XJ1Pn8y1
	9PG8KwFozIyqCuM0kPniLOFb4DCi1tJP4COnQrtVj9R6dr67Ztcq0s+9PYkW5pDA
	D/aLW4F3wevb9eSFNy9tvV3KB+YZuUNkRfCqUKfaw5vjYKFoh1nas4aPogtn3L5L
	Z6ev0yhdRShYYdS86oXSMRGepuBXhBvFrDeMLrr+2Xdx4Bc3AmvCvdMzUXt7HjxD
	iGjajE0qEdOACM8yy2YkzM8HtLLhRmk8dkCf+mAdMYgOevhNemt2k7TsJpeBrNn8
	/nRDW8qbacMN0rvUJMEeBuzs/lVthIi3mFB1XWdo3RciEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484racjb83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 17:07:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70732006280so22334146d6.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jul 2025 10:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753636060; x=1754240860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixTGCGDVVyYZCVMPENu9+cSJCMoukZrCFUWQs6e8nEs=;
        b=kezAIIZr1BgIkjwJ3yuhIQF6BoRO2L5tyOeYog0SOg11RWMvpKspxCUA5FK5MNQEgW
         m0+HAqkog8PqbNx6NgyAo8/Lh60B1Rq5syjo1ZezErdhrkAwIeBsp3K07zrFH5yQCxVS
         qFGq1EcMYjaMFKGpYsl53i78ygOPKsZ4izCWxdvfXI8pR7xCK8vJRgVP17yh6ikadiFf
         XEu+0csMnlFmv83LskzPgIBuRpesVxInN1CpAS9uSkIP/uySSoJNfWo4CEraOtJt0qhq
         +pa2mlsRAuQ1tZPB0VvqsAG4/ky7jBvjvfPmjbXP2oHB0BRweb/KJug+GVgNiGSH4kfx
         MDDA==
X-Forwarded-Encrypted: i=1; AJvYcCU0pbx2LbycLN8TVyAS4fiuKN9eHSei6QhVKurzc4a3mZTSG7v1QLX6NSnYcuoiCJqOsSxdgCIP9Zt945dXLqKj8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEr1kFul7SNZc6sm+a+5E/Gs5rqq7yM5ILE6yZjdeb9DRAcDOe
	av+rtFVNugchfSD0BUXDtJRW9dWdHbV9nxLlSooHs9lLroijrw4iCUSDasY9AemohFGCYVI2gpe
	oi/li8P/094gb2mdCAFO2bLsSaRmGk82nc9jI93Oj13CaizvqLvLeEIUd3/FUTUwhrqDPBt3wlA
	==
X-Gm-Gg: ASbGncufME3c1wM5/6ltRKo5mkK61wWGSA0zv6XU8uZtCqSq2TxY9bYRTfhdpTes57B
	acT5Di+xM0xZndPG6ADnuKHFExyGRBIG0bKYtTcJf7uOVC1u3n9AfeiQy6RIfaaWaY/5kcNuD0J
	SSvpEORn+fz1sR11hnP7ixvsK7VuTtHFzve1zlIniq+MvKlXMUFXtsGNL5gWr3cBT7ltB4gdMCn
	k/SNFrjS4yDDWxpcCPrDQOYb16PXGDN4lvtZFjZA6FZIByhl+EdfvRCOhYxF4B/69TREwfMYZli
	fko6jA4za49+892bnca3tkczVVs0ZO2OII0ulfeplmUQRnYumstO7RcqTZyx5Me3lcVy66PfgMk
	FYGSkFfVs4w5ST498yFCr8OOL3DgK8IavKCDX/jzPp2ByWtJBtt2Z
X-Received: by 2002:a05:6214:2589:b0:707:4537:694d with SMTP id 6a1803df08f44-70745378ec4mr29537446d6.40.1753636060365;
        Sun, 27 Jul 2025 10:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEXLKqoDY1SG91obuUTr/s+jXCYfFkccduE+r6jszKozvG4bsVHcYbTsAuHs4gKScMQt334Q==
X-Received: by 2002:a05:6214:2589:b0:707:4537:694d with SMTP id 6a1803df08f44-70745378ec4mr29537026d6.40.1753636059860;
        Sun, 27 Jul 2025 10:07:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b633760e6sm878179e87.160.2025.07.27.10.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 10:07:38 -0700 (PDT)
Date: Sun, 27 Jul 2025 20:07:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
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
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <ldhyfuczwtwydwnvno4xn6ppjtt7mtcj35fp52xrqaajtfbtpb@2pgkytczb5k5>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=68865cdd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=he5a5jZawRGK-0tMrGoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: KbTTzbyfnoQ9n11xpBI8Ud7RZjlqqDft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE1MiBTYWx0ZWRfX4s/Qjvc5MGcT
 u8+MT4Y9kDLjxCNecWpsCkyT3+oEq9qk5GX0N16f0UyRwUwsxvAjGLjZyFD7mJE+WGmUNdoxaYi
 NLFwNh1E4BNd7kBgNh6ix07XAFOBC/PsE7b3Cyn1wdQAaSIzQaTkeIqzJ5ixPUDH4xzf+cOp4g1
 gX51IatFR2lUG5AphIzVZd+FpszCwAi/62+628P2hP1bgHwNBonbtVex3v3/mGiTg2T4qOvs8JP
 toW7kFzsKbmY0zLlPAd6Lj31D2/KsfOaOKHm6jL0MdBG8ThxvRlO6I1Nhm8N5BUE2hmaX3oXTIN
 sf38Vm4WjF/0eMFVob6uQKiqlkWMHEFSFk3W/KwLW4HMZC8JRNi5QV7C1yKOEOgN4phH3uElztJ
 5p5nvLFiX5lJjprkqovVHCAdR4wRttEgSZQ8Pg3hTDvy9WT8sQtokNGnHyZL+PlAKJji2thq
X-Proofpoint-ORIG-GUID: KbTTzbyfnoQ9n11xpBI8Ud7RZjlqqDft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=855 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270152

On Thu, Jul 24, 2025 at 08:50:53PM +0200, Henrik Grimler wrote:
> To use MHL we currently need the MHL chip to be permanently on, which
> consumes unnecessary power. Let's use extcon attached to MUIC to enable
> the MHL chip only if it detects an MHL cable.

Does HPD GPIO reflect the correct state of the cable? What is the order
of events in such a case? Should the sii9234 signal to Exynos HDMI that
the link is established?

> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v2: add dependency on extcon. Issue reported by kernel test robot
>     <lkp@intel.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |  1 +
>  drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 87 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -303,6 +303,7 @@ config DRM_SII902X
>  config DRM_SII9234
>  	tristate "Silicon Image SII9234 HDMI/MHL bridge"
>  	depends on OF
> +	select EXTCON

Either this or 'depends on EXTCON || !EXTCON'

>  	help
>  	  Say Y here if you want support for the MHL interface.
>  	  It is an I2C driver, that detects connection of MHL bridge

-- 
With best wishes
Dmitry
