Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811E2D660B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675220; cv=none; b=NWxrQMPNflZO6dOChwB+xv4MsIZnPA8HShNeYxI9VeGGFkGl84nIAiv4+31oVVRqitpK/WrSUwBQYxNDnlvfpBJ01c8OeyE32XwgAyxMAgNa/v55R76CPjM8npzo9EG9SDL8j9t/Y++0b3DKmPcAh8sPJ599Sv+duAlq1N3MGUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675220; c=relaxed/simple;
	bh=CuFw3tp4Y2KS4XsNlMWcxOczBnPSe11GRIKj7TlEyko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDvWFquz749GH+JETIYJf/LYovL1a6zGmKnU0eDmM+QGACAGBQmbSuoM3+m7E/e8Js45N9LjE/OX6FrWu/Bcfa3PIEVpI+emreXSmYJJj6O5e6F8IrMmdfZNhid0pFJZwvaxdjOijXxWS++02VLj7rCYxzNq4F14eub4znGLNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HogY8K/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HogY8K/E"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fOa3012845
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ObqOUZTyrARl8ec8JgmHRIoB
	QhBr/qr+CrAYCMGQmus=; b=HogY8K/EpkV/pbnGmdiacBZ3fg5WnhBQc14tPHE8
	dGFAFY15Ke35AX8wHNIxpMICYLjk524LwDwH7+ESLvSWfHG0jX+z3POOceLoiFtd
	mtnH/kgcCGF7eD7kjQg5pV141NQ/4vaq5p1iQrVBevtotYv1dq86UHBuBdNSQITU
	+G+1vsOOMsDnwgnCFcy8uVTCL2GuIWHBcliJ2eDN96TsP1+TpiZOuRLLcJhEdxeg
	brvRfxMyhf6EKz5PpJsb8EZ8HVP7Sb4Pzxw8kqZtRJ8s8XJk4yO0IFKWn1zseqy9
	n9dvE2lcfcF9bRA1T8jAva9OKWZkM4p6WBf7GfvB3GEAUA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgb4jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 11:06:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-81b8d38504fso620355085a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2025 04:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675217; x=1758280017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObqOUZTyrARl8ec8JgmHRIoBQhBr/qr+CrAYCMGQmus=;
        b=JyMJns2NqPBCHDw+a4D6wsygO8TUbU1PlVdzNvXOfgZBgSAangLNVDO2EKn503RBrX
         GtH5nYLNeK+8FnuePn60Qu8d6Ha1CA3E/wrfDryuCqQbc2Bha3SfQwy/mM2YKSNI6mEN
         8aj7H750l7fMaZAgSGkk+d+KVAnPvErxhgGyaPwQUYIsGR/3VdmF1uxKJmfugPMS8TLJ
         3T8a2ywPxah85/AkYqwOFhM6Q3qyIzOYWseJYioNnEsfV+msdCvsFUrSP+BoMIwN2lFI
         BbG7aC0+SnfoZIfNXyZaHgvTTPEoD4cWPDyO2HRisFij5fi+9gB5w0zHYz0i0jcHWXGX
         ym2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXM7e7M8IIRc0mnEpCV8lKxGe6qP1oQYrFQJopQtyZ9PW3F69aCl/DL33qu6sRwsJHbQelwtNDl0OwLY6SoLPzjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZKR4kfbPe0Rg8mTL4cunT+KNYGV/X7r6SG5OqySZKHauGhml
	6PvDV+tAvlU+4GF84LzqNwOZ7zIjRiNay+YdKSM5YG0ye7GKd7f/TFfIrzU2LvyGcGJ6i2ZR6Oo
	cPFTnJwuMJRqdC7esCa7SLqtdutzMwQl349wo/BABgtMLfSuLZZ8XYhAf0/vTNwwMNnd05XRezg
	==
X-Gm-Gg: ASbGncvInIk/QgwlovPxi3cg7SD/dG4b66Zs8b2GyXrX5hl33v3d+Pcbe/fFihA8DlV
	o9nmmEuP9ArblAdqnoVwSQnttLouJdFwmYvwKY6rVgn+GOGPQtQaZjPJdagiPmptBVj0nobh++4
	UkTcfewuLwVM48vGPyfX/wx6DyRfiyTV4IvMrsRi6KxMcqlY9TwvixKKeqJkrST+lezaOMeA77Y
	79D4KOIZL399ytVJPBMkjRp8y1yA7MMPj/xse2qLPXKD8Fth45JXAokcorBQAd2XuKmYnMejVLi
	CgwWyvuj/yXpg/sFyvi3LgJmFoaz0/LxGKft9pajeIcPHv1UV4NoFinmYXCF+0QmaaJmQM8PsP4
	6+DHowiXGvnvW4oSNc5foyEWVuESU2WUVez4pQ5Vy8fTICIIlO8Qu
X-Received: by 2002:ad4:576e:0:b0:70d:81ce:ec1f with SMTP id 6a1803df08f44-767bd2881a8mr34381616d6.12.1757675216784;
        Fri, 12 Sep 2025 04:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzL4AO8dNGPWgFHm6qvxn4ogauEObB1TwGr9YSH5AEOx8Q+cb9zElyfiMXPvqBFGwT80wJCA==
X-Received: by 2002:ad4:576e:0:b0:70d:81ce:ec1f with SMTP id 6a1803df08f44-767bd2881a8mr34381126d6.12.1757675216206;
        Fri, 12 Sep 2025 04:06:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f15a5834esm7432661fa.10.2025.09.12.04.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:06:54 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:06:52 +0300
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
Subject: Re: [PATCH v5 16/17] drm/bridge: analogix_dp: Remove bridge disabing
 and panel unpreparing in analogix_dp_unbind()
Message-ID: <zt2kyoq4rnn5gbb22vvpphqwmbbv4vecjvc2iepa6t5iljhpgu@xckynlkyyjiz>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-17-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-17-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: 0-bMJG1fINNCve6mmu8AaQWNUjbOysBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX+DEU1d+W1pv1
 F54cdGsQ+9aS4/VlqiOCJhoGZIEskcjhX82b4SSaLvUFuYzihg3kmIVxwEfJSrZzkEwhf3WUU7p
 4x+j+FNOilK0UyteNougwmBP7HKTHEHOS5KvmtGHqDRsfez7/3uLy56EGAIICD6Y2bOtfiLhHhI
 29JqqJcypchRi9x/v/vyt0FnAtSSW9KOU3JeUnuNLCraK6A3QynCo8HgkstcTAoKix90RM00lXj
 WKl/NgM/PyuFYNj9Z7xDs6EbCkjMN78FRDcfbGHoILkB04fU24BjQxNFXimuKAI/FsSZ0vS/pho
 C7pVv70qKXV7+YpTaZnqNblK/o0NwKoA/OP/ThfKSZzQMNv0P0yMepT2qQLnmDA72bPan3OJXWA
 7VYQOG6d
X-Proofpoint-GUID: 0-bMJG1fINNCve6mmu8AaQWNUjbOysBP
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c3fed2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=0i7CoW_5q_0ZA8A6Ya0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Fri, Sep 12, 2025 at 04:58:45PM +0800, Damon Ding wrote:
> The analogix_dp_unbind() should be balanced with analogix_dp_bind().
> There are no bridge enabling and panel preparing in analogix_dp_bind(),
> so it should be reasonable to remove the bridge disabing and panel
> unpreparing in analogix_dp_unbind().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
