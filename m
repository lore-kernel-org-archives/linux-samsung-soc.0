Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208242A94
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572427; cv=none; b=UQkvP7x0d50uShyyjFV3tFYJKOf7ZEDvi461G5mM895MN0byK7kZ9reHM9ZsuXMqaNr+WdajqDar4xVvQ2lf4t/wQFx/JlbqWYRKG3PWqsu9u7u+Ysookv1ZSgjRKvevXUQAEM03BFAXK092UY09GLGWFSeIrFjtQyO76hFTntc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572427; c=relaxed/simple;
	bh=yw0rmi0N+1PoG1Vjfi94zYQFIsZ1jJ/dTZR2eWl8J5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REdwbLRLa3xvG2/p5eTD8YNu7NCY19gQcMcT8Tzslj8IAzoKjsgg7cpLTfKayRmrX+PpsH5OrPLsdz8JBA6HQcALeFi8Dx8AJcRkkR7JfSlJ0PaDS0tWRvD+rdr/pww2a1+RUE5a7w3YaNQXCxOznl4r4+2zn1wCcL/g03HHH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwOqSwML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwOqSwML"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATAD1022088
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LptmSOduTXZdmxLfabby/f0q
	YD+OOd89CLB3+Homj/E=; b=XwOqSwMLn6z4nHVnDSkjrjKFlzyirWWCntc4tipp
	mdieX75XroXRDdyorNmXzvbcciaq9pQf0LkT+vPXhl1tTisgbArrLN6Ph6XSZ44v
	PHwfbPbgHbs5PX8XZVoXC4/+yhO7XBakxe3gIuCGR3htwRDz22CgcWUycxORItcW
	pA2ZMdE3ZJxmcxw750xmNfalecsyaLy8KbhYk5suDi2RT6GD2cPITOt0xOrs6PIl
	xU5BZUQZ/bZ1e/a+8lfPk4uJljvvUX/DmuetZz8cAPTpO4klaZJdCdxxPAbl7H1x
	QrAzjuAtzNmsEZ/dSBZICyAlxmsNm6/Nc10mLWvE0EK2KQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wph6cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 15:53:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso29646586d6.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2025 08:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572424; x=1743177224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LptmSOduTXZdmxLfabby/f0qYD+OOd89CLB3+Homj/E=;
        b=pLConJ1a59wVgCVHHc8enWglVA9Si3NxlgNWShQwN19Lb3VqX7yQ7mtflyC+3jXvgV
         wzqsaAhQevdUZA/3vh1MhlVkYP8ZZ5lZKMsJGU9sQwpeDPZiUds7EqPy91t1GBdLt3hC
         4oqmf9hMCBEk4hQ6Fe6Fz6mz46RMMIQRLBgeLzFAdzSTZ/LEckuWBUnM40KDbL+Ib+mc
         n/+AGqF38EIQoM0PLdHO2hvpMIRGmo+QaBjOUXXIzeDBrCyquT8lkXpGLOAN34by25ss
         6QRKoPOwHmMrleH3xXnMqzaeVR7U9seAPksmAwtM1S0cITRPyFEKgQtg8tXXt4b/TMUD
         9ikA==
X-Forwarded-Encrypted: i=1; AJvYcCUkrYMNC5zJZglrfHSQ6aUpkcA4eo9cCvdhYwqvmRLBXZy/ZKT3lr7pWm13NP2/g01zQRdCP7CWfbYTYbt0CZluMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdR+0zMB92Ly8eo+e7qUnCmxctxpUv/LeMv5S/+BN8n8dpo5D
	oafY0BZ3SqNlVigEY4TJW9TSgseKHFdAmYDaRgozGoHORsNv5uMIWm28MU9ptKvCGdmvGfGw8Yo
	guAyCjAYtLZ92qAJZ1iWft9xhfOtCa6yvlgp9gHAySWGSA0/eieIyoSMTmXUjAmMqcOINeQ==
X-Gm-Gg: ASbGnctPQUs4k2Nr/VnT5H9CIbBqJ67opl1wM2avrMQwZM9OB4wLwAujvO/x0mfGAkG
	qecohXEZbRjvEpgkVVS5ZaIgBQF67OIKGKzgiaAL5dZ/o2ZNbwmorD5cLJ8Cvx5MPoDla2GYWH1
	1cPxLQ68wfQqabRG+s/RGj+kx9uIrEqZ4xbdN7Xj2khPQhLprpyJb63JFBpB5qnrTCLNsot6/fk
	CbA/O10ljyaqRdY8a4KeT+/wRMnmg0Eljw7XQ895OIOUj66UnRrxMoNZui9EZFBGO7agMYq0feJ
	a0VVq87xgKmrqJD2vU6O649hoFal/csIyofBdz7nlZuxWRi+kzEuQoawX7AQG/1vzmgDV2Mb4GK
	MReA=
X-Received: by 2002:ad4:5de7:0:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6eb3f3b7b50mr46274676d6.42.1742572424177;
        Fri, 21 Mar 2025 08:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNM19+y0wvr0/rSNbRv08Ya/wFMH3feSKKK/Zb7YMAXHSS6ZMZj7DV4uHlqvystkp4UnLvjQ==
X-Received: by 2002:ad4:5de7:0:b0:6e8:ea17:8587 with SMTP id 6a1803df08f44-6eb3f3b7b50mr46274196d6.42.1742572423624;
        Fri, 21 Mar 2025 08:53:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad651237fsm209084e87.242.2025.03.21.08.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:53:41 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:53:38 +0200
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
Subject: Re: [PATCH v3 09/10] phy: phy-snps-eusb2: add support for exynos2200
Message-ID: <wwvjm4576r437tf2thbqseca5fobedgrhjk52iegwz5qnlhfv4@pnsl3pvsefwq>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-10-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-10-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-ORIG-GUID: s7JCbnExtYEouHWRRmPNt6bQkCN59QLP
X-Proofpoint-GUID: s7JCbnExtYEouHWRRmPNt6bQkCN59QLP
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dd8b88 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VxB2ctdoYg6PJSLCJaAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=639 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210116

On Fri, Mar 21, 2025 at 03:58:53PM +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC reuses the Synopsis eUSB2 PHY IP, alongside an
> external repeater, for USB 2.0. Add support for it to the existing
> driver, while keeping in mind that it requires enabled more than the
> reference clock.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/Kconfig          |   2 +-
>  drivers/phy/phy-snps-eusb2.c | 162 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 159 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
