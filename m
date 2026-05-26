Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E23B1019
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812284; cv=none; b=ID+h5z6Pqb/wvc26aT8H6OBoygWI1A5rAM/D0Cc80OueieBJ12ZixH/E6+AuSVANgAQXHmTurUdDRaZaG0NUW2cqZnfnHI+SLMZVXuLPy46K9H7nYfSVnfFJF5TOKwo+Djl+kCwjbayI1bjEYdqIAnnaVUf/E+QsIQXAjFSn1bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812284; c=relaxed/simple;
	bh=7IZ0w0YQU64nz+Dkfx+hX0g0EGwDct9uNAfDXFj2UqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iQj9tjyJi4B4+S0m8LxE6upHvLuaT44YImc1veCQojt7UTzaCyFDKH/NxNSANySQDaelSjvXPkbI6Jwe+NAHyJ92had1OfhdrKdC8JuRObX6qxCGxMsDpfBkzAYMjtAZ7iChdft9Dn04O2QBWa4KM/2xZ+oQ4XIZeS3d0r+/iQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZ1MATlY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXgcQ+ti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZ1MATlY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXgcQ+ti"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QFlQQw2901968
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 16:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7z9rVd8N941MDY1O0PNVjwau0om2vSKSU/WoDo9hc1g=; b=AZ1MATlYKHJHDwpb
	OKngKzH2C91eolrPBJWCh3CJBGVWik7SCe43DR6f4cD3xjYzx3V/JXbL3bZwd4bi
	YxoTR0lWfIxgNxVd+kuXBk0aufwOU6qFrX5RFf9/uIZUgcVET8XGSwLtzlDasFMT
	8N89sk+LzvMOIJWmF2vD/hyBCRz9sFXvZUUnC/rb2zq499Q0r+NLi3zPkRZGsg0f
	A6O98RusylV2oi2d3nuNL3N9XK/X4TzdpVWy11YxEY0xoHBokLsOROVUYnFR9qs6
	K95AyRXi18kEkTcPeGP7P1fo04LW+kMB7dZiEPwFXOXHP3BLNYi6KKw5MjtZZg94
	ku2X2w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff0684-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 16:18:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751db2792dso1997824137.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 May 2026 09:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779812281; x=1780417081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7z9rVd8N941MDY1O0PNVjwau0om2vSKSU/WoDo9hc1g=;
        b=LXgcQ+tir8DvmHZKXcgLF0EWaLhBbyn2heQz7foghkVspHr12r6DJJ0x/stlqLsKF6
         MX6vhQey4KsB1xaMSQ+HW/TC7vOtT1c1Q9FhqEiCO/iy/rkK+2uo9iJ4TlbmJ0XKr3XW
         ad1kuALFWeuYG7tgZapuE8TZTbkbuydD8krwrF49vL0H6+fJcUBk6mVCDfY91gR7dn06
         HECMq0KSJPwc9Z10zrtPskiTjC4dW8BJvPlt4h9MwfsiLwP3AtJGaNoTJ/ZIkJ4/HH6Y
         jf+sw+GNYp6SJfeckYgnJIi/dd6764HPGjnpIvFCewmQNSwTVpmWQSj15fFBlQrjJ4V2
         HSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779812281; x=1780417081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7z9rVd8N941MDY1O0PNVjwau0om2vSKSU/WoDo9hc1g=;
        b=pVmPZtzKjuk8wQ7Sq5PVrQedZpksQ2kXNnEoP1m4tPvO2psqrcT3Q3U/vtZxWbm+xD
         BI0ArqPe2TJEu1Qaif7PuHKC+dFtioz3+GuxWgOg/2Qz8FTVNwVaFWohVM6FQxaMDYDG
         DIBL3ZcVMbRTJPzmqfCtRyBuOJRn2/J7FFJqwMDmR3Q9q8LSrtUzYPNb4NP2GoA40l4c
         czzxcyo7xD9nNjdbyEgeb79AVbdSpEyq0oPlpSowUjrUd8mG4hBBwez+BfxXrxfTyxBJ
         0kmDVKBKi6DG76vmN2yvAo/PboElqDz9Z9Rkq2Kq37GX54EHvkpJ6mt5qmexPaQ6lO4g
         R+Yg==
X-Forwarded-Encrypted: i=1; AFNElJ+r7PUuH7vFogsrMqlQpX1k1ELwqGMAUq0ol8QhGpcRtKWNQP1QL0vqO7MUidBamQQhrFfNEslPWqDfzLEZkaeLbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8IAWIFXmR32vUzbyAMPCl8MnPAqf/KzpM7m/X4HPfBWeXV+C
	B1SWY+R2U3I0V2xLlJJj1LSlhnuK0zs1GA8qNj86CcZiCE9lEC0bLiu0VCGaKMDNojq+3RIbZV7
	/9NWBPRJpU+O5MZp4/xFQws7IoGSYnTRbrF0QDKFeraGZOQ4z+A/jyuyMNxkXuG04ignpkjovWw
	==
X-Gm-Gg: Acq92OFaBfttSc70qa+AvofR9CrhVRiRCI/C7AKrXbgTQGGPJxjBkFS0bM6xEkCz/9m
	PWmDaVNfEXFYpaHVqsri1W7QEwvuLxB3/4cGN71tVZ4qqxhI0Rcry/LfRMLZMOoFMcUzrHFyrh/
	hapr1G58RiOJBZj9u/jjcweJM5usz90XGnsuOj/awItlp5biAgYhlqRU/bGUFEDjN/m6QOjECY8
	svIzgpFTtNfbH3gnv6apRbiE8bDpMvTs8ZxzljfgccT763MMZ6bcn/cwutxNcq/zVHNrEGG5v5i
	VHQoTm465+P/ELF8TULFsugfxp6zLMfj7tMswxxstdyiptPAEdmQpR/3jSFOOKlcCYIN0EIgAiC
	9eIKKDSCd3UmOoOtGUa/1fvVoDNTO7ngJBIQZhRIEvgAZAd5+U7uFoMOrQYaTlDMCOFRfSQyUgY
	RukEXiN0FCgKtgTLKp
X-Received: by 2002:a05:6102:50a4:b0:631:44b7:b875 with SMTP id ada2fe7eead31-67c8ef47d6cmr8684799137.26.1779812281161;
        Tue, 26 May 2026 09:18:01 -0700 (PDT)
X-Received: by 2002:a05:6102:50a4:b0:631:44b7:b875 with SMTP id ada2fe7eead31-67c8ef47d6cmr8684764137.26.1779812280642;
        Tue, 26 May 2026 09:18:00 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1? ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm331332605e9.3.2026.05.26.09.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 09:17:59 -0700 (PDT)
Message-ID: <b20c560f-4bc3-4686-9c91-36d93f1535b2@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:17:59 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: samsung: Enable TMU by default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526135312.8697-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260526135312.8697-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a15c7ba cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=n2YIJuLLpjprAwdwynUA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: p3OMP0XNCpR5SMW55UbtrsmQzE-i5mvj
X-Proofpoint-GUID: p3OMP0XNCpR5SMW55UbtrsmQzE-i5mvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0MSBTYWx0ZWRfX7jH6K4MhQ02K
 YaA/RXNx0KQA+PCfinqBabpHvGoluvwea50kMjE6jHl8c1qbdZpdxA0vW3M6x3xzYKHvgLOpCRb
 5XEhIA7aFj/h6vHE0XykgBz9NodDGqhpSQl4kfLlj0l4y0YgOq3BpRRrHXcbgmvlniPu95FASzF
 LF7bZZzkr0SBg1yEVNP/c5gH6QvRXAbVoPka2tDC+HABituyn5FwPSnsOdzI1J0U2PeEJQ7o5eW
 zHus0hu7b/Kakq5mZ5z+0H3+IXg1dxpQo/rgr2vtPL3Z0uqMCO5ZPmZZvgUl2FfH3fDps2xPC9f
 15qrLZpPZanVi6ulpshhL6l3qRBJtMR5BFaLffaI9m47Vtwv6DkkfaSJw6EwbC99c7V+LxzR0u9
 zhJFR/ojnBq2IdO8hyuq+YrDgT6ZIF56BdJJEJnrcDtmuOYDGtQqd8BSd66dQ1b7gjz1lfGHZlT
 RqdRUALOoTjjJAsdKoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260141

On 5/26/26 15:53, Krzysztof Kozlowski wrote:
> The SoC Thermal Management Unit (TMU) is essential for proper operation
> of the SoCs.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Impact of making it default:
> 
> 1. arm64 defconfig: No changes, already present in defconfig.
> 
> 2. arm32: No changes, the driver is already selected by MACH_EXYNOS.
> 
> 3. COMPILE_TEST builds: enable by default for arm32 or arm64 builds,
>     whenever ARCH_EXYNOS is selected.  This has impact on build time and
>     feels logical, because if one selects ARCH_EXYNOS then probably by
>     default wants to build test it entirely.  Kernels with COMPILE_TEST
>     are not supposed to be used for booting.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied, thanks
