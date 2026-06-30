Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D58931E846
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 22:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857404; cv=none; b=emrrkepDwa79lrwWfaq32dNFn5rNEEqfnd9Ie6EKBWjwgeDnom36VIm9ZjNh4YuebOUSPsOYrlqL4lgueZZg2bu12JqH/zK9SOVk7TFrOafPe3QTMnwOOiHJm/AmUrj7723oELtxCPB7TKNdolZ6LZAs1nC73piJdAjavDHSYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857404; c=relaxed/simple;
	bh=lka07Gr3l2JawsdDoDkCfszFn1o8HA7+GaDRSGzKdLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GU+yUJWdNAQXgTPA8TVHwXY2p6UgCzq/xtLcf78FRzkqq2MRx83MSiz2GtNHSBU/9/Y2g6sZm1PGGf8RtBim0bU5aB7Fj63NGw22lShwo6H8oi4SEchSIMY+IM8OwCiE+LjlTl8H5O5hYpKwLrjDhkbv5GNviFwa1Ga6gGWCe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVVUyqEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEAAEWd8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVVUyqEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEAAEWd8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDcAm2959972
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 22:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=; b=UVVUyqEgI3aai44H
	QkYs6h4Sk/6/uPO94ctKOtJjj3n5+wTduu75T3lBINHDzCPeXdCe/LLgdz4BiIIA
	I6FCYJGuW6rbqCzG+PqGMHpMb6xjJcmfkHJt1PYgP/kntODh+X0VaaTTgDbDdP/t
	5mK6QuZEI5QJqRhPc//Uvx2PsEtojBE3Wf5jUoCGbxwxji82ZKuqfAGOBqi/CtJM
	MHsN9S66aTzRxKSc9r6r3jxLGT72P0S66dSuzw/gjfRycE/zeF8d/az8b9/+BxqX
	uSr2XsXere5zlNsaYwMjPVwz06xYAC/u+oMsdfeWvyWqnAZBEcPGno6XGT0scTZD
	4sRW/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j9114hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 22:09:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e73fc29bfso896385a.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857398; x=1783462198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=kEAAEWd85ty1iW7Ehg228b7WvVI2ivezDIzTJZHDcsJExAZFfE54uIJMN3ukrEJNaP
         IzRsRUt9woJFG+L9jC/IxUJPejgZTiUdX4JRrF4r6z+WCb00ywdszUM0o1rOhC+4vm1+
         XN1nHumOS2/QSeUZDl6jRd+VMogWYL+N0ADqzShbkSlegScjNLEYy++Yv0v7OawbzDiU
         V3vfxWvQwZDDffvGKjiRasDsIpzjeFL72OVaBDsRHsgSP1QIkpCv6jLTDuFZPr9zwoKP
         M7b7kfvHJ1ufBP9BsbKztO7Tszouxan8SSmgXnQqqqhVeB4iHyfvRyQb6j9U9PVoEkYG
         pvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857398; x=1783462198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71yptdqayaVFzpJtAQzWI+qpR5NfHXrkWbz9ikn7Ryc=;
        b=qMSOc/+uOBhBhP7tE0CjsGTWZg28+zmeg+n4FDYsdgsEOKcbGBh6luhctg24QDzD38
         DdJmwC7k9FF0HzfHhv6T8GEQeeMsWB/cK01TCvLm/rXHBksYA0nX9r/7yl73rdAYoV1U
         1XTr3yF3P2rkjRSlcLvJweqtZUYmuMLBHnO/rm5JJJu89OHp3ZKCYk/ErehEwpyaUn9u
         N02bTFZt/IU1ijmrZEsqql/+9Yjp+NRMgG8C4YrQAzR8kU8F7U5hEBHfY8MNqFloIxo4
         UQGgLNNBfM6ENWw7mfUWd4aGSyq35dfSyOcC3vOxe77kAf3Y8SDalINd10HuDFXnt3mK
         MswQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FMcF8cuxiT5uHqMNYE3UTVocL3gDBkAwAoHk/fm5PQaoKmrcqb+drVLM5A8VKP/rioj25Ybl9FUPCDeSfFQqzrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhzX6mvuQ4gP/LL0xTRiGkimL5htaWkqJ9R1aGa4PWRpm2cX6E
	1JKyhwejRHXXhBUGTijJPf2B8K+Rng0McMXhwseNNJ4EbWZ89Nc0uGC3KVXtoBT43K4r4lBURhU
	jb3Xsx2e/tnKUc3rPorgzigoUlFC1IYxBoCsctpuYaipUSg4oEW672Y92IcZ7RWUwG+gzRoX92g
	==
X-Gm-Gg: AfdE7cnwmsxaRh+nciOBawCgmxy0NJ7o4y7cBjTsrNlmYFCE+fmUILtI2dm5J3VmDwN
	KZRUgJrOuX3REl0h39pg6TUzbTIO26usk0qokBT60LHEn/Fz+AuPahTVFYlNhAmCBD5O2pszcK/
	JNbeNAdTx5KnBfwtJ4uecDttXGz9TMAbaLtnoTopBBpUezovQjh0wHj/k/ftkG+xHri2d503gNf
	CXkLTKOEEsIQLlT4jqt698yX8Us6onWQ2It4zIHs/Ofz45kQHjTHFNS9A3tzODFzISHkCF6XRZz
	e2MPCFAPeefHRAPXCKbHBUFwx6tir3Y9XzHS5BrQU6p+V6WX7cOHj9aNhoiXINepZw/5OEDZyJB
	e8FPQ2cTZE4I0AQvdebbdE3HnMykKNdBzn4dDmhtIG0f2QAKnLu7gxyt6lGsjow==
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434251785a.66.1782857398104;
        Tue, 30 Jun 2026 15:09:58 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92b:6805:918a with SMTP id af79cd13be357-92e6d926a2cmr434238085a.66.1782857396955;
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm11865243f8f.8.2026.06.30.15.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:09:56 -0700 (PDT)
Message-ID: <caa30078-9dd0-4f07-a206-2dcbd2ba09a1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 00:09:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] gpiolib: remove linux/gpio.h
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
 <20260629132633.1300009-14-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260629132633.1300009-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A9pC5vgIuS50vRgRmYbMYdE9Xn2zT-ge
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a443eb6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: A9pC5vgIuS50vRgRmYbMYdE9Xn2zT-ge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX/JyDVSrweGzl
 CWW/rhAqzNH48fu3z12bs8+OBFT2TQlM35azo9/5qqYZ/knszXrYT1EXp7Fl4Ueg7PvnaJKlfp3
 RUxjaIU5eFRo2LTQ+RyzTqWnlbwUJZOhGn6/rYJQxzm2xIGxdgzAbwoiwTEGw11RA5YCdXXYpen
 h5UeRV1kopdeTmXQma8KRk3Tpg9Szm3PpQn7w7ag44hhln9GFpgmlV9FxF6AM0tffbTQu4Ex322
 GiR7V/MkuLLeXTInd+NhI6bEWIsvnwGINxz+ZODT5p0zyCZQP5Yoy5ChX1w/qy0Mf+DndYMOKoX
 7iY6JSSTAS0UzKhs2v061yb/qdOZSTbiRpDq6h2Sogxsam9igVFh5odZcp5UnzKcgBkCxbPZWLU
 JFkvKfyMJ2PVnOzsIuicACdhSqWqGUIZ7CD4a0UhvJHoUMKCrR/ZFNbyZgK/pYTMVqUtYDazo0/
 4/7qrvbFn7ncZ64hUmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNiBTYWx0ZWRfX7r2igVZraY44
 seKSH07Srt2g1m2vZmrBcrimkjEWXbcY2A+Oj1T4/NHnO2ighu5xLsRVJYr7wOoSPw+fNma0XPv
 4AXQQmxVgrsfotGe8YN0XKLMFTVWyyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300216

On 29/6/26 15:26, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                   |  1 -
>   drivers/gpio/TODO             |  4 +---
>   drivers/gpio/gpiolib-cdev.c   |  2 +-
>   drivers/gpio/gpiolib-legacy.c |  3 +--
>   drivers/gpio/gpiolib.c        |  2 +-
>   include/linux/gpio.h          | 22 ----------------------
>   6 files changed, 4 insertions(+), 30 deletions(-)
>   delete mode 100644 include/linux/gpio.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
