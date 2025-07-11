Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5005A2F0042
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752254044; cv=none; b=ora6MZd80fceSdnQwG3AW9709Y5/fPWh7+carBVftu+QPpNUj2dfK4xOHUhEj9pTyOk7CE4VQnt23Irp+LW2MNONaGkEMvzkhM+cu4tI2VrNa6aXC6vngkMPp8Rrec4BSLdJ0B0H+jEhEJA7HO7bO9KPDtPUK7g7Cx8YZ3f8WmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752254044; c=relaxed/simple;
	bh=IfkgkvwrICiY1PpPvpmdoJ/Llw9dqsyr42ryaHPpX6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2bobZSST4Sgzf9IOvr+jV/Sk/xL0KBGeu8HMbiQRngGXJedj/UKxDa6GHt+n3k7Sw0PfnfZ7o+5JFEXqNNnDd0nTh6ha3klMCALmzMfFvPjmkcT1PUuxNYNJxoufD3iQIq7eYgtaS8/2iEWIFtq3qZMqk6vWsxR81StgzCAUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEa/dwq+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEa/dwq+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAx38L016806
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 17:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+yUxiWOGlCs35rCfqD4oAy1uFpwrIW5gk0AdeeQDOzs=; b=dEa/dwq+qpYCp9ov
	IwRHGfEsQXTn43yLpCT4+xX/3a7ltSkZSMokDMIE38v3evpbApnArv+9rfpFfgv+
	sE8M3YGTtI0B0kJnQ4glXiPL0ahgiGk2cyyzjmpWf7U//T312lcmwB0uANxwwqAm
	Y/g7DfZWTHTbPgzXBsnwKI3tFzsWH3uVx7Ve2i1N66S4qY0wA4WBV+vSIKFEaBbj
	SE93RvPCIUB4+go9Kd3WeUOSWupWlAiXk6YPp20rUFRTrbo+DkG9Bl0a4r3rLJ6W
	CHTF5zkuY7PP4Mbcx8HQ+ccxeHvsKOefhJkmsimVzEOQ4cjo//lOTj3+pajpdLda
	6PzSHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap9cbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 17:14:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-315af08594fso2615930a91.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 10:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752254041; x=1752858841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yUxiWOGlCs35rCfqD4oAy1uFpwrIW5gk0AdeeQDOzs=;
        b=g0I0949cBRgoGyYGVoG8+1OasI1WUy9aBx6Qo5ZY3cRR4hcbC+/7igTd3oXUcUMKl8
         CV+/2llJgi/8WClFXv94+mPdDBPsVENWQXKPJnOJNh6f62Mt9kRtAnqxkdINZ56HJsS2
         J8J/jOUIPpxweUrMtxUV7lN22liWJz2s1E2KaG/peqaX6pfjWTt8Zgu4YI4RX/TPH7aO
         aCPKzAZAoW9Pz9tZlWzGPTpoLN8m1FquGIEe/t4db0zDI0zKSB95URiTJ32arekEKXBf
         8rJ0q5ZH1BEFaOyBOMTo1iA3chSDfkKVn7v7ufH//iJi2vuQhToCjKpNM1d5EPkJ6DGe
         UZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCXlVYMBYmSyZySdl+o6jq+OuxWp35oxubOQIXTI1y6GyzTi1R3siFhFjd/NTsRXSvIqLveH6jzk+/FjhxTC45KCtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIhwZnbD0jEyzy/fxLZeTj/PqENLJAlpCrjWxWvlkXH6gRgqLj
	H8tjI4jc6MTrEI8OTQPapk4K4wyjmJJZpmoEq0yDpSf3wZclz/ypDnxelASnlSRunD+x+15MjLV
	DJR/TwJpunnmn/6owoTAwfHJQPo7NovinE8KjO035D84nr66ZbCj8VK54F/jg+a5XcZc6HNqojA
	==
X-Gm-Gg: ASbGncvx2dR4Q7/wbU2hc2LHmAXZzeNwTqyi6zbCwz1BjmNv62GmyzvdBKop9Y2ut0m
	JLmKPus3EFECeuOWJnXDg0LiYhwMiycy6i1beVasXSoHx7C2V1uye7UfRqFN+jjArMQmByFlGIZ
	f1K659avOBYAHjr9MfCDBI8j5Xx4TFbfJlTkdXeTb+QiNqF2vaUGkqoaMCalLPvAZ3ysufmsprn
	Z51C6wUdPc+J2m4K1wGbUa/Bf4BaNrAjrh+a8737lQfIqlOxvixWda9zDwNk42jn5c4s0beHp0N
	vZzrioCPZskHLDatNoe1yJn53kJxMDfSUyX1HJg3b1Z6BUcdShR50wBEs/F1+dqwipt8jTw4gg=
	=
X-Received: by 2002:a17:90b:2287:b0:31a:9004:8d36 with SMTP id 98e67ed59e1d1-31c4f512a2emr3401803a91.20.1752254040862;
        Fri, 11 Jul 2025 10:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8jwEw4xKzZ2Gauazi95OMMWknYXW3kdStTOkWdXT5CV0YXjXLaabiJCMU/29GPhFaCVApJA==
X-Received: by 2002:a17:90b:2287:b0:31a:9004:8d36 with SMTP id 98e67ed59e1d1-31c4f512a2emr3401777a91.20.1752254040270;
        Fri, 11 Jul 2025 10:14:00 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3e973e80sm5633493a91.15.2025.07.11.10.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:13:59 -0700 (PDT)
Message-ID: <b6f4819e-462d-7a59-eb19-bfb65ec27229@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 22:43:45 +0530
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
 <9bd63c0b-cf14-d00b-c600-9582061e3afc@oss.qualcomm.com>
 <23e0f0d5-c0f6-4fc5-9775-c0ae73681d31@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <23e0f0d5-c0f6-4fc5-9775-c0ae73681d31@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=6871465a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=rM0-y_1GYM4-gDGtagQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ts0bxn5IICNldQrnQvigxft6ZA6it3Md
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEyNiBTYWx0ZWRfXy2xapNbKfOZI
 CHtgocvDtK0q2kXPzm/JwVjWfI1NOlt48n4q7inBZ/sQog12lpdEJNph6ePQapLHbzVSMQm3bM7
 ks2ECbje+0d7WHrNHoAl/xqDvtkYtftQxSIP6dBmfIqc80c3/r7f1bR5d758sMGt7RfMLdtESbH
 rMc8RT96csVFrk1XIriYHlKE5q1PctfCZm1kLZjODqfdJXh2ek6pnXSW3XGnwQoV+u1aWvf7VDM
 36yX76olBvFRoHT6bmKXjtjItF2QfD2c5LsflWRg54I9jTQNkUOwld3OvKd0U4/9+f2HZaFipcP
 n8SSmZdkVZ7Dyc6TM8yQH/okMNY9duJevGXklosusm7AhzJYix8lrIibu+6RVgZTAFV3dkPC1Gp
 oufJhs3jyX/fYHajb30Vy5Sqr5hRaB8Fc0W1bF55GlVPKGeFyO+w45OEfHLU5HpetpAbnhAs
X-Proofpoint-GUID: ts0bxn5IICNldQrnQvigxft6ZA6it3Md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=843 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110126



On 7/11/2025 11:10 AM, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 18:53, Shivendra Pratap wrote:
>> On 7/10/2025 9:00 PM, Arnd Bergmann wrote:
>>> On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:
>>>
>>>> +  reset-types:
>>>> +    type: object
>>>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>>>
>>> The other users of the reboot-mode.yaml binding all call this
>>> node 'reboot-mode' instead of 'reset-types', can you change that
>>> here for consistency?
>> nvmem-reboot-mode and syscon-reboot-mode use reboot-mode in the
>> device tree node name.
>> qcom-pon does not uses reboot-mode at its device tree node name, it
>> uses pon.
>> Kept it reset-types as this patch was already reviewed earlier and
>> the name makes it closer to vendor-specific reset-type.
>> Should we make it reboot-mode? Please suggest.
> 
> Yes, I would still change that. At least all the platform-independent
> drivers are consistent that way.
Ack. will change this to reboot-mode.
> 
>       Arnd
