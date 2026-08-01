Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B878F3A
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596819; cv=none; b=O8Cc9XvW4r0ibEtlCNCjTxJG1+vQa6YjnfMyidaZPN7HkLKONVziaG8unPWTpwdUH+p+Z/TU31gw6u5DAqYHRLn72cuqUhU9h7dRSvAGlV9S4avmbvP/q4pqK2/4KDZhRuN+BdqbHa+lw1lQ1VwErA1HAG7E894pXX83jN0HIvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596819; c=relaxed/simple;
	bh=2u8x7UM37nI4ga9Fvb2fN7gFkcZv1A/bdeDEVDvmmdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFlyD6o+ARLykPA2Tw+VGq0s4ilU680zj7ZC1xuIZxQJDlgtGNnJLQ+7/zCY5xQWoZmHIn+Im9m3WnnK0Rtemz2Y8yB35BUiujNDtHcRrL3PC3JJXPoS416DRVjcZ+gZrEVYHZo2inW7nOjye6tV74gpNpSy2Qe9wtqeTPnAQC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tti3vt3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kTq2ps6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tti3vt3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kTq2ps6p"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CbDNT2816212
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 15:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=; b=Tti3vt3TrlSHvkFd
	k5u3rXZ57tzo4U8XAz+AR4mSA1QRw5R008/lrAzdFOHOFZu1GchPRxKIJvYEOMHd
	Xn7j+jGpDqD9u77cEjywgUuYvQdt6RX5zeSYLl/8gO+sRHl51ZzzlZM/hr2d7gB2
	rvLm0TRFdKDIy3TyK1AL2tRsYxi12JThzlJArmUYEEGWVxNrqVmJ0jBm2dbie0Co
	SUJzpocYYFMMFfDmgI8lPpnHxPVoidtzvHAtQAFVv2tv8t88qj1y3tZ+0h1zYnTu
	VELJzj0sUpaDLyEBMzYDNIy/OBCM6jx2RfH00iN+AA+/KagS1OMA2PKF1r6Nk9HI
	ZXBbKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfs0fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 15:06:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so19425711cf.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596817; x=1786201617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=;
        b=kTq2ps6pt/Be4TicKZBo0n8i9nwHMdQZkyCDEoAAdXs8DFLW3sapTM+o5LSRUg1HTY
         t4biN1m1vMFZVzmqoEH9gyoa8SqKYnk6IAkB293smGNfAZ9VwtXZiHbZcjG+YgNLgv2k
         JwI30Dml3kxTSqEFK59+O8icAFwcVMh5NeVt4KR5oIXXZ4AW7vU7V7Ti6QPXm7n71XCT
         +i/wS0OIO3mdrFdAxM80/dbGSQ5YxdDF6oQOAKVM1NWKAZ52oIOT2kLRbEenkXbe9T1Q
         S1QEzE4ldK16AOGDG0VrPNF7QcoXJOeA4isEmNw1eEX1qi3IHyipVArTKib8BSRBisex
         QYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596817; x=1786201617;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GtaqztfRAYNSQM0XYRe+ZXodkTMj3HkNZWs3vleHsc=;
        b=l1jzOy26nLBqMBgyMBfObc8/vT2u4ivwloZWfgLCC5UUoYWRGOruJ0fuyugrQ0LTst
         gP4l6LSX+x3vaLOQAuU2g7AI23EkFT5c0l+eWZIvOORYGZOEhg6jj1wfhFM3TjZvrEQ5
         NuvPn3I7rcxvj8lS3nNPsZCxB3A+4l+jlnzg+bZm8bJ5nOQmiXwd3UgserinB1sBlBfj
         J/3lQll7LHwF/zOkidOQmJE+NdztPEGEr1IUJz12km14kFrac5yQdm/4q84eEktVBywd
         TXvuySZ61BRbuf1TdY0lm8JkmRIWnKXdD5ZQzX+lXmCiimS7nobXbduEJDe/8VMtLAGh
         ABlA==
X-Forwarded-Encrypted: i=1; AHgh+RpkDigyBmf/Zsno0HZiG0lowAJL2EUWIiANPFLPj/TBBexGTl3boG9fU4D22o5B2QEoKHZGKLp7Kx2uc5UlbnGzHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL1IZby1ezcoByXuUz9TMppnwRfJQ6W3AEQY0P0dVFF03hvZ/P
	cRTSZA0FwO7nG0pI1INLGzNhljBfJrFVlHaYRZg0HldtBIwVQn/DRko1KJrQR12fPOT9yB6B9rp
	MyUmaVxXKZG1+a/L0WuTtCn8OvieF5LDS2npAgH46/sfgkdyx9h47X5jKoeX0v0yBozToypLkHg
	==
X-Gm-Gg: AR+sD10xKuR9v6aSQBq+OlNh1x8Z5kMq/cKjs5oh1sXNiwW0JEzPvvwtMZYEIcmXnId
	L+uEWjaDd7fY2ESaEjV60sun1yuYBamFn1jah1PHG7xYTB0raliO7K/qOfdIlfMajmh1mFLlqc8
	+oayeRhbRKXKZ3C+FUOSzqQggT0Ksvo/zGr6QLNeavpiTRnetgua4FKvZTZKnyObyOfigKQh6eS
	V5Lj6vEyKCLjgUx6hDL8scjBuLDlos01UCyXl62xD1ePgLRmGH1x9lR9tT/UVE84tdrSdIup+pz
	AntFZPYYfttSptD+EOsQmSwkY0MZjOUHXUIcPWndJuDp1jiwCrDcLmIta5fYgHCdiKM1raVWTyP
	GmximQ1Cjx2NVqKxuUBV9VUInSzCddg==
X-Received: by 2002:ac8:690e:0:b0:52b:4f1a:5ff0 with SMTP id d75a77b69052e-52b566db1abmr92401641cf.19.1785596816716;
        Sat, 01 Aug 2026 08:06:56 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:52b:4f1a:5ff0 with SMTP id d75a77b69052e-52b566db1abmr92401001cf.19.1785596816318;
        Sat, 01 Aug 2026 08:06:56 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm15979352f8f.1.2026.08.01.08.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 08:06:55 -0700 (PDT)
Message-ID: <a5857cc5-ca3e-4adb-881f-912b6414c453@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 17:06:52 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: exynos/google/fsd: Trivial white-space
 changes to adjust to DTS coding style
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260801-b4-dts-coding-style-strict-v2-0-c0b4c68b2ba0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-c0b4c68b2ba0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CNd3owhLCGex_9NxGbm76XcQX9NxgDiv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX4Onkun+EebCr
 KQKX4VrH1AnuCfQ7cQChVecfDsRYwyXfFoVczPRGQkZ4j2bUUVfnSGYbBzZ4U5erOCCioqrsfoB
 GJ91U7B9XAJF4dNwV5MFB007Uq7SuyuTiupm9JKYoP0EY+46YJw6AozjfaJcPdxBR589DcYESmi
 0M0BIAi6Bo0YoBNGfV7rfe3WsToLap/8p58SJKe1Z6GPK8XSMShb0EcweeDsxebzjvwhlEtAvVs
 RPS4AiQehahltl7LEQHLsnArpcc8YkBaqETj0vw6JyK16KxGv2XuXwXby3iGsLwg5YsCen6sslW
 zJLjZV0Xtg03WijzdAEJgw2tRsMe/MPdjUGgiDLTv8GcFIwSYmqFQ3vahR822FnN8hZ9Nlgdv2G
 DKxaTBm5OuOTaM8es5Nn3zLsE+mcAen1gKlbcRNi7tQwfWKGsiL7lzwWchJcfjd6GyjlpbcMddi
 fItXoyDwxBbXPrkxjSA==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e0b91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=96pkp0ENnvQ_4pjiV9wA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: CNd3owhLCGex_9NxGbm76XcQX9NxgDiv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX6vTIx/Kkyrn2
 brEuAC8cvo2wjN738R3nf+FX+qggeXiL0V4J5BnbrU4MGIBcFb7Wl00QVOmnneC+/gZxhf1/Re3
 fiJdhkYb074yy+jZ/SC+CX8WQ4RJJaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122

On 01/08/2026 17:05, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix stray blank line
> - Collect tags
> 
> Fix a few obvious dt-check-style strict warnings.  No functional impact.
> 

Please ignore this one, that's a interrupted/wrong posting.

Best regards,
Krzysztof
