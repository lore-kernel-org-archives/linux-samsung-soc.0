Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5781925522D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382529; cv=none; b=KBs/4nBm1bD7cwtNQbXCXI3SKXRJj53bgY12pMd6jgxLuU4al9wXBqVzMPr3BHEi5Binul0aCTpKIyfQXktveOrQr44mWgoe+ALNpVHzLVv57RqyKrRuC+m6RoGL7FzHBP/1yJ6C0hX15hrkmz9bxAk+VldT/lhgt3MMUP/sByI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382529; c=relaxed/simple;
	bh=7kVuE2yalymm0zGrNn2VhxNQO2hWeUQJHMGJHJYEtkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyBrIg6lcL5Ytpqx3QiahBDekSYzLAEFkxBjmaJgEwaDaMKUQILISHYfpqvuBW75HdtEue61C9s1yND0M7M9zfV5xRNN46vdnOR3HSB1ZhmabUn1VNmORlT1U3HMUwDL1LRqzkH9496a0IvGts4CaOkt2FpgRt7+XUD7ybb9pk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+2BTofQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+2BTofQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lvpV017280
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 11:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WzyptaVYzzRiiqOe580gou9y
	L5Xd/cRhnh+9PDrH8JE=; b=a+2BTofQxHcdNpEBdZY25rpiValaCN5Ck0hEsoDN
	7Sp9HN/LZYdY3nxuL9e9qiQ3dTFCh3eRiUyvjMQnlknVkikcOrOId0Jeng7OHVYG
	TZgx15kJvxNXIFVh7t3a1qPsepi2b3jV4aa6dQQa5SDt2k7X2TjxCcZF2rWtfSa+
	n1G644PvPuqe0AgbIVdio2W4kt7vRpAau/DnpkLGiKa/aYlcn21GFkJQ4pzaMb4z
	c8vrrK9RRelTkYLkgFAsbEJWZY/01y/PZbScZ/gVTb12/kh9A4pYtlCbu64CB4ed
	yfWlYtiR+EtpCnGsIn19tdDmWiytNvFgPnBn26ERnvEbMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy3cme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 11:08:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c544d2c34fso1028840385a.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 04:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742382526; x=1742987326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzyptaVYzzRiiqOe580gou9yL5Xd/cRhnh+9PDrH8JE=;
        b=mGzdtwia7r91ohNXLrgzCfHrzE+tQIAjNUwT6EEPTMPqxSWU8MHEmPUlUdwh7aJFx2
         sqo2V4zKcr/szxiTxn1kIHREVndXL/F2yoCVMssUD/rMu6cT+/sYoxrGawbtMt12VsgH
         /eNgElF6I4NVg6hiRSBmenLKDILRru3j+a+rAE43RPtq90P0BGXoc0r0nRgbWPtsKZno
         cYjSOJqTi6oKToGR6eI7+4kld4RtGlA8dFhsTT4HoQv0/c9UGLY2WmcagfdSu69aEVfU
         YcONaQcXrnZAVPju48Iz/OPct9dri2tVwzqT51BnV2yVr87CIGNXt0QnHJ3hTyMMPVNs
         limg==
X-Forwarded-Encrypted: i=1; AJvYcCVQUPqLF2Hs744AMRF7SOlXA8pOlGMchyCjGbBDBKYYtkFhjWQ/cAO/caDAu7UCpKnU3d9zfX3D7+R1ZAVie/OplQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JN16nHTFuWfUbPTeNDVrSVB3IXF3Da0VYDyOuS4mc4yX3Hau
	FWh8L5qSDne2geB7P39jLbh3RURR41bhAvBYwlhWpmNvtPawjz3fo7hsT+dSfOvLJCHEovFGCpY
	maHOrJZ46JNIJn9aKllUA8pDQM4ZGftZcQ2i5B8R1nn00RkmvEYfN23l0X6V+daXH9G9ACQ==
X-Gm-Gg: ASbGncvC3eztOdtQm3QW46P7jMOYVD6h5fbgCqSCZAyiWu6owPQpQXAeQpeeT6IXBOa
	2o0VmOdR0wh9MG1XzQ3vNMvF+bxr9bsdVDZmRtL9AyZXqMXrlvq2uj8viKSLIxikexEny4CVVLP
	0/3Zu4do1EHrzVrkdSgq6VhqKZDr4PB+5+2sGV4d4Kfk4EULrLkdZY4+44+LPFa47t9NfN7qahK
	10Y4YKYU9K7VBiPKqukdpT/QlO2suBRJgb1DZLn8RMai/zQGEL/HrUEY/FA4IttiWruhiti0HIl
	E4014v24r7bhw8xFPx3lJWHpXBjih0NvzCAPjILiwn/GaDZ2Dx/mZtgjaveTMq7LK586QM1Vy4p
	htEo=
X-Received: by 2002:a05:620a:2a02:b0:7c5:5cc4:ca5c with SMTP id af79cd13be357-7c5a838ec42mr250545785a.14.1742382526265;
        Wed, 19 Mar 2025 04:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZcIi2ghP6ESmSAMRKD4aGrSgNmlI2K/vEMqdFO+ac+ilM5F3UbWyPluESd1UDuKYaE54d9w==
X-Received: by 2002:a05:620a:2a02:b0:7c5:5cc4:ca5c with SMTP id af79cd13be357-7c5a838ec42mr250541485a.14.1742382525800;
        Wed, 19 Mar 2025 04:08:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864c12sm1988818e87.157.2025.03.19.04.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:08:43 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:08:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Message-ID: <sxrae5pmykx6ul2y7uc24fss2kdeezkkom7ev7mavt3fbc6ckv@tghyp3whuxnu>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-GUID: iN9JbNJDWv0b8CG1O0j-_GZbt2QEIznD
X-Proofpoint-ORIG-GUID: iN9JbNJDWv0b8CG1O0j-_GZbt2QEIznD
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67daa5bf cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=XJ2MQsQTle-X_OudA-YA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=787 priorityscore=1501 clxscore=1011 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190077

On Sun, Feb 23, 2025 at 02:22:24PM +0200, Ivaylo Ivanov wrote:
> Some platforms initialize their eUSB2 to USB repeater in the previous
> stage bootloader and leave it in a working state for linux. Make the
> repeater optional in order to allow for reusing that state until
> proper repeater drivers are introduced.

Generally "works as it is setup by the bootloader" is a very invalid
justification. Please don't do that. We should not be depending on the
way the bootlader sets up the devices, unless that _really_ makes sense.

> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 4e5914a76..dcc69c00a 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "failed to get regulator supplies\n");
>  
> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
>  	if (IS_ERR(phy->repeater))
>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>  				     "failed to get repeater\n");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
