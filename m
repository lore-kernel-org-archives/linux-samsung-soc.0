Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB02D0C99
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585963; cv=none; b=LOY/DaPc0GjfnlCesXa46udU9/LPKgtQoiQdeNDMeR4NZmS9adc2T/8SMGzWF/u4p5LMN68ThSo/h0uxeLxA4iwshPeBxcD03QAewVAETrY8pUf8Js5vSI3k6WA3h9TTHeIJT4vABqVbFOecugPH/Fs1gOdRVYLstICuH5X59Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585963; c=relaxed/simple;
	bh=pp+j1K2Fr3LbHSJsot4sOhc4rV6JB1+epx0dGqCjXRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XPT7SUc2rr6fe27QS628/vlkE8TR+uk4tRmgNviiuhZ1QC2oyz0Y0H/3/m+85c72yOohZfQF5URQwQZBVUCNO7HKHOARQcPuMp4gNnMyFlXNNi5HwLClP9OEIHYEHRDC1eegx4ycwqtrenil7+OjKNdYPWwxBWUWyBtjYDX+MBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPhKn8bS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0GycAm0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPhKn8bS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0GycAm0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GG7NAU3582785
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFe/Zyu73JAIFNPhxSkP5dPKs9Oxi7ZqadctkHY0IY0=; b=NPhKn8bSwthqbOyd
	6Y7z/d/rxoGOTu9ZaYqE1leiENFctAJtHdPZUrLZTSFdGOybqo17WRwBAM56fenC
	hCZ1sfV76OfcKki1WbD9pcI4foGARbIVrq4ZgPRKx0Mbi+gX4Vvib2aUByGDCm69
	ee/d9PI/p6hyfFH/pOn4AW13Hqn8B26qFCZMrLDO5bXljdhWmE/HGgC5iOeXI+lu
	CMeDVFutRikt2sXyhwe/Q4VQsG5KnV+8AOcT0Z64UtGFaxvXDKs4GiFwZD3p+gl8
	A5WravHQxLMRJVijOUWGEllsgmInaDAtdA82whpkdeTjBDJMO3LpB2KRoWUSrSD/
	5wHLHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9ayu28h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:52:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6ae763d03so77562185a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jan 2026 09:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768585959; x=1769190759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UFe/Zyu73JAIFNPhxSkP5dPKs9Oxi7ZqadctkHY0IY0=;
        b=c0GycAm0D6uXTN+umqx9/ecSHd6r6yUC/syUO4YN8JIzuJtAkXPNt93XpUvX889uiP
         JExZqeSZR7s4MGpNNsaACUEWJUMPLPxOaj9E8jJABVZltZJxFgWBcanpxrB75pnEJyKX
         Nas5JYlu3qJEPp9jOiW0wLtS8caI/i2a2mQjPk3AfyNwQ3soMSXPCBO5Mf8EeDXK/2GI
         bwTXEf45vF2XoFEOtC837WCrfZZKTRt3EUA8sEcKAcgTHqYcP001OwvKTLqsj2hfdoqG
         rNezcCYGu1aBJA6OvbTmpHsMBdx3XuZQayZ4NOw3S3lGNNQwAD05X9fYsZsuI4hZQpcs
         br2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768585959; x=1769190759;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFe/Zyu73JAIFNPhxSkP5dPKs9Oxi7ZqadctkHY0IY0=;
        b=AXLQsTWFsMh/Wy4SebUADZ1kN4jQox1SFIPI+3s4Cgty2U+Pz7sF6+byRlHqy86fWS
         vXF8/+noveBLl275+puOZ/P86vOKXQ8GGN79NtfTuvAJsY0heCUE7+JSdFOorCrpVdTM
         jrs9k9P5Se2Fg5/dqON5XUDTzMDgXDEr6vrv6sA12V1NtsxUO1ITp5b4iYx7/6kThS4L
         bIQiHe3Gfh4VoUIbawsCvENBFo+Wc1a1gIsdilqWYM0qz9zR3cs9v5JDKfsFJWH5DLAu
         ZbwQo8dT5v7dfIxlUowTPcmMoEvZJg1Q8obg2wZCqZcjRfSYl04gjg0wSpisyaDu4g+l
         DWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhskeQld5YW/BOcmwgZDcn9aE5XfUzg6qvEfhuPaRXtp6g8LH3OdrbUoZJnYYE1dfGv+a/G8somwMEOBJbqCv6bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zZeyM2Js18uZuN+WIzLqA7yAue7lRrROBHXWHlv/cfB9H0FH
	Dwv7oxbzeoySKXmZOpqWODZ7b1XeaUTBwL8UqR6douJ2lFpKtfnFKSFPjryOSy+Bu3sw3yeS3mC
	IdaEq9guljPeCPYZ5ZHlOEZsD5ILYS/iF3klEiBcOM8p4ZHk85zU/ZUani2/VdJ7NKfia9GDcrw
	==
X-Gm-Gg: AY/fxX5L7wc2o8TTvXvFhtN3MUi0lZu2bNjFNLAVu9iHLiF7fdd6UfLpX+X7JenJ7DC
	d9Evp6Ur9wnskV60JMvAhHT6IjEQ0aPM7Xd8hMfpQzODPIoPaGPqXPVq/tKmyb9c7G7FgdJ53hQ
	qkpDeUuuvS8YZwoqJuv/GSIJsUNFFa8O0y06FVUnOB9X4L2C0wSTEwqN0I5IpUmkVbDTROVmwrW
	KlobdZcWXvbo64uk8lls354jO752CC4qrYPBKCDRKYxxejp9U6auSr9Of0AbCh0iRPlBS6b/qPt
	23gJ0I4XNqpRUlZFF8ydg6jQyva3Ij+qCrbysL8Of3ce7u9msZGFTdoC7dIiTdaasIteaXlo6rs
	ZIxfG1/P1m3RT0gsQ8/SYmQ86tLF0CYC6YByOPw==
X-Received: by 2002:a05:620a:1a25:b0:8c5:310d:3b26 with SMTP id af79cd13be357-8c6a6718326mr548618485a.35.1768585959228;
        Fri, 16 Jan 2026 09:52:39 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:8c5:310d:3b26 with SMTP id af79cd13be357-8c6a6718326mr548615585a.35.1768585958760;
        Fri, 16 Jan 2026 09:52:38 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ff1sm6330385f8f.13.2026.01.16.09.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 09:52:38 -0800 (PST)
Message-ID: <a2cc5580-cd5a-438a-a207-55a893d64e56@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 18:52:37 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: MAINTAINERS: Remove Krzysztof from Samsung PMIC
 drivers
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20260116175055.102993-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260116175055.102993-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NKuDM-wFIxTI3EKuJG06duvE-02XvZcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEzMSBTYWx0ZWRfX7NTFd+XJ3Uyz
 4WAE45FLy3LTyLQlgKuszY72gmbO48wPX18cQvigko3HzhyAN9GgRJj6l+rK1jG/UrftNxudHJC
 h0eqTtCF6r2Rx/lb9n1ePyUQLxPw0QQ0/J3SGe/qEfx3hcAU46ZNkhmdQ4G6djCBHHAWNjtbDeV
 6gfAmp1YnZSgMotofnLhJnX56WjL9m+0dJ0DrQaId6IS0LFcmmtZlj9h4g41htC6r0jPPmBSaSv
 8a6OpkZ2kr/CQ1wgZ9KmfZ8SqE1ldz++h2gdRGyaupoYv2/0zvQSujE3NfLRMsyFb8CmU1enjEL
 TkSU5myfZiDBXsDbOWUhVlR+8HPoLX4DdQGX0kcbccn8veOBgjsBVhzBU/K9HJ/6WWBIwDiCCts
 FcC4QAHmUBTrV8K+ymOMy+RwimgeLCCjlgXcKaRbxD2ZY/F0bJwkauqu8gZ1oDH5vzm9/VxcD/m
 bhF7uJRMsWxV6K2Smlw==
X-Proofpoint-GUID: NKuDM-wFIxTI3EKuJG06duvE-02XvZcF
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=696a7ae7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=iLbRcsS8QBo0z5yrdRQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160131

On 16/01/2026 18:50, Krzysztof Kozlowski wrote:
> Due to lack of time I did not perform reviews of patches for Samsung
> PMIC drivers last year, at least not in timely manner.  I still can
> perform limited testing of the code on hardware, but that does not
> warrant having "M" here.
> 
> Maintainer should be responsive, so drop my name and shift these drivers
> maintenance to André Draszik (from previous reviewer role).
> 
> Cc: André Draszik <andre.draszik@linaro.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Actually let me move myself to credits. :)

Best regards,
Krzysztof
