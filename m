Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67A225A20
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572391; cv=none; b=Se8Q9tuF+vhjXt+03NWeeRYrlXs91NMh9Sp7bGz29VA3qixyDkd1PD/jxl4ao65Jpo0od6+MKaewccIP4YIr58b4fAY5RVBlpNUfjGAjTXeChoV0nE40WIRRQ+HJNK8VzelfkAiYO7TShlgTXiQiVPaSKfsIrgRPsixpzC6xEL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572391; c=relaxed/simple;
	bh=Z0R+V8mIAAyfySi3sGNVs4O7MwDKBcqIsi51k8di+xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9XNiySoSSO0L2y8xbzZ45pNuBrZNDoRp6qXQa/vgHuKnmQNELCHU8Omo+PtczfJt0mn0E/lVQoxYgDADiEZkNERffflyYdPm0TOi/nCu1YapOuh53mnLHxGX6dsBmw4bsFdTNUlR/mXbmdMxr7N/to42AzmIAmcM8iQ9pbWbu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jD29Qml+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jD29Qml+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCSgpj010552
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VQlDE2/fBoDju/XlglpVY6/w
	fpayn18xS3bj6jOtEoE=; b=jD29Qml+wTE5+2QhwYgyLZzkeSaTzE/Pij7VjbA8
	4k/oIrWsQmIIoY+EZfu/XxBkvCr9ObjmenKZfOZvT417avfhJwOHhvfnZTpcRbQo
	K/K05js6Gt8KWqcU0/pisHfHxvtLYFI1ME0D8iaphCtOp8GITOEWO92R07LO0hFq
	VXgVdxArFxisF0wZCH5OHYTnQptnX1R1gE5RxZM0ie+vgOZe8nTsfe9KWNBftY9K
	+NxWKq64w0ezd4sk2iEBcQcxJ/chx0OAtgyCIZOJC+nre/RG2hdyQ2WmJW7fcDUV
	H7hDNM6UhcPNcpQBIwVulZKgQBjKNw2Us8yTMtx5bQbnLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h85e0hss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:53:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476a8aff693so46030191cf.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 08:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572387; x=1743177187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQlDE2/fBoDju/XlglpVY6/wfpayn18xS3bj6jOtEoE=;
        b=qh8hyqrBzCS4gjhI0niVwyx5KmJQ3E69P1C9tgCZUfNnd8/x+KULeQAuV7xoCDrQqE
         eg4sE4MQ9G5/jgXWUJ4m5ZEsUnwnB+REDF2y7efJ0BeH0U4b7/HgJ7Ahuu5jrMZHjT4X
         zAI46Xe0Z42s/Jnv6/kahJCJUgrxNbJT21rsyiXM/el23M67Sk1flTIWWuW+n8BhyE90
         ernMReg0Wpm1/dADWOmuCsQJQ/fBboeH+eK3nFCLlCNeJAazjx8XzN6MHcRjmlxyUdLJ
         RQRsqyg9XZYMd3NDMe8BdUYBSRcvEm8zwMLkxH9rkJP8qnFpK0mHx8IAEnJ+SAsvET75
         dqAg==
X-Forwarded-Encrypted: i=1; AJvYcCUyc2R40UpXc9qcJCFm+4+RfANkmgNH2fmN0ytXtI/Wajc28Deuu4tjiuRCmyHWgCehRgtGqUpFDJltTqEvqyDCDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybTBybOmpauf9yjkZ9oOMwwqT+QOYf8kMLVUSyIKvwRcJ/ukGi
	5twcuAb29cloi8vSlv6bAj0/N9+uLFcuzcAZXBmyhAegrZVcxyYiyjJ/BgSUD12aJUgQnlbW3gV
	WmVoZlEhy+qBYTREGwmcUpA6Nv/ADzH7WFQBq++GwDwSw/fGssCvWiToAUZZlzhjgguP7eQ==
X-Gm-Gg: ASbGncu9oKQyxShOijt+cYWT1zRxqnYcVRV/L8GQXiN+PYCEJ8IEANgGXoEQ0WnqkbJ
	Sx9SOkmFOLcWdzOk2IfxhQ6u6qNtAvwNBiERXAzDex/4O9HFe0gheR4Ye3R3UaWexz7VMSHYTKD
	TiK+9RvtWAh2tSaFaKHsVhTyx30yLCLS8Tg8xHfhqkNToibU4iISO31z9q/s23R5A7OKx5WFOOM
	QH9oHlS2vko4nZ8Zxu/CNctVAuTF4MTWI7COu3QJYarsaTYlwrl8EhrgUaa5wDoNn1SlTgZFS/Y
	3j7MPWOaymwCD2GRGA3C/lzFu3JjPrjKBX4GIdREU955WJ9zz679lDSkSXvZx1PXdhzHfK9kQ87
	LD7w=
X-Received: by 2002:a05:622a:180a:b0:477:1e1e:de with SMTP id d75a77b69052e-4771e1e070bmr43920021cf.0.1742572386759;
        Fri, 21 Mar 2025 08:53:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3lNdzhAtr0sK0LLAK9PFg2BBOEsioVsVc8qjwwC0svOGQ2IU+IMTDXrTnp+MfGwnE56Mnog==
X-Received: by 2002:a05:622a:180a:b0:477:1e1e:de with SMTP id d75a77b69052e-4771e1e070bmr43919501cf.0.1742572386254;
        Fri, 21 Mar 2025 08:53:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c54csm216260e87.66.2025.03.21.08.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:53:04 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:53:01 +0200
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
Subject: Re: [PATCH v3 08/10] phy: phy-snps-eusb2: refactor reference clock
 init
Message-ID: <vphiep5kvusrsyv76a3hdnkso35isoe76uy5hx2vm33tix7yxl@4qh6sk3xe3nu>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-9-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-9-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-GUID: 8ztfZQM-Y1k7ZDviBWPPB7aebKnr9eNZ
X-Proofpoint-ORIG-GUID: 8ztfZQM-Y1k7ZDviBWPPB7aebKnr9eNZ
X-Authority-Analysis: v=2.4 cv=LKpmQIW9 c=1 sm=1 tr=0 ts=67dd8b63 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bmNeyW_Q0om-5_paTGoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=704 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210116

On Fri, Mar 21, 2025 at 03:58:52PM +0200, Ivaylo Ivanov wrote:
> Instead of matching frequencies with a switch and case, introduce
> a table-based lookup. This improves readability, reduces redundancy,
> and makes it easier to extend support for additional frequencies in
> the future.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 61 +++++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
