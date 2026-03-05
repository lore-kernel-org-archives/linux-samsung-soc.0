Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE09137AA63
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703223; cv=none; b=JFSp3wOkVeaQ9dXI1R9bf4QoF8wogV7EASRh1bCCslHXG72ys477NUrgViIVShqPMQhDVkJqM03ZQfSfTD62h2WzegqfM4jA6opBS/JVX2g8raJbMKca915xbHeqY1CDUQ6Hun3fEYhKb6rUZXdZ6oU6itK/KjPswnYVcKxvsRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703223; c=relaxed/simple;
	bh=HOFCRWjfrMQ86SS6aNSy6MkJAPJRhPPCTc1Ev4hVuSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMa3fnjiWIfEYgZXZOxynrXcK83wz76u2IRK5aQ6pBVkDjt7hdPtdujFyx7UsqUnry7EtSXeihey1hl+yKQ3ZkXgyuHt6eguchw7ILCXVxiYR1ZWwu2revSHVd0SCCYX49Tcy9GOkJbjAcibMkNX7rUWzIM1ichOt2Z4j3GcZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzbctnVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATZKfuuf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzbctnVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATZKfuuf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62590ZMs3473599
	for <linux-samsung-soc@vger.kernel.org>; Thu, 5 Mar 2026 09:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=; b=SzbctnVqNSZ+NFa5
	KZNgrd87lqL1C4EWwyQX3KRCSqm4AR1CtRNPJmQQtSDMvdXfmaYnmP1uJ9mcoU39
	x5oHt1CxUbWXIScr5LqJGXtUzjCR3EYOjo2JeJIVt2bcNqLBumFoF2xCHxj8HJ8p
	3uVKCn8YTKDR50zX3M+04OETB2mKG0qWZNedQEdQDbDZb0bLJzOCAmlar5/bjaut
	YMjVGHQb1+qtI0EAX15PuyQtZJgJfRzxhNIuefwEoIPI+6NkaOq+T0x/MsEecMhn
	ShB8NHHzJIhEeKGVmnCBE1EO3Fsny1DEDi9Ymkt7u8i8x3T9dawWdfRZXVHjFv7c
	+rn9/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj18458v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 09:33:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so613599085a.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772703220; x=1773308020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=ATZKfuufR3uvkuhUERGJHSMRgrIUAJjOmwORCZ4HmuImcI9xBZcPVAWNrKsKOHBh2I
         N2Eay+ZjEaXlKu6EGzTD3aDcQhFYei4NjhtRiZmBQ38Ue0Ls8bp/xIAUNcJd4ESz4/4C
         w8ok9VblRFiqfib/yTqRE3Zur5OyakLCryNGeAIb5OcADKxQbE1sK9ke+Ayjg5jX3v9w
         QFQ8UiT2QII/5hxCO2RMKj5goiNn8QV8CK96kkvs9abJN0zvpbQqKmS8o3brPOrIqcv6
         MoEcyepRiTknpHsSNePPmv4I+dE32vzNxWATQrHXobq1VG7SdRDuA4HYmzz6iLLXD7+k
         KVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703220; x=1773308020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=S0n3jSEGbwiDm7W3hBm11N6QtGMsrPJPhoMIwxhHsbyK+TneZAsOt/ug4UWMFuUQXR
         YXDVWgBzU364sAsPRcYQ+hzM88L+F3QwXUMIXa0xhQvkM/wKk/pqrpbUP06TdlLcFBVx
         /SrAERmDa8GrZlkc6Pag/maaKL0qW8k79KVZY2sI9ERVZaIqj4Te4lzcTteHk6Ctde+2
         7ndgsQiGz+529tFapqY7uX+yTV5wsQfbzze3IJetHNeFtnYIzYRUi6glytRMrc/ATXZ6
         8BWmVaX50BvE159htGBtELbSq0s3KtsK38WgKC0Q+S0WGgTEKk7KSq+XbbjahVIiFntq
         w+2A==
X-Forwarded-Encrypted: i=1; AJvYcCU0oMcNbcG6c0CHs1sp1/2SIgsaFiYbbSJvtQUlASIwJ5VZwE/xbGW2LShf7Wo69dls0KSq/ZG+q1/+53OqxbpI2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT389w5k5zkCJJpI+LutQLT7zZE4GDMWEJOnLMvJAGgMiC8xqN
	PoqEOFO5lQAK47l7vPIEU5v2y89HqK2v529ACAXjpcM1ShlvTTl+StA73wVZ6tFkJooGnMi3boR
	cdArL4wCOMI1rbhqvwkbcOEyySfKlWJlFxcjmTaRNYdYgsiNlZ1Zuj7enB+c/eaPyL1tbGY9Zaw
	==
X-Gm-Gg: ATEYQzy9AiDMd62n7y8f8rL6he7nCkdhH9ib+Fg4umhfDAvjO2Cb3a2D1hhdArTGFG9
	NMa699irpPkHdR9r3tS08qKcTVGtrrNmRcOFhgUGz2we4m/th7bSjJlkGc9zljUMxnDIt72lyXd
	Dq86/BfTLDQzW1hKKJoL1ayP+8HBNKqAvUhxGsLt+BIbJ9vYZ3t7KTFdqHAI8Yh4U2bVJISm3DX
	+OXO0bjZ6bibSaHsZdsBQG3uhtSuebFFQvaXur50B+clYjDxU6X7u4ZSjaBN//KNXxqnuR0TNVL
	wPFqCLOpWmv/xwCcqWjMBs+/HmH8Dd6yGmJ47Gz+GFEaB1ET/5MJQVHY+9RYvUp5sPTXeoIPlw5
	sM03NNYZF3D2qrhTdSjPI4geFqD48l24rcQDLbszHdkVor1kqBX3psGuSSx5sBnmRAmOl0R9m/L
	Neef4=
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462863685a.10.1772703220106;
        Thu, 05 Mar 2026 01:33:40 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462859985a.10.1772703219701;
        Thu, 05 Mar 2026 01:33:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae65662sm884380166b.41.2026.03.05.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:33:38 -0800 (PST)
Message-ID: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:33:35 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w268nIAg2j9mHUktFkk0QGUcU7orjbwO
X-Proofpoint-ORIG-GUID: w268nIAg2j9mHUktFkk0QGUcU7orjbwO
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a94df4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NiBTYWx0ZWRfX1aLyOFwmuLB8
 BBbqNSJBO4It3DPrm8RsEmzTQRy3DmVSaGml9lUC7m4KGN9M2nyEH4rlp7CxkS5AK+Lj3gET3Yi
 KfAzrYTLDFjlNR7tmaZx4d3O5nqWM97m0R9/WY8lQGiK7xmAMbw+eICl6GJHT7DbmsEhhR4zCle
 QCdw+xPTtHb0QsWIBye64k/eXLODXF49B4RCU+446nk/biznuK96vhGCxt8DJapbvYn/MUgudJo
 66KY6f34V2ao5XfQQ2YEYjMiJ2P6O3RMWwQalCt0nkrIZbeQEpg/SJxKnyulSGy0W7qMNn2OHfK
 tCeZfS/7aLv1Xi/n2dO0AmxFj//K7shuePZ0Mkhlpi6T1kd6GeNlXsR+cwDEUSd2bhCohmOSmLa
 v5OYa9buuj4T46TYj0foy667r6zHPP/Lp7TsRzARVU9fr51Ub+DJdadu754dBaaXcbqbRy4drCI
 85pfu9wRFgZjZKVyHGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050076

On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.

I'm having trouble finding where that's used on pre-v3 even.. does
that actually get processed on the older iterations?

Konrad
