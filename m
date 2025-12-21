Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86685179A3
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766326314; cv=none; b=TCQSG1gl1Ppl/k+vbVKrtWZ/gsL0mzqv5X19yNX27n+IKBHdZN8y3t0IVVvy+lRy/18q52Fe4/TpXSFDAbPS9sZJL7NAeNvParbYioRpb8NnCXJLnvZvmN71181d+Iu7ET3FLO9UnxQND6yYVI6bZ2hpqCnibAE0oHWY7k5hUQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766326314; c=relaxed/simple;
	bh=2uYmkEPKGuiADtXD5Tit4rB3HxyeRaz24ds3lrdBBGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHB5vNJousYYHDo692cC1OiYs8HifjOMVr7sXpk5KkHEP8AHutMUnGmu5re1s2xZqsAip3l6B5MFhRzJmY56+QP777SxGgYC51RIC1f6iiLfTHjFrSyTLo3X1Z0QgBUi4xbPqYiWWibR70s/YFlQXrENPNFgD8/B7J1pTNkQWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3KIxPl5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgWy5fPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3KIxPl5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgWy5fPG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLATl1n2169857
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihJ+Ec5j0Wj03PL6tGf390iLLMIjjv5jteMD9vvDTUQ=; b=l3KIxPl5kIN4xNib
	myQ4HNQYCI5ceHdtPJpnvoXePGxZ2ALz/v36TDFMiscfK2cleq3yWzGnv4yA1sFz
	XzVlg00q+fnP0eOssShHUZbtAyANXY0sTxsf45OiR8JHuq7YBh4iVuLP4MvLZj61
	LG/rmLO/tsthe9Zz/dyeM57m8s3JY1ktS9dBgJQsRWKdKiU4a3TgUvIkZ4LG8XBx
	3F38pHhC6QePZMfGY6dtM719T7/4/22pIk3nqeskQ6XofIQAoGDrq5TidY2Wlhsh
	rNRzIM+WbSWJrCL4GngMPsmpTWGT0SczvJllVHHqwKsTx5oKQvCp4rtSDE+Z2v4D
	tJplqg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrwteed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 14:11:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88883a2cabbso112263636d6.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Dec 2025 06:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766326312; x=1766931112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ihJ+Ec5j0Wj03PL6tGf390iLLMIjjv5jteMD9vvDTUQ=;
        b=IgWy5fPGWBoDd99PefCd+Xpa8c7Q75JoM8XO2n7twktIR7flt0JGTQBtILICdzWWnx
         LfjTGrrVQ4YA9pmMdsKBm8y0jY8nHApg+ThunYDc9l81YfkXyM2NpxFI/kw1OzpPLryM
         VQp+97mQi5j0ZpEAMsO/f8XOhpZmGvzSi7AmWzCb/sSGkByYvaPv79n3SYEuqwYJzkFB
         DEKD7dG8Lf9pwf8EfdGvhODS1jvlNkziDvWe296weKtz1jwB+85UDIdSaux99YlZ3G4e
         qhx+gh6ns6O93pqplGtiIC2Y4teJd0UMCkBa1tftEBHYE/pBd0ioyL+VC9LVagtrPD+U
         2hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766326312; x=1766931112;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihJ+Ec5j0Wj03PL6tGf390iLLMIjjv5jteMD9vvDTUQ=;
        b=cizZnS7wvrvdud3hZIAZfSmaNGPSaFunYWTM3RFGp+94m29yrp8kKLp7oygmeiJ1VY
         TMHQlSsbU3PULEnpkhE54QQrkLHpGWzdPgn84CPN5IIl774FyHLBqykj/wgSPELnc5pA
         tgzVj/xOyt+kzNtFH35HreW9b4bjU4o2AzZlzwHtfQ+zNSObh3XUcqFNlkeo6sFF8Ivg
         fwZFU+RL2cS27FC41RV680I8m9ezvZnWuz0rJ+StjtCim/TbEHPO3hcNcWTAVUyYxB6G
         yN/xLtGZZjhrlVkc7MzUTUwcXLwLBIDZXxf0XYdxonSF0SXyjeUmowYb813WVxcP5bDx
         lEOg==
X-Forwarded-Encrypted: i=1; AJvYcCXY9n/dSnVuJYhvFSFInQ0LUoAht+V9UBJT4iCN4u+13/5Zyp5dfaymxhQZQa5ucBjwiI2Wy56Bb2Yj6YV/+BBHFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMhKG6rCcrWqWu3VoehqM+BfyEDCreLDi+snkIQLujjqD0zCiK
	N+uFGNASz7T/Q77MIr3uezYeN8/pw4pua6ukNLGqqeemahkVphYCpsS5/aOVh5wqYo6wKC0ZUUW
	Xm5FerRWIwNS4t51zzij2bZIFheNLm7KqoTPIjaxFMUJ+drl62WPphbxNSkkaLGhKnAeY0DsX1A
	==
X-Gm-Gg: AY/fxX42m7OMUKnOh0UdoEelXROIOUdF/aIhSw1IccAmnewfCuQN2NrtIf7MJ37ut6V
	aJbE63JGo3j1Q5vjoKY3nyLGsmAkMS22XSIuEr8/KssDf3wTAWY82LuCFtCbaCzXLF/DJxTaPP/
	H0Sf7ZMz6MVIYTw/BUCURFKKQKJw7YxdicHO8iW4xmQnbOaiks2FGUUEWW7WOt3diXblXa6Tzdu
	9I10EXmpEEv08CLUzn3WWxLTpw4T3KGY/wxLgmEXE+Q6KmDwXKn/OYl5ZzqTZAsf1xdpwtRgCzm
	OmghIO84gN8V6iz7LaCcz7XxbKs5GJuIUgBM+QnhMBuS5l1hNtVwA/ntKI+4rO7sEUPY/PjQYAD
	8NrNlIEkknSHEl6gxItn1yUfjTNvxD9VwNakxE9jVH6rqtsycvcIG/nXJS7vUDAj62GwbxMl1
X-Received: by 2002:a05:690c:6511:b0:787:f72d:2a5d with SMTP id 00721157ae682-78fb3ec5208mr65067627b3.2.1766325944084;
        Sun, 21 Dec 2025 06:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENen467K+vyMFnVky42xzDMgtlkejuduc7jpwaaPmkE5REAaPMsWT7W1gXzapvi894bzqQ9Q==
X-Received: by 2002:a05:690c:6511:b0:787:f72d:2a5d with SMTP id 00721157ae682-78fb3ec5208mr65067297b3.2.1766325943596;
        Sun, 21 Dec 2025 06:05:43 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm7312426a12.1.2025.12.21.06.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 06:05:41 -0800 (PST)
Message-ID: <9b363736-ac88-45bb-a428-7d3bccdc4d12@oss.qualcomm.com>
Date: Sun, 21 Dec 2025 15:05:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] iio: adc: aspeed: Simplify with dev_err_probe
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, linux-iio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
 <20251219-iio-dev-err-probe-v1-1-bd0fbc83c8a0@oss.qualcomm.com>
 <20251221120413.7f1fa877@jic23-huawei>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251221120413.7f1fa877@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GC7d_kqE4Ujv63cvkUfZapVJJDaT5X_c
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=69480028 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8od0x7llD9z3EFROJlsA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDEzMiBTYWx0ZWRfX5OjvmRDZh+s8
 11D93jB4LSYXd9TsVFh2ZxUHN8jBI0jFBVeIKh4CI/mA6Ixrfb+m5yIaJkwJNyfb6/rwgl6Dzl8
 SKHiZjZgvIVeaZ0WGuRuVmBJMLEvCBouPRAjVbNvE1QylUsmsaAgkSt9urZUEz+AFrzWhxQuNT4
 wIsuntZfY9O70IQarrtDWscmgxMlvBR6rvN06XWF7ndO+jVnIgVEeASywfaGHMhIoKccwox6eEi
 t7vaOHOYGUvBkUyO7+tKYTnhNEKhGMtYkjJXZ2wHMtPv/8luh7f/ai/Qx1N4zPUAJB/hh7O7UyL
 SpWxfUgs0EQbZxsIc90ygO8lp0KVtEB01y2IlTpT5s6XL3/y7DvAAEsSc5855aebbJm5rGdUdIc
 JUjw0/Lo8QP7WYdGb5T17JJaMzNpx3yozrqRV1hcHoId/yrA8/lGCds7Sfr7Bt/pO8Xj36Nrtko
 kq0Md6BH0mZLlGzTqPA==
X-Proofpoint-ORIG-GUID: GC7d_kqE4Ujv63cvkUfZapVJJDaT5X_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210132

On 21/12/2025 13:04, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 15:31:50 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use dev_err_probe() to make error code handling simpler and handle
>> deferred probe nicely (avoid spamming logs).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Not a comment on this patch as such, but this would benefit from a local
> struct device *dev

Ack

Best regards,
Krzysztof
