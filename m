Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACE28C02A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752237152; cv=none; b=ARdzaGulVncTm58pL5f5djltYV2KYzaXTlfEi61cLFpbecFTxJaPK98FbSE/AKFksgfWCnIzpjL8vmi1wHZtLI7unauV/Q7brCZGExFh42+1vhdtUP2g8eWAfG/4tVoizQOI7rDloqNIIoU5cOGN1FCRlXxPlXvX6f/KmiZMKqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752237152; c=relaxed/simple;
	bh=jskRVxDVP/S7EV7/YxIs2gggxobMl3QXDo9NH63okro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcLOAWlCgoi2dLuy+3EbfXBNBYKa6+62pp99ToXvJPrdiRl+NflXkmfc/69eBtf8v8paWUJoc69wfD95V4ERRlFziK0rCbS21Z2VXHgMT9LZxmDr/vZG37BnB87sjSS9GufCPlX4rsoHlzGTC1aOdqJzGrvNbIiI6zn7OnM/WDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/pjBBTo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/pjBBTo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB7IAQ023904
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 12:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+uJUa0zDVqqPkW/P6ZNncfaiD0Ik/YbmbIwujNrzqc=; b=E/pjBBToKGzsD7Nd
	aP/K0oulwHPlxsH9QDB5UjkokGaSTwp+ppzV3nPC+zT0BAr1G2IsxtUchb0/O1r6
	IXdkA7CV8TuW/2M6R1CGUEA9OTppGialSdxTjdC5tlulcQFhsGbFUpxIAY5Wdejn
	A3ym7h3zKXy/RBGl6G/H77MKPrI7+QLrsSlDnCZJN7KV9rsIRPzDY02eapz7lveF
	aZ7oKzOgavVo3GAdhfV6WxApnbgw0XnrD2vuizxgp7T753m8zZZmrSlR6jxDNbDC
	4rgx/9s1/zjlN4vrW6g+s0VCJ+K5kIBA7byNQu6EUv95pcKztrKQZlEfD0AxWhx4
	apS7jQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap8jch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 12:32:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso1822835b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 05:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752237148; x=1752841948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+uJUa0zDVqqPkW/P6ZNncfaiD0Ik/YbmbIwujNrzqc=;
        b=FmtlJgXxx2I5qdOX1sByd7rtKQ6OwuqjRXQETxceCyLQPalFu9tFQo/ipVbt1Upnrh
         jtTV//DYYaU2wqmP/A4Du1cC4+kjxVEJZlnbtxvFFZ1cHGLeXaN976OTxs2IM0YzwF9A
         2B0s+DDsE1MUZo1KSlq9gH8Fc1tgj6mbZA0gMEd9coJQINXLy1huDJU1E221X+/62hQw
         Xe57NF7qqNImgE5GAS4MkMQo9KeFpLvxtkp1yiEpTcQEMLHTGcydlcBLORqrjxePO12b
         peDYnbJ/nteJFMh9N+Jq/zwqu0+EVRpxiclkVIL/3Ed9dzhMxCmV2p8lZ5za1+TWYqk4
         KKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRDH46drGx+aoHBAv6ZHpc/wuUIGpikdvp4YVV3hlMhulk6PB0I8r3nXrtYaKO46c0xZcDmZmfobx5NOTHezQcCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhmKxNJa5lrMtyyFHjOHq4z1vIY4V4pXKyTG/Z5w7CQ8bdaUQr
	PwGkuEjpbE6fPkFu7V+sxuGB5rXMD1+9eC1JY0JnhU+RjM1Uy34XkUeBq21EcSTYyhkqLwCNIFg
	U79El5l2okbSC3Uzrd36OOeun0CcE2XPI8q+ZKvTs0sFuS4lC9AP9FcidrFX7TdahB1iKF6OB2Q
	==
X-Gm-Gg: ASbGncvMjs96QTbr+7VZy2IRWtqzmkLYZpZLD+bV3F+2gUl7viXNRpGsjXa4xaDLjHG
	PdAan/U7uUOBaQUvopDLrsYwbO0ETiLleVfQ6MzTHxgMSYwix6ApCrzEWoSrJ4UySrYXCGL8oT3
	A8NV57TosiS9iClYPbJdfaZm0rGr5sEASfWr9cmsI1IJdUpAl8z0mw1mm/uXqO7k179RUYIb7aq
	0KuUTrFTmj9xlasPkVmbtQ4ZaGi9MEyTLiNF9nvzsfSiQVsOXWY1AHNQAZLtaG6U8fwDFB8Qy54
	NI6cmJXKE1SxQ/tml1AtFCCUVX18LCZ7mxCH8SmsdVw/YLMHCQacQ6WwoIOO/TjgUMrx6Mw=
X-Received: by 2002:a05:6a00:1151:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-74ee07bb96dmr4845170b3a.8.1752237148289;
        Fri, 11 Jul 2025 05:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9gsUsqbiWSyynICyXIvV85uCk9/J6nn3GoQC+GKfjb1N1fCIuGevD1MSbYwD9kXnui8JeEw==
X-Received: by 2002:a05:6a00:1151:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-74ee07bb96dmr4845108b3a.8.1752237147622;
        Fri, 11 Jul 2025 05:32:27 -0700 (PDT)
Received: from [10.219.56.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f90d66sm5040981b3a.173.2025.07.11.05.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:32:27 -0700 (PDT)
Message-ID: <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 18:02:15 +0530
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
To: Rob Herring <robh@kernel.org>
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
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
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
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20250710224740.GA15385-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=6871045d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=PKmmUXB_vcMajKhYsGEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: Kor4Tv1HeBpE4xRUNKJDReywi0ftL9R1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4OSBTYWx0ZWRfX8wv77k5ckVvO
 dYvL00BDTjldAmDYbuWxAAL039/AUuij2EMdMcJ4FVqnEQN3eO00aqm0zgJve0+1rwhoy3cF+8m
 XHF7lrH019vFwEGgxvByJzZ1YD27J7+KJCEfY/2Z2cturzySaS1VOLyfWGmOm1o1UzGi1y6mRk7
 UeinKjwoaGbthO7+h7pRu2l0S+U2NIJZEoXp6LL2Rp4fWVGNn6OwmXp/Q2J+0IX86st8j2M0WUx
 X4py+D9Qwlo1OOEytoF1k1cfmdUYWD7gX33r+IxgnQEtdIS5fbD9zT3R4LyfHyuYjSvn86xywbt
 RkWR0+NWwxugaGKevFX9wrXhWubiwkKgwNjCOL5CWqYl+FepIKpgU7CtYZRHYk51FPLQZGL7tT+
 A920qXDFraFron3I+GXKEc/0TlPquw8P+mWiF+n0Ft+oVko4V60mWuvzdX6OVwjI176j39QG
X-Proofpoint-GUID: Kor4Tv1HeBpE4xRUNKJDReywi0ftL9R1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110089



On 7/11/2025 4:17 AM, Rob Herring wrote:
> On Thu, Jul 10, 2025 at 02:45:44PM +0530, Shivendra Pratap wrote:
>> Update the reboot-mode binding to support an optional cookie
>> value in mode-<cmd> properties. The cookie is used to supply
>> additional data for reboot modes that accept two arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/power/reset/reboot-mode.yaml         | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
>> index 3ddac06cec7277789b066d8426ea77d293298fac..a4d2fe1db51e0c1f34ebefddaad82b8cc0b1b34a 100644
>> --- a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
>> +++ b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
>> @@ -10,14 +10,15 @@ maintainers:
>>    - Andy Yan <andy.yan@rock-chips.com>
>>  
>>  description: |
>> -  This driver get reboot mode arguments and call the write
>> -  interface to store the magic value in special register
>> -  or ram. Then the bootloader can read it and take different
>> -  action according to the argument stored.
>> +  This driver gets reboot mode arguments and calls the write
>> +  interface to store the magic and an optional cookie value
>> +  in special register or ram. Then the bootloader can read it
>> +  and take different action according to the argument stored.
>>  
>>    All mode properties are vendor specific, it is a indication to tell
>>    the bootloader what to do when the system reboots, and should be named
>> -  as mode-xxx = <magic> (xxx is mode name, magic should be a non-zero value).
>> +  as mode-xxx = <magic cookie> (xxx is mode name, magic should be a
>> +  non-zero value, cookie is optional).
> 
> I don't understand the distinction between magic and cookie... Isn't all 
> just magic values and some platform needs more than 32-bits of it?
Need two different arguments. Will try to clarify a bit below.
PSCI defines SYSTEM_RESET2 vendor-specific resets which takes two
parameters - reset_type and cookie. Both parameters are independent and
used by firmware to define different types of resets or shutdown.
As per spec:
reset_type: Values in the range 0x80000000-0xFFFFFFFF of the reset_type parameter
can be used to request vendor-specific resets or shutdowns.
cookie: the cookie parameter can be used to pass additional data to the 
implementation.

Now to implement SYSTEM_RESET2 vendor-specific resets using reboot-mode
driver, we will need two separate arguments. reboot-mode already defines a
magic, which will be used as reset_type. For the second parameter requirement of
SYSTEM_RESET2, we add support for additional argument cookie.
> 
>>  
>>    For example, modes common Android platform are:
>>      - normal: Normal reboot mode, system reboot with command "reboot".
>> @@ -45,5 +46,6 @@ examples:
>>        mode-recovery = <1>;
>>        mode-bootloader = <2>;
>>        mode-loader = <3>;
>> +      mode-edl = <1 2>;
>>      };
>>  ...
>>
>> -- 
>> 2.34.1
>>
