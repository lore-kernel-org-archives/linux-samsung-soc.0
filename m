Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA12571C3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 04:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752554880; cv=none; b=qYYCH+IvYvJAfCnU7CCHMDuLytzJuBbpD7c1XtEP9kiKmOU+CfMfBAoIB270YPJoXmCF1KeFiIL+CY1URRlj2KBlSmxk64xE8SQ2CiOToIDxH3s6wjTF/arsu03XsTTp6t0BJXBlcjEYjtjpD4F7H8/KvyD+ZXIuXtm2vB8JHHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752554880; c=relaxed/simple;
	bh=X5WcdvGOR4ZnxxgkKRanPZQzRvjeUHxMPCMuzd9RT9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSUtzSVjeblLFpvAl/zHeCLWC5DM6WdQ0VIYCateQuN0RAcY5pb3ciUL2dMZYRP147q3z+/UW8y7tUoMoKI9ziJ2XMXupxrunEMM0e8dkImFXjVmX/MY6EZd9kznkKwH9YrDQbaM/nwE+FsUsZ31V4rqdUXCvLo9cyZitzjgPWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTHCMFWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTHCMFWJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGL54r018725
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 04:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1G81B60xsleyJTfUNHppUdfBzYqz0JcVfIPyN+RmVmM=; b=lTHCMFWJPCu8e0E9
	V/AAabygrTtorP9ChfuHJ9QbaufTRbwAtIY2Rnsv6uzT8ZS6xO8bM8WClCszfr+3
	2UESTZeWJreQfs82l6td3wsLsNo7xAOgkgkMFCVK1nxaq0nL16cVvLakSs4lN89J
	WI/HZUoYudLihQS+dLl2FY30gwZV4AIZufsJl3kaOVET2/9yrljJ0YedI4ElPHlF
	nypIZuCALT0fhRhoUCP92kBc2JHq8t5L8/TG0IZzx2QRtDJhe4uc8AqC8RkeqZUF
	csLwdvEUN5twDhMSZpwg9ST71WieDwSh9lhcEKT1jzmlpYdexbtdvTGQO07ozx5H
	+o57kw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu86t2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 04:47:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74b185fba41so4489603b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 21:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752554876; x=1753159676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1G81B60xsleyJTfUNHppUdfBzYqz0JcVfIPyN+RmVmM=;
        b=i5nSRmfmA5fMArWXALqYcQsmAn80ZDL8zA6hnTZOB8WdrckCAzoCWZd5Mo9QrUuvM2
         lHmlQtgaWKAf3dKoRQc2+KwWVPSTF0kcYveBNThfKgfzz8gGU54mBQTlqyF3DMoZxVQq
         XiKZnbGpUjTYAbSrKGFALH9e5XvQTjjNLNelsRSYCDOkpRpGhCIvueSOp/fF6y2sYb8O
         dbFAFPMVWMcaKTrYx6zNfynbi7pgJ0Y2MfdkAyH6vi8IX2b97f6IWQf+69UVI/2h4yPi
         M72mdN+x7PDWaHONPqSq/NLSTTyHviWYv0J0Ps71tvlmFWdVBK3WH9/Egb4ZgnThyaQ6
         ZICQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUhGHa6yv0Gtnz/TKZlbXqW7M8OkcYwD8C8Ie5VIt0wA2W3rk2eLA9qKB9GNjbej/2oIfM/4udlZb2+N9+fRz3nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwueTSPj3/qIU8v0GrHVnPWU3qE+HHrrBzlioubpDlKBOGIlkp
	nsRe+VynaR8aWB0S1hxzK1sZzLMO0fFcM5lfqx6rA9dFzFhJbyCf9cHO+YLFq4rolWZ1EpGcRky
	3X8rYpR71bgvSGZWw0pKdwPHfNomFOIa9ATEytJUOnj3FrndR98raqdLwc8GAhMjpeEpAtqszLw
	==
X-Gm-Gg: ASbGncvOn8A93lbTqyc8G91/xgQBx+hPj32DgKcGKAt4uv5Nnskcpn/juWWjz+Np/7d
	BCmRkpnQWd6z2Gr4XJlf7OqAlwjuMtQUvbspxAOoZXu+EY6fkdczCnUM7WhKXDceKqwQb70ZLqO
	rHL2lG5dh41+ASZHAhQMEuzlvtBEfUOMCUP+aiWfVnMtr7jHyB2NCi7FyA3guQ8V4R1NpACbYMr
	gZm67ByEiEpqglawfhfJ25BIHrULUEXHmA6B85ZP3S40RiVnQUXti8wvjTw+Yu1Ggb1VPf01Qed
	VQ6rhKubwz2i53llJ8JcfyqnkfxM/sHDvwJRl3s94qgfZj+pTT8PPBYG/YVjtK6ualgL7mM=
X-Received: by 2002:a05:6a00:148c:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-755b4cb576cmr2345403b3a.21.1752554875865;
        Mon, 14 Jul 2025 21:47:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLw7QsQsRMoAC5kgpjcNQia8kN0Ju9KrU7l9OxO3SkPSGi12dP1bd89nTq4dVCoxD0vfJycQ==
X-Received: by 2002:a05:6a00:148c:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-755b4cb576cmr2345327b3a.21.1752554875237;
        Mon, 14 Jul 2025 21:47:55 -0700 (PDT)
Received: from [10.219.56.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm11715343b3a.5.2025.07.14.21.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 21:47:54 -0700 (PDT)
Message-ID: <08a0b50c-76e3-5c34-22b0-74b8d20c8e63@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 10:17:41 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 01/10] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-1-b2d3b882be85@oss.qualcomm.com>
 <5zlix4hfxkz447g6e6imjlatmnf26pvunnsmfkol7mhvropq6o@k7wr6h4hyqtg>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <5zlix4hfxkz447g6e6imjlatmnf26pvunnsmfkol7mhvropq6o@k7wr6h4hyqtg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0MSBTYWx0ZWRfX+7dat4Ki7t9B
 iHpckHJXb84EQ0Z+K1T4B9yA88jM+ztTBvqnT0JRY3ckUQAS8HmF62k8nKokuppN95wJ8iw/DKJ
 Vm4HvFtAmUWAvlx9AtOvMawEYKNtEqZ1XmBjBcS3HYfnUF1XelQ5Sw0b7pMZiLdeC03oj/goN3x
 YzdmAdpw0dSpFy68SPO2muMOFDrZfW/Bba8iet42Tb49u2NzLdwF2vVCEeflJG3E3S/a8bcFuDF
 Hjspd4bjL0qaHX9BRRNWz4sF98HH2Hcl78OpYzLDIboS72OhCLcCYwECHWA+xK527LT8Z1SF+LX
 dXQkc7euqqdhSRpzBfY24/7i6LiljjRa2xATCnIFnPJp9+0Jabzkpx9F68sGGB2VphaHqFjDCDu
 v9Bb45mKOwbtg0E1GGThCPnIaDgpfBzVGpQ98d8awNnHuQ4KSr0jnA2+cYHIOMxpR4MJwEAJ
X-Proofpoint-ORIG-GUID: yAOHoJmpQ7vRYdFOMuoYi-jkssZ36-j4
X-Proofpoint-GUID: yAOHoJmpQ7vRYdFOMuoYi-jkssZ36-j4
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6875dd7d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w5sRTUNUNuywR65qw8YA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150041



On 7/15/2025 4:41 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 10, 2025 at 02:45:43PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties and the device pointer for logging.
>>
>> Remove the dependency on struct device and introduce support for
>> Device Tree (DT) node-based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/power/reset/reboot-mode.c | 23 +++++++++++++----------
>>  include/linux/reboot-mode.h       |  2 +-
>>  2 files changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index fba53f638da04655e756b5f8b7d2d666d1379535..61f647b23959789a313f3af0bd967abcad45fa43 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/reboot-mode.h>
>>  
>>  #define PREFIX "mode-"
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> 
> This wasn't really tested. If I remember correctly, it should be defined
> before the first include.
yes. fixing this in next patch.
> 
>>  
>>  struct mode_info {
>>  	const char *mode;
> 
