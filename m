Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405329;
	b=y3FdNBMEO8rbGC10cA5p3gAd+slCQglwk+vZ7LGNFeAIFVolXdZCPBdOAtEVTgacTuml
	 aD4cqAnSGHOFHmUBNVRyiJJ6Te7DjdFxMSgcbVWaC+d99JO6rb2egffH1A8HpHCtXxeBK
	 o9uu9x2h5n8Y7HKAS6opma7TVR/tyqrUrCDhnrf5wRGtaVaok+kJYCj39urdRV0ZdCKip
	 VYgCL+XOoUPtQlzEw0AzHqj8rRQO6LJkuv6qS8HzlVSwQ9v33AHbV2FVjcDYiXpMhheSh
	 Zg/9E2xaDRN3aXACoBGVEpvdmxVliaQtH1i7Dq+lr4UDzx1kr0+WSiqU4ToYGZbL5RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=;
	b=PvepKQzjefQS2i5R6UEyQRyaKXojWp2TzeQz7wlAYOPokxeOo6SLDMfshjvCJ6zI3upv
	 hgKvwDCX0R51YRbqhwQWWuoDJ1el41BVisgqR7tjUmEPGY8O/x5DW0RIGsbeDdKBxvgR8
	 8h5pMk0MKDlyaWUXmFnC9ZSEYczg5t6D8ufXdw9+n02SAaAM7xbe6yZDX6yTSpkmx9Jhr
	 mZPW5hlykiOj6SRzixTkJV2LdJeCbhtyBcIAilQgciP+NvYgvSGf3RTZye1CDMTsf1TI3
	 ZhT6Qj14DprGrgExCKVYhcHHINcoXGn2OH9eHp40hoUvaYtNSQGTZgYEvR9AeJXIzKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTzJt6qn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DOWxcegF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E74E606A31E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E74E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTzJt6qn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DOWxcegF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMNuM9L3140574
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=; b=oTzJt6qnLd0hstbd
	xT5GdQxklui3K8aOlQ3KlmrNk7szOErxUT/OHKDYv5tl0eR8noJQLb1H9ygwURRk
	Le99huTrH6aQVqzpwCbzYnht6MoWDr6GmvIkNp1itUcEBysCMcY2GjpjS9pM/OBr
	VeVoQSVgla3FrtKpWN6PvXNnLaUARUR3LpN4oZGZ2QSvDWORGQiWbB8fH09xaiUc
	w38ZoJlfqabPhdUPIOY2IzZ4JrSdbzBdGJqynRii0FaA7Ur6vJ2PbR3IOza+DfuS
	HJ4aB34bbOWMEdHAzTldUKyuFJearU9F+ODz0wxHp5kceA/FsFW5N5VCfcEE++7p
	Cqt1DQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk4v3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:42:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so2190990b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Nov 2026 19:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795405326; x=1796010126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=;
        b=DOWxcegF0N1Qkl2kW07pCVOCooYHRcJuRxCr+gVBSEErxuQkXxEzwdnLO5Hoy4jwhx
         fQFs+0xi6hhQA8OcZKdtTDJ4dfrOqgMJBq1omvuozEucva5Pun5dZWbESlAc5lfgZrIT
         i4iX0jhJo04qoI4Hk0rKY34PaFCtNCt0S6zeOaTNPBCwUVCiW3JgQs7CYPdZRJAjuYC7
         cP1fgBcDXI65GNu6ofchAdmm1bc32cEmhe+XK+42Jyo4kz7HiYtjazliHDu28LjqF4E7
         y0RpeljXp5LcRKC3qUzo5C4dhTjmzLneslHdBa+wKgO0mKcFia91IzBZLr+9xUEkOZkI
         4mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795405326; x=1796010126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOMQjZfNZl0Skc/H8u9J1Nf60tDa0Xn86zNJMbt3J1c=;
        b=i3mvMnHRI3J/4QQmNASG3RetYVfzHHYJdPbgD574mRqMNSruF1m+5h4hRFOhoRMMk3
         vRwQ2ObXphC0Dy/F13oeIXzMOCOMWyCKOGyKWT7DQFILqPgl9b+0qoxTQX75tZW6PVCP
         1J9xorV1Lr+5jHEB7YUTI70TeM7v7SD9MT4ArgN3Rf+PXatW8ifUdzpCQcOL0M6R+nLO
         ILe+Aao9zsFHjBxxSlqi5FkZ7UBiDYsp9vrtCDdORqmsbpeUaAfyU0kWXYT/mcWoKIXK
         2q9b9UoqgaUmGi5JmqaNbPF/XWEH2/W4cCloGL0rNI80z/yPB9+wCYe/w4OUruhH6Qvs
         yw9A==
X-Gm-Message-State: APuU4Z+H2JSqkbGKhgmoR65+ZfXwG0Igf26vEUxmxvDT9BnpvkcEMxdG
	YFiCqabKTfaYCwdhTJazTBC9KnM6atoN9O/2h+Kwg0qiT2H+c8pkDGn7vRAarA/LlbzkXWJdgNq
	BgBYD4rvV5xhNIwV1m3i3McahgSP2Ye4GsjK3KaaRoVU/2RstwOSrcWcyZb1O6tPY8e57gWrEUw
	==
X-Gm-Gg: AZFdTZf6mLj+8vY2xdbPc0FD3166MgjYZ9s0sKd7pUKbIv2rj+J1mXopto0cuW3Zajm
	9rft5RIcUqYJKxlYktMIHpGLFwe/IfFxRT/6QAlTOrkw/2svTiwd7D9MwJhsI7tg4QVy4Rv/X+b
	7ePhlvs2GszchKpu/AwrahbkD3Sx+fCv0hFNX9Wte5B/38lPkvUaUKLQOH0auWKEP3O73ixfnOJ
	EN9BjLIsbm1wO+FdihKTXik7Y2WkIdWKqTcFXszou4KCQTLA1fNyrL1RMzlRZ+/ZPsgpGAHiOe2
	ZcyXG/VgxtA/652xfOk81uQbv5rkbqDGexoReiJ15R6B/yCOJXPlIW7DZ9u66Td+gbR9cKMck9n
	GZHRFqUYRtgKrNxvIiSUT0SgJRX5FcBtopRzA97b0eojomMYOJJEN3dKg/fPqdECZCcLtSjsxCB
	EZAcd+yPxNk+tTaobhgeOO8ANnY6PYLTzaS9pSkCZwfK3hsg==
X-Received: by 2002:a05:6a20:7486:b0:3fa:53f1:abf1 with SMTP id adf61e73a8af0-4014e74bf27mr10216919637.66.1795405326626;
        Sun, 22 Nov 2026 19:42:06 -0800 (PST)
X-Received: by 2002:a05:6a20:7486:b0:3fa:53f1:abf1 with SMTP id adf61e73a8af0-4014e74bf27mr10216896637.66.1795405326163;
        Sun, 22 Nov 2026 19:42:06 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfebdbasm4362204a12.13.2026.11.22.19.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:42:05 -0800 (PST)
Message-ID: <f74a9623-4522-4a30-8d50-bcc148f2b9bc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:42:01 +0800
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
Subject: Re: [PATCH 2/3] cpufreq: kirkwood: Put clocks on error and in remove
To: shyckless@gmail.com, rafael@kernel.org, viresh.kumar@linaro.org,
        krzk@kernel.org, peter.griffin@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, alim.akhtar@samsung.com,
        linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com>
 <20261122-cpufreq-leaks-v1-2-96fc17ff7339@gmail.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-cpufreq-leaks-v1-2-96fc17ff7339@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lsZcToIPQEfNBSYlrj4GLsApUJuoSvRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAxNCBTYWx0ZWRfX5N1074iorF6I
 LcmKTEWeniUeZfje0oLRWB5TfYkW+tzIWVd8ocxcYD/2/dX6B5XxBfLfzycjeoFVHf36HtK8hvr
 g1NCaRZRlHK05aTwyVYJ4A4hQVEH5cmdzPlWsJdMWQMTsa/fYb8beOoPo4j7ylA8/vUrheCsuTb
 2lFmFQ7fcvF7DP1+qa+KgL9iZe4vUTWzGiaALPVwqOmlSIhSe0vTcVt+qJMT3EdFxMXHrZluAaV
 EmY1Tq8UEgbU5/hdpf3aoNumsSXxV8H4c/XgZbWLDZYR4mMn+F5M6gg4EWuC2inBkSkNlEkwqNg
 X7BBtwrcHbw/RsFJDTWLO0z0TNsYbkaEF1LL4d065K7oxovufaCbyRQ2GOofqp2BGns2SwTReRR
 J4U1dmUZ50l9Q/wBVXOlYyQxBYjKhTNXgMiBRYZeLJjRQ7OW2p9gCQ6sz5shfR7ayr8os9puyrx
 QwGDoa0ezzMBXbfngbQ==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03b60f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9A-NSSyiqZj1DCQBHqoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAxNCBTYWx0ZWRfX7jPF8FKXFnNA
 DIGsd7TXDVcouVeT1QIuBNPS9kshlogEWma2t8gTC7S4tMFezwXbZv0p5NUi5LUbHq34GakvHhU
 FGAmnkPBzU2Azdq2HV82Sf7cP4anvnA=
X-Proofpoint-GUID: lsZcToIPQEfNBSYlrj4GLsApUJuoSvRV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_06,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230014

On 11/22/2026 7:55 PM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> kirkwood_cpufreq_probe() gets three clocks with of_clk_get_by_name():
> cpu_clk, ddrclk and powersave. None of them is ever released with
> clk_put(). The error paths only disable and unprepare the clocks, and
> kirkwood_cpufreq_remove() does the same. So the clock references leak
> when probe fails (for example on -EPROBE_DEFER) and on every unbind.
> 
> Add the missing clk_put() calls to the error paths and to remove. The
> "Unable to prepare" paths now jump to new labels that only put the clock
> that failed to enable.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 2a4bd9f0db24 ("cpufreq: kirkwood: Add a cpufreq driver for Marvell Kirkwood SoCs")
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
> index 24b285cbeb8d..e85658081c07 100644
> --- a/drivers/cpufreq/kirkwood-cpufreq.c
> +++ b/drivers/cpufreq/kirkwood-cpufreq.c
> @@ -125,7 +125,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.cpu_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare cpuclk\n");
> -		goto out_node;
> +		goto out_put_cpu;
>   	}
>   
>   	kirkwood_freq_table[0].frequency = clk_get_rate(priv.cpu_clk) / 1000;
> @@ -140,7 +140,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.ddr_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare ddrclk\n");
> -		goto out_cpu;
> +		goto out_put_ddr;
>   	}
>   	kirkwood_freq_table[1].frequency = clk_get_rate(priv.ddr_clk) / 1000;
>   
> @@ -153,7 +153,7 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   	err = clk_prepare_enable(priv.powersave_clk);
>   	if (err) {
>   		dev_err(priv.dev, "Unable to prepare powersave clk\n");
> -		goto out_ddr;
> +		goto out_put_powersave;
>   	}
>   
>   	err = cpufreq_register_driver(&kirkwood_cpufreq_driver);
> @@ -167,10 +167,16 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
>   
>   out_powersave:
>   	clk_disable_unprepare(priv.powersave_clk);
> +out_put_powersave:
> +	clk_put(priv.powersave_clk);
>   out_ddr:
>   	clk_disable_unprepare(priv.ddr_clk);
> +out_put_ddr:
> +	clk_put(priv.ddr_clk);
>   out_cpu:
>   	clk_disable_unprepare(priv.cpu_clk);
> +out_put_cpu:
> +	clk_put(priv.cpu_clk);
>   out_node:
>   	of_node_put(np);
>   
> @@ -182,8 +188,11 @@ static void kirkwood_cpufreq_remove(struct platform_device *pdev)
>   	cpufreq_unregister_driver(&kirkwood_cpufreq_driver);
>   
>   	clk_disable_unprepare(priv.powersave_clk);
> +	clk_put(priv.powersave_clk);
>   	clk_disable_unprepare(priv.ddr_clk);
> +	clk_put(priv.ddr_clk);
>   	clk_disable_unprepare(priv.cpu_clk);
> +	clk_put(priv.cpu_clk);
>   }
>   
>   static struct platform_driver kirkwood_cpufreq_platform_driver = {
> 


-- 
Thx and BRs,
Zhongqiu Han
