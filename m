Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550FA50EBED
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901910; cv=none; b=OeYu2cT8wvV6gJU/htkRcXqBqmiH7e0gLqvdLf1xb4NMbdpnIqyPoeNday+XBI6vs2v/k5/EpyGDRb+HmFC3fFgLq5y9yC70MpCAX4xzk5vAAoPC2Tb2+lMvJGq8LE1JIo+JEwUNgtvKkyvtiltOmyGwXMsQDBHJ9cW5LgFWeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901910; c=relaxed/simple;
	bh=Xc6UXng5AfMa3Tdm3xgVuHWrr4sfMoltxMiAHnxmBU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NycXfwHgSBOtOaBhB9u1bQcT7GPWe6lP5l3yuBa2sprgTd24r9aMU4BWnyv+u5tQorkMcFTsu5gdjEHcIorMySagyWj7JztMZhoUZ9C1ifuhwp688JCFklgUcEABDuuidnGGBXj8DS20Uy91Rh7cjRX/Pmm1Vy8cspJWDI1iLyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLZIH1D4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs0SHoxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLZIH1D4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs0SHoxF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3Zpc443059
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=; b=WLZIH1D4gmyHOg/k
	cBYXf1jWGHJIcH9nlqKa/CSOjlWL6EDg0uiE6jPkwbcE2szL5VWIFy73EM8UDLdI
	Jkz8PVhdPQY2daA5dW2FHefgwewHjmh8PpVKN2aKgRQ/v/ObUCJSY8jwoN75aA08
	yw6tBPiJYpflQn+kXKugwDIjlU7OyrYDVWDG3ck7P0b0Cqs4uPkCORrC4iVlN/pm
	jqDoDj7eExStvPkiVWY2oE23F+oxOMIpK/PbYamPnvsNrvb3jk40vlq6b4ZXGkXw
	aOXpUnFV6JTuVgmg4OdpMM1TabUilDCXQthS/Y/68nALCHrizB1lF/WLEzIWpfWY
	07BOPg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71gdaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:31:47 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5df1badcee9so2469339e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791901907; x=1792506707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=;
        b=hs0SHoxFoNZhCTr9ba7f9r0jw906VQhwQssz13Ur0/2z2kM0wg2i5Lx9Nq/GMZp1D6
         ovTKz4+DY4n5FDh2nbqACDDXRtyLI3PZ12ghFRqFxP44a6RIpU9njwtR3nUOethhAnz7
         6GYlpUGmNcoliIwPvs7Igroy9OKpYYm56RSzUnKQVQ6+gdxfulhvBLUZtpHCK+IFFOQV
         79iW9eg5iWdep5X8ZWVS7W5Z9kS0erEMUp40nnp5XBQY6AyM1C/xiceVbUWQbJUUhMHW
         QSZfBgGGDeI9rnnc4ikW6+scxJHTN/8Z8dCTiMpMK5rqWSzfYIhYf8P6SCEsrtNqxYIE
         /1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901907; x=1792506707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YOqxGlLfUnOc6Yx8cld+aJVHshZXI4bRKRZq6BJB5E=;
        b=xwyKt90h2j6I8zGHxj/tii4gSVi2BRKurTgvLp1hjpR/7gLZdhHvYCW0ETUpytfG8L
         ZYmlF9WVqNYt0JvDpZbkwKXVYvRSsslwK8mXjrU0DeoRYfajpp/bZTVybtFx9MFCcC3g
         4qII92UUl2z8/0eeindcG/mkckjh40ZLGcG/c0h8v+NZaJQJtwaEcaoIpqYOYQaxcmim
         Xox5rrAK+Qug+4mV7kKQdqVAUsSSahITDJh9EK0fVSVQLSs6Xl46qVG2Avvy7MiTOv7V
         Hqt4InMcPSAFWd1mxSETpigBgdGysl7Befv8buDVfU8EVHckPaZ8gRww35MVkTGJKMKd
         2S7w==
X-Forwarded-Encrypted: i=1; AKwUvByfnyARNMu5d8WFatcasnmUow9sjm39QJcMEgVUNvXyajq0TpI3LESsuAl5NW88dqwPSrxTWlNL2ilcE+6LvtB2bw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6Co5po8OSVa1Zpj7RKH3HhA0QmGk1M7F1sB12aUiizOCyVBU0
	AX9cBQN12eNzU8OH+rutQBjMyy9hqzBOND3fSAwjmwDctlOpV7sN/i3RbO9li1cz/dyjPyKx5nt
	JcvR0al5qpzQPphYRI/mx+8VYWYmgcKzICq8lD+qLPGWibAxbOSsK0JtEABgB8vnUDjEf7mnJmQ
	==
X-Gm-Gg: AYBFou1XYjBJgcjdR3HWkNW0q+ZVhqy2rCm5LdWz0ujr5jEd2h99N4wPMWpy93s+nzk
	E4obOBYLPHqRsDrS/+Ev0ihnqS0pLCgD0XEMVf800L1c2zRUAcVIwQUeEqWT1OeG930u8ISQtzJ
	CnYtmlLAbn7j/P++cL7W4g66f7PLY2UNoFYGfyyW9nynUpJzEObDIMl5UsdlHI6Wd5uDHDMEiAu
	3MkvOeFjMgvfBD8RRq5eUtplTlOSwcWTX0N2az20UUn9Mw9SFJjbRxN4R1DhYXOYIm755Bgd86y
	aKsKcsV0fpFUMmGN6BVMXCfbxSUhn+zFgyWKtvN6TdVm1WW+W4ilqYG3AWi40Q4oTSbm97DtR9Y
	+M/Dc8l5JocMsAfXj
X-Received: by 2002:a05:6122:6161:b0:5c9:a60c:2732 with SMTP id 71dfb90a1353d-5e91f44e07cmr4248164e0c.10.1791901907077;
        Tue, 13 Oct 2026 07:31:47 -0700 (PDT)
X-Received: by 2002:a05:6122:6161:b0:5c9:a60c:2732 with SMTP id 71dfb90a1353d-5e91f44e07cmr4248001e0c.10.1791901905853;
        Tue, 13 Oct 2026 07:31:45 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.4.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm401121635e9.14.2026.10.13.07.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:31:44 -0700 (PDT)
Message-ID: <04a1331f-1375-471e-a674-87039aeb0328@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:31:41 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
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
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6ace40d3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Pwpi88Ktxb2v7RWwfB9ReQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=GpSJM9idUVmPmik-TdoA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: M0gNCOnOCNcqkEMdK73mylYKb01NuScg
X-Proofpoint-ORIG-GUID: M0gNCOnOCNcqkEMdK73mylYKb01NuScg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfXzu2VQT8DA/G/
 Y8iV/IKvKZ6NHlyI6Qd3sxuVAHTC42oV2psXKJ+saDbo0JrKlzHOfRO4OFeJdThVlcr8GP2w+VV
 lWPdKEd2bx5Ln/ZzGx1OrjaUHm2IjyADFYkfUYkbF83NTVuLnrwVIv5h2I3NEZqA7tRHHmblT1l
 jETu0gdk1FWc+c3v4goURzCCYeo/r6nj568nj4AGZ9spuuk193OXMnT5ni+vPgzP6HXW50W5ONL
 SQxLc9ATBoQPwOcvsu37zk89dwHnKAolIDE2aIrFy+0tv8LA3XzodexlXqGUMuR8PzljhIMZgEw
 i69X+vx3IPqaR9qm4YWdrD9/N/EJOfJMcIj8bmCv0mlEt4yOGYkwcTG1Yvy5rhIi45wQ8aBn/FR
 8zgdeYQFmVpn7n6nLseweg2kUNhKrnWf0nPO/OSovmyLvy8hGxRz4I+zVB5zgA3StU1Pd5i0oHD
 vr7VPRCurEWYnVATdcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX341+/XdWj4+S
 mP/y0h+aHDpsHJ/hwWV6d5HyW5wV2l/tQ6XC6TeSTDqwXaoaUukdVCECuOb0ZAspy30ZjTe01cB
 bMUYbWFhU6yXus3qlIa7wNAZ1eTOX3g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130057

On 10/13/26 16:26, Tudor Ambarus wrote:
> 
> 
> On 10/13/26 4:33 PM, Daniel Lezcano wrote:
>> Hi Tudor,
> 
> Hi!
> 
>>
>> I noticed I picked up your series without notifying you
>>
>> However, I did not pay attention but picked also the dts files.
>>
>> Shall I drop them ? (AFAICS there is one comment) and let you handle them separately ?
>>
> 
> Yes, please. dts and defconfig patches shall go via the Samsung SoC tree.
> 
> About the driver itself, I was about to send a v9, where I addressed
> some issues sashiko spotted. Do you prefer to drop everything and wait
> for my v9? Otherwise I can do incremental patches.
Well the v8 is in my tree since a while now and I'm about to send a PR. 
The patches can be dropped but the v9 will have to wait for the next 
release. If you want this v8 in, it depends on the sashiko report. Is it 
minor or major ?
