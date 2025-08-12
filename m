Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA02E7F10
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Aug 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990066; cv=none; b=MNFE2XlBo/Tu9eCq1+Z8w7cloxZoP6OyH2sydS/ldHW4c/BVViPK8iTleBLTrahkdimbalsL8xLQu7tCbVqWigr/7kd3l2L2Y6P0ZjZcBcmEEIf/qpHMpwb36+oqRcoH7uHmoLPbMT612IpWpYok9lw45WO1waLLSd/JwfULNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990066; c=relaxed/simple;
	bh=Ov0Oe/fjUSgAuHs0OdT4PMNwtGL69MPkRBbW+7CrYn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQRbjh0DyKgSEfimHnCsH6979LqbkLSjjhfWC9qgWu92OFK/jABu+vJci8PVEXVM91Ss7u3XB1N9DkVfQlm1Y/DF3bF1jMlBfcgK2hnZhrQLp+Io2gR5k/NDbBG79eTwMirCU0e6Xyir9JeYpn7kLRkRdWdGYlu+EC6UEtuVYjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfdgQiWN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfdgQiWN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5XjfK005401
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Aug 2025 09:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=; b=cfdgQiWNNxQ+3gOz
	tvXu+hfjH5tUiLlCYXVCQj4yajCG2tbwmGSKj8r6EPIclyHu34r1Mq6Yl5gff/Z5
	rjMhJd4x8GzKxE6kL3nIqqhOrnJOSnOb6Nrx14iYpIZqPgyuDd6VhuWRuyrNAynZ
	G9tqJgPuq4rYDPz+y5a0M3z3ORQGSwDcElBx7jEOo2ZRLufvhAIOGqeiaOdTkzjm
	tPMLfaaWIzvq2kY+T0SliAsuaDCHIBCqnpus61yCdav0D9wmC7jEiFf0YfI4ZUMZ
	BaNmNlevD2vZKyrsN0RYsV5OylahioN/uPBIRG74BeWZcuwuvK8/ihxzhffefMma
	RyIkIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5qs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Aug 2025 09:14:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af23052fb8so8198271cf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Aug 2025 02:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990062; x=1755594862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=;
        b=T2lqRoixYK6bTudtBJ45T0dCWFBNNxjY8OLNOnH0J1bM+k9u/KSv8W2+6Ew4uJXO6c
         lLrMGQEOiGCp5/cbVo0n/1PthlHgVXYajODuRtEpoQXWRL9eTRgjsFB9MEwSwfjpVCi4
         KJGuQU22vbareCWqnWmDc3k26LOHLvPv3appj5WJGNOJ5zOyedvIY33qaxkIMvVlW3ET
         WMMCbH0iVBli9y8NyOgQBQbyDS3Oty6oGGEPZiaWS15xnUV3p1iASIgr27e4GElxizSa
         qOfzdrmUMJazUAUUt5ZBlV19ZJp92e45wi5D1e2GrLXFgEtta/8yAheJcD5/GEKk6m1X
         CtOg==
X-Forwarded-Encrypted: i=1; AJvYcCVun49FGaHIVhrU7L9iT9UlbmNTKLeSkLWpzd6qCA1ng0kMWP6val89TG936NYGIhSBF/c8zmfTtX3xQImPQdE+cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHsfx0+0acMGs236WeIn1/LCEBM0+AmRBrzagTBTWXF89H087J
	JUxslbwBggXwZAkOtm5j1fZfwnN+8Enhq/Au32SlwDTpxNeDR1uM8DnFOyQsZMsgEUwWrREUCWe
	T9wphXOLLNbtrCjn0LUqlMNxkkdwIBQhj/IrzaXc21Rz9Y6z9YjFVzKqJi/2IXxjyNykYC94CAg
	==
X-Gm-Gg: ASbGncubWtP8f6CPljKOG072Xdg5y9dunpgrCvtS3C3VI+wd+6wuGA5+g7rExNJGowU
	/QikfkzSG2gLNwATyq5WubBb5xuidcDE3/JfhETP5aS4lKfmhb/OOFzT2dwQIuY2WDSmtVEHuvl
	Cp4XSwJTijHhFPOHip5I8qwTD6R4iNTHHeGJ1tQStwkamalAR4wMhlmkdARPaKED05b9DN6OVoi
	RADtam8oDyMI1kiiIkfdxZAm2wxeksoznkz7p+sNcknxgVMm+pkbI9tPR8VEqa+YL+ecul63jCU
	dvA3dscIKaQcmxEMux7ggerRJTBC01MGVbQBOHU32MFmiorwpMKox7xt4KDRcSrXsT6J7KVWU9h
	3uxvc8IlxNBA7XvVU6A==
X-Received: by 2002:ac8:580d:0:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4b0f4ccc1ccmr2590831cf.9.1754990061597;
        Tue, 12 Aug 2025 02:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV6Qlx1UbGp6Aaax5Fxj5SKbEXoDO3q7jBZvznDhAU+9eJcmfQCUOIdtA9nAu77phChEO34w==
X-Received: by 2002:ac8:580d:0:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4b0f4ccc1ccmr2590471cf.9.1754990061134;
        Tue, 12 Aug 2025 02:14:21 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218aa3sm2185232666b.93.2025.08.12.02.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:14:20 -0700 (PDT)
Message-ID: <86b3f3e9-8a48-4580-82f4-68164e3022b9@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:14:11 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 091/114] clk: qcom: regmap-divider: convert from
 round_rate() to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX+isPIJdw7gOM
 R591JzfDLC6dcVIUvz6ocfvTFtS11PzZQ4QoqLqt65GMeGRMH02a5pVhsO06FIlRO7f6Pw5S3g7
 lhEnpCq7qUdjTa52M75iPxjBRib1yqOIprUlzz3tLkY/iI3RrIUQ0ylzWD/Hrtxte/pzU4oBGee
 aXjQ7kMqo6bMHkhZZtHHfk/ue2UghDHLXxT5/MNTv5lBMllfp+hdmaesqjxSvYJwTt/ab52qpsP
 HwB9ZLGEYxhLVS6N75V2CM8kID1GLNXcNZSPjkBjvq3VJTyl4FnfFCu/j4unoz7MMQxrYKhI8sW
 0J9N1I096rkhoP/5fULG2SdfgId7PURQ3aFWtX4PBSRAiURzu5T9mfxlWFhohAz/yXXxaVV7LtT
 TchHnqEb
X-Proofpoint-GUID: 3AJNIEtNeTNMwjxRxGSMjmeTB2ta1Bo9
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b05ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=lhVY8u9YebhmjeZYKd4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3AJNIEtNeTNMwjxRxGSMjmeTB2ta1Bo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/11/25 5:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that prior to running the Coccinelle, div_round_ro_rate() was
> renamed to div_ro_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
