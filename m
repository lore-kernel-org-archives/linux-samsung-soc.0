Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF92E36E3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675051; cv=none; b=jEbHHxGOxMzF/ngNlUj6dQ5F6F1oKLbXv5WhXuDhZhwv7PS1uLTG4ferFS+nNH9jHEzRpoIQO32suaUEjwV6+OCeGd6g/W/F0+iO5MbY26ETzMTlMF0bsKB3MWApcBifyeK+OfuiAB4udRSvaFvox8slXNzV6fbOJBIkW+q8Wqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675051; c=relaxed/simple;
	bh=gn4IolZQ5hLKpwPjMDyK3Q0CgUaBvu71w454l60Hmyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvsFMXTSN0zbEdpriNF8rVVKB56ah3SYGIOp+3lBa3DFTurJ84YjKmSvi6WDlitXcJQDl0K3xwUb2QXWZXU1gDcmsHWLhjByJcoLco3RtJQFRnbDNM+mUhr87dB+zUXpXQCJxdeqYVPxbdB8idNJnhA6Al4jMFZIJ4WYo/i6UOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuqdSLRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CuqdSLRN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fNcW010905
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uRiYWVeZhrzAaBhip5FSqu8N
	Vj+JbFtrHaupfkSzC2o=; b=CuqdSLRNCdEV/s+X64vOANtGFRmvkltCIFvt4Ewy
	xOYei2Qeg/sF/VMSdAIlrYtP0/Ce5tdo3BTI8sjsWbQtVqOH7W5E7tPcmPu9iu8/
	eITClcBMzIpIMk2mIyA5aMxHzUroJLDOa4HqHAjHJZnLe1H+ZHZPZz6fh1Mre9dz
	rntPktZakUi3N9DjqD6Cmo/LpbDd3fq5URTE4RmTc8deNRHN1yp+Q9Fm4Bl+2kv1
	P3e3WY3zVsNLoVfrAzvtQ/RwG+M3sqJCf7iFn8Y/AkbrGmSFGK+Mo7YdzGM+Qu23
	Y4ghqbneuIMryL05pvUv4oEoRShSO1sKFxJzjgbgpMvmRw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mb6w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:04:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7273bea8979so31407106d6.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 04:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675048; x=1758279848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRiYWVeZhrzAaBhip5FSqu8NVj+JbFtrHaupfkSzC2o=;
        b=WJ7rFIHCl29RRMsm5iyRVwJd0Et43acEZcBlnaOC6Y91iaxyceU/3/tDnmmR5l9urK
         /Y54pHa7eOP3QbdSNxpj9lK9X5Pi29Jr2jHjIdm0hEEV3XXCt8qbcvTUnrKQlYxr1COG
         Ja6br89PFx3x5zAxP6mdClq3HYjoy/Ngt7wedGhAJTkCvClqsPqHAtPDY7fQ95Kj4eU1
         +h05T6dzeiK3/d2Mv/kOvp6HEpNLgmX0qQTBmB1xLVtjb8bTYi+hyo6nJ+nsHOQd4FZ7
         e4c+iy6V1fhUnbZia6SJo7oiOsfrexY8d+kWolC2yu3LXT1EqQWZw+P49PVD30i7rKPe
         YFmw==
X-Forwarded-Encrypted: i=1; AJvYcCXQqx9CAuZo8WJY7wTPgWWPPA4ingssKq0CYkbGNN9LLG3gliTsFpCBWL9+Ofze5HfHLnfehkYsxse8R86uELVZQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2pnuL28WbrQCjMu4ujst3aWpKiT4Hld52lKHzoW5z7YchghMR
	v7kRfnUVQcTt8G94uRMcGAXjvpxxaRtC6K4f1LlgiBtyaLaFRLqbKZDn85Ns5aSrM40AP9DHb4+
	J19ix+75NBxjrAvB5od8Db0U004Rf9sqoTMYX0wyU6uDUqqZ6EEPL5scFAOAYZx03z/OknKRhKg
	==
X-Gm-Gg: ASbGncts5BZyYsCHPWctZTNwhWs4//G84iKO9gs0jkjV7UW5gwqgeY/TdQ4nSlaTBoF
	z2ef+uKQ0zDq4O1s8zoZTQM/ikIpMqUVjBIW5GhJ1vT3PeKlKJkGhnkIL3NTD7IoYQQro8NbohA
	KlERgo8PqlEP+s+ZX9W+6eUUVCaCyKvlnnaWHdQaUXMjykqF4Y1zWfyP8H/8tm1rUT7CI+8zaKr
	uCv/u0WUNdU4Ls/J1DPnCJd+Vb7oBkWy4yG2LxybD6YaTZWyFEsQ1EJXBTWKy2TW8svlooA8naO
	KcN2IqxRQ9FJZszL3huRHN5lpwMVQy7SJs7KN5f1ts81eISHMovjihmi2NH1CzUDUmY7oFVUiGd
	JaGBFEjR7Wa/EQb6D5cRZLottJHL4Q98aLjOuyQq4UhShqachG/1B
X-Received: by 2002:a05:6214:20a1:b0:70d:d8e8:c5ad with SMTP id 6a1803df08f44-767c50643c3mr31652796d6.50.1757675047501;
        Fri, 12 Sep 2025 04:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGWK5ie/2oncU/4OssIMnMH7lHSxzphQkEo1qeToGVNk2BXrTzFDbaZYLruQvm7dYwaukXQA==
X-Received: by 2002:a05:6214:20a1:b0:70d:d8e8:c5ad with SMTP id 6a1803df08f44-767c50643c3mr31652086d6.50.1757675046952;
        Fri, 12 Sep 2025 04:04:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b622fsm1079317e87.2.2025.09.12.04.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:04:06 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:04:04 +0300
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
Subject: Re: [PATCH v5 11/17] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
Message-ID: <xaasoza4346jao6ihbdb4payecfi73qekaynkfa2vqqdp2slb4@2onoar4qvw6c>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-12-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-12-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX6bHdFDijtnm6
 vNiNUXMegeQiIDcpR6aKYiOb2IsjEDBw/C/0l2UQ0vhMWRDHJe1TbToZcYm98jZeReamkzj4jCq
 KZ//8MwvsCIcy7HC7U2XB6VsB74PdhkQ/MCs8GdYDI5wU7KXlYTCq4P/Ao9dShQZZ05/wwLDuUC
 vyI33Ig6rHD5uSRnwEJyHKPX4fs6BI0nHY+06MHqnQFs+m+tYB5SQzFTUhFn6iIUVZP0LsGRwPK
 QM2eHM/e3wr/JRifnfVP72O8NY0NmU9y2sFlW2BeJ4gLbKlqv9VuNi7uY69+B/FgvOd7ZHP5I3C
 RAAD6Ie2jCQmaFUOR0i8eVpRZ9cGQUFHKNUZE73VpcKhoHEGKfFCqZBW/jUjTFU6ylnA34whDys
 xp+PFmaz
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3fe29 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=RmiVBL_TxkOMKIEFt2wA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 0wZIjlVlidR0Mg7g32SLZURYy2qGXLCs
X-Proofpoint-ORIG-GUID: 0wZIjlVlidR0Mg7g32SLZURYy2qGXLCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Fri, Sep 12, 2025 at 04:58:40PM +0800, Damon Ding wrote:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side. Therefore, we add
> a new API analogix_dp_finish_probe(), which combines the panel/bridge
> parsing with component addition, to do it.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
