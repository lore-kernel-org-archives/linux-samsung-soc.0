Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DDB1F0E29
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753531526; cv=none; b=Dhxi+vUnFqRfU0nIHtb06OhRb7sZq2b73u4pfnoD4UeY5Z7O1xrBmEATw4PO3r0Zw+ASCOS45XNoMCy2t4E+uOM6mSajyDi9ZAGAbbuhFFZJYfGu0EbDFIjDo3nmpiBcaV1U27boQBNZ/y8cby9r8H3V4lDNbliAutVz6QQ9KL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753531526; c=relaxed/simple;
	bh=40gDhaF+mgeZ2DYJQ6bquL2ktTYwVRNBMOYLWfhAv4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwmQQTRhrX5DJSnNmqFDuY5m0NcTqG2GD/vnXWnGeP08dglmbFeC0a6+HkLrj+O2eE7Nqla1JMRVXSRhJmgISFD++XdAdBAobdu22bWCLHukRNGrX4nxyE818by2WbtfBU6a112LbrveIMwxd7aE/zffSvipoWnsjDYJLFl1hF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHP6I2YA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHP6I2YA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QBk2dT020782
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DTIGg+kC61P58j186QXClRnL
	U812M4zddHYS5CcqKJU=; b=BHP6I2YAIqdJi7tJv2nQQJe7Is0zZkqGNEQjjuOH
	1wYHb08R2f91VnkqBvY9h0/mlhFa5BbA361u9hL4nV+TUfqSIU32qKfbxRZKaa8v
	55TP8DPqemAB8XZVDM1cBoWQOxk7LoSWKCjDXAsI58KUbKJ3RO1tsxNFt8uhFr/A
	f6/hLa+1ij3bXOx/31nxb69vRQ/AUPMDBtwKqmVkEeAp+NgTs/JuImttIqr1shJz
	oLgNwoDaFYQe1o/a66mX6KaTcPu7ibLA+qr/AOz5Q33gtRsY+zZwaDnQWn/LJQIQ
	0dKthinJR0wxwQDvb98XnzwfwBa8qn8sM8MzyaUFDilOEg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qgg1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 12:05:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7073b4fb53eso39406d6.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 05:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753531523; x=1754136323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTIGg+kC61P58j186QXClRnLU812M4zddHYS5CcqKJU=;
        b=tIJj90ppY2gDErHq8zso4aag77jfa89m5S4KJA1r+gcQGlOlgn4Fa0rfzc4/Erklyt
         wWj96uL8uCTc3dp/h2IUtASTQRatnpfIHGvHjbCPtzad+nx6wuG8j6W45xSHRe6+Y1Jw
         B2gqACajnJLQD/xEb6nqTXZafGPh2muntGmxXjNVpspkEOKG1uUZZ902kQ+lk5RRtJPs
         VBhp5oClQGPda+x5/d9QnrM4fHh6Y3bXrSYitxdSfHdRdggYFPeLg8lxfilti6agSmaS
         bGjsOZMltI/llg0xskcvLrLftolPFHUHnbkyjfK+98sR8/FZuHKeIP7zLYt5fWyHRTfR
         /9WA==
X-Forwarded-Encrypted: i=1; AJvYcCWZUb7RZ3F/1YNz7H64oRjcqfzyYEbTee9UJLdCbRzV3g3+btn2DGvd2wLxpYX4T5lQesf087OvELOWAKdVP1uyIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWDBGaTx8CW77R4z7fD/AtiPaJ6BUNiXLleqfxN9gG9rRoUTE
	HqF5FOSaYpTj2zPNOebgHSv1td8PdzuUlbYvUSXiLzUy9IRwewG7ryV2ZSEILoQst0g4G3QGQYw
	Jzu5I3XLq65FciE+YfIQTP9sTMXDdRz4MDw/4v6pUqif7irj2INbkJI/FZTXDuxhxum6XDQgjWA
	==
X-Gm-Gg: ASbGncsTrJOG1ywEwyoozipOJUMfzYzUUa3FxwvMxBITE2lfaNd4GRZiXlbFwiHOyjj
	aieEoXKye241yguqplOzrpiQ9dRoghbAtQf5e0mgsijNmmb4acTi6Vg2/MpphBEOtqPGniItPUB
	yHyXGBbUleT2vn9sqpC/kdhiX48hBPMflscCK0fvPz1akpFdsPB0/L2rnm4UV2rUVT9v48UIG03
	O9dK/oOzL3jPhXhWJtH4lS1v7Wdx2MO9IhqIIyjtuQsGDEw8O6bWsLWtixm0qgTQToch6ZUkt81
	/FUQ+tZMX878l8kbzVeb5pyEd0U6aOBflOff3eb5oekf/wRJ4LD77VuPtxrEmDOKTYwV04b5yPg
	AyVDRq5AXRDt38WnO4tNKexFd7muPS5uJGEqU0mSSG65ePMSwQ27b
X-Received: by 2002:a05:6214:29ee:b0:707:14d5:ee74 with SMTP id 6a1803df08f44-707204b2a68mr71727976d6.3.1753531522588;
        Sat, 26 Jul 2025 05:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqLS1jVGgdye44ecBKfrqDjWtpGZOfSZrTK9StpLefqH75rrfs9TCl1Ca6g9vIQ221L1XPHA==
X-Received: by 2002:a05:6214:29ee:b0:707:14d5:ee74 with SMTP id 6a1803df08f44-707204b2a68mr71727076d6.3.1753531521882;
        Sat, 26 Jul 2025 05:05:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6337f3d5sm406862e87.165.2025.07.26.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 05:05:19 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:05:16 +0300
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
Subject: Re: [PATCH v3 11/14] drm/exynos: exynos_dp: Apply
 analogix_dp_find_panel_or_bridge()
Message-ID: <lhzh32ji4gy44kh6ymobbyp6xdwkx5hwfwdhdx3fy25vaeigin@6ofhouk6nd4h>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-12-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-12-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwMiBTYWx0ZWRfXxkIcbjghPm5c
 c+xQ6cPmfXWmfeBY1WW84A10FeF6VUDOn5spTsB1sBbsyapE8sbQCX9/o2ARddAU3Gy+s/PCVhS
 cO+OpLbBtqtNNiPrMFPId7tq4cOvN/3SjEAJMCYOhIPWEztWXWo96WwfXCWmMO2HVeuYnWIfDoH
 +KntNu8go8bZNR+TH0m43WKnyRMEWCUSM8lUr1d0dT1p8MTk+U0IhpvFhjdJ3kMWcvv2lWHql/H
 zOxOcKtKRb1ya1rz3XOcMVD8KmVFL0lWjIOOtr2ZqCRnSN7uTx/14aPcaFOVaY/rz7jwO3XuIlG
 4agSwKOUXgKp7ha5NgoMmPlhkLPzaDOiT7DK5LNhfghYil2J5g7FCzATMvTZgNDKCpfyHkcc3cs
 M/zPOP3VlacpkRY3sv0tKqfRc0inepbY4v3dTR1TBKH3W1L0R1QeVNw+/BnIRJUG0OJmQWMr
X-Proofpoint-ORIG-GUID: Y23K1odn8JLVPCNpPTKpB1svj0HdB7qe
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6884c484 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=xX9fryL7oNgbU_NKkWoA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: Y23K1odn8JLVPCNpPTKpB1svj0HdB7qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=663 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260102

On Thu, Jul 24, 2025 at 04:03:01PM +0800, Damon Ding wrote:
> Apply analogix_dp_find_panel_or_bridge() in order to move the
> panel/bridge parsing from Exynos side to the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
