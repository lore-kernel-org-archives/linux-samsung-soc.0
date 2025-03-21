Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732E1CEEBE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570018; cv=none; b=Kds76nvUbFdvcyRtg79wihJjJWRP94iq0CJI0vUFUuihWebNTKB5YsQJiwpDupduff2WoFfWOT0o1so14f683wBcHBXqC2DFVujr34Q7r32iHMZZL71jITByyVhbWfmnpDBNGxF+6C3vPYLW80hneUyHX/OAgyfpDDIlSjf3x6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570018; c=relaxed/simple;
	bh=eUb6pFAQJsgClBFqUN//SWMcT52YNoD/1rKlYn3NhwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwDPCG+Dx9akvD1FZ4+1hv+xNdyPPo3aZ62KOHakwmUK3kaglEJY0Dcd3tqY07oNUYba63B39Dzbj4IIA+HOQSBrLcTxy1zXXNbc7dKNjIQTjxBJqJ9G0yzuCEj0ZduIHiSC5xYzCLHMnHBDL8sUicn8T847qYanErOkHAD5BxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/6WsxSI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/6WsxSI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATCxg012672
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xMZqwFdk5KSv8eArmzuOQClA
	gGlpgEE5tdbkxdpxDLQ=; b=h/6WsxSIpkBW/1vpvBD4bsmbgrPtvlQotX2E+c3P
	l6lUuTmlKhEoKuu1aFsMZLe+kZd72mFSYJyZQxtw5NnuS6SawRGqz+0sL31k5xqE
	YCTHuQKTtQrBVWupRyfq7nOGIUd5YKJbkHBByxPZWBHO31EF+wUbc0fUDGP9Ync8
	4b60IeJb8RzC4RQj6hqN2dITSuYivsSbTKi6Ev7lVfom1Rjc9UxtSP8SshRsyjuV
	9bUcTkeDeFhtQpAZAh/wJwIrUFMXWpBPmIHlB5W8GEZc2wJELyVkT/P7D9uPfoIm
	SnmSU5CEHREX/2k6N1Q7QH9QsXPs7L8AhgXeTIg1RBw6xg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t46a09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:13:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e90788e2a7so33040166d6.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 08:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570013; x=1743174813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMZqwFdk5KSv8eArmzuOQClAgGlpgEE5tdbkxdpxDLQ=;
        b=PJB/CMAl1uQbtqRuyOgQA+V4e/G7JHKZq615eteuQdfIXV6bAoh5BrbfK4gDzr2uGS
         MnNA5DqyTzQQ8hwtzn1IKaUfY18THv4Yg6oMZaPaZSURdqp6dZiQVJ+o4gaWOKhuX8PQ
         kJrGpCybiURbGdAOXLrH6nScwNaFRMYVbonQAUuGunlRhEQIuYjpEDVcRX9ZtJgaZtgk
         FS4l5jmoiMs/ETHEivPu+qb95+o7bvpjdI6Bs/90aYtrTJo1hjegbsoQVL40DpSUM/lB
         xceC79iNCFKnY7rqkCgTI5BwgaG7h+EtH6sGc5ZeaYPxNv3qUOS/X9RhiIUrSxRDBrWP
         SySg==
X-Forwarded-Encrypted: i=1; AJvYcCUqFBhX4HWHpxm2g/ApXFbrRPxuvb+1v5eNvO3z0hmihlrusYnOQFM695Or6f8FLeyUneUPAzigDpqrDXDuXrQTwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PllJEOkb5a4hyj2poUSFOYLk92QXcuIKgrIqeBVe+/nDI+3x
	wC3MKnXieyZ75E2VjNdWWy0iRaxsL+zGFFJkuqSl5LoZWTyT77Nx12hTSfXV59N9SutHuQDaKLW
	E1ILqbxbAX1/MVsZ4pI3mRG2JFg+787DWjh8mAZYHdabTVtDR5xYGW06HnZeU4oslUD/xmQ==
X-Gm-Gg: ASbGncszDIWmKt1uMwl3akrgEhDpki7HUIyP4DGmdnV/WCPbTTJTwzBn/WSejdMx0Dt
	EpQEnXfWuc1IGvxhUiZ1FNsUKdGBF+1hhbR12DWHoxrbRMeYx2JsafYnbnPettTXyWjklPiVioh
	yT7+gD1n7240H+lOC5VDbdrsFasdt5tDZUFzom7B3TVF0Dx1ioPX08poUktqgELp/T30cwElkDh
	kT81d55C5OPEYyxFb4HrWcJnZroabEFf2RWUMLuCBuTHtm1dPDsHNrX4nOCsI8MylV9MXZaFrvy
	hDy0mnkijJ83fZZc4Q9KPGtbGNEynZ5JOm0i5kzIHyUguBqdodfktkkTCsobwjF8qOpUYR6IMXa
	DGg0=
X-Received: by 2002:a05:6214:2504:b0:6e4:5a38:dd0f with SMTP id 6a1803df08f44-6eb348e09bdmr117295356d6.4.1742570013208;
        Fri, 21 Mar 2025 08:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV2qUsrf8Ji8k4NQXXY0QZJ3uWE9bmcYzJL0crOi3WG2aGplZZOmwLfnoE3lH8ycAUmOl/vQ==
X-Received: by 2002:a05:6214:2504:b0:6e4:5a38:dd0f with SMTP id 6a1803df08f44-6eb348e09bdmr117294576d6.4.1742570012721;
        Fri, 21 Mar 2025 08:13:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f4f79sm2679021fa.77.2025.03.21.08.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:13:31 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:13:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 06/10] phy: phy-snps-eusb2: make repeater optional
Message-ID: <m6uabp57a2kskyspnrz65frcf7dqkljmdeffupqkcni5qbgya7@cwmdcac5eh52>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-7-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-7-ivo.ivanov.ivanov1@gmail.com>
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dd821e cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zXIZtLy0MoHwQ1NDvSoA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ibIH0peTQKBtEThc5GQk4LKAnB38shfD
X-Proofpoint-ORIG-GUID: ibIH0peTQKBtEThc5GQk4LKAnB38shfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 mlxlogscore=707 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503210111

On Fri, Mar 21, 2025 at 03:58:50PM +0200, Ivaylo Ivanov wrote:
> As described in the device tree bindings, it's not necessary for the
> SNPS eUSB2 phy to be connected to a repeater. In configurations where
> there are such instances, the driver probing fails and the usb
> controller does not work.
> 
> Make the repeater optional to avoid that, which also lets us use
> the eUSB2 phy when it's connected to a repeater that is not configurable
> by the kernel (for example it's missing a driver), as long as it has
> been configured beforehand (usually by the bootloader).
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
