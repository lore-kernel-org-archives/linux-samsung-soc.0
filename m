Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1530B31E846
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857331; cv=none; b=faERLISvEANAR1909IRTgedWwKt8f6+AjO7wluUd76qFdUurLhREvb0if36pxROj+GGMj4zUkn4iG3avZkveH6v7E8B/T54vO8UlCDnq/O3L2LijA9ZpSKnFtuFpmOGDK6VLctprw7eU7xyg48svFjGK2Pw59VQj9hcZbXJT+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857331; c=relaxed/simple;
	bh=eyMPhz4D72N34DaHLBk8TtAHe/1rzGfpY/U34NdyrfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTjLUdLxJZ/HP2xGcAr2ciOjth86L2UfM2b+3vcdlsqpiwUDseO10I60QOh9/+TfcXHuzDTiVvDq/pYFBYqphQqFUo1sSBeKhF5Qxm7pCNvD6TjmljrPneerH0mGy0qJjdkrAy//mw62ZbmlEYIQNr/Ipum6gkspC0PSQfpPnKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjdrKYpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaDRdcoP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjdrKYpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaDRdcoP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDkmJ2946987
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=; b=YjdrKYpVqZ8H9XAX
	ibF7vH/kUADBSYjVGZClU63lnyKF8JVv5GZII67PEhUmScSfLZEtlySCd/8RXj6x
	o+rkx6Eto9cTsN3V7OIW3H3NJVDGsBpAi4uBgzMTXdfS8EGc3015nJ1/UL2kEZ4+
	BA9iwT1xYJSu51qvtJlUaI7KWY9mpv+Zf/4q7MA6Zp7fhxha5a52zn6FeCol17DP
	00t0lcWini3dby7PAFSuxWS4FE74H/bGbkax08nYfIc7ANpPU3ABvUKZKfwTZ7uA
	3ZIoFEoYf5v4XPixYIG36bcjUj9HG8lp6iaVzz8ebgdDiRlDt/46JVeyX2EfpF/f
	aeUJpA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpudf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 22:08:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f871so685226d6.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857328; x=1783462128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=EaDRdcoPceYoAWWUwIABiowKA4xewzdMc0gWkmN5YI4B5fvUgR0r97ljpcBh7pYPum
         Iu9t6cIR/v6ZyzFFS+67GAP99hO3p9A8cR5pDpNEx/BaqSEtfVfaLGdXSaGKYNiN/YR9
         7JtpB/Rw3BQinIvKbYVHwtjr7VMPL3pYrzc+BlzcGrbjuD45LolyizX/ssLCjCOfdCFO
         21fDXXr1D8DW5xVOBg3DGONiiZxODGhEBgGmB9ZZKoj7DFKhN0Y8W9nwQhEWAXhyUWca
         pPphpA+1fknebnZUlAdDkznvkTfjuXH6gej05AM++BuzPNFZ8dUStE0eu88NiOVHJosH
         3g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857328; x=1783462128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1ZxiCoDe6QCyz0498GlQmGlGSpLwZNnkWsIqh3kavo=;
        b=APS33Pbkgqm8a19teY7bm0PRsJ17qJg5wi+VApoQI47yOVwuG0CvGfYeCXOHCfQdcB
         WZAQrrqp9H2Fg6GTHCz+fy4TjcaqOF1U9rmXgP8pqFkiMklI+nK2W0iJCbpjZWXYJT5O
         7tb2FbBTspyV6bKbQAYOLYKbMN6vcJgOzaJQqQBIP5uZr4UcwtLw96R7hr+x3VBILOys
         giKozSakOWvnU6UFw8ex50iihpL0+GGR/Fyx1wC2C7U8QogEqL6zamwRtZGb3FH/Hxc5
         tIcoPorxKm7DIMBzbexaEV/qlS+ht67Y+vaB+ooDvxSPdfU3Kenzaq6MtBqR2rEFOsu2
         UOEw==
X-Forwarded-Encrypted: i=1; AFNElJ8AdwugUo2UKzWkGpiBgNxKgMvTbyQb3jDoEpLHQiGUYKVYPV0YHFKjB5smF2G2oALwpqSG3gu5nhVYL0hH4aMeIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynNRR7sePtYNs3jHjrTGfYYd1aep+nRQr5d9atGbFBBjwY4G81
	fLMaTQO3UGwKb1sG/jJmaDP2D4qTMf9lP3Q7ACKIwGsZitZHDt3lUEV9bM7MoxUhJ8InY9J8UJh
	Ovtfi0fPwS5ZMW6vT+w2mgoKRCYic+ZRsI5gmxYtmVfyT81140+7MDKjD/lltB1Fy+c79X6Bo7Q
	==
X-Gm-Gg: AfdE7cn9n+apgc8l2NNAH02HbSKNHlNqUTUcMiXpNI7yLU4xVA8ld8pwMVoa5Iv4lHF
	4cWZVMmyy+pvKGRgMsYOrTvWagQL0ZtHBxIbHH7spvT57+h7VN7yiJzqVqPzSUudfUVd7WwP1QU
	tbw876V7NTgNWb7p7mZHiME6X9VPbsKUt8ssrMfoXMippt1g3kKaStHRJx/k1FdBfDr/HvxM/Gk
	XANywOXIfGjIDdZ0uqMpaF0hqGTGRGflEYufZfxP6HPHwVYQ2x78nNbYPS1y1nFWS1RrdNslnY1
	WJeSXXnUqJtO2dyYKWhJiH0CFYx2mJEGdcC8Y74mPpHkdkf8PulFD2atA16zP+T7fh51wyP4gcQ
	sZyppPw/UXyznzei0vxEMNpjGPvRjbg9XVVm9T8aiKKZcDhvtOVa5g3q02DtEiw==
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404388485a.15.1782857328385;
        Tue, 30 Jun 2026 15:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:915:8502:f7fe with SMTP id af79cd13be357-92e6d7dc6cemr404382285a.15.1782857327863;
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d9daasm28380565e9.9.2026.06.30.15.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:08:47 -0700 (PDT)
Message-ID: <6bcfcfca-aee3-42cf-baba-9a926ef26471@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] sh: replace linux/gpio.h inclusions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
References: <20260629132633.1300009-1-arnd@kernel.org>
 <20260629132633.1300009-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ORebckWD3m9NXWtmzXIetYwgNMcVzLqZ
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a443e71 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX48zbA1Ac1K67
 LzJYHIqeTXM8/8OSEv8mRueP78ACfvKlBwNZI6RtNzXXg9zdI8ROtXajfcuMMR51C2p1VCjXH+/
 /7/agKNRB2+13BwGRELcgevXQDjal3nPxoRLM3drp7HE6DBsHyaDe/aQPT+VsumeBDc8QwrtmpG
 3c/XG+ybQFpPOY/VWHzb+dqX9xQm6BqbwxczvzO4eAgbSsg2LKUH2tz8WmCPrlvSqX+aF7Mam8n
 PdfxGKDrrkUTXxh1mrR3pYcx3ybr19R+O7hoMIFJLvBEAdaNVn4cM1fwcZ/ClX0WH3k+wcAPqqQ
 dkONUOEp7yDZnyiUXkfXL0P2JoTdwtZtIVeFhmOxRPxQ8S3tKLtwYGGeDRp1BBW2/J1ae4OW9yn
 q9SRUXX9b6CqGgGHrxTTeCv2xDFbeqXNG7rI6fxHcdEdL8FwJdNAScXkiUd/JWYsxcJqG4SQ5tN
 zx1NLi3RlTan26hJeJw==
X-Proofpoint-ORIG-GUID: ORebckWD3m9NXWtmzXIetYwgNMcVzLqZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX9euckhx1KJ7h
 uHBeO0BwA36MEeLJlvTF/hrIU28jOzD5G13AjMtkaUUUyX3wLUwLesYkZdd2RcoLvqjFgkKa70q
 CQUoslo1kcx3xRtTnXA2bWBAm8uxkgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h should no longer be used, convert these instead to
> linux/gpio/legacy.h for the sh boards using the legacy interfaces,
> or remove it where it is not needed at all.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/sh/boards/board-magicpanelr2.c             | 2 +-
>   arch/sh/boards/board-sh7757lcr.c                | 2 +-
>   arch/sh/boards/board-urquell.c                  | 2 +-
>   arch/sh/boards/mach-ap325rxa/setup.c            | 2 +-
>   arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
>   arch/sh/boards/mach-highlander/pinmux-r7785rp.c | 2 +-
>   arch/sh/boards/mach-kfr2r09/lcd_wqvga.c         | 2 +-
>   arch/sh/boards/mach-kfr2r09/setup.c             | 2 +-
>   arch/sh/boards/mach-migor/lcd_qvga.c            | 2 +-
>   arch/sh/boards/mach-migor/setup.c               | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7203.c       | 2 +-
>   arch/sh/boards/mach-rsk/devices-rsk7269.c       | 1 -
>   arch/sh/boards/mach-se/7724/setup.c             | 2 +-
>   arch/sh/include/mach-common/mach/magicpanelr2.h | 2 --
>   arch/sh/kernel/cpu/sh4a/setup-shx3.c            | 2 +-
>   15 files changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
