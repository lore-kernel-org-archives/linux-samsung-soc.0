Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2329643D501
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Aug 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786713269; cv=none; b=AncWmHqb2LTg3T/SS7b/NispsLj+o6Lyzt6s/TN9abCnAM7eBDkfKNPHUYtIdSvVtmgEZjwPhdhz4XUqMjmrtzx4aq6Vs7ct/0MzoSh/OsRtIYYsYp38WM28MicBsxaoWsxf0Qvq4fthtZvzOpmiuIZ9CPXQF3A6LMjSwESJ2yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786713269; c=relaxed/simple;
	bh=DeXrYOF1Wymq7i6AG2t2RjGNTPwbswPu0A2UMnwWnG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAhH0lfwg1wXsq4EsmoskHx7BtFxm2u4ZdaE3ZrJNqyn969ydhwsH8LmSAo2Lz3sJ5Iw34/fHinx3QnkW2l/ZrHXVpcChK1cYmNiFqW5C0D8nh0ElWqld3JipyBr5zk/hXSofnHGcuW4XB5KjXNahTjodkOt+jxL5OBkfjzzkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCE73+N1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCCiupWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCE73+N1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCCiupWE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbKpr1068952
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Aug 2026 13:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=; b=kCE73+N1jcjwYL1v
	1NLH6kaopfSYnyiDAxEyMWBypQ5ncYrAPKVN9AFrxyyAQwikfI/TeXh0x5+c7e7N
	eEmpGdOR8dQ1w95X9jTl6sJikBQPiX8/yKS855k/QnU2Zk2LxuYeBziPeOrXn3cI
	uWMHlALQyGOyv1rBlCj792HvFYj7d03jLiEbZozTxIgYNEfSeUXi1SLWPbz99TkE
	3Ly2uaa8lpCCLrSABZSKx6B5YUtxb6mr7wZYnT8s8iWLjlIBySWB9Aegrrlds5P9
	P9uxd6rJG2g5zo6eRwyxCuJ8rdWhpzARbJaHr0QjafZ71u7UWvolQytNd1qX3Wj1
	DdpnAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8psx0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Aug 2026 13:14:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936a796a23aso92207985a.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Aug 2026 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786713265; x=1787318065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=;
        b=UCCiupWEMpt4O//wo9T+g2jnFt3EOXgcPluCmia+DBZ8DgwHrhAdfzGjtd6rWK3CH1
         Xm+aru+7rd9KbuI5WrXId9uqHM6joAz5OrQQqgLZAlEesyIZbxvpSnn8p9+VzcFOnuE4
         RMBa3IwRosaffBTthcpea3Sxq2eqcV51B/l9+EuyR5tGGfLXqqYLvzs8VYbSKzmW4weL
         EEL8+oHFqI0kXJPKkG/SSP0BH8Nz8arEbZPTPLevQrfGQIkMuZQ3RBfLVLghXatxxnH7
         pOWrjf+Z2naDc1GG8Xiw+QJ0W+4go1H0fVtf9W54YIUYkkAFG19dDi9dZabp5phuaBRU
         HjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786713265; x=1787318065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vviloqTvq3WKiFKD7ZKd1dUGZvDqcy3SN6oDPTL/GUo=;
        b=K1VIkjED/ZD142ns1EyzvJF+RoZLxUdQIy7lp/j6ldVe8yhd2u+lzbwtlJFc98mxO1
         cxQdmpDS4VPLBBN7h2vqJpJWO/SWgf5v7B229jldROJmtr8OP4jd6dwiAjRUkNYv+d/c
         eN2ThXuJ2GFI7AhxtbFGhyx9wYBUPQNBd1UwsuBcyLsKyYMVp3KeSRz2+PsMOiX/TNaL
         cpLDeD52YRc0/QcjpbQbLIwBqHYBF5uRKAPjfgDsytBYnG6Sg0wdSE69YQZEOYHv/FNw
         Td3IQ9NrBKgmCdRBh2m1ZFAz0OuOTX0b5pcCQlSc4zElftSKnqx5sRcb6xREdq/ST20t
         wfGA==
X-Forwarded-Encrypted: i=1; AHgh+RqNVBQ5p/v14ynHkPgdBPG7DOf0w7eYIhJdfsYQFhD5FmAagJtueKV6Wg3YaJ7h71Ebb1fsHmEtSXSbsbxMQlej0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwxbuQvzxXoV0z5p/YwCII9vsLQu4J+iuJsULPLZ7N9qxxBf5
	eKxBQhEtaEuT/mo63Dp53/FMZ9yhqjgMuTkCW3X6OPqtRZ2+ueOTJ9Gzxx/8No4kSQaTgxBKUbX
	dfibMzBZCD7oEokbCyCxtkkwYVMcBsFZe5RtEnka9QWF/wHulm6Nle63ufHrsU1oHhpOSbPT7YA
	==
X-Gm-Gg: AR+sD10MY25GaHrrmJqYsUw2GroiSRjKmrD6SujAv1xW5uSYKH++oawCrFeiRm/S/G8
	7zYKwmFGeDrsUK3RdqdsoX0cTCTfhTJLeWGmZIHmrZ1NMBAVkUw96BuhrXS5Uy48RcMJ8fNf9Ny
	tePbpra4kF4nBVWeFdPusAM3GgowUEqSdbPSiv1tBO8h+leh5lLc2BC2GY5wq9FssShjhhUR4rL
	zE7caSI+aYO69jgzs/ipM4EUtJZXo87GU7f/t+MrycyCO0QJfe/krsBXZ2Ar3tLxy/dLUPBxf1z
	TBhzsmz1+EhoaY0IfCMYN8vAj/k9u0PyGLv4sSz8VRsuYFoFTzalK7ZQTne2Paw3MWni1DzW2xR
	dZNwA0+PJxqxuZN79hbG6FYllGErzKCUECun/4FgOzwW3kBza/Dn3E+sBi5/4
X-Received: by 2002:a05:622a:c6:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52d85501022mr56159601cf.27.1786713265328;
        Fri, 14 Aug 2026 06:14:25 -0700 (PDT)
X-Received: by 2002:a05:622a:c6:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52d85501022mr56158721cf.27.1786713264841;
        Fri, 14 Aug 2026 06:14:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e4c:e833:9d1f:4e19? ([2a05:6e02:1041:c10:e4c:e833:9d1f:4e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899753ccsm32150965e9.0.2026.08.14.06.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 06:14:24 -0700 (PDT)
Message-ID: <8e82f564-be0a-4bcc-a9e1-72e0d26ca0f1@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 15:14:22 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <DKNSMR9KRFQH.3SQDYW46B42FV@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <DKNSMR9KRFQH.3SQDYW46B42FV@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7f14b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=z2-NpXgQeZIsa6yCj1MA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwMCBTYWx0ZWRfX9eS3W+jIRl1H
 LS4Scaa5seeI3NEyZHO0U/Tww1NSgJbLZUnep6JKsj9AYYrxFJweBX8M0a8qxwDDanOE/IGjQDa
 rtL8uvODz9SfvKitJmAj6FQUYPqgv9Q8CuOJ12ZUvhHYJcFiFZI4wEQkDV2T2iYIcZE5WQ23EgY
 Uz4OFU6OeREAyF48sscKxnZ63CKXiok0flv2WBZds4SswupFDi+GR/l4w9gpeb2gtadt0BFHH6U
 hMiCg895l8Nk606LinDrwPbhMq6SZsDeJnzIniCEJW92zNqOoiiJenZU3S1VWPSsKHRhjB/KqxS
 fWm5w5+fHGCy9PtgT3HUAOOed/z3rs16sZTRYoml6qxGQ0pUpRTdu2QV6IfOQ7X6zwVYyftCosw
 rQsfU95iM4QWBdFPAje1oHAqbgNtsB3NLmoNYT1Lvst861HQ3vVIu69DSFeCtG8XMK63PINN0Le
 Yi0phxj0wbQPzPmog2g==
X-Proofpoint-GUID: 7x8smZJ_fkRGmYSTkbtpbpw_YmFPqgeu
X-Proofpoint-ORIG-GUID: 7x8smZJ_fkRGmYSTkbtpbpw_YmFPqgeu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwMCBTYWx0ZWRfX+UBzmvVjDotB
 WgmvI0drlpAcpX8/2m2VOIQlbXzihwLnvokLd/l8Xl3tABWjBIVHq616pLQipViHBEOA+vmnDlc
 NmD0QSGkmyMr2rPIEARiL0i2mltjHbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140100

On 8/13/26 13:52, Alexey Klimov wrote:
> Hi all,
> 
> On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
>> Add support for the Thermal Management Unit (TMU) on the Google GS101
>> SoC.
> 
> AFAICS there are no new comments and no updates and Tudor said he is
> waiting on feedback from thermal maintainers (for 2 months now),
> what's the status of this?
> Apart from some required updates [1], [2], is there anything else should
> be updated here?
I did have enough bandwidth to review the series. I'll have a look 
whenever I can in the next weeks
