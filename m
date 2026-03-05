Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A737C91F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704936; cv=none; b=OeqNR51ltdAQ/jaLc67/+aTnBTNUhYqWVYRw4lZWbmeO355fTmlAK8LwjSH+D5ttjsGIbKhBvrlcLA7IDNGzEHXpJ7FHU4oi7GHRxI52NL5gmFAKky8V25pQ1nH7OPrmnLSKBZ+k+fCaXWgLDFME5AXzcbbrkfJA75qvyKKcfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704936; c=relaxed/simple;
	bh=sdqAqjrVvRH62b9KukgizTgaTiOnXZlSQR1sQ+H8r9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lcv3IeqEd1qSCFQEdDaZ6sv42ukcoPCzxUAsaP21OXDyjQ/6J+2JRhk7WQBkeQmDvW03czA9k08PfSLCraD28+MYazf0F9jsQQNPx832JZoJrCD/zKdp6Wr3jHaOAf1m8rIUck/kE5IM+rutYc+1DKBBtjFotHLiPKIpvD8LPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kN+AXckW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QKzPHGHT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kN+AXckW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QKzPHGHT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KGam1852944
	for <linux-samsung-soc@vger.kernel.org>; Thu, 5 Mar 2026 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=; b=kN+AXckWrGaNHZZm
	jf4xSJd0s78PHX0x5FJWfoVPPXDSDLvHXVtpa+lgGAbrzrK2xS6zVQ8NakKmGYAE
	0Zrfiog2BU1++B7ORhtLrcHsBEwM7UYh4w7hsovbto/u0NFLFW5u93VR1M1Ryyhu
	+WtN6Bd5Dh+MC6fZk97UHDvrhnrAfFmWFS5e43T0BhqqTmPzgVXdfQk+FWZ0Ddjo
	W2LjCX8ckVom4jsE8Gpt/s0IKTv1RVKN1j90DT8bmHL3VDLetzptu6FCsjg4J3JD
	Qcv0QjKMIM88rHxsDoFHi1hX48xX3mdtVErfjjS+AzLxCnX4Iq2Yco8qfWXdlH8r
	+RrkVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q813r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 10:02:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb399597fbso468229485a.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704932; x=1773309732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=QKzPHGHTHqP0uYNy51Sul+RMdpQF/ADpeiRSPH11dqwgvtx2IZvi/gCg8C0WNxgBkk
         ivJxp1fHA++DIAh5jbeWLVaIFLV6RaxmaoA9g94wUrx2Vqivu5uSlNxJP0wld9epaSkj
         v6amDlHhQGxrRo5qQwBNFUVdW4cmDG66N3mYl0suDyoFwIshiGHputf6Mg+q5TlVBqOt
         a3xwYBg6E7bWMw5mXQ8rHnUMNlZtmjdBLeTMc2gylqP9BZgly1Kqkrm+M2UYjjvZ7kjd
         va4i7cGSD3nQq9MN2Q60dfGCYn7omFYwKAhFqipU591jdKImQErxzqBkpXU48uSuJRvN
         bVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704932; x=1773309732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=k3G8YtgQsoVP4gXbMScns4OmrNllvSJFCXTf/+QRWzAgSyR3sXwf782qR2EyNu3uFV
         eOVyyUb14a0/sYTH97j2T4k3GziyUDjy+0rFIP9Kmv+VyMZNiOGrMuW8+4S5FGovPkRy
         bxzS8RVcPEcidCd2JzBzcEvlBEFAztDsv6zBTGPI7cnsgn1gVnTYQWnXt2nBO5tgUgSF
         76q30mWLKobpTCrrBT8/oZZYPpd97nkf1jULVJQ6tdPFYjOPW8shryjiTnFrewtbDHmt
         ufv7rJQenCreQiux73cUrqto4ucTaAh5S67t4IrqsRv5M7aREP+yFJqWi+NrbDmJlIWq
         QAZg==
X-Forwarded-Encrypted: i=1; AJvYcCV45B1/2YJh+k72pMYScsGqlmrRJACKjeS4+OeJSF67qw4cIHpsCir4D0CJNUEcPUbhSOSJaVYwiai5VhN3TCkAoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWCVTGaVMAvOgD6Osl/jCbwWQVwmOKuUsEd2oNQXwkzoEeKYh
	+VsWhQpbtz4PqsYYuLFMTmPndqleoRiU33ScVtdyQDI1M1wWURCkpeRWog9rONoJAbE/okZx6j+
	aNmLJhVhDxeTmYYu4FOV6eFv+Pb6n5Jo4iTk3Iy991IQ2iQFSQ44DQpSrxlf3KU4H6zre2Zdhgw
	==
X-Gm-Gg: ATEYQzz8u5hTONXbTw2FEBqQf7zUPye1+9gkhpnrhEyeZjEON1lJcOSS/Hhv77vGj46
	XlBYHYEKuPFbOzd9Sg02jAY4NSjFdA+kJahOFTQhtwXFhLAixDVqGDIUedhGuvMPMBcqZWhk1/o
	3ObHuOBb1EAbOoDk/EyHEIk/JThjRpizzsPb4UEcqu5ktbiKuINDw3PAK6aIi4BYHxIY14pXzt1
	E1wrtps0G8Nn4vJNkiBkPJa0tz+ojGvNU49Wn3/fXalWFcGeQW00zvpq113w7NU8BnbTRAsHgdP
	/YhCZbjxjcwZ0SC8Lt5yjrVwuYjaqsGE07l+CyNzqgwoOudDzaqRyYF7G9CfPHxrsQ/s3zHekZ+
	D4v3wq04ke84rl0aVZJVIXEf45VqHXF4v5IahQ0Z2z4/KIEJZStw1GYpLL9o9bxqz+BXyui4XSh
	qcBiY=
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443239185a.8.1772704931602;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443235485a.8.1772704931010;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:10 -0800 (PST)
Message-ID: <fd00e0bf-7b73-49fd-a2d7-1d4a88bed5e7@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Drop CPU masks from GICv3 PPI
 interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S013TfSqUUKgk-AxQA3cDW4iPsPOfzHB
X-Proofpoint-ORIG-GUID: S013TfSqUUKgk-AxQA3cDW4iPsPOfzHB
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a954a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfX8a25k4UHNfdM
 +x8b60nYCAaZT4aPoaOIK69xAj3l9fviLcD/CSUllrNS+YjQuYVS+ikpid/fv7mlEJiH+leT7zV
 R2VSg2lzW/re38eEpWCmtOXcXSaGD5STb2GIn2SDQpRuC+kFPNv4sIcSXwNuA0yQ8AZZHKCIs8U
 quT39EuhxXunOruSOJa6XZdNEryasPg2+1tDggi1+vEiLOvL5rfK4v0NYfaeUNJG5SScIsXEc0o
 pc5jDl0R1rodUpOAhVlYf/qw5H4/dEJyB/TSMKgIgSnULcCh1kIGiIeVD7yEcgyiwVLWCOrstSX
 GfnzGy99wR6asradggOJnlezGxGCNlJmSboydB8j9dtXiTatZiDwGdecsd/EIn4hc66gXTmrKGC
 0/qo6WYLpOblWfFG4u3H6BbykGXCnHbZrWqRprfCgi8L7J9NevJuceL8j6ld6ut7R1YtQGfMKdz
 tB0puaW4t2RWCFJhNCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080

On 3/4/26 6:11 PM, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
