Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558352EF9DE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752165635; cv=none; b=n5CdAJPpd6ZbU4BMK6cn61hW4f7A6Z5M08my481TC67boBpD5bnI/xTC39DPwPTrO9+4/EjMQFRyaeIOzcGgoCf0AhrAcpGpVN6C1xBKFAyAp7BCfjDKUdXpYFiIRp/zroD1JV90LYrXSOljYszGRZY2EysLIn8qTvt3sx+XFh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752165635; c=relaxed/simple;
	bh=ljHCphOxR+d5BJhBNTsSZ8hoSOVodR2caCmoIY1SWxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3QGKEYZAUlPxrmHgD1eTx7TEeWC8G990a+t8wIfzybSTDS6hkeevY7InQRJ2pdHIxA7fMPTiJspxbce4pvLUZBVh+Yld9dGdEIJr4w6YLbL81NMzJMQU3HzjpF5IygMw93EGpq0/xUph4sqJH+7xZ+MJOJtDrmBsUEeGsjQUlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3IfB04r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3IfB04r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ADjeIC022579
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBTG/80ituUWOqNVevH8q7s7UN0DFkGF9rfsMiylJyc=; b=A3IfB04rdOspZSph
	YfFzQX8nIIovs+lWueNxyWlgP0RIrMq7RwTogh9qJ9i724N7FYDXh8aU/ejIfbG2
	xjmdPsQJffatVi5fEWbxy5e8aWRYZz5JjFjOuA7eFep/CFlf1zdHhJLu/ebTMQnT
	RSlrEJmwpQhG99lYI5FTf4mpdxYtuxrgC3ghmyVFYCjFa+5bMqlhNB6WUCEynjrQ
	NXfkWeLbD4++UpWrrGWOH2KjLUohhLlNxOylWG6/c9YzD8k8iEUjrKpiP0XXArwd
	L54M4aqokyLNcSdHy40oNPu5BPdqnglCn/Us3mufkO2X0wcILJDff0c5qJSAA4kO
	IoBUxw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u1y6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:40:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74928291bc3so1049330b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165632; x=1752770432;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBTG/80ituUWOqNVevH8q7s7UN0DFkGF9rfsMiylJyc=;
        b=nby+J5zQj/bnDBZiRO2EAJj6g1vszWLiNW4Tuyzlm5DdjiG5+6TU1fD2cqkUA9sfA5
         kb5caeVl2J3UPXV4Uhfbya6A6m5nXmttoDbsOqoMGxeCihHscg8jcVSgX6L9x4ha+1fn
         zTVGRAXeMLWfJ6BKjVuLPBJmlDPNjqWDtbfCODk5So6BHJNYKBRnRQlIqnY4wGvVozc8
         pxPSHKzbdUtsiqgV0f0cIFP0eZdC6mUms2GDmQ7r7QYsQ+bxeDvrVEBU96khblqRW0h1
         YrHiptEg/b2fUdzZoLv3yZtVCBGuKa61iKnDmMHCwDFSjcGiK+3QN7DZ/XO5nJw0u6W2
         uIug==
X-Forwarded-Encrypted: i=1; AJvYcCX9uX8Ih277wH+D4TFUD5DmAQR0KyTpecxl8A7k4SifHFWKGzIR112xUZmHb3FbKmvpjsrukzsw8EPJrhBGdLpAwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL0+05dr9HceUmMDMLhfEZMBUp9Qs/s419JxmLlPjT34a1l8vg
	iwamfciJlqoukod0fA8TDDsuRZC8m8EleMfNq1Dq2BOen7fjBkgQBRqDusGF5QDw3AjiiwwvRH6
	cxwFl28m2qOViuyiYO38s63PolHzCdhFfMkgwSvG38Jzo7U1cmWrA2XtlWuPmEVdyv38coBPWNQ
	==
X-Gm-Gg: ASbGnctdWh4fjVbhQznm9NxxeBrtK8ZBW7lZQDswq9VtQsH8WZDxjLLuViE14MaOfNh
	T8KJzEqkj7AB6o2aC3GrYV94uBesINA0aLu0pSE3pOd0JYv7XOWDssAJeIQ43GchIm30ZnZsars
	aCH8MAbiVfeQLY9oZzx+b2rOE8x3m5Ei18LyLiVSvQBVR9CPR+RoUyf7g1hY2NrpH5UODHdWvmg
	b+qHXbfldTRhUV+CYfHEfQrnu67f0HoYWwL5W2LUB30TYg5ysHpk/SlGNDUfys64nICsxGqzn7/
	eNDbGuWZwGifP+wev+6Y935ekzS5vaVKdkUKA94cOmgrNRR9Wu2WKg23
X-Received: by 2002:a05:6a21:6b0d:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-2311e53470dmr106329637.9.1752165632431;
        Thu, 10 Jul 2025 09:40:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHydOYOyhSewH56uQb9WOivpcBapw9P+fJbdPXdbKRn77lJVLdsVx7hajLvC2ylRUs5DaV0Pg==
X-Received: by 2002:a05:6a21:6b0d:b0:21f:4ecc:11ab with SMTP id adf61e73a8af0-2311e53470dmr106276637.9.1752165631958;
        Thu, 10 Jul 2025 09:40:31 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8f878sm2576220b3a.166.2025.07.10.09.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:40:31 -0700 (PDT)
Message-ID: <23323fac-7ff7-0179-3cf3-99bc070f8778@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:10:17 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 03/10] power: reset: reboot-mode: Add optional cookie
 argument
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
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-3-b2d3b882be85@oss.qualcomm.com>
 <12c9a69c-7e27-4d43-9b1b-542e735176ec@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <12c9a69c-7e27-4d43-9b1b-542e735176ec@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZdOHucos8REd1GvIwxzP1Yd45U_8LYgL
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=686fed01 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=sDLv-8AjHc169E3Bnz4A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MiBTYWx0ZWRfX8A7telHnQdfA
 chrnvCrQq3JeB7kW7PKtYDLUAI1lD3YMt2nAAfUx/WdwbZdTiJalOIc2WeIZZGVVMZyvXCI75QT
 zWOTyGbiFa4eMBidXRQq1Bz3MYFhmVpEGX0A7j9RVffwK53WSiMaZSUqmWhKZ7WUjnUPikz7TCK
 dG+3lQvKXfFnOo5aanw80F2BHrtaBLf0YAv9S0Pz26XNPINHuenvuKjkQ2Dq6gwZdyQ+WahT1cg
 RKvOKX4RKHydkqzW9mHoFo7M7IScfdTLInDlkW/dxuevDkAqwHLBo7o43UcjIzzXXPFS22dtqiO
 quOxxXjKIpI7ygiEmYgxh/mL+qC78OQLbagY3IUcPY7n/JEd6IDpbzcekC9nEF/mhIw/xBBHA8s
 Yh6xzd5vfHqilKSu2nz6cd56t6JSDdnsS7PehIUvKOO7GNurolTCz+mBOKLnrpr8habH8kph
X-Proofpoint-GUID: ZdOHucos8REd1GvIwxzP1Yd45U_8LYgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100142



On 7/10/2025 8:59 PM, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:
> 
>>  static int reboot_mode_notify(struct notifier_block *this,
>>  			      unsigned long mode, void *cmd)
>>  {
>>  	struct reboot_mode_driver *reboot;
>> -	unsigned int magic;
>> +	struct mode_info *info;
>>
>>  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
>> -	magic = get_reboot_mode_magic(reboot, cmd);
>> -	if (magic)
>> -		reboot->write(reboot, magic);
>> +	info = get_reboot_mode_info(reboot, cmd);
>> +	if (info) {
>> +		if (info->is_cookie_valid) {
>> +			reboot->write_with_cookie(reboot, info->magic, info->cookie);
>> +		} else {
>> +			if (info->magic)
>> +				reboot->write(reboot, info->magic);
>> +		}
>> +	}
> 
> I don't quite see why we need two possible callbacks here, could
> this be done with a single '->write' callback when you either
> add another argument, or extend the existing 'magic' value
> to 64 bit?
> 
> There are only a couple of drivers that provide this callback,
> so it should be easy to just change them all at once.
yes. Three driver. Ok. Will modify these driver's write function
prototype to accommodate the second argument.

thanks.
> 
>      Arnd
