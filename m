Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4604833EAEC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Apr 2026 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768564; cv=none; b=YrNfqk9u6MSXK7dNs+mmwBDKef5r55J+9J+NekAuS6owqiC+uLdTUa8H7RhOURpYRDLdbxgtvWcKlgaC5yPnUejS5ohhn9a+XIPNhIRYIUziTuf/hzmnr2pDgesjuMi6feSprupYKpc5GZKcHGcDhjylaxYqjM/NniABGwcls+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768564; c=relaxed/simple;
	bh=hpaw+eGFVDC1cn6/grl1NqqL/A0F4xCbTiGbFyErEJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZtv49Iafk8Av4nLpqtp9SQS3rgKXJGdef2dNcJX9g7BSE2WaQQYrdtiTUXCWCi0C9irKsY5RO0y3hhGFAB5sFC5XwbfkZI5FCHFJ4ammrpKpE6US1uT2C1U8MxVv8woencBI9GcoORzaYR1R17srBIoJ6mT2rnnWQTbrjAu9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwt83TLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4l4lXUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwt83TLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4l4lXUo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KErn01730055
	for <linux-samsung-soc@vger.kernel.org>; Thu, 9 Apr 2026 21:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fy24ThaE7zxCmOTOVBB95xQI
	Swb2qBaf1w/hIxxQ6/A=; b=iwt83TLdksEzI97LSyWc2oo6OTCnetVF+TBZtYiw
	jVvR93rQ0vMOjI9AGB43I1+Z3MGaVKHQYJUcZtCZqTVo/msgQFETyPAZX7TmH5lP
	Er7k8jHnbsNkbtFBIu0Bgw9oaNxRBDsuYIdIpXeBbsrwTQVqSDNe4wmGkL8Osx90
	32VlGgSVpKG0UmeHh5TgbJx0etVjXLB0VhbY7KIvrSqkcHv7uR9Nuvpuxgvc+/6x
	qIpPaf8zT4TNVfSO7dpdO+FYiF3Pa89SwQWrkYQaWb+0/dujQoFTymbuiXbHzp26
	jgNmLP0WYZRPyl6YuD5rT2Ob8d92OA/BnC1ECwM/vs9AYQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxhp11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Apr 2026 21:02:42 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-689b18091ebso2768246eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Apr 2026 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768562; x=1776373362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fy24ThaE7zxCmOTOVBB95xQISwb2qBaf1w/hIxxQ6/A=;
        b=P4l4lXUoB2m9eanD4alq+W32kCghhTe4ALRi51/szjwAGAvBd1BGzSn/QkIJhnuQxf
         FLlKHJg29Txap55z+I2mFCIdqel1L5eXNNwCGnVfFm81K8W9Hl0rhPVsYva1yNTkyJ2w
         bA5/Hjr+GjXDuCPlWVaRqVJGSRJjdcOMhibAXEv/Jc522Y43ytrsk+5ztuqs9ezMW0Bw
         HC7cbtNLEF6Ftrwmwp9o7jt3mRu2cKp9exn5nvtLjLvnVd6bu5h4xR/d0b2pTeGmq/zJ
         hT95lgz/S5aN7eL1jayjDWnido5NDaDDShp3HrBfrQHDTsbklLQsLk5JEy4M3Y70ZBa/
         eMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768562; x=1776373362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy24ThaE7zxCmOTOVBB95xQISwb2qBaf1w/hIxxQ6/A=;
        b=LkNgktPTyrkyYwQtg4cXlM88vUBYb2u9Z15NLoHlkGbJMPvlj79UDTJSI2jBdj+Ar/
         hePix8je80vZFcfeP6Scet9LtYLNE+pGmZR6RKxHDPEpEfF8ELamMRihENzn6wgwF+Ko
         /IooTN417IhSAipOKOyZxrcm9wuuoEDNzBZAAnHBc7GR6QIdxQcVPkCUF8j4O2XbQxr2
         PDIRAK+TkJaRCNu+hGrS/2V/wFMOSwUjpyfrRZz/p26Bw2OU/hvg9hAn6BDI7jARUQou
         vsG0Ep42FF/e1H+CxKh6iz3VdGmSSqGN+0k8CQXaERUYLtOO917VOVR2TQxypy4g+f8o
         U+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXZss/1byTKCVYIfKkAZvwdY3VlKVhFDm7y5B4sUfzo0mcTMdzu31X+1TBQ/7BxgWiwvpGLy6pbPsvVkfextP0OFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFmLAn3QwxJkD87fUt2rpnM9EArcKQV7xn4nmEDFH8cRcvn3tW
	Uj2rzUwcdyTQEGJ05RSmUVme0gNU2s+f5cbEBbimt+W5+RnMksvLi3OaxrP4FsfdyilyoqT3BcQ
	2I5mI3dudVDfmCEc1zGebxLSl95QV+b3naK0Tjw2Ww7byQ1JTGH5dBJb/P9ZHoDPCNe5eRVbTuQ
	==
X-Gm-Gg: AeBDiev6ZiTtnwDOIhFEmY7S4OkKKq9NVgBNOVs5ApxKfkrChcVl7rC1EZ/Dmu/Bw8U
	QMS2FkOkHz8nBuTmKNQ8I11nr4uTDCl43gmjSVRDHxbGfOnbFryCDoBzqEHvd4KXP3TmB1StJ0Z
	0vpGW0XlGnKNa/E4HjJF1adORxNPGxQ55paRooN8Pg/HqzDgVQQxVpR3cEd/d0Cve2OhsflUl/8
	VDDtqDbrMDTsVlHyFfvMv2uGRDtMtPnc6OIIfljVoojGcmZMVJsOjlY8b7G35n8aLVeezsROu2E
	J2sRzwYggQDUyad5qJA86UfnSRZ87hAgSl4gp0mMht3Pi2Ou9QhRkWNCIt4z1dvcbwFsYFJfFFl
	Vj3QEmhDe+hvywgUilqNhIh0GcqKnXpHLsECLBfRql2PsW8XlKAmIqzScpT2PW/jbinOCb5sb/i
	ciP1ePsAmNaay1Fu8ybVSMc5FzjhIG7zXVC1I=
X-Received: by 2002:a05:6820:678d:b0:68a:3b31:1bfa with SMTP id 006d021491bc7-68a68d5fb3bmr2094644eaf.13.1775768561842;
        Thu, 09 Apr 2026 14:02:41 -0700 (PDT)
X-Received: by 2002:a05:6820:678d:b0:68a:3b31:1bfa with SMTP id 006d021491bc7-68a68d5fb3bmr2094597eaf.13.1775768561356;
        Thu, 09 Apr 2026 14:02:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee93264sm160532e87.29.2026.04.09.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:02:40 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:02:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        victor.liu@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, krzk@kernel.org, jingoohan1@gmail.com,
        p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, kernel@pengutronix.de,
        festevam@gmail.com, alim.akhtar@samsung.com, luca.ceresoli@bootlin.com,
        nicolas.frattaroli@collabora.com, dianders@chromium.org,
        m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v13 10/17] drm/bridge: analogix_dp: Pass struct
 drm_atomic_state* for analogix_dp_bridge_mode_set()
Message-ID: <cvm3mvyh5ggs2fsjmikzn6z4kf7vsgxcxl3qusyxnv6jmtt3sa@fof7vydwsvff>
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-11-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409065301.446670-11-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: rqs77XJh12Un4z6RSsX92KfmxTCyRQEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX3LmyNvHeZoCE
 4dJKOtl4lzdW4/LBOViKBPGPV8sUvn+Hz32symh3rxGCYlaEXuX8cXHR9XBB/8ZUtL6oOT407wD
 NKGx0BEXNWgG1FaZ/ZitWhb2vDjp/L1tteJsC1Ye+8r/kw5h8Dwy5kVmiAGLjfl6V7pCj8rILSK
 qI5peb970ARTXO+HK0cZYPVWJgOaRvVC5Q1BxEQBBIbBPulPiHw1M+bv57QKyQyUjU7Jk16Kbn2
 qy9kiP1UDNg3ivZkvnvMuYYuuPIYSs0oAb34Llod6HNAvNUYbIkZLkiEpU6EjVIuQpEQ88OgwPw
 0cO6iwO9cxHVZe4c7oOjQGXzpn1B41eZtLidcDNgXpHLo5r45FQ11MV1eC57RKNyjYukTkY+LTQ
 BU9Hcuv0HKm3BiFgRP+tx/im/oZv3WF82BfhjmKjX6POjwte1H7n9jMq5eY+/9fWNb5faoguOiD
 Cog54y7BXF5W9MJITQg==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d813f2 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=pclm5J9ib1Ufy00r_ZoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=k4UEASGLJojhI9HsvVT1:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: rqs77XJh12Un4z6RSsX92KfmxTCyRQEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090194

On Thu, Apr 09, 2026 at 02:52:54PM +0800, Damon Ding wrote:
> To avoid using &analogix_dp_device.connector for compatibility
> with the bridge connector framework, get &drm_connector from
> &drm_atomic_state instead.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
