Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E95219A8A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601168; cv=none; b=q1Op5oWtHpsVkiCkRCxEQv6GNS4TdwxYLzZ/bAt6XT4/IT8xFsm1U+eIHrsXYmXdfFZDVgteBcjd5VsAMXyO32kqPY4fu8mO1uZ/3eIiTvwMjZEnx+bdUQWqycEcHtGoObYm3/CfysN4t5Ic9Wowuzpm3FGxsXy4x64d021hwY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601168; c=relaxed/simple;
	bh=/iG9LaEOOKZae4ol1OEca4VnoqsdZ/YxkgR30xJdOu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFW4SVUsBtkb1r5gnzJfpjdxLBErMGVOyDGUuWd3gR9BjxQaE5JnBcjYHBTjKNiG7dj/SS7K1pCrQEvgRindW93TX0wh5isBQGUjl2mvay17tThj0la3aQWh+0FbbEnAPhudNVZdW4LgZ6+X+1o4boSdCUuIQWWXK2W0uFh5rKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0/y0OAl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNYNeNy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0/y0OAl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNYNeNy0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDCe1628459
	for <linux-samsung-soc@vger.kernel.org>; Thu, 9 Jul 2026 12:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=; b=L0/y0OAl+AJJOS7f
	w1PWvdtiYchzvRoPPGZqJ5PC98dZZjGkwHWPnmyI6lPB4JZ+Ch5QzTuUsb8GAI3S
	uoOyMLGYwDBqyN8db+oziIhRKWnYKbKIYpB4Ugdo5K906W+JosP8C/9peN2Uic+6
	FrUTAqylERxjEUAC8DmesG62n6SDOCQ218Ur2HHgA0OdxxF/3QFMpg4n4HUH1DXo
	pW0BKIKVtQmUVYkWNrYqohMTHT1rT8KyUjqW+tA+tTm319j4f3QpsHe8QNaOfi/j
	80OoPdp1MGq2xuPTsx2olI93kDkLY+qvmWo8xaiC8KuMDkvJEPhRkOO05CRYVxZ5
	Amnd3w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvupbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 12:46:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1849405a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2026 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783601162; x=1784205962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=;
        b=WNYNeNy02E0dUknscEyLdj2ea2RVm6lv0wjI6LtGz+S4iXX6ld9vjxthxwSMaw2Yyp
         8LnDuNGHmvwUth2y3XYKfNcNCowtrn9nRnwyGCnM1/tXRGn7MUckFDORpwr/mn8lxigK
         YCleCeRc5B0H+AtwSOwBjzJRl+T+WrbI7kEF+FoyVpV0lp+ZR9O+gRR9tcY2KskM1wBB
         uNiARfXHsYUgwokR2LltuyAolUAjWRuKIT1oz5GYnrlRi2xMgtVnoyEyCOKJuNEzxAPZ
         2Qkg3RoBuczE7VZJTiKyGkoUwMj8nei6oThlFCmiq2SudPwDhup4ZU0UdrlHXDEzG+6P
         yPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601162; x=1784205962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=;
        b=cm+o2TvZil7ibhugMU95E2c3oBZxq0lhnMj+KbyPziuqGD+yPWWsH+GHG+fWHKctkx
         Byx2bxz7nc8uKjOy/5OCTvNM+pOi5ZRWzX9DY+aSMboIwIVda2siyTPU2foSgOPQndnk
         Y8W6da1/KvkFdgrsjSBA9leqVOqP5vy4A8KVyxC/zh7IFT42C+A5J1zvLcZxkgQCUNZr
         /CQWlr7mNhkA3ZT8yI3QpKln0lz7SfaYfMCGe8G12PDzpMHDPmGnMVtZWcPicRscHmj8
         hKaY2V+VXHMimZSHsLPcPxjQHJyw/yv/C5jWUSqMYWR8FkFokzYd3CXVJx649XwUoi7x
         sTFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzLn5d115tS0T951Zzh1bvt1f/6g/tJynefvmKrLV3GsIvIAU8RqqQTOp+N6nCGFtbAmf7tW05t/pbJlES6Pcq0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8Hb1xH8Zr50qb11ATxyL0CPndAEFzFaoTsCPGxL8LbULMUdI
	YAeJGnZ1cGZr1PKFI/r/IcmqemaKCssMbgKy/MVcXNaLkuL67A9Xar0nsWXSZ/+LAuDEivulf5r
	9yWymd4SXooAatnpGWp2QTVsDQ62b5xQLKoh1IZl6fWFTd496cSx3B4PM+eOVU+qcINolmf7jvA
	==
X-Gm-Gg: AfdE7cm6xIrOagt4cNeCzG70IyBsDqNM2Edesq62PHBFGiC0B2nUIf9AAm+unhxNQ7f
	HWblv1BozoTf/ai4RaDjvMFr/19H8HHX0qZBQ/N2jhX+7VCdoXj9Y74zMSDO4yGO2Rte92c4XGN
	J/wADgZZM2bmwDANkIbvxOFTuFIGBWFcg/GO2a+yreftVVjHujVCjBAPvwfDmK3aect4cEeUGhr
	58WtogHiJlvdX0HHhE83oAz+OyPQ6mrghxuyprH2ChhPAXmJ94lRtts6Dv0DNY92/RXXglRPEIC
	wf3yKgTDFMuYhudRZwYwLrYmH4EITBusaTWBslaE7zvRX6q8Xc7svc4uvHGFS1pAlZ3/tDYgyIO
	mW24DzqlH0W8KlJCRkXL/3W+U4p0tJ4s22BiYz/LpXMU=
X-Received: by 2002:a05:6a20:3ca3:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3c0bced482bmr10459357637.22.1783601161848;
        Thu, 09 Jul 2026 05:46:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca3:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3c0bced482bmr10459285637.22.1783601161268;
        Thu, 09 Jul 2026 05:46:01 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.111.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac178dsm31739101eec.28.2026.07.09.05.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:46:00 -0700 (PDT)
Message-ID: <bc3afb69-bcf0-4a73-a9df-4321c32707ea@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 18:15:48 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
 <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
 <ak906CqHYDooQTVu@ashevche-desk.local>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ak906CqHYDooQTVu@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMyBTYWx0ZWRfX9BQGhlJaz/up
 7/5YYGEM0bMiX49/mbgAHzLi9v5wYnV2yOn4Hc7WGmmCTZQU3aB7eSVGWhomp2HQUFHG01hVM4K
 xYUDTQJ7DjFeLEIJuI5gDGnys3/8ovI=
X-Proofpoint-GUID: OF9ChyiJKkMNljtIjYiMWhnxOzIi6pae
X-Proofpoint-ORIG-GUID: OF9ChyiJKkMNljtIjYiMWhnxOzIi6pae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMyBTYWx0ZWRfXygZb0n0WWQoB
 TGGshkozdEmK2xX/kax0DlC+bsa1xTxNnCBuHLfGKyw0KKIonui61oQ414R6Cn6GHaVesDqbEoV
 f0DSWiL3VM4j2J3tLQnTT2YFfpQxrK9FjatW15pqdMbI8uZQDP+xBXfPcD6DQYR3h9DlLva+b2P
 /eNoahrF0gejEdlEOJA3qrpVjNNy4EykAn6YtAA84mPnY1y+x2jwwlr3K9Qgin6/9u7byTz013S
 9+A1btGotVW4+0+Pt/aki5Hz2zpJwN7eJD65ICkeGecg0I+ey2Y2tQqKK+Gq3rgb/GohwOXYun3
 MH2UD0AsMmo0zMRq/ClPTWPzxMu1vI0QVqVtoQPOxB557n3tyKpjt1Gq3/HSOZ4B4q5XBmfH2QM
 JqkJAVks650cFFRR7/iut7VulK877TwV3bJlBeN9COY4ts6iTyealmQL2OCuFgbWcbRH35ovull
 VjhFX2X+UPqL9xDCY7g==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f980b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=vz+FLylpEn3mlzyIWlmD3A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=2TZWhx8y46JuiruMumEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090123

Hi Andy

On 09-07-2026 15:46, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 02:22:17PM +0530, Praveen Talari wrote:
>> On 09-07-2026 12:23, Jiri Slaby wrote:
>>> On 09. 07. 26, 8:25, Praveen Talari wrote:
> ...
>
>>> OK, now I miss the rationale behind the patchset. Neither there is a
>>> possible code path to actually test this?
>> The rationale is that qcom_geni_serial_pm() calls
>> pm_runtime_resume_and_get() which can fail, but its return value is
>> currently discarded because the callback is void.
> So, you take the solution from a wrong end. Just get rid of .pm() in your driver.

Ok I agree. Now i can control resources via PM runtime APIs from 
startup(get_sync()) and shutdown(put_sync()) APIs right?

Thanks,

Praveen Talari

> With that, problem solved. Really, this series is a road to even more broken
> PM solutions.
>
