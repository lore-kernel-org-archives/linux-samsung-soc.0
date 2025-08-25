Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BF2A1CF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116974; cv=none; b=OLLQC8TNDHGiKNQ2AyGkd/rIrUxTj9Bz5uHJ2ilAANmg8oLlntVa9sOzgjZYaKcyQz0tV6PgntF3L9UW79Vhy3AVxTK0lk/7YNbLAs6RrvZcaUapEXIX0OBWfQs4YXnX5Y7jo9WLQBuo513n6n7MwTVcQng1iXDt01wLYqhwfGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116974; c=relaxed/simple;
	bh=0BFTmuxgCi7E3D+te5bL1kxeMXSObQ6kl2H2LNQwS3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idlQYYF54qU+Dsk8PDKmzJkeSoODnjGbp2cguUA3Y02rV0pGOAsgyL01DwPDLStEXwYsk82iUF2g3r5P8Mv4WaplZ0S2R6ixhi8eG1DeBil6lezrEfR9SPfa74MmxatXRPZfJeJaeNwRelZTeGbimcVcfUkAuFWaMdZ+X00bLS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmgeo6O3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmgeo6O3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8WScc031759
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 10:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0lhsR71KkcIS8wNBPhBZe9mM
	MkgJb5Dic3dujxApeFY=; b=fmgeo6O3teZyGUgySaDpAkYKkjekQ3uPRhxt1ein
	4xMZdPF/+Sq+kF+5CZmc80a8Coq1GhXJJwnTKNHfmBWUJTSGnMaRhy/5mi5pL/aP
	uctdS1l3lnvF79uxFU3WdfdWmv6VI2mDq/6sCTn3O7Be5KgrepDKLKPKAncIX8ZE
	PVjKUJBo3sgoN/FliIlfE5vndA4QOpFcfQbv/NhFEth3aRGeFR91Qsls8smMKhMk
	gqVUnbCZJAH7o9zDFx6801jkyJHcoKIIaJZp1ARO+loyjic5QP6Y4jhQPhObYtdh
	dBngZXh16lI7o2PIdu/ztAKNMW7w2C5xAnum1ZDy8y3sow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc4m9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 10:16:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e88f379fafso1583466885a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2025 03:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116970; x=1756721770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lhsR71KkcIS8wNBPhBZe9mMMkgJb5Dic3dujxApeFY=;
        b=UXohRPb/SCi3ig7X0GdT0y39SI6aAb3GWoI7KtzdlpCJX+45DDwFz9mUrwQQmZHq/W
         eh9wBQv7bRh79LhMCjypQ4dfn9OlKsSvXBFvK1Do+u8Mav92M8HPR5xdG5aQhUkUpL6C
         0DkneShID1H8a03jG+W2/CGLxbVXIdx5ozWOPssPMRLIxhLuSAGALoHHaCWsKSDOS9ek
         VUN/rTvapc8XrjgVbt5ZylC6Qkb59gftBSqyeUzIqfxr94nmhaxCITiCPCDqdL0Xs/wP
         3F1oi8etCwbsyYE76pWD729GZycrRvSOdvhzLMNDizBwQYlTMpN1u58ZrmCxAy5Q2naS
         MwJg==
X-Forwarded-Encrypted: i=1; AJvYcCVwe/24fKfHeXouegc9uZJyUAi+Mfr9NAhzlemrSgq9THUsKUUlm+Jg2QXPcZLzj6YVvGein98W6FyCBqm+Zxlz2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8068b/f0zRGyZ6hG2/vD8oEhI7vtL00OWMOOctulOUih62vqm
	KTArIAYzT/naR1gzARsVFk2XJn6OLwn0WaxFnARcYYhBqY7eV26KK+bfs0GcGr37lCXu72p7OQD
	M5R0cMgqGkc4+Y2ZbQKv59JWcUpETQcPxOMWmFqTXSdg89WUtxOZF/j13TrGU6s9WZHSmpatMhg
	==
X-Gm-Gg: ASbGnct20uZegRKTkP+Fc6Fe3Mub/+7pFya9xBpVrsSrHPD/X0UhgUMd5lFeuCliybR
	eVQfqtXa0QXDCzzzPrd31Aupd8PeAMWMyT2nr7GtIQC/r9espNF4vyG0XgonKqO8vLjpCyb+jOR
	YikzRkCavMQbmi2ZP8nqNtRxyGFgWIlbthpf386xwvpztmVEENDpbX5QaV/JMrN2huOzEJIROcf
	UawNtE1NeaiNz+Um0poKGSZYm9OE8nP3eLwk5fvV/fKS5VIkZTCE+3ml5909Msq+HMFek+onMFi
	udA89iGgZj1qo/Of3xPobn4Z65eDuqI3GiwH5PNEEUO0UeXDfaipRMLLGB4UdrYTMSKx8ZiaDwL
	gslbPypNUBaoLFRvgssoyK3sD8nruEvknDJCf2fakUVzqZBIvt2r4
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id d75a77b69052e-4b2aab8aca4mr145651261cf.73.1756116970299;
        Mon, 25 Aug 2025 03:16:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBP8bbrhPwwi4dRXsomCDJ3dx5TCVrS2s2eHTccnc6AR1D3zpu4g5/lFfJzDG9qk1UiQwqEA==
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id d75a77b69052e-4b2aab8aca4mr145650931cf.73.1756116969712;
        Mon, 25 Aug 2025 03:16:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20d2aasm15513781fa.6.2025.08.25.03.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:16:08 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:16:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: Re: [PATCH v3 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Message-ID: <eckjfjhs35nagljcjmzjmu7q2eaewvmdzavt3u62gma5xphbzi@7jfgheo5fmqz>
References: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
 <20250824-exynos4-sii9234-driver-v3-2-80849e716a37@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824-exynos4-sii9234-driver-v3-2-80849e716a37@grimler.se>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX68J1xRKp/DQj
 d83+f1AEoZo/AvpFlww2EQSLjQPsuqmsVYFiT//LiOy5QgUtwfN//xkCkfr8/6Uf+AN2fCGNl6q
 lryKIfweahfjrgHUvmv2cu4hWvs6OThtEaU75YqrwUDBYqtFzG05zWQD8nM0R1CUCVq9C3+AIK8
 XN4jZmsdi1SRAbBSiKk8GA4BqNlE56C8rqQUcaouQGjJU2hUXIpojLfpYOMC1JTbivKQNzXa8AD
 fnhdKKRa4ZmSBZZj/yrT/E9yZwj6DeaqftivCb4szUnK72GZcpelVHwMp4Yt/DEUUeYKIU9qDga
 Y71EDvsRllmhFwKxaVYw/J8kZAML4/bDStzzjCOTipArMPZwQhsVd4IyCqdg2BLlfdhA1wGJGjW
 k9deOlKQ
X-Proofpoint-ORIG-GUID: _a44vSOHqryQnGAfz6Q5cYJEbpTg-zzR
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac37eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ix-_PWS5aj9sFk0hK8kA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _a44vSOHqryQnGAfz6Q5cYJEbpTg-zzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

On Sun, Aug 24, 2025 at 01:16:55PM +0200, Henrik Grimler wrote:
> In case of error during resource acquisition the driver should print
> an error message only if it is not deferred probe. Use dev_err_probe
> helper to handle this, which will also record defer probe reason for
> debugging.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v3: add missing return in error path, spotted by Dmitry
> v2: no changes
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
