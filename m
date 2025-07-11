Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE8E155C97
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752256218; cv=none; b=Edk4nfDCSSwcu0P9UyV8TGh2OhbcuOCEb2RjuoN2V7VJ/nfIbvawRhAooELCcO9c6vbY0gg66DVClGvfqKMrhTn34oW+zhvdoO1bm1IrpwtVaGpwHRG399B+JMiGQzsG4r+gAOHy3tq9TgbdmBsBpuk4CngoNxtu01LlfImWe6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752256218; c=relaxed/simple;
	bh=86r/sDTlSeSMo/+bzTvTxRRnHkxkb+sDRT3RGVt9qwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TBEXTQ1X73EXGDfI26L22I1A3j8rxyObdgqdaBpnqP8PaL8SEf83skBR2RpQYq7IciGyIhB1kxlnHH21xg0QNxVxJOJGHamM4s3fhUkD+lovoy2BnK7MIzGyDBlFslZqHwFIUgFzwBQnGYsz8VyP8RznApt91gDeG9Obn91qcgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gApSY9r+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gApSY9r+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAV8jR016246
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 17:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zODF07FEndKVYerePzf13yZa0v9IMBpC/Vm6umRGgcQ=; b=gApSY9r+2eAhMTb/
	78i0vkS9emlIFK2N5TD+V0KqbqrE+DJTruHeob27jHnXjtuMt6rEH6OnMoIKrZxX
	3Jq4Hr5MiTU8vX6sUu6IL//2V4H3anIsaXpeuOu0QaYGh6EQ5x45kEy0GonU8Lv/
	nLN1jzwClGo2Lr3s2CEXqhRwP8bFtWyp5WkI8xz2IMmP/8P/jxUqHbb+orW6fkJb
	WtBbHDz+O9dVEaTTVpNR3QLe7fR3brxtWx7elNWmJgiibuy2YvnEBP1TFmDrkja+
	dCF80k5Kjn7KMZFjQb1pJYRpF25bm1DDZDkX3l+rxZqa+NFHLEzIEUJvOagwF9/t
	k90SgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u5rra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 17:50:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23507382e64so24676385ad.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 10:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752256206; x=1752861006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zODF07FEndKVYerePzf13yZa0v9IMBpC/Vm6umRGgcQ=;
        b=iYhC9fjIpu8wcmVi0UVhS1IrnqbUgjBlG4Vy5GEjXpIXllbpzznoW8rZ6N2texJ0AG
         Cc9FWRFjJogTM/MQuwRx822tPNHhoPKSn6iqhaZ7ZeFUA0CE5TTLH80AsSQZp6fRGBdf
         /Cs43EFNgNjYR9nv4Ac2H2w9RrUGu3z42FiH641l1YCYjLCj6xJjzo4YZOSkOms/HHwS
         bWv1TYXF9VoXt4bapZ8T1Jx0c785KwiO6J6sKJ8Qj7fL4pnWJXnymvxX1WTLbbTlSFZl
         RKFuI0CRLbCEa6+Ifw+pi46jwYewa+i1iS2BCwxe3Lg0TWsYvNEGprLhGOkZaBP3j9JM
         ogkA==
X-Forwarded-Encrypted: i=1; AJvYcCWDuSWGRBpQh1/oHRGeNWUC14Mq0zn0KWAe7K4G+L8+Au0yxE3cbRyTERe8msm1FFE5/4HzFdh3eI5GGGmNwTctmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAaubf5sYLaI22uy6QrG35P+naUEzNutj2Os98AliaO+EgEyj/
	HNiQWh4TSOc5/j0bTab2yoZXlHsz/pnLAxCIVNRy1aM3s4k820aOQ9YAMebDyOkTVFrtWMGsvSF
	+pBBMz2Fh304PBpFzqd5XPPk+K/Q+kkCZkbvk/fUvoDX/1bxqKAav/qy4PJPJTFoWTg0QoLALdQ
	==
X-Gm-Gg: ASbGncsLwmyRnnMvUHd5VxEsyHquH5FAA9xC0H0O85tFVdNMp0asWuwQdFswemfCRUD
	6pXKdHOLavYEDA8Bd+H/uUJGt9XXdEV1y1NBVekz/hPaM14eRUPluspguWj34Vu7C9TwEk9Amm1
	aD7ziXX9bOcttK9rQVhNb0eeyHWbmuexeQgA4/my/fs1sFNjbdnQmM9NQdKolea/BvBFdQ9l9AP
	3kHmEcfUGpFXLhwdNv9OK1dELzlwD5uy95LOAnsxXdRiwX99Q97IESAy25r53CjKDNpOj2Iz9H1
	nJbpeW8hmAZTQfNdTKUrVBWE1rdT+g7yxdX0zrUnbJPNLj5z7l9U9PvYosSNV1r1VohrExEurg=
	=
X-Received: by 2002:a17:902:f545:b0:235:efbb:9539 with SMTP id d9443c01a7336-23dee1abb0emr63643535ad.17.1752256205894;
        Fri, 11 Jul 2025 10:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoW1pfrpu8TJ9bIwQOf4KOWgHALwSOkO1BYsTZCrJkUsn+7Lrx4ekRpFxTdtXkf6n8J7ntUA==
X-Received: by 2002:a17:902:f545:b0:235:efbb:9539 with SMTP id d9443c01a7336-23dee1abb0emr63642755ad.17.1752256205266;
        Fri, 11 Jul 2025 10:50:05 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e160sm50153985ad.172.2025.07.11.10.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:50:04 -0700 (PDT)
Message-ID: <42a98c8d-7287-8aa1-ad39-4d5b79e177b7@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 23:19:51 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 02/10] dt-bindings: power: reset: Document reboot-mode
 cookie
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
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
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Draszik?=
 <andre.draszik@linaro.org>,
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
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
 <20250710224740.GA15385-robh@kernel.org>
 <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
 <454c8361-151e-42b3-adfc-d82d2af62299@app.fastmail.com>
 <28f277af-9882-2c70-5156-123c95adc2ee@oss.qualcomm.com>
 <b870ed33-7d4f-4b0e-a9ae-b9c374ea854b@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <b870ed33-7d4f-4b0e-a9ae-b9c374ea854b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eK2TDVT05_awfSLxkJ-ZphqEHwuTE15y
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=68714ed7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=xZdgJlt2tE-EQpnRY6gA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEzMiBTYWx0ZWRfXzo+VfKoII2YZ
 wsyrEd69s6ULLWLySilgydJA8lkogaLrrlDt/2svixMoE1lQF7+W2SMlSXcbQMd9eSEgEtNoUxd
 XyYYIqyYXqes3yqrGS9QF/clXE+KMgpYVsInjCV5CgtVZoNvEeRwuvhTbR+J885zg8f1X9PYjpG
 iYlwbVY2OHVl1lngOCMrMId8rHL//nxk95MJ/sWU8xTV+bF3kCQk2//rzIkf5EBZsH7wxduWpSt
 juwwQJ4CYKDa41Zb3me9vSyVww8zNcaqidHGSivIqcI2bHzdmgdhWk2A2bMIGru6CkaC+RD1Vnh
 hc7doc1tpi/KrjpTAERm/PnPE0Z6akAKbyWe23510gqm+2+naDed9YRdB4qSb1exK8nXnJkJNeE
 qCJ+SB54TAhbSGLAP7Dt8vg0gu9WzCuuLKutrqkCFR+l6WJlaqorKePAsS4//rEei7ug2OTZ
X-Proofpoint-GUID: eK2TDVT05_awfSLxkJ-ZphqEHwuTE15y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=616 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110132



On 7/11/2025 11:09 PM, Arnd Bergmann wrote:
> On Fri, Jul 11, 2025, at 19:00, Shivendra Pratap wrote:
>> On 7/11/2025 8:14 PM, Arnd Bergmann wrote:
>>> On Fri, Jul 11, 2025, at 14:32, Shivendra Pratap wrote:
>>>
>>> The distinction between cookie and magic value may be relevant in the
>>> context of the psci specification, but for the Linux driver, this is
>>> really just a 64-bit magic number.
>> ok. then if i understand, this binding change for reboot-mode be dropped
>> and driver can internally handle the two 32 bit numbers?
> 
> Yes, if you can easily keep it internal to the psci driver, that
> would work, or you could just change the callback type to take a
> 64-bit number and leave the interpretation up to the driver.
ok. thanks. Will try it out. 
> 
>      Arnd
