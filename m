Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95DD2EF9DE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752165260; cv=none; b=RemcWDBEd8H3wvLUwkrGBTbZpzlJzPopacYrU4KV1AZF6QYzhahwIT6v3fJUhJzG6XwEShHirdx59I8nIWpr4AAD7YKZgAEWv2i+kfR2dA8Ff67YgOUcjWPkC2R8TYhJEIOQx8AKFzgAfsF3PO0bWW0OEozrxRB4iu19VqWOUGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752165260; c=relaxed/simple;
	bh=qoxdD0u7F6Vm7IosY+IvImJNAwzJZkJIJRozDDanEIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLNVN/ARH74+pZIDSRpJkdN1NnQeApzKCNpRhMeI5jI7LOjv6VYPe/aMiYT9v4S77W8PBgm8zDY0vr24O7TwV7RIm+b8Afqa4zRQTGq4l3XQLXvg1INCXLC/B6gHzb/1Ee+KUwQgB8zrUitJyTLWVuD6LzhBrVCE4mCMdE1SI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TiuGIBY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiuGIBY+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8kAx9016804
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7v+KOlxVQQuHrXP2BzwGqdrb5703hR1R+qZ3XSvsTjw=; b=TiuGIBY+SnjWlHzr
	SpwydSFznLuBhG8LBEgO1Ue0EtJ5+OYdCJkHMLN7KKjO64vG2Wx3zbblqK3noMpe
	JuDBJwojNhChgZKqIAh9XHREznOLHrFR3uBoX/3evqqAbfQqIB04NyJ/UDz8y7N7
	I33HJaPPCrLugdSyTnjHY7HgafayqwwgytzWaksUwV/TtnszfXmhFyAk2RJqfXiB
	/FQ80qAZJXSaz31ewu3sPKRQ2Uf6O9JEakaaJMVu3z/vDErDw85jYG7qmDn/MXuv
	xUepfDi9U4e4Xuw5gBxlYnuEjy+vXCRY7Amsf8KDJJRMUadsUY6uVGbFFKGzncro
	C8Ls3Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnwp2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 16:34:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so12506135ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 09:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165257; x=1752770057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7v+KOlxVQQuHrXP2BzwGqdrb5703hR1R+qZ3XSvsTjw=;
        b=U+INWSlE49FlHWk1zxODUaF/pgrCjfWMyugaqoYD3X1h+liQJkmRCM5X6xG6fmRp/L
         AeyJX/9VXf/s1NrwvQqKsaJHU07TAGYfYzZ78nN4lmxpDG4Din7pdSD4C/KtWSsrCAyi
         05N2UMBrROwelOS/9eswcktw9uKYFVENev8wAi16AhT0JMn0Vl1cRF6usciwI5JN/0G0
         lfF9iQMkVSgnffR4b0KXLaplYTLzMt4UMQQRx/gS/JTwRoIF128ZY64JjT0kaUcDX3O2
         bd+SKbptbZMlmV8MiQWEjScXCkhYTjBKymQKK+3CjN6JiBB8Gta/2wrpdtFj094Ch2ZP
         zmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc1xNgXesJCjH5k0gMx2pwfvK8t6qoB/jMxsQtBUEigNFAql7k6gTF3Hs78GoyOv3rOmoxOSB6cnIPWKEu0sSDIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrkJrTsGRp+iRftfA1MaO/eTPcdU/8NemofYdsGUoaq6572xf
	nLcnm669chc9ZAXH6aAKFQMr0S1nr4yLTNqLJKf0rDAX94VmpySYPoXpPvHkE8pwHiBsLc2Jo6Y
	fINuRYznmStWpfif7WTB5x/zqFJ69T9NS6MCKtCbcLFpZvh8W3vptJKDSTH+IVb+j++NGWDEb+g
	==
X-Gm-Gg: ASbGncsqNIkJPUYMqtD9yIsOPOWt0o1JEnyj2KiSygv7gjSspTIJcMbNX0CaBQXsfX8
	c8Qqh3q9XF7oYfUXlm+iHOLOtrolHUjmSzu4FN6c6v8gc6avwt5TPW5UfP7vJ/qBJ18rlrsQGb0
	Lj/YGRCe1GGxeSHcw5ep2gPOS2uCUsx1Bc6eIrrMiYJkjlKfTIMjkL7lSG3nWi2WqeEosRLTvSS
	dBYkLcm+8H27DSrcdoTyf0XngNwgfYMH/IOfVf6iUzLr5c1oKlZoim9LbdzExkfVbP7gyfJYJ7e
	IcjfAjmmARjUgE3ZlqvWKUnTJp8HfBa6yBzwO8yGAB82M1BmyddzWC+T
X-Received: by 2002:a17:903:240a:b0:23c:8f21:ac59 with SMTP id d9443c01a7336-23de4870255mr58912445ad.29.1752165256689;
        Thu, 10 Jul 2025 09:34:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB4rnPjqJKSrNHIQvF405YfcZfT/Y4T9Mez0G2+iXfOjNPRdQpTDwA1RKIVvdQzWG4WI0fXg==
X-Received: by 2002:a17:903:240a:b0:23c:8f21:ac59 with SMTP id d9443c01a7336-23de4870255mr58912015ad.29.1752165256183;
        Thu, 10 Jul 2025 09:34:16 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4365b10sm24645205ad.240.2025.07.10.09.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:34:14 -0700 (PDT)
Message-ID: <62cd2efe-2a82-72b0-c4e0-df8a0d8fcfe4@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:04:00 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 05/10] firmware: psci: Implement vendor-specific
 reset-types as reboot-mode
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
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
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-5-b2d3b882be85@oss.qualcomm.com>
 <4ca0df4e-7697-4cfe-ada4-6eee8224938f@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <4ca0df4e-7697-4cfe-ada4-6eee8224938f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MSBTYWx0ZWRfXxabL3LZrkh4X
 WE2ZtXxWzlwnpg13Z7v+e4FKUigNDVcrEQ12BQBZY5i6eJ13ZuCGc4HNv27dXRK0kH0XcxOeDGE
 6rwlbjwU49IS/IwuiBK5zGYPOv8zmhMTS6JcQ3qFa5q3K1B4rmbRMO+qnpnLkg7Y3GgvUcOaI7V
 ILUHkWnxA1vGFAW9AWkwcdtxIav0IatwZE0eY8+le4zfJEqIZgFGZ9x1kY2bhuSvopdz8rQTL9F
 +vBWqvvmTyu/zrYp61S/fU6VtCGRNCKn2EOauEnFuObIqdExZJV8fkl/pSDINyqc8nvPw12Dmk4
 dmuqdQDWBqlJtMTyJTZJZSQp0gtibJ29MaUv5cMKNwISubFczfqsCgRGojyJCZAbqXTWDyPAGv8
 phawXgnxOTuILVLl/FtqLhFSl1jVKFhUCWLg5iwsNBnScNSyHUkIWGofiJJJsQ5j1oTdPuf8
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686feb89 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IRR_k5T4b-fJqLONmWgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: mof0OGM_-EIlRYfpdYRXO2Ljb9eZ17OK
X-Proofpoint-GUID: mof0OGM_-EIlRYfpdYRXO2Ljb9eZ17OK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100141



On 7/10/2025 9:15 PM, Konrad Dybcio wrote:
> On 7/10/25 11:15 AM, Shivendra Pratap wrote:
>> SoC vendors have different types of resets which are controlled
>> through various hardware registers. For instance, Qualcomm SoC
>> may have a requirement that reboot with “bootloader” command
>> should reboot the device to bootloader flashing mode and reboot
>> with “edl” should reboot the device into Emergency flashing mode.
>> Setting up such reboots on Qualcomm devices can be inconsistent
>> across SoC platforms and may require setting different HW
>> registers, where some of these registers may not be accessible to
>> HLOS. These knobs evolve over product generations and require
>> more drivers. PSCI spec defines, SYSTEM_RESET2, vendor-specific
>> reset which can help align this requirement. Add support for PSCI
>> SYSTEM_RESET2, vendor-specific resets and align the implementation
>> to allow user-space initiated reboots to trigger these resets.
>>
>> Introduce a late_initcall to register PSCI vendor-specific resets
>> as reboot-mode arguments like reset_type and cookie. For a SoC
>> where, PSCI vendor-specific system_reset2 is supported, the
>> appropriate value gets filled to reset_type and cookie during
>> this reboot-mode hook registration. If the secure firmware
>> supports PSCI system_reset2, restart notifier will make secure
>> call to trigger appropriate requested reset type.
>>
>> By using the above implementation, usespace will be able to issue
>> such resets using the reboot() system call with the "*arg"
>> parameter as a string based command. The commands can be defined
>> in PSCI device tree node as “reset-types” and are based on the
>> reboot-mode based commands.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/firmware/psci/Kconfig |  1 +
>>  drivers/firmware/psci/psci.c  | 53 ++++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfig
>> index 97944168b5e66aea1e38a7eb2d4ced8348fce64b..9d65fe7b06a6429de8a26d06f9384e5c93f36e5f 100644
>> --- a/drivers/firmware/psci/Kconfig
>> +++ b/drivers/firmware/psci/Kconfig
>> @@ -1,6 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config ARM_PSCI_FW
>>  	bool
>> +	select REBOOT_MODE
>>  
>>  config ARM_PSCI_CHECKER
>>  	bool "ARM PSCI checker"
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..87293f78ed83eb33ba67ded73728729811693ea3 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -13,10 +13,13 @@
>>  #include <linux/errno.h>
>>  #include <linux/linkage.h>
>>  #include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>>  #include <linux/pm.h>
>>  #include <linux/printk.h>
>>  #include <linux/psci.h>
>>  #include <linux/reboot.h>
>> +#include <linux/reboot-mode.h>
>>  #include <linux/slab.h>
>>  #include <linux/suspend.h>
>>  
>> @@ -51,6 +54,14 @@ static int resident_cpu = -1;
>>  struct psci_operations psci_ops;
>>  static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>>  
>> +struct psci_vendor_sysreset2 {
>> +	u32 reset_type;
>> +	u32 cookie;
>> +	bool valid;
>> +};
>> +
>> +static struct psci_vendor_sysreset2 vendor_reset;
>> +
>>  bool psci_tos_resident_on(int cpu)
>>  {
>>  	return cpu == resident_cpu;
>> @@ -309,7 +320,14 @@ static int get_set_conduit_method(const struct device_node *np)
>>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>  			  void *data)
>>  {
>> -	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>> +	if (vendor_reset.valid && psci_system_reset2_supported) {
>> +		/*
>> +		 * if vendor_reset.valid is true call sys reset2 with
>> +		 * the vendor_reset(reset_type and cookie).
>> +		 */
> 
> This comment repeats the line above and below it without
> bringing additional value
Ack. will remove or modify the comment to make more sense.
thanks.
> 
> Konrad
> 
>> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor_reset.reset_type,
>> +			       vendor_reset.cookie, 0);
>> +	} else if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>>  	    psci_system_reset2_supported) {
>>  		/*
>>  		 * reset_type[31] = 0 (architectural)
>> @@ -547,6 +565,39 @@ static const struct platform_suspend_ops psci_suspend_ops = {
>>  	.enter          = psci_system_suspend_enter,
>>  };
>>  
>> +static int psci_set_vendor_sys_reset2(struct reboot_mode_driver *reboot,
>> +				      u32 reset_type, u32 cookie)
>> +{
>> +	if (psci_system_reset2_supported) {
>> +		vendor_reset.reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | reset_type;
>> +		vendor_reset.cookie = cookie;
>> +		vendor_reset.valid = true;
>> +	}
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static int __init psci_init_vendor_reset(void)
>> +{
>> +	struct reboot_mode_driver *reboot;
>> +	struct device_node *np;
>> +
>> +	np = of_find_node_by_name(NULL, "reset-types");
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
>> +	if (!reboot) {
>> +		of_node_put(np);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	reboot->write_with_cookie = psci_set_vendor_sys_reset2;
>> +
>> +	return reboot_mode_register(reboot, np);
>> +}
>> +late_initcall(psci_init_vendor_reset)
>> +
>>  static void __init psci_init_system_reset2(void)
>>  {
>>  	int ret;
>>
