Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543452E973F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155634; cv=none; b=b/ZEgHR5JLZlM1sDtWzpOIGzGatER6cmUH7bt8cNMi4/83UnZxYQioE0ORcSzkNRCrGDRXPIcBO1nCiRc4/FQekOGN4D00TvEIV/fJ8PyH3rfxXkpNr6MmEfYfCygRG+PvxWFsSrYB+NrfV4+qrzaBgMiiRY+X0hhhdg2bv4wPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155634; c=relaxed/simple;
	bh=5XjcOwMBg2ujPqV40PeKRngJIvkzbjW5EfjSJIsg1AI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuaupbFZkyyRszOqdLUDBWSsrwVAkdTXLByvwVrwDgC5R2CekT6pwfvta9csnh5Wi5wkv3BNbPfCw85oEqPvb8zgsvkoxzxwPKOHAx//tiN0GZ4sUmO0aBY82SsfMTyZVcn8aQ8hxTFHpixkyKRhDeUCB0NTM+kuZa/XwjS7zYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flCd99Wd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9LJuiYg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flCd99Wd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9LJuiYg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB41Xr3939222
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=; b=flCd99WdIB49zGTc
	An1q1Hdk9XGhbN7baTxHWBodnU9IW1OuTO4Ri0dNVIe8iKl7+QAxfGOpvzuCuLEy
	xutFuVjEyrqw13VgdUvVFv/TcsBADcZ40zRSGu56JCSh58KPtaX2B8Zqa5wSJ3dT
	4QNz3wM7Ej+VVrSQg244rwJ0Vw048cNys4KRXIQjG6w5u1PeVzz6WSn8qLflojB1
	JlEIWc3hcVgEKy2lZwJ6hWJouHkUytIFY5KwMWr+GVd1+YiAaXWBg3lHj/+Ak8Zq
	+mBm1TjcUcEm0SnXRB7dSKGsjp+mO3B4MpXuM+moWgwrG0kO++3MO2VScncdD5Jh
	1Fgk+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c3053-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 14:47:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea2b51cfso48133585a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155631; x=1766760431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=;
        b=d9LJuiYgR3xSBOAgK/d4NJtsCYJRsup3y8S5kO03rlLASrmoJTkNojhRBskBb941CA
         7WvpWkGgwf9FpQH5Ci6LVuWymSQ6Bz6HFaDJhzcCWx3uYHhVqDoGIvh9qQxWnmFkz+Vk
         fblHyzvRJOQ0DXC3otv/BaHBL/lCq1jEz9akND+MFGPmFLbIdCZHMJVPB583+2HRM3J/
         IDJXidhkFpij25Q3w1p1ayvU91oY8LaUsRyqt1nF2zotN6x2MNCuc44rgxDFVjqRYjbE
         kO1szhTd/dYR2JfiIrBpU6VJ0Vv3RrLFO9Eo5GXvl9F/c0IPZeJJ7Ltgsn3zASzqpD8/
         5b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155631; x=1766760431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2llrig2VlkvP/lmBhRWbS2Hi5oOu1YmedcLpczcjcPg=;
        b=GfYGq+dI7gaTFBiB797g4FsSDsUCSxKfdOFv/EUetDR5eCTCFkaAJtcHgaZEMx3Jbo
         gbfmBLzz4nV5Q0tTDSo6J/dMyQi6SR64VTUpI2tbG5gAAT5VuM/T1dMPAFgPRKOS10s5
         yZMccI8F7mRklobsDGxTXB2jiGd4iiBDitZmPjVHspAnsVS9MBtsuP6LN9nogDxLsbHm
         tSTiNxQ3zcM6TClPlbqpRockpLnPA8u0QVbCStUfjt2RMVklLcpZh83N49xCNKEqmT4i
         QJZw6nqm6XRXekglYkU6QJXbBRdhiVYK7LpvcFC/YSRVmJkwgYEOh/zD576Ugty84vgL
         nrDA==
X-Forwarded-Encrypted: i=1; AJvYcCWB/V2W0Eg5PaRfzMAqm8MECAmG6ttRCukBA3E4trAq1MP81XooZHnUSFp9CJ557aGZvZefPK4caCR2GmSgk0kp/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySC5kwv1QG+8JjIRM1t8TxLXQf6nyWIS1kAo2U2mdssPH53ae8
	n3hOHkZgUeke8ADQUI7KBhJh2fwQZfSjHyg4v93OyPb5WAGeTdnew8wyi09FgWnXRVzkze+ztG0
	dtx3W6MhMTW4lQFOXwfEBACCyTa+cH+PKmdJPvPzm7fdlxLh1AXnlSWT8KR/yjGKWiB4K52QFug
	==
X-Gm-Gg: AY/fxX7YSAdNj2sHqNuTpXt5d8uBpDcbm2Dk0FilQs1Q+LnvZc2wXedgppygJZuKT/l
	8dcT/GSH3JHmfRoLY28xTdXkInChxzgV3rTAYOHZcQGVM9FccpgeRFBLkKXFvYIaPTJMC9YZwn9
	3ANoK65Seo4dDn2xse8P8vlZScOP3cv6SOPdReRwXHkb+Up/6Qjn/T/j2wPTKFPmfBejyKDAINz
	tFe4KiJKAKkzYGuSeWbftUuICzZPRXUnKefYGw55wMss6nuM7x7XXbRSUf0ffYOQJzsAdN3w/HK
	GWzc+vy01I63646Zzm0PiLoVGryeQkPRjBz6jRPOAuI0vS/ANyx4fBK6z869su1uWsj4yCHoaXA
	oh9aMzYuhUve3X68Q8KSSwIcVoQ9Xa6vLcefpUsfQE5NlsuonmtbbV1WN7U7EX+VZ/w==
X-Received: by 2002:a05:620a:2911:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c08fbbc3damr339356685a.11.1766155631512;
        Fri, 19 Dec 2025 06:47:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEve108+vsMnz6uQvHSLsQBNpRTIRrSI8CXrS6ViEziIGCv/1+cO2DfuCTVgDsGgQRx9jhOg==
X-Received: by 2002:a05:620a:2911:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c08fbbc3damr339351385a.11.1766155630854;
        Fri, 19 Dec 2025 06:47:10 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105b31esm2309173a12.13.2025.12.19.06.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 06:47:10 -0800 (PST)
Message-ID: <528cf0f7-6025-45de-a061-2d4f6fcc5bce@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:47:07 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iio: adc: qcom-spmi-rradc: Simplify with
 dev_err_probe
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
 <20251219-iio-dev-err-probe-v1-3-bd0fbc83c8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-3-bd0fbc83c8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -mPlhkLLVdXWiFWHQIkdIfWaAbN0ac3r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfX74SBJi0AzRIA
 vFHCiAgsNj7r/Wtg2AjS4THuXol8gXNXc1fwwneMrWEdafwEMxf0p4o6FryhK7Kqae6L283FK1A
 cCX9qXpIGrLtYjloQJ6VM0ruejSRH1/nIjKNq7Ptni+2AcXFPuoN4/G3vH8AN+xRS2wDVnXfttt
 HICALf/DyxypPYfvVlkdqMlnqNHVf2RnvozQ3KlScQZgbr0+MmYhbCM91k5eGO9DRIPHKjIn5ll
 YS5TKl0boq+CSLdDI03PcC5U5PXjovRzTFoKf2oqNMFtwW66S6Y993gZ5bEkuQqCYEh/XIq/h3s
 t5kiLf7LaEmeC3m6ra2xvJOoFErHuzguTVSTOZPj1CaouoDk8fpHrC8ex4zRgKW56WRuCIGSSvF
 uuZwkE3Pc1DgJYBgPA36qwyzxdlIIlaFOMlYUjpEyfZiz+NIEOMxlVPFVg98V3xm499ru70JZ2J
 7vnTgXUlcaRdnl6kFvg==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=69456570 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y9TzTQZwL3x8CsvTrzoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -mPlhkLLVdXWiFWHQIkdIfWaAbN0ac3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190124

On 12/19/25 3:31 PM, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
