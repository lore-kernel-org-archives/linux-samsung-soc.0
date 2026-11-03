Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706837;
	b=dvhEDnyPc72g/84eol1QqPgrY7aCVR5ZTi8UIUTOxuNzKilUdh0uXYhZo7D3lkW+xL7B
	 qvqTpIJX33PrV4Mb3TprJgMhNu2QSvj+fEcoT6UFaeZlMblHJJvPXr1A/wmWLvSs0zTj9
	 nzRLo4fZaN/rU4f7Laey/PoRxupeNt6izkbDzxQtMM6Nb3L+gcqFn9ZtwKI0k0umq0Z0i
	 CBbcCEfwSe6z6n/fIsnwZAPK8bbTi+2zia21O02WI9Qh92XrzsEXOLkrkWxEhZox0If0r
	 1SKJxtm/cI0PLgnCcp9rz0mVkbDINNguSVdbLoJPyNKOhW9DHpFiM+9cs4fyE8a7JWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
	b=swuQ+2Vl/HJAQ7y19/FB41SnbujEAvpeDdlAdTdBWmTtL1mkzgd0OqRy6BgV5wL2l1Tb
	 ykd7ZfMYuP1xh3jktlyu0ekPZhbfpBFx0dvpshX/tbCRP52Hs0Qhd7CxYrQT+rK6GzgH/
	 cw006g0YiDf2Dp57ZJYpO0kCKfPowsVHyGk0zCjNLJyxsRe8ao3LW2I2NcnUleTRm25q4
	 p+CJeLNt5HIMnm9UILhR51GEtbqQF8W1nT9h6CRckfP5KKkaJ5ZGIsEDbPRPJNpgSaVEK
	 R0lV4StPOxf8PYZbz6Owb6s9TW5bKMWWNW0xUXDLG+njwDnf/XEmfRF3Efnb60ZhN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KK78crOG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451A3606D821
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2026 11:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451A3606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KK78crOG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAMoq2552983
	for <linux-samsung-soc@vger.kernel.org>; Tue, 3 Nov 2026 11:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=; b=MWWjy+ZVi2QdM7hV
	mqTyO4PsXxS1DeaTU7F0pAhk8eTinZvdhnDH3UY2nWUpcmotKOOoNSkfFYno6zvP
	REV6ABDEPV1Mi6FxJu8o8aHXxbGZ4bqB5mDrgZsk6oUaMDz/uw8uPELXjz6h/pe9
	XHsfsSXDnizijPjlIkO1rH/9HbhyfxvkHInASLwANmxINNEuUt1A8Iq3uXhv8gzD
	jtrLtrSdpmgIjQyTpzH4p2jGLgzKVv405S9fxEOkSFBSK17afQ5ypntnmcE+zZde
	OxDAZWtoPjUvNfQ/RumMUqU3vTm1o3B2J1r3WtcAYbHiubHCK8T8v5pdvCyKmcS2
	dVepVA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0873j37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Nov 2026 11:53:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so2563414a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Nov 2026 03:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706835; x=1794311635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=KK78crOGmZpSA555x++KwTfwjDuBx0eos14VrqpBCgLIy28W7f4uZKjNYHCI7ay+z4
         2yiQMJMvcstAWxARbkl6wagm9d5pCJdPQDIGKyQ+bDmXQr0Il8qweDzX5Aqmi+ES/jMo
         p1qyKLOd53d+6NGFXgfFWo7/m+hyV/iosjja3oBspeYvsOTBM9mfHfeXTKp877l6tdUH
         6x1ON/pCJLUfuO8SqvieUqr6Kwa2CxOQaFxRQcqfGvGfAqrFzwFUQ123x6HV4PN3w46h
         qpg4CNqiyGV2spbTKqgx5BUBc9npE2Lk0cUq5WUC49AxGU8melpdpfHqUlm0h18AwyGY
         05zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706835; x=1794311635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=ySfue83eqtsJ+RLZAaeO14eK0WDHGe5Iozaghqf49x5PORixIncZs1x/m8qFfIXCYt
         KGFQJv7rkhottZmfVP8/iSSiQ4m+CIUvEGbC6YbiS2zTTT9mcU+kZE0nXoGq2EPkY8nA
         aKadDfqTgBp3huq9X6IXGCxxWK89wePMRC9hjUkjXUUqgMSeGcmWWCtvCt/Or3zkxE/I
         1bLAlA9cZ7iYp2OgG/ikYfurui4x4ehFF/wSkbDhSj6dNIAsDwVb3HhpO2hyLLvju1dJ
         60l/t8CPjJZZu3LZrt7xPKCEN8sYlGTsbr0IpveuyUmC+IY101fHGQAcn28hu+CAugKf
         ZuUA==
X-Forwarded-Encrypted: i=1; AKwUvBxNjy0OwlSaj0SqPPPyv0tolLDigX65t8UvxQlnholZgLZVqNO8iV+PlgbCHCOdKu5B51UZe7ppI0b8IuEOSi5tAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bHwXZORI5ItgUmSubJ3XbkR0agm8ed53alwDzryP5QjqwG+0z
	fc+kXfIj2kJwVkkWSUCdfXY2FQmQnAx8uUbvtmy9friu7BBSID3qGF5F1j8J5narrjs3ZKa0eXn
	1P+ZeaB+D7udA9N/ZGgH36xYMy5mbhfhBFPyhZ7imXQ2E6duaJJNdCId1XzPAeYHrxr6FEu9tOQ
	==
X-Gm-Gg: AYBFou3g+oq9AkiwRhzodBItXSpGCSIMu7LVAd5rk7GKVt0Dp07YovU5LFcSj7sKM55
	5ZpdMOnekk+RM+Bafq/TQh2ZmgqGacbP6J3UCp4WTiggpGkp1vSEfaNqx+uksPn7H+UDvbsJts5
	N8HM59DWHhArzwXdNfLgC0OhYe1asdoDxyUhG6QNYRkJ+WcCTuDTLMWzg/Y3LDTI7v6mFyFxYcf
	nZSfhC2a6uIX6iTbY8+Q3vyZdiXKuP1RO8RlEMlv8lg9Z9s9fv9AbSTWYKl3EVEkzsyiRJhkJHO
	3tNMu7a5a0+KmaPdw+nxGESft1PbrUjD3twhFOu90R7oC9YzLFfXnp69RndCqc6FcN6w/nuB17J
	9bJwfhgHDJX9Umwk8CxrmmEvTWwrZUMT+V2C3DwaLU+B2FJporPN8cgXpX27JDlyNw+pXks4pz5
	li2zvhIw==
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480904637.79.1793706834790;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480885637.79.1793706834326;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364cb511sm1161045a12.28.2026.11.03.03.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:53 -0800 (PST)
Message-ID: <7a873a59-247f-4e4d-ad30-32bb504da40d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:23:34 +0530
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
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
        Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
        "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
        "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
        "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfXyxw4m9kc4MVa
 jJwER0k8CIJ7WCqeaZ0bX2Q3lzN5GbsNal4aPUfWjmGNz1Thsy4D7n8CYhdzgg3yjRs4IYyiFCs
 Fit/P8qUJSlKVx4V0vltSZuz7ufvbSg=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9cb54 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfX9SctW+s5AkUu
 a+gCxyntA9y1h/mA/55+aSIUidHdpoSDWdsUrDzFSOp1EKA0ldDIhSOmdptOOPCysOrmOxbsOts
 ChrEJb+g7BN5snCjRAxiPD+J181aXDgyAgvxPHzjRDGqCqwn5J8T2cbWnWuvtSjSnQbu+IOPDfC
 sv2H4TwH15Bbmg1AaRPTYA379pZ5AmAz3WCikB6Y23+ChYbuXs97a0/n5eU/vZOUiBK8YDUT5L8
 UznLXYi4bASrXgIsoYxcITX/BUshovkV336mPdhnIE8+WguFTeMI6z6JshMQqHgDjdJwZ/XZ4Td
 vnUcRxh+Ra+Qz2DYU2fIqv5Qs987YrzAtPYKoszeD3qxs+KNPEZzNcWk+dKUxr1QULOx7X/UzHI
 b/oddvKVtKZTzz6zDjKOXfhqxH5MUchAQCNJMvuJIcep8jZMYOreO/DwVGEkNGGtkGH/k1c+LW4
 rZsVodbNhNHJ6uqbhwQ==
X-Proofpoint-ORIG-GUID: 84Yxm7afcjTGoiyNhIJUxsyzB5VJbUEj
X-Proofpoint-GUID: 84Yxm7afcjTGoiyNhIJUxsyzB5VJbUEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030047



On 11/2/2026 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
