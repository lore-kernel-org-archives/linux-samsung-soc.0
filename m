Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404085;
	b=Ynfct0T++OfwFTzEtBiKUyQOnRfDUnmwu0xX3Mml5dS9Z04saRzEiQrarIiobxurVH5r
	 JJ+YAymR4TbMs66ng6+aAb5gdGZ8ePWm06BqFJzdcaAxgQRmbNuFqhtdpaoatG4vKVXZh
	 aSEKhxYc/dTp4aWZWVr13CebNDlHsavtnN2tEBQiM90Lt/JGU5+n2btbVjPJVR8PRVJxW
	 kmqCMGvAwxOUXLUXEjtpPmI2sZRn4E3PCe5SUSVgNCPd87vQsxla2IojfaMQJ741GMDWO
	 lxd3wjaaS4pr+cDrkS/BYG7s3Hv8UAxcDCx0fLaf/rfJYSpBAxn2kJL612HGuEZ/oSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=;
	b=Xtbujub+RCmqvLk0b920enufvwd0uUoy6JEc8qoDstNCW6SdQ74cRcG8bRLIeTnSxqTt
	 GY5tMWyjHBIBTnwhoAWw4W3JrBuNHlbgTZoaTTyJMsNnjoCeBWvk/apP0AttdHXZF+cpg
	 H4EqAp6wR+CW017Oo0I1rNq3NbIlfcMQV7t212b+rP/aL1Z3JGA+rSyQC5lQGjuakWleT
	 hTQIjvko4Wzew2YryRKmUbGODvpxOR/T3JnQAn0WzvXMCoK9kQZyDl1ZgxkHvZHcUKOXl
	 Zgv777DDkO6u+TI/EbIU9Ekgm+cNmQwcuhu7ig9VWPAyad+tJ57jtFDmffpveeD5bSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QoraXHFR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Zo3/uIj1";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8B8606A31A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC8B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QoraXHFR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo3/uIj1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMNrv6u331223
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=; b=QoraXHFRbb9UnELq
	GPO9l0JpOcU6VcmdtSJDDANpnm/s8tsML/fOenKlPD0WCAVWVv/LTJ+jtaD919Ft
	8e6C4XensAVOHJZo4vqvy4/LXxnTkHpXH5fVHruBWo6oOx+AI5c2oD9cNQt0mPRB
	J3J+7AgmHgcPY+iY9T+wSyigCKKvbwMwvHWYC0OqZJSZa/mtK5/WBOtOfNQp7dga
	egnjjrhuj5AvhXHQ5aB6lNCgj6tkRUhuVFFyDljY+NCkfKOIQgfk+37WqbagzLF2
	D4au9eJ6BI7d1cCX/zL7K7rdvCMtJ9KpSI22d/ARSobgQOtTvWMGX2QPdAeWsWDQ
	wGnoKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgd1yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:21:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41b099809so2468434a91.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Nov 2026 19:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795404083; x=1796008883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=;
        b=Zo3/uIj1Ox691nFw7TymmsPrWz1wnLyJehzkhMZvYfkeE/ZkeQVP9DnKpzd9ld0rQl
         L9nHrhzxfZLOyXhoKY7fmk9uENDf0pxnWYhNGaxh3zlK0tTOC/kwvAKK1h9WkJxMZljr
         rtkoBdReEulAAgfcqAjouqubGcGSCjJwprnqhq23+A5egg85Luw9jTpFH3r9p+YvOhaR
         AWpiGuPZd9GnMZo7HNKu/Vul383AnJ25CdpKPhJ64wDOf23hB/7uR6u1VRubv7bsazrT
         te0MbvKLxSgEhW87DPzqi3tBNFI5TNF+adB7klKqx2i/3PavyvYcJ15sPCPoJ5cRlnBz
         5u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404083; x=1796008883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXedBlLbPwD6MOhiJ1M+V/ws5Iohq5O/bPIG7VrD/2Y=;
        b=mAN9Bl4woqMJcJr6AN9yxfEB0nIFpb0WXE2YulCUZszXhCl89MOMsxhhmv5kORzzIJ
         miKC+t7I5zqyi3grvaOulAtbCth0s1zZOcqTsoJDgBNE6BR0Y/K5G4Rwk/cYhGKzXD8M
         yPx/JhP5dTczatpVLJ8ZskB3+xiae9KnP3QE/0VOlqQCc8+U4Qw0zhSH3E+bhJCE9Ba/
         RuthqoYpEHn8dvO4jMWwOLeAgRCX0tjd6u/vzDqJX5XRgzY/ahHcGnJiQzh9WrTVrYOd
         yquy+Ui/ZvTW4uPt0WjN5imEIZtLo81+s2va6td9DoIVq6sKkoTo1SdcH9VAER/82A07
         3GXA==
X-Gm-Message-State: APuU4Z+C7FnHeJ/iZzjCN6+tqV2FQw1/BCwQEWIG0m0FEzg0/dVwgrHl
	EGaywBpg2YjBmc0nVqEqIKPIR2OgucNrBHZSp9vaps8fvhJVqSRv68uI5nb5kdxWvQ83X11Revr
	s1TG8fIL98gCHsRIrhV+TP9kAk0v35mCxzA1C6cNyIuTFys9DeELmExSlgKvh54/NH93yoh8IOQ
	==
X-Gm-Gg: AZFdTZd9jXYO6AVftCvypqD0UDwU+smOCEl0biGD0x8tti3mBpOo91PCywWXTQvIj0l
	WznM+irI2wfKsQksS8X52P3NCD5yVvApWwUJZ7LeCKa8PM+tsCNHez7b28wZ309/NJS7cl7zOdr
	xliZfxIP4naOJjBI9ggWcU0Etkz2Lm11n2+fHJeq6NE4+nL/gh983H0f55YW39VZ2RFZLYXoE21
	Gt0bhuxtt5SDGFMusDZXSLma+T8aEcSS7xHDebHcySwn8wVGxw7CPOsx0A/QEabBD27oJX7KyEP
	f0tnaFZj5+n+5MBJfYtxKLvrKgbLU0SefrEL83JCD2r4Lr+qBgWSMNET0lAPBTKmTf+70t+eZrd
	oqE2DqUcb8FPFbX/+v/tlNLpLKp0dU83PtHs9ZZzNpecHuENjMpGJBCQLWTdMCr/eAbO2vhGvxN
	l2vnXvVJtKG5FFpG/c+VsK7RSxoipSG2U5U+b+v8nbRK+q0A==
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr9091513a91.57.1795404082686;
        Sun, 22 Nov 2026 19:21:22 -0800 (PST)
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr9091488a91.57.1795404082223;
        Sun, 22 Nov 2026 19:21:22 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b828ab9sm5057963a91.2.2026.11.22.19.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:21:21 -0800 (PST)
Message-ID: <681285cf-b668-46c6-b6b1-793782925602@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:21:17 +0800
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
Subject: Re: [PATCH 1/3] cpufreq: highbank: Put cpu clock if clk notifier
 registration fails
To: shyckless@gmail.com, rafael@kernel.org, viresh.kumar@linaro.org,
        krzk@kernel.org, peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, alim.akhtar@samsung.com,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
 <20261122-cpufreq-leaks-v1-1-96fc17ff7339@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-1-96fc17ff7339@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxMyBTYWx0ZWRfX0o/w7FnkiYiD
 ohTFcPdwczrQIBTJeiJmNHn6TuyKjtxqYI8KcwwdNzUDSg0dNqbjJm68GRCWqFTo3qvmSPE8Qh4
 2D0tHTYlOzK/SVbY5Novs42Tcowr8NpDyFcmYHg7xWbSw5iQGZRwodaEeL1I06Fof58AlDylNSt
 Qoe1KvIOFp3XQeq3DRMvHOd9yhbDOSz4dUeaKnsaIO4fyjSTn6JPGl693FDrkMrWqJcIWRdkN3E
 ScIgVsUy/Z8Jsgx/h6SRSSWVV6vqBystEoFbX56cgb0p+KZG7W6TMOj2OGotlaUuDyMrg0dBNrn
 CAX7dQmwIxTNUXwdKJtvKftCNrFNwX9vRNkWKduVDQmpYYhEzIcP0deq+uTvnpxudadtcgr8zxf
 t9+ueOUkL/5LgYjDGQbeijgs0Lo4XK33KbWFKb4TQTHrzwV8dbtC2MdMvzMWAI+r53zbK2CsgwV
 RORQf/g8+CFR44Ppa4A==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03b133 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gElGNr783DhJT2Mv8Y0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxMyBTYWx0ZWRfX54dceLJ2BC76
 Zc0q1HfSHhfzy2RaefGcrIv5yNMfDK8ZpH8ISfWC+bq3xFbBen1j253IKB6/S31EeUoxwi794CZ
 Vs4pC75FMXg+69SgLa6hTZ2XIhBStfA=
X-Proofpoint-GUID: QZ1_xssTmusXQbPGn2sjNlxLHvNH8S8T
X-Proofpoint-ORIG-GUID: QZ1_xssTmusXQbPGn2sjNlxLHvNH8S8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_06,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230013

On 11/22/2026 7:55 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> hb_cpufreq_driver_init() gets the cpu0 clock with clk_get() and then
> registers a clk notifier on it. If clk_notifier_register() fails, the
> function jumps to out_put_node and returns the error, but the clock
> reference is never dropped.
> 
> Call clk_put() on that error path.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 6754f556103b ("cpufreq / highbank: add support for highbank cpufreq")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/cpufreq/highbank-cpufreq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/highbank-cpufreq.c b/drivers/cpufreq/highbank-cpufreq.c
> index a45864701143..ccdaff4384d2 100644
> --- a/drivers/cpufreq/highbank-cpufreq.c
> +++ b/drivers/cpufreq/highbank-cpufreq.c
> @@ -89,6 +89,7 @@ static int __init hb_cpufreq_driver_init(void)
>   	ret = clk_notifier_register(cpu_clk, &hb_cpufreq_clk_nb);
>   	if (ret) {
>   		pr_err("failed to register clk notifier: %d\n", ret);
> +		clk_put(cpu_clk);
>   		goto out_put_node;
>   	}
>   
> 


-- 
Thx and BRs,
Zhongqiu Han
