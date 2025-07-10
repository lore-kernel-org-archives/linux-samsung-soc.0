Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221182F002C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752166434; cv=none; b=cf7OAk8xbM4Zv1vV1QCOWlOIDX2vgRcx9nPVMZTgc23N0tEV/WfwBseZwS1Mk/JYG8ksRGmbjIr1C873wd6Fb8tJmQg8zPGdY/EuUGVjxauly1CHeJwB1CWtV64WDaeTp8BeIAp6HOS4vlYyUYWIc/29SkKbaFBgtwKnskY6HTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752166434; c=relaxed/simple;
	bh=9nnYLmiKBH1VusudWulFh6i4+wEOM596AKd8BgLFv7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLHTPAdGWBawQIz4hQhgw1CVjpl156rxdCdqXJv9Pmj7mQEeVNFbJkDmtdXEFH9VcUeHdXcvJh+L/vuANbX6YebEnnTmxujVXm6qk8STwFMKX5JYK30LJNL/uf1mtHVxrrpaDu5dfYg5RTPFXyV8nlXIPQHSrCI110zhST9WvNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOtXlvyY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOtXlvyY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9TW9W009959
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfb8B/yryQh/PYLYMQLTf7EgWVJB4S9JcLJ8lU/8XF4=; b=JOtXlvyYzwn25xXB
	DnH4/ZPBSqb2hwUscr7qSxMyx0IUmJIWpou//KtU8TgKGTm3L81SsGqJ3BO6zv1w
	LzA1p2dhaSr18KnWEXBK9Fx5wXu+dm3sgt6hZrAEkXrmD9EndinnVdcuCokajMb6
	S1vWu6PH0OoQULV5FhVKKrHD4xZj5e/jShEo5rsiXpByBfwBTTVCNBMdYfESDFT6
	kF+tsApEQ8j872KG3rCFBpHjLJCBspHWZuQw9M9R1+77YrEn0YbftLksCVnkK52x
	pVzOWCIR3FIsRo2cEPz8+ovQIUG3siHH0+tZ8de7R/EFk5m14OYSG6Z9BDGbjRvz
	z8b5mA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dwq0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:53:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740774348f6so1017937b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752166431; x=1752771231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vfb8B/yryQh/PYLYMQLTf7EgWVJB4S9JcLJ8lU/8XF4=;
        b=N13NE7zh2OowHWCJibIjTKGUQACJzoSWLBExCqxrdoE5Ma2GURMYSxIdNSa3ofarXq
         IIec6OFOO2jy62bGuEMj9WUxN+SgmyNhdjnobGDbgDpT25Ud0XHT7OZctZlPHNMKVYg3
         g8rGzFZCFukjHG4DdOT00lFADBolqChKcjvK1PAcrTCX40J7qJ5qD2VqroLEAntZ/693
         2hCPvrC1thEjByK70Quy2E98GNYwRU4JSPlPaMwP+dqC5OCkLD7RJ77lW0zDEk55NTgo
         y0kk8uSTGjblVPfGqKmuInqkIYhM4U586A4P/cOzvqfbh4yNroGBlgxKPBp3Dn1OwX9k
         MSYA==
X-Forwarded-Encrypted: i=1; AJvYcCXFtemqZETwfCD4pqTncEd+p4g0fHMtCiJpRvKpAcWR9UoEM8R2kTDAwOa9E/VyWdJ0du7Po2174ZNTfQGLigy3XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjbM96xPIcHrvR27uix9T6ynhJDkojhWsY4zBwcSDP+99CkygR
	6xieOApkEU0w65pacmdbzlhMUAI+/d87jH7vrkrlSHLbSPOiW8JfGLFNWybtW915fufQkGiMTzZ
	WhhdjP6W++I4BGtfRzpBWm3YjRwyuDMUJ5Su8Wkpg5V/J091Q9XuVvwbL5R3+cOxoNx86yIlQUw
	==
X-Gm-Gg: ASbGnctWot9c566o3FlNy0x2NnwiU2Kj4q5tlA637QZ08fRXcTZCY4q732qlhSFTgpI
	513oqsYMTyfC1cJtj2tABrkn8/Ol4NzBQPpDSL5emWcwoaUL1iSruri77r6ocAFOiO7nt2Kty1c
	rmCojEcI/CMV2G/rt+fox7KKuJqRUp2wM6i4sh/MID1rIopCEZ0OUIzYCcA31l3DAxConvOZFi8
	N/P1U35hdze9EF3EJJQMh7CKEz7rVFkZxLj0wTqk3DMEed8P21wQDVw68f5Wh9xLWgIH81HKUPc
	7bRA9+KXjukhsGRM1TjNMTl2M/D3wpf5JolLPIct5DqbnrAMG602FZQd
X-Received: by 2002:a05:6a00:3a05:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-74eb5634899mr6389865b3a.20.1752166430618;
        Thu, 10 Jul 2025 09:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRSPr0EphfUz6oNUApD5i2gJBSco9YazNRfkr6HyyRBAwDmdRRKU0prxAQ4k9j6X+8VeHj0w==
X-Received: by 2002:a05:6a00:3a05:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-74eb5634899mr6389798b3a.20.1752166430065;
        Thu, 10 Jul 2025 09:53:50 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f98ff8sm2985645b3a.177.2025.07.10.09.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:53:49 -0700 (PDT)
Message-ID: <9bd63c0b-cf14-d00b-c600-9582061e3afc@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:23:35 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 04/10] dt-bindings: arm: Document reboot mode magic
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-4-b2d3b882be85@oss.qualcomm.com>
 <2d8e17ad-6bd6-47a9-b5ab-0a91689684ee@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <2d8e17ad-6bd6-47a9-b5ab-0a91689684ee@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2pQf54RhmV0njadhZRhnhl67MWxib35Y
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686ff01f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IQD7W_zIqse-sWlNMbcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 2pQf54RhmV0njadhZRhnhl67MWxib35Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MyBTYWx0ZWRfX2hXMcB17Qqh/
 hK2UxcSkCwlOfjdkdxgg51IkBmJW4Lu6MzsUXzYbbCTq6unFJQkkGUd32ZnN04KufM8aoYtdoml
 nnhd/1qdrLBIsMbuhjEpkWmkPACgNzrG0nV1G5K3JMEN/jpugbHVPAwf49TaPjhlXqJ7bOfOuAw
 ykW7mlmNfYU5e+d4V9goqCeDwZLt8tcipPTXjBemWFmTQZAW0XNyqnEyJnXfqqgb8q5NymB+w2v
 QHiB2bxa17+Xe9TrJJfBiP/FEtQBBJtXGqZOEpJdRIVzy0sv8ndWM6ZBYa5lSda8UeouPOVsF2z
 mtXYiH3GM52WFo0IzzEjtCAu95PJGSYj5FS5DPzb6YpvQvgtlbnRdkyuKDVS6zy4mG+eueNi43w
 EzkrxTOjCu3R8fAN/irzVvuu8Ki9widfSyQmFy3KtczlIf8OvOuY8LCc6ZsaT3Y5s/c+eQVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=858 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100143



On 7/10/2025 9:00 PM, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:
> 
>> +  reset-types:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
> 
> The other users of the reboot-mode.yaml binding all call this
> node 'reboot-mode' instead of 'reset-types', can you change that
> here for consistency?
nvmem-reboot-mode and syscon-reboot-mode use reboot-mode in the
device tree node name.
qcom-pon does not uses reboot-mode at its device tree node name, it
uses pon.
Kept it reset-types as this patch was already reviewed earlier and
the name makes it closer to vendor-specific reset-type.
Should we make it reboot-mode? Please suggest.

thanks.
> 
>      Arnd
