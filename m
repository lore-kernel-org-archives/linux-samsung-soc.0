Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA542556E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753488887; cv=none; b=URwIgLoM850nUHv2yY2oZ7s8wW0mmEpfzsSLR/aqyyb+j+kiEALhg4kjWPEUPOOnLw9eBaQGM6RBWwzZ7VF7onG9smaeLO/mjUXuxjUjMw4mOEuWflkrx38h92kTDFBw0Y6h4w/nqjB5JsKGTkSNjlFP99S0qRzDbjNG/49fAXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753488887; c=relaxed/simple;
	bh=fY7r3FRb8cEp+aAm9WecvJIrzZwcJAQUvD8crxOL13U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvuUBkQwzZ+v8wrjwpytSB+ZDmoso3ukpeigKwPHsVpUlF2EMqXzpHxPMdZWiGnl6XEqeedNFbzu4LK5dqTPozKP4rOEQD6ySCRvUAcJEqEXn0xvZI326QalXA7/SOx1F8auoXSQsKcuQ22s5tzvKk3ybLgfnROTC7Pf18DUf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQIrZPLe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQIrZPLe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJJ0Q6024845
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CTGcg8JogZ8+3e2c1J28j27/
	pKoaqY9rvoZ/CTXAvIA=; b=WQIrZPLebG37A2p/sAaV1c+nhCPLOEZ7dKd/z8Wc
	1EWqTW2Dz1/JkNdJ/nCiPKnFh+PmSQpBnc1k8kRzygJXo7V8ICN5XTBWNsfXWlNM
	+FVL5Exg4RjvNzbJGVJjC8pWr4B0KXC0bIJs8Xms3O1OBi3j/oh3PiKlnCaMwbaH
	YTWlWvjdgaUtEWO8HHhmyMwsKcVPr+Ey8b4iyE7Z9/uffJa+F9TdUyhLRAfFgqHC
	nZxLN8TKMrteknF+bwg2wtMg7kpADmN+c6doR8bKUja2yay1ysDov89fq2vJeE5X
	mKhZ/Lz4qMRy99m+IS26LwS4s37nq+L04LIc3aOco0Gw7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2rbxw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Jul 2025 00:14:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e350915d2aso877857685a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Jul 2025 17:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488882; x=1754093682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTGcg8JogZ8+3e2c1J28j27/pKoaqY9rvoZ/CTXAvIA=;
        b=roI/KXtaxuJyw8+Sg7F/nyBVlkGtIKkpg0hpDma0pUR+VmmfhZ0mBtUeZvyvfAjzaH
         l86lYDxdC/EQ6EIOqA5QPoVzEvj3YeIAlkIj26EdTGI/4uOEZt+7NhDjpzCCsVbBKWPj
         ZkwFKwS1Jy6jVNnxrnIfh8/VVfwtbmeK8NgwjYFgmTW2dqm3IRKwN8S/tHBEesYu6bjw
         GZ1f49o/hanJKOMXEalYjgn83Fe6yLo18/dQFT4VWrBkkpngzGnng9vDeWxtopTIFR5H
         WSS+prpHIa3wkp4YtcCgyNHI/EDT2hoa2eOayoj9Tw7dlvLsx1uWPbnElZ8LWfo4+955
         sX5A==
X-Forwarded-Encrypted: i=1; AJvYcCUFnGP7M0a4TyW26Yg0unKvTidG9btpBV1OxOJOghy3j14NzEETgCAf5vF6BstqzxsF+pT3PsWl+cCpj8aQCJ/vww==@vger.kernel.org
X-Gm-Message-State: AOJu0YybqE9Syw4Tx8GRSEboSf9DGOjwuYC3kH8WJceskKxzJ3HHXkjF
	PFMSBITvvVIkRqvxcuVytD1JFzDZBsO7UD/9/FuXZG7ZiBPIqoBD3+G4bocIpxT2QBV6qFYDFgL
	N9GbpFIYiDy8zhlVZ/UKQ5CwZtJJ372sjaMBBH3cvFzJdE34uk7w90K9m+i+iQgx4Wsv/QleL19
	eXXBvLVQ==
X-Gm-Gg: ASbGnctezWAgrhn79dlRzEgRgfBUIOyFHzMBM4ELQ3PRZaVnoKmna4i4p70xKKC3OCf
	Xp95MBhFO5r4yRNs1kpLGy/2kbMljb8YBepEh0Bp8fYAhQjScrhGJ0irVY/2wlwbm1imz4oQmOY
	PoMZezwy2hHrrPkI9u4uYA2oY0xk2JM3d6Iq1u/wYPwd2p/cohuglQH/vzqMOp5icERmtkqf2lh
	VzkgHuiUnSaTaNWlfPswcAyLnPx8PzOYVgyZD7wPR5ShI4B8+rdj3lZz8LcdJeZmZg0BWr8LO+N
	1Xe6ILtan5KoVfQZPpe/5XJiRtg4LqDPdWZVR9bFMXgpFC91H/MTmTZBuS6A3Qc0ru50CRl0CSL
	jz8bxX23mCwj4XUDnV0I0kGaEgf1wMoEW8RT8xEQ2FxXC2mjDe+ek
X-Received: by 2002:a05:6214:1c41:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-707205a701fmr50122986d6.30.1753488882365;
        Fri, 25 Jul 2025 17:14:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdQpwGUCkqR1lOUKTKaqZouyRm9icTapQyzE9JidQYLs6U2H/kr9H1AePaGwZvW49Mwo6Dww==
X-Received: by 2002:a05:6214:1c41:b0:6fa:bd17:313 with SMTP id 6a1803df08f44-707205a701fmr50122636d6.30.1753488881831;
        Fri, 25 Jul 2025 17:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6337568csm188598e87.129.2025.07.25.17.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:14:39 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:14:36 +0300
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
Subject: Re: [PATCH v3 06/14] drm/bridge: exynos_dp: Remove unused
 &exynos_dp_device.connector
Message-ID: <ovlz5hotvqyn4gnrmidfq3aafq6tkjjpnpgt43yterf2cd73ys@dkarreyoctbh>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-7-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-7-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=68841df4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=xX9fryL7oNgbU_NKkWoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 35g6_zvh87NisJR13R4gEPL1Lliwe-6P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfXy2VOhR1c7nSk
 ZcQ7V0FF6yDbgMWhMHQi4Wixb8x2uMDI+9T64luni65lcI9bEIDhM4MYMt4juP/c8BYCfWQHRlH
 l0NWChoAWQ89abfnbe0H1PEllQAxTUa7ChR7In4fpDV8i0vEhCjXvnZ41b4glsU3Btgd5FNRt6c
 lvoC1KNMWE3SMCJu+oYv4R0nt8N9FPlybW3qB4oYDd6L0L9aGMX7v+g+u6I+mHp5JZvZxHk2/YW
 kDFkeU88zOce9VCDUTShNUmW+EQrO8RM34boEt8XQBE4ONrTpW1QeK/nti7kbOBtmT55mCxwYA5
 cyepqYmfeqzhH44N4GFqx+Cg7iDPirxOTE2j7HHiUgFJDJollDTI+qJXkRgzuiKqpZPh+uqMHKE
 wCMxqt6aBxEc3zP4hq6+TWtMFNQWQ0Ay1pa72RamVVp3VQ7scrcBt7h/Yh4BhNgB/4Ia7cuI
X-Proofpoint-GUID: 35g6_zvh87NisJR13R4gEPL1Lliwe-6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=697 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208

On Thu, Jul 24, 2025 at 04:02:56PM +0800, Damon Ding wrote:
> The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
> but never used. It should make sense to remove it.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
