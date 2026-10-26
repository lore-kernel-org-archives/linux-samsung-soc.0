Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013064;
	b=NLFpEAHJ0AV9GHf3Uj9AykRLBqSMj9k4doHP/WJ91jnxpTks58FDHh9SYwN/+LryaewU
	 DX3Ls1T3HlGXdrqJeZb9C8XimvAE2loJnm5mxmORjsCMsXu2JJ5e8iL8DjGLIeVTxK6Au
	 AuA3aYAwadSGua5cRvyoGsVw6cj8KaGHG66Qk4gpic8p95TDxBNgzJPVTArmQGBsYnUsx
	 Mh2I0K9j4ayGtM1BqbWxuDNuulkh8c65QVcrqJ/ldNtsOps/jqb4lWHgLmYWPAlI2NYar
	 NNTp2vUqBUKbEJ3rD+R2swK0EZBlaUdw8Opvto9gZEUyjs/P1JiwtPik9m+bVtNXNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
	b=TKW+/IM8qSunZeifRIXC1KONyEqlkE5ouInczVxvwKB9zvVk6RfacmMMfc9MpEDux6SJ
	 G/BoySFNxE4YTSTMEnvbZqtkxKfQv4m7bh62L4Umd7jU7j2ey14Q5UKns0mxkCbrY3H3r
	 WqoLiwXZTHKgU1e9fwfauEs5vc2MWsBAj8ydyGdzR4E6+QLw5BNZ6dy58Glom1syzzOC+
	 vZrYad0vtGRwwdn8ALLTeB8SDT9XPZWtXJuXTVz5H7hOP8W7+QvZugWVmQ0WotEe5oQZE
	 ledO7dwckMxjOAkP5U4qFxhrcNKu3PCnY+QXkZGsiR2UK6bTIdvIF/7FkSRP7rcLzgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CoNVTt/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3VVpGSk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70F606E739
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC70F606E739
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoNVTt/w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G3VVpGSk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9dd3049850
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=; b=CoNVTt/wg0dZFClx
	IKMDZ7tlMz+/NZn73DytzEzpH8rMCz2JqFK+bpL6iVSbKYS64sMCiau/NPeFLMQc
	qaN2SPZosMEXZQQ1v9n13dzA/0NLEdG124wtfe+rFuOoePloJRl0awLDq2OQOs+W
	SO7D9J49wPSnd3jrDGRH1LCsmpURaI4vpnbP1t74IR4R+dsCcHJAw4wd3rfhhZQs
	kR5Tm9g0mkTjSEDP82haOZuYqFwIWpAGnTjYpWJYlLGsc4GudFJFYaJv2hop32FN
	Mm26/TxHtuMTR6+s8OgmAPhPN92oZAkirFyg/Yy4tebL2tM0kdZ/Cq1BGjqSqUsj
	wZZ7cg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so366170085a.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013062; x=1793617862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
        b=G3VVpGSk6UKh6s0SeG5WW6AzVP8rIm7HDhuuyLkxLALU/FOW0U6+EGSSnoWMd4zpth
         ViyCQh2vbDZMDcruecO/gVE/+iEw7IlwkBNa+nwWqbz5v7CpPsAe1IGC2mIXmlap/EBE
         5ma/HrHYO5HZW8w+KEwccjpzlE1uO7YVQPC+pW6bHrCtSw7lSP1lzVPEH/ipNXWPxg48
         JIMsZUvJuz+bUVEum1WCG+onexOieGyoLpAYkx2lMjrc5vosOhRiyqdOa/0QUaxn4LL0
         DhuySKxOm0jMrGIOyHIgbhUzAXsl5oB8Ss77Vv3qwquuTq4Om0YrKvY9FTfWcDr1UFB0
         sUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013062; x=1793617862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY8BWoJH8w/x7seYGIIKWtBAXqP7TPJ+H06hDuNNvmY=;
        b=C3E+keB3ruKxd9NAPyuRqiGvf6dcOCnahHzaosAxyLxHvV5puy5knWwLILpnEmhnzA
         IypRq6qHsAKGSUuLBmTYIs7xuYrhef+i80sLuUiwqNyBabzo2/0bC/yPNOW5KT1nH4Ci
         rsMJMunT5JUUydTpCt7OKlgk0QNo1DGE4beG2/7szFLspirI9pAf4MiERaOnkFN/YNib
         a1lg8kxBG+Q7UT5WWEc0REQlY9PHFZibPoGJm94EsJOkkvWjpzUwitaDJlYR3xbvoU4y
         AeWrRNQ1NcqlHbV7atHp6cuB1hkPKWAHE7uNaBC3PiiiMkUzrd7uEaUsBMetsXXfvuI9
         EPIA==
X-Forwarded-Encrypted: i=1; AKwUvBxQop6Fr7f9k3sqnHQY6T7OkiQz9U2XcaceI6VmV5vQFzAIdB0UAaPOD1ATqNZQrtAHvPLLEDCW4i+qxX5IMFzX5A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLS7o8m+DVQ2VuJAsVa+K4b5o8xWOJsNvDOcKB5G0PERMOfZua5
	Lk/qsmQsL1sV+okwz03qHNwrv0tfZ3OwB3zN2H3xxGzLgM1f/eAVPq6+Mc+P0uCttRxsxkGWFam
	r+38mSsYItdgtip+ZL0V7AXHdETXWMF7HFS9Qha34rshlpiu+puJtW1ln3BL6gI8qUGJg343o+A
	==
X-Gm-Gg: AYBFou3Pwlubi9Vi0TG48ltIu/PrB5U+cV3xDX5Ln2H8Mz2TJ/YC/iU9ZGtbphiWnkx
	y0px3q2ivWpCVcYDXea/B/XYU1kZpyrO13RyPvNbqdUU/zCIACTj/scP61L7UAXnQHjwVAjmF5n
	jM10eG9+6phwNMDvqgXqn7hpk2DIhHVJlDottuKExuvr9aCaXqZDK4Ao0Cp0NFGlvgOdXGp+Z8B
	5z8AxGFyxUmgKVW6R+yNd935CH7sTDhtl94OLnYIZClpTxnt3mCxJ6qE8oXjP6mMU0mCTSXaQQk
	xtj1orEZyzXEFtp5oOboucCqmUHDYTBMxfSfRLQHD//h76/qq6fUd45ZN7eR7TyrOrq2uVDubi8
	WJ9zHH41Q6HZf3UTqFWsB14SmUVfGj09hH5RBAfsPrQrjE9Jck9sgvzklHoqtQYeM2ZEbItKUu+
	7mKXMSIt7rAg4h
X-Received: by 2002:a05:620a:1a12:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-940ef9add84mr1002516685a.66.1793013062056;
        Mon, 26 Oct 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-940ef9add84mr1002510785a.66.1793013061497;
        Mon, 26 Oct 2026 04:11:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:06 +0200
Subject: [PATCH 17/35] drm/fsl-dcu: set the panel orientation on the
 connector
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-drm-panel-funcs-v1-17-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NybjcCZxaVBV8YlLKaTAyHmm87V6T4TYtZ0TLbzplQY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUOmRe8CEbGjT64KtPnEJZg/5EMluF4tX1Lg
 9OIb9ldBJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DgAKCRCLPIo+Aiko
 1QpUB/9uR3l3GfVIvTKbA10ZF19l1tvhKCRzqc+3iCVH6xmO7vqg1/9o/l9+GRVdBZJb7Qt+ZoV
 ryAW6z5syuqvIF6XU/Z1zs3gzoaUULDp0z1E5cxM8sHDD2KSmahajUh8mhN5hQpY/NdAmWWRybN
 HhPwxvxRuXM6fIyMbV0HOFGjniWA2/TJ/A48YxNlva6uqAIq1y1+Oj2SbU1jrQCnlvCiX1xkb1B
 xP7jH7YQUa+wkP9/hVqiOMclVILAluZqPYKKB2nJJuKsiQaDPiYAjazAxr+x+vVIC0RJVQaLdl/
 BiAVwbiKmq7eT5KFJTtY7a4PdKMB5tGgv5ni4kck/fYLVSrD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: eRpk_ScIMCXTyLtf53IgCWzmz51Iknxf
X-Proofpoint-GUID: eRpk_ScIMCXTyLtf53IgCWzmz51Iknxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX+mcrZVYRFCih
 /qa8IlejK2D6TRJw67iMxdv0vQZaS/boKV7+XU/iHNgg2LtL9fU1FkSN5R/mDccXN/OH0gClnNJ
 uJ27IeP5hq4ep8IY4f048fCtfe+pf1+Sdh6Y7X9UjxpqDJpdPc16MhQlf76ewT66KY8t92NCjjK
 FRmeE+fBdIFA5I0IuTIQzIWeyip+pV4UTdKJt2vwvP0znj2YrODlTsnevebinoGfe13rcydeT2c
 PMiiwmZ4GdhHIwslPWNZsK+idq0YbkRb8CB+23ya3UVfJHYTB/iIijBSQBwHIBAVrW/wHSAVkLL
 8h0x1s8pQa11n8GnynHlbg4JATNw8abog4Enb0Tru0laO5naJVb2Aghx69c1NrVQ5IEcHLQ4/fk
 zQ0PKB+GVqvGnw3q/Py/Zbwa8ZQntzXbzET0XhwYxaIDTq4QfdDtWF6hkfzMTyRAqIwW1MnDpGZ
 hFy47AwBILzOLnWaTjA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3546 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vjBfRQYTh69vIXlwGnYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3cTNKw5hgjTb
 nht0Slrvi7Awuzqjr4B1DNSCC7r6PembYY6NFTxE/OX4a38ggvylcR87fIZdwHx/wvO/DX/aGyv
 pI8hSHFP3KMOBtyZpwTOtzQTwRnJQJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index c64264541fe2..6d42376a57a2 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -96,6 +96,11 @@ static int fsl_dcu_attach_panel(struct fsl_dcu_drm_device *fsl_dev,
 		return ret;
 
 	drm_connector_helper_add(connector, &connector_helper_funcs);
+
+	ret = drm_connector_set_orientation_from_panel(connector, panel);
+	if (ret < 0)
+		goto err_cleanup;
+
 	ret = drm_connector_register(connector);
 	if (ret < 0)
 		goto err_cleanup;

-- 
2.47.3

