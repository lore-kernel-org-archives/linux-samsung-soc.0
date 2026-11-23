Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412927;
	b=Kin41b/ap3WoilrYBmERrzWw5bpZLKAkXcLF/RInHjxSPstyuOtqVERwYT6+v0UYEYSr
	 9wMtWH/UcEK8L9i1BEOjbpVz2vAFl0Dr+XYSQ3r+1zRi4eIpjZ1n6/Gi4+QI9RkAs6RAA
	 zKbw8Vd3H2IBjd2lDtlsoJ+N3rVkNVwKthNu4bMr6hDa1oAgK5WmMl2Bz/efSMztVPx/3
	 ttwcqte4tF4l1fZxbhpkboJlNpRdSpwFR5/9hYLNK3BW891U1ycydJSWjW1GoJmLTMR6w
	 3qjf6GmmTSqqD3b0KpNASRD42ONMenZEBA1GrzV83pLK9RGj4dA+/k53EGnf7J7wkKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=;
	b=IqsOYKiqGnlachBYkibsqMYiWIklr+LHrmLBRPA7YqZZ1MOf2T1mJqJ87yA+8czXDsfY
	 YYPNu5Xn8ahMdjBlTPqISwJF9hOF4ZttJyaRnCXFrwVNiB52QbJp4IPpxBZjUmSWsj6mc
	 codQtk3Cq4q9rYVPGXiQk62lj3KPPz0KrCKSFCGEd3VfogenQHcVBx3/l9lZc23JESmAW
	 vtVTP/fbwVzhDu49i2WIVsv+FYTJ82AWE2gQluvQDKkKpFFaCmHgP0S2dX4fGAL1l0/M0
	 iNQqmBE+6xnl00iIPNGa+xCdm6KWRFZUffzyga0bbLYdoTe7nCBL9S7iM/JcD9a9k2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrouaAOQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8BaWBFQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71269606A320
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71269606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrouaAOQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8BaWBFQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51BTF3528081
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=; b=jrouaAOQBkpXIBv0
	p0KNvCgW1f7jEnIrr0Cy+Nnxx1dSw/Ay7K9cKDB6jBS47qatRVXeio/i+ZnrSdce
	gBvTeLdlV9/MQQCSmS7LdOrlE7vDZX4bFFRCfyDuM7ZqzSoSn71dQ0hXnVj0wk+1
	s+y7B8I9sJuwCvbI23laLvKIxRMGLO0iAMLdCB6h5N7c1eb/xD4m9VJLw3RxPJQA
	Qi+HvSIp6t2+9bx0FSBoeNzjEhhIGqydVasOOXI22En4OTjNS7QihXk88Sy84ZG8
	NXFa+AmgEzOrD50vCeO5kJlqHeOnun7pal3HL55qadLF2DfhM8mUHXNjdjAWD2ba
	loRXjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnwqqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:48:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2edd25534afso24249045ad.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Nov 2026 21:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795412925; x=1796017725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=;
        b=R8BaWBFQ3icyby0bVQZ+wDH4STMcAiTr9We+ZD4LfTFtdS7ujvgsJszYKbA3dzXP2O
         rgWxpmQopwjF6af5BilwlMT7gp79swnLPQ6PGEzMwjVdMfr8oLKwWNQKf3vt9nzYNCY3
         o2y9IUtxstsvK6Z8sT1zEcxifuBJuhRyj2Jz0GAFnri4v5q4jK8xKyHqmPQz0kLFS5dI
         t1c9qjZwDIz9B7sMuoz3Zcv8k+I/IuFK+WEFO1j9gqxflsL52uhry7CT1lx5QqFD70uS
         bs6MSSV/VP/io6w7y1izfPChjwjaElZxiP3UOzLw7cTLjMdiihwDIbjXvZxXl8h9mQvc
         lddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412925; x=1796017725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlhuEsnEqWYtLQ39obGQbINHh9BrJT/OwpgUaV/SUKo=;
        b=fVYSYFdTeYcKmrpzaDcwcJpEQ8MO0yoesUZY3S6AmVlcaFUX8Wfj+yjJcuwe5gZ//V
         qQ6y26pCwHC5xAlnGHMPgdx8ZNxfdgFLXwXMIwpZlJmdYZKl0dQ1Vny2He4CQLhvGCbH
         hO+qYSA+hKr9Hn+ytJERtDp7mafvVeBuQEnRb/AewoouYHYQEOt4pJrGTZzKiAMjUVMG
         hL5CYotX3A1fgt7Meuv7JO8XwhAU8Fam8mYko4ZEZTcM06ne7HtxQPEVbXwpE8VQP68s
         JYZZO66qWDiQUzEQuGIuwDxe/KK0h3BzbvPuvvVaRFrJmaNjZ8YCuEgXFe1/1+JJcDZB
         zErw==
X-Forwarded-Encrypted: i=1; AL+hErFL/1ZRQz44kuhN4NiI/I3Ndb8TF6xzmkaTGCrdIMFeHeYBm37oymOdQ2OQUwpP6LOsGNxVHx1rIEqvEGE8qN78+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dAj3+KK11KQUW6elqWsayt2VFB+M5KBSFwlbK2JikN+92BA2k
	SqG+DFv417+25/PIxiJoUiM+lRHsE2m4TnbbIGU+gS6fAnQU62OQ2TiHOIsX3TDjNd9tFQu83WQ
	+dAp14ANvKaZrvdPZdvHGiaSj2gSGf5A3R3LEPlvMBPoeWbLa6xgdvBq7k4xqDiJaIqytO336zA
	==
X-Gm-Gg: AZFdTZehCAT5yl6B29KtHU9QB00XiQMlXWleoEndm/cF4Gcjtn31JecdxkXSvP4vAWM
	n9lSS582E2mS14N4ZW2nYvYammcFGfryUKfCpucp6eT/j0dOFd4SU0uJRsDf0p+X6AkbZ7NuEjt
	k3tdftKREQ/J+nB4G5Qu2NJMZU+xJHy4WscPRS5E+5HTr/0nNYoWQkeQgsf8pqZA15JmRZrDQHX
	4R6gJEQF7WXfcowFxtDlif9kPH/wTZhca4SnEjd/OqzfR1iZxri6iiPr5T8CXGZtRZlxbN7QCg0
	zAmFlTnqwkBbPxOmIs+lIZ7oi7vL/Yqle05VzirCbXSRd3C25vNnedxK45uRkBKb5wyCZUh5PjX
	DNY91KSVbWooU9T74GyxvJHCP8ulbQEgGPq6M39OC6odOhNwghnfZFm5wkkK2KrUeo7MX4kbRVS
	abtOeB8Zzt5pKV4/oCRKFE1rwtLFjMPe67jj0nZlcDj10a
X-Received: by 2002:a17:902:f551:b0:2f0:2ba0:3b9a with SMTP id d9443c01a7336-2f03f1bfc54mr100526475ad.38.1795412925271;
        Sun, 22 Nov 2026 21:48:45 -0800 (PST)
X-Received: by 2002:a17:902:f551:b0:2f0:2ba0:3b9a with SMTP id d9443c01a7336-2f03f1bfc54mr100526295ad.38.1795412924773;
        Sun, 22 Nov 2026 21:48:44 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm46143615ad.64.2026.11.22.21.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:48:44 -0800 (PST)
Message-ID: <bee69c86-2433-46bf-b842-0277b8f2b76e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:48:40 +0800
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] cpufreq: s5pv210: Fix resource leaks on probe
 error paths
To: shyckless@gmail.com, viresh.kumar@linaro.org, krzk@kernel.org,
        peter.griffin@linaro.org, rafael@kernel.org
Cc: linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261123-cpufreq-leaks-v3-0-1f1e3f4f5a7b@gmail.com>
 <20261123-cpufreq-leaks-v3-3-1f1e3f4f5a7b@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261123-cpufreq-leaks-v3-3-1f1e3f4f5a7b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX65MlibnuguPB
 PpXoMEW8lknPdtvJn+xTv26xcFw/zEkiPa+mTWLHiLUfj7Y4gXsbpx8wjtn6JYD1qCc7rdxxjDT
 kIfTZDiVcYg2LNo0F/ejRzC9qg93MTKgdlqnarnRYMzVZrv2OrDe2xGyzkLRkf1gP4RFZXUOlBK
 k4Cdqd4zoTHhHvF/S61OrxMhB9YPJKMr1oxcyWOsCkq9nOZ3GWSoHyPyJv9uD+kaOaOEWBhjo4A
 mfvqJyK1XWHNk7KklddYwOEUCqYjcd3N1/WDk79mkuxjqzQGNJXcS1xrqfRj+S9v8/cVi9YqcwZ
 whBJFOKfNuubDAuAD8gS8/Z7DZxwSehgD7NcfLxjqSHJRyAZ89WNKZthSkvw7UPGEKDyVnhZMi9
 e0Ppn+aEZ1GV+h8QOreDgQbhINaWiFG5/M4q25tN6W25U9vwwd2qZ7Gx+rRSZ7ZNqSB4vt7U3RR
 cND3R3R3UTJFRnwZZEA==
X-Proofpoint-ORIG-GUID: MnxdBVuExtFbSl68zrhHlqkNfTBUJRXx
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03d3be cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=M1YlFrUzwzMSSZYL3_kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfX769Gs94H3MQw
 9ZRhcLULBt5URbjJ8ssV+wdK62WZDwVpjiATwTKuKz5nomktXyJ7lAb9SYQqIuFz2buyM4cY7h8
 RG4MM+YyiHrMWIs8q/NeHPxp5o4RzR4=
X-Proofpoint-GUID: MnxdBVuExtFbSl68zrhHlqkNfTBUJRXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230022

On 11/23/2026 1:40 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> s5pv210_cpufreq_probe() returns the result of cpufreq_register_driver()
> directly:
> 
> 	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
> 
> 	return cpufreq_register_driver(&s5pv210_driver);
> 
> If the registration fails, for example because s5pv210_cpu_init()
> fails, the resources taken by the probe itself are leaked: the two
> regulators and the clock and DMC register mappings. The reboot notifier
> also stays registered. (s5pv210_cpu_init() releases its own clocks on
> its error paths, and the cpufreq core tears down its own state.)
> 
> Also, when a DMC node has a bad alias, the code jumps to err_clk_base
> and skips unmapping DMC registers that were already mapped for an
> earlier node.
> 
> Unregister the reboot notifier and go through the existing unwind code
> when cpufreq_register_driver() fails, and jump to err_dmc on the alias
> error. The err_clk_base label has no users after this, so drop it.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: e8b4c1986efb ("[CPUFREQ] S5PV210: Add arm/int voltage control support")
> Fixes: fe7f1bcbff91 ("[CPUFREQ] S5PV210: Add reboot notifier to prevent system hang")
> Fixes: 6d4ed0f46af6 ("cpufreq: s5pv210: Make the driver multiplatform aware")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/cpufreq/s5pv210-cpufreq.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index e64e84e1ee79..29b1c5d71a8b 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -634,7 +634,7 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
>   			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>   			result = id;
> -			goto err_clk_base;
> +			goto err_dmc;
>   		}
>   
>   		dmc_base[id] = of_iomap(dmc, 0);
> @@ -655,7 +655,14 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   
>   	register_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
>   
> -	return cpufreq_register_driver(&s5pv210_driver);
> +	result = cpufreq_register_driver(&s5pv210_driver);
> +	if (result)
> +		goto err_reboot_notifier;
> +
> +	return 0;
> +
> +err_reboot_notifier:
> +	unregister_reboot_notifier(&s5pv210_cpufreq_reboot_notifier);
>   
>   err_dmc:
>   	for (id = 0; id < ARRAY_SIZE(dmc_base); ++id)
> @@ -664,7 +671,6 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>   			dmc_base[id] = NULL;
>   		}
>   
> -err_clk_base:
>   	iounmap(clk_base);
>   
>   err_clock:
> 


-- 
Thx and BRs,
Zhongqiu Han
