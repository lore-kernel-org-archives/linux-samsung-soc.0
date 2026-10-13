Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E173EF649
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901442; cv=none; b=C3kaR2AKuCkJ6gVzWt75UrPFmPb3vFTzoaso/xfqCXjPVpm6QR7++PTIEmx6SXGWc09fYckOKMddlLfU9zk/o6gg1eMyqPCFNCU9B/gLdZJEisZBkn+5qxQGkhdcXr2QOgAtapIeBI8ZnbbHV4+e83HC6nFEor8I2NYaRhJOiVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901442; c=relaxed/simple;
	bh=SyE2Z25hzP8HKj4fDJ94fsBx77haZvgbrgT6zrnosF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppAWEJssxB5HbW9Ao9kx/sc2I2rOlo+XCNRFOtzElTYu+UjjAyLhrpqsIja8Vyacka2zP8hU/XFauLeU6D7Ii/CTfOLMBnW19nM+asAPqrWXjLO+BR9lDknfnxD7P8X1PYX8nXvvwoD+J6AiP4WqgB0VPC4v5slclNzDUVV8f+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbCqkCaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VP31E+RW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbCqkCaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VP31E+RW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4dPX2512242
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=; b=WbCqkCaVPtk9UIzR
	KDKCSMaLmcYdP1tdpf5tOpRaO0mn3OH1PnNolvBIODrRshpHOQfeyiC+HAXuuXSb
	NMa9FhyDweL/7ImGGK8oKAqobGVozeO6L87r76PpKW+7iisKT0zS206/mAvQ7DOy
	kyQZdimk5uqwwh/51UT868ZFKMrZOTn4+EN5b/SxxASJqRgF7BfceQ9oa5t9/VIo
	K6LiMfrkkofmAUwth/Rp08/e82hXilLVyHidvYkaRGkAA1aVu9T1JaO9O+qDHZ4F
	XUPdAnjZ67Sz2kIDDaDH8cdmpxJclU/KNn0vRPg4NpQRLKwZ1pGsHfr8ygRY8WOI
	bvlirw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1udua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:24:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so283816485a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791901440; x=1792506240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=;
        b=VP31E+RWjjXDpdmtRhXqyS5lIdoqFwygLrAkqc/e+meRskF3iEk3EiCtdksVwRKL6b
         SVFt9JIzmZNR7qWljPagdJZlwaW3HlqWIXGGf5xxk8PW09+oEYBhK+Rvd+GVYkoZLywt
         VJ9KYshbdJhejyfCw/wnIUWZTRdITRVWLaxzAfWP5WAdg2ooqR12BBtxwqyVud8o1O29
         4gyb4dsGS6qaibD/MflADrcMF8VV3ey7Ics79DA1+p0EtJK8g1ogp6WJknuQ71Tvzs1S
         vRKQ3jjpOIWt0xVIs0Dmt/neiRmf026SWrLovOFWyX9tTLwnUOx8TEbOMt/8l9lUAt26
         WXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901440; x=1792506240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=;
        b=x0bru4ks8+HiAc6rhXP+UZxrA5XmU92WYBMBwWbF1IGqrQIgbhpT0HIi10/tZzAzZo
         azsATIIsubx3jrzbiQ3+DnXBdTHg3Uysovx76oO8HBba5RysiqAVGHy+MtRRoHgVovnY
         SS6JaVN+G9Q6V84wE5jdF1wY8O2ANILIOsmEJAM0zpw68rRGyXaQG6VrJdXkpKfCaSTy
         7eArN3TZ9a1VvSytGq5ZdtLb3WoRDyyoKT+Uzv0n79W+bNJrkAV0PvcJQftIfKF8Inf/
         zHBGZ8+yVDoHTRydZhIHMjlblD3de1FzFE+lP9ULHB1u5TOteJymqYD77QcCrJvRP8JN
         uC+w==
X-Forwarded-Encrypted: i=1; AKwUvBxqbcHzMTQz+LaSSTSZZRZ91cRHXZ2zi28eBjQuFBigfnR514LSCXF+2BC4nq3rgz2JgVfK+j6a4xDjL902nMlGew==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPwutZXH2ycpmY0dOehMGApRUPl683Jzuh0RzdXt3OjFRedOFj
	eRzTHIyRh7BcRTAohEHoYHiKQdJodT10jAPRW+adC5Hw0iDV4gPkKuHUc6ydrr5nc1+4zenKhPC
	ov2t6AjgiogizRTMPMQLnMDliI3alUWFmcz6lNZR7ewDSpvCd08zbAjGcNpg/niXvnlbp+oaL3w
	==
X-Gm-Gg: AYBFou1JvSL2lt7li7RUDWBREoQPhLz7P+kXzrKv6uIgkpnVCHASYrBrDfrcg+4fsxc
	HxQ8TN47CukCR6ju4aD8Rn0t6FUEQkK33rHXZkr1dU/lMgptzVLAaUmphu5U+fDEySkp9ID0e4R
	g/8+ukXNtZYhXTChZUzjE9fZ4CABc4cD+DAqKoQgpi7kgFLaMfRkfikSFoqu3RSSdu49X9q/wDO
	ukUimQGcSSjBaYoMrvN1Jlz6GsTXZCsegkJw+1KQwnB8ORXxvJEF3fj+JLtteIjUP1ZUUL1fYJ1
	FC45+yejf587TUQPEzUsjoOnZYeYTpxZkmr656TLrSudI1N/6DA3Y4ojo5nuPzq0b9Ojd6OX/bW
	Ezc0ejhS27uU8s4ym
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2046717485a.42.1791901439811;
        Tue, 13 Oct 2026 07:23:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2046711485a.42.1791901438883;
        Tue, 13 Oct 2026 07:23:58 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.4.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab48a7sm5417001f8f.24.2026.10.13.07.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:23:57 -0700 (PDT)
Message-ID: <5cf4bf60-00c1-4aa3-b264-aafba8af19bf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:23:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace3f01 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Pwpi88Ktxb2v7RWwfB9ReQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=4bmiNBAiDDOXaXc57RkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PoLd2O0ip9Gct5mUHUvbBTLeAAs8XKrW
X-Proofpoint-ORIG-GUID: PoLd2O0ip9Gct5mUHUvbBTLeAAs8XKrW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfXyYeT/YN84FA/
 m4ALI5cBEOOCWtk9BhaM3zhupyLi7zHX1U3WjMOhsUHmpo0xaVscGV8/MshQo94e0cdZ92en1b2
 Wpn75YA2oNxWU6VFomA7vtF7ejr1kEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX5bkFT6N+noEZ
 Wb98C3pswYsr3NVGZ2eG6ZAhfE6J97S6N65POkmfIfTyOgpXW4csjQVqpXaOdJO+QEFh1giUwas
 SVYx/JQXO7Qol5T5Cj1ajFxH4ua1d0OI0WmDuJqBJaiLqtlQ+wdoUfOTeMzBVDvZ4ZdqjUairjm
 HGZFkjlw1bCRIDbb4xckJe/KJSExD6XG06QMfb4y5/F7FUIQsSRenf7lmqXY4+wwEles+sb6jAa
 tQYN2iaiZxXLHP34R7lB7a/WP3S7b4+/bRggJvCWiNCy4n0A5TNv+tRmd62pl6c09T/heTJ5yyx
 ruyokKky49MPP4jqsGX/llukgvFwdH17Zd/cClv3AYq6f1SRIWYmx+rpo0uH+7N993rfgXyx/Zm
 ZwE62Kqw7srWFj0iRb2AHj0/b290fLLPQLVdJPIeeN0fRYcbHsOraLe1LCL1UY5b5Uro09DMy9u
 JPJP1eakOojWE6XcPyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130057

On 10/13/26 16:01, Krzysztof Kozlowski wrote:
> On 13/10/2026 15:33, Daniel Lezcano wrote:
>> Hi Tudor,
>>
>> I noticed I picked up your series without notifying you
>>
>> However, I did not pay attention but picked also the dts files.
>>
>> Shall I drop them ? (AFAICS there is one comment) and let you handle
>> them separately ?
> 
> Were they reviewed? I think no, so that's another reason not to take
> DTS. Anyway, it must not go via driver subsystem, so please drop.
Yep, I agree, I'll drop them and keep the driver specific changes

Thanks
