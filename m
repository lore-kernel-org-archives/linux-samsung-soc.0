Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21704F96D4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900118; cv=none; b=oP4tPYpT1qx+ujnEkY1xuhtfEgPeQMUpBet+QC7q5x0y7LEpYFCXyrJrlDKdbpD94RwHac8fDgWzYBSVWVJGFJMeqa83XBTNvw9/uNX1y23ThKSggNFsv1CWNJ9hChK+gSSBscbKN6Bw/2ssiSmcpD6WYWRATaqb1C6+7CqfJuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900118; c=relaxed/simple;
	bh=ssqHTpXGgabYsxdvcp1m8bbcmPreD+147iRzWVW6JUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6OXc/io8e+dPXpIPduNVLNsVB2pH2HH5kuIBkkvyh6BwRRUKOVG4c6ZgNh7ePKD3hsgef8tbeXQ4ImL5dSd+ItPO3VncMvKboxvsbvkkOwDanj0o63vJzlOKWr16UMkEJXkSG9YDDD3R9zbokXHVRh1fbjh/Sr5EfT4VDo/+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wpjj8CGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+qPpj3s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wpjj8CGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+qPpj3s"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9073W791622
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=; b=Wpjj8CGKvd6syAsW
	wtKuWOEMzXdAwfjyWwU63oFbmTGJfc9gDeAOVjepqzpkkwH2dYSgTtltVa7IPRAA
	75SD+S49d5Ta2NT8UQbJavnB1yms8R04z7KGX9/T2o8WZZYRTbsiDOiYK5+X+fbq
	ADm3eslKt96bcRGzrl58ToWkng3HWPaKp5Kxq102O5hvnQJ96HuQ2ghQThOjYg6/
	D2GT8VtVNImIR797Bb40m6XIzGj3ztNJbUjovqtOLzJMGC16JTJK812OFSw4ofAn
	khHOX9hNckkAnRUnuoA1OKmbr2Jm5WZjW0+wrGX+m7dXsNNhbMOnrxOY5Kx52GUt
	ZFBK/Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjs7cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 14:01:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e199541d01so4827645e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Oct 2026 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791900113; x=1792504913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=;
        b=O+qPpj3sc3Qsu1ijR5JNfBPshJhgFrbuRtC6V03Hkgxz6wc5tVE1DcXD8KVy0EcHGs
         vX/3FfSTf8DTfpuKMubQwLkVUbJCeKH334VL+CaSarIHRJabGaefXlsTbqkt49yZKnj9
         YxX4BpEBSE76fRwX5TZA5rXiX7E+4y8ZGXaNRUWNujGKwvTKjRcRoShA5W8yrFYN8yfG
         Rk9VkS28qFAnguDFA8EARI+NmxX6ScNyxW2fyUhNOiKt1f/jk1KxCzBiJLtWszJF5eV7
         rQj7k3hdm8q1jXiaNPPLNYJOnUcTiilP4+38ch1ZIm+6gFDH/inbzk59p78KAUvXf+eZ
         0FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900113; x=1792504913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=;
        b=yMgKXq8d9Gn8T7qlgK4mrWQg/u2/3VKC91qzlJS6cfjvENCmwup1Epzf5BbhcrXVu7
         WyQC/mwpQ7slz8+FWA6bT0xAzUpGEW+N1/3w8klfHLiaeDYFt+wxW9LrXwc3UCcm581H
         CfmdIbcsdjOxeYB7IQVYbdsf3bvqzmHbaoWqUMP0kNHM1jj+GKdrdU9Mqd+kpXVrbhIU
         QojW0tDdQYyA2uXYCrCXl495ujeK3YoHK4ZabTlhvaGjGu02w2w+o5Wdcff1M1VcR11x
         3N5MPfm1w9v8W3FaxYicKcH76jsr206B6912kXOcT1bd2tiz4govx6PEUoOxeOClEqnI
         Xaaw==
X-Forwarded-Encrypted: i=1; AKwUvByQcQdn8cQ2AvKlJ1GxRV6R1IOLb1Z6xoaVC6368cDybkLTL4xcNh5s76CeL/bAz0TOVWmgo0IWfPSXRH+GGCityA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6cPUxmo/Xft/+JMZxCilsr++oDNVz85TAiqLY7A24ZB/Fis5a
	J8nebWE1+n/VRott28nhYa+W5Z+5wd13g3H3CnUPjNdhJA1zm2JLkUbOWoDyb0KpO6VddjEIYXm
	SodsK9GfdUbJUQE9fLOGaljQjuKYjxOUxyepPaGAk2iT+gql5aO9UQ5RcDiilDJVD+ZyaewLbyw
	==
X-Gm-Gg: AYBFou1v+DXurxFvn1/GTyTY/jtelTLinF9LOaD5SwsjiJT8RZ+dQTRC2IvS+Ls0HVV
	djAJOHRydh80c4Ssov07zybxuugIg/EUS5zjNfI9rf/fAYqlVd3OwnV1VbNc8cndEamlBwzx308
	q3EzZQFyal6w+VfoyTilTjty+vX8QFtN+rjwghUB7ZJ1rmN2WX1AjuvbjKgojXBBgLnQ2F5nQm8
	Pwv/VWaHhqYx19zE08SlTsGLUz2fc8zaYXN32I8atYhrQBwGR3LGVUygueoLAnDEN+lVHk4w06c
	bvRudmAms8d3YeHxNdLg2x8viJ4Av8GmetOjqQslSPMjtPN0yLZNs6wzB+TYxup01PeXsd3CwZc
	bfLQnDSsvmCzN/kNAjefaPZy95M+P
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr4193257e0c.10.1791900112786;
        Tue, 13 Oct 2026 07:01:52 -0700 (PDT)
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr4193151e0c.10.1791900111802;
        Tue, 13 Oct 2026 07:01:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm377260985e9.1.2026.10.13.07.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:01:50 -0700 (PDT)
Message-ID: <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:01:47 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qroaqvGxJ723oddy5Y5RS6Dr6cJvukrl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX8gM7uPULEnPl
 uNQk3F0lBge7S/+3Z5QIOI1HJCdONa8407INlQAhI7W0IPDounKhkiwOIVemH6Tj4+vgi5QLiCB
 4PDmgtDP1ilPbj6DTmUkp1sVhHQ7VR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX2LmubcwgdcvT
 0BOtNPCm6rNEfO2QPk34auhqz/zAjJImAWy6URDeRi1/26QIQhZcUnYRhMpfEZse+nG4FThiB5c
 CQddSrHKHNDj+djMW1on3c1/zEwHWe26CeMHpmPpJUv2YWsNZ1nP5fHtzd7Paf0RsPOC7HviN3J
 tWem19s1EUTGGIYCo5DpzREuFrrRu484sXlzpOiBUUG5RHfSYeFBGq0vjyyJU21HkGEwK39/oq4
 aAUacrscqDMct1USgUIwXR8i75mCKQx65XQYTfYJrD1pzjTwZSwsYfhvrU6JNRmePytoClYvnPX
 I0tma/B8AfQ9utgpH6IxxUy0o+4qG1PwLX7KrUO3b7cTjy4EIyUUhOae6UHyk722b3t7UZ+ToR7
 NLaEIldy/Nw2gf6fPpEM2JuQodeiGg==
X-Proofpoint-ORIG-GUID: qroaqvGxJ723oddy5Y5RS6Dr6cJvukrl
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace39d1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=xpaw9_Cwbs5_s0yaehoA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610130055

On 13/10/2026 15:33, Daniel Lezcano wrote:
> Hi Tudor,
> 
> I noticed I picked up your series without notifying you
> 
> However, I did not pay attention but picked also the dts files.
> 
> Shall I drop them ? (AFAICS there is one comment) and let you handle 
> them separately ?

Were they reviewed? I think no, so that's another reason not to take
DTS. Anyway, it must not go via driver subsystem, so please drop.

Best regards,
Krzysztof
