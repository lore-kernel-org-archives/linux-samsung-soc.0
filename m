Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102579;
	b=XuPWFoPKdumskGvbOGwOosA2/B/aLFjXgBqvbZBBnn7StjybQvfGRfvyv7heNvkCS6en
	 V89u6VizpWnwGUIh6FEBeXIwxMlkKOW1r9WjtsFZeC5cwj2UUHzETckgruDbwqJ1yo31b
	 TltuxHpuldDw3VQLNnfFbsmlxIJdYnsDOH1JUCvFavGG0TqxZIAN7M+poet4jnc05t2t6
	 WShWzLcxGY9SRZaXh1+ecUBtC6UnMqj40ze2QTT+qocZDtBsn4a3gCKgLxkAICZ2i3zYM
	 ix49acjnHYADmJ9QPrJcsCufUOEqQxn68yp88FJ4HGtEDPg3nuAXiSEw6vr7WN7bh4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
	b=LxHdmkIyRn1csDD7QDqx5Qi3L3vuYIiWGbJ51Ppo0SBJPulWpbSKx4m0zdGYAiI12yc3
	 +Wgm9v3hPG0PsI2mQXjzE+Ku9SxtlQI9j9iVIJFJ5fwv0kqRgcPFCOYoKU5+jQfkC1fG9
	 gca7eK2ZVe9m+QjmLmQp6h2xg8gIRdWLYMrDgllSu0q6BU6QQyVndeRp7wuO0pS1TJaj7
	 k1d70Q5a/CBMnl0kPO7aKpZvqa2T4sb/31vt76ar160sMLpDYdQAqVpiKnDrTn8Ia1l6v
	 y7A4Rlcd/bS3G/d6MUXxjPfifXv9RZd0Glqt9FTZkWoPkqIDk1Xg2+M3lNgcxgsqjRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+1n6Gi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L/wBL3yB";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B999A60A262B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 12:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B999A60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+1n6Gi8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L/wBL3yB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe8Br1935974
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 12:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RreJT6OdWgxLLvGlC2N7bmJy
	Um9m4QYaD4O3KtIV+1A=; b=E+1n6Gi8vcyP3M0k3o5Wgql4Sq04nvrDDWa2FIWu
	sLVnyHOl26uyu0ziRm33cusRsQ0idxUnBjgHJ2RO/qvSp1wHmhCKSkhP2PX9UwFl
	D8NaLY/DpIx2crNESacLyxTZ9kQuhMfSxglvu3e1a1oKGG0W6iSjx1gw/r1fp5Xd
	k7OrLdTHpGWvnjK4pATqvpF/9fOaMQ/AzNNTTONZty1mBXLBsphEF0jiM2RS8p4p
	Ry8ZVgJBxRqe4K/+tP9x6nh0kIssyfUW4f+D5JWoBKeWW8s+5tYb+3xWnGf/RmGW
	fXR54qk1SYsBEQyZhnU16D8nBTna1kcthL5pM8W1wcnJSQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtpyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 12:02:56 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990835cec5aso694276241.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2026 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102576; x=1793707376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
        b=L/wBL3yBsMtrQFZ9wCDcDKGR/JElC2jPlODkzkjZu2DAMuxTCFarOL0w4RqPh1z/CC
         EXWWxA0m/A+R6aH+Da+ulCLE/QCN9s4eW5/oZBHlBSMpwuWfj5/cAf9DtQ3eT9eH03l7
         ua6o0W8feTusvBj5o0iIvW2kgtnmBapQSczGkowVZp8b+fwWeHAxQyxUm0x7gptt+At5
         eVl0xRNU/6qKySgrfLoiJm50bVNxVdMEd4KpepLSYzyxlaObMwE0vvg6dSR0sI+OVA2A
         5Q1eSfeAnFh54Nzz1FkU2bDZkIyz0nTE9CvIPXxnvTNlojFgyFir0yDw+o84UUeIxtSQ
         sFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102576; x=1793707376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RreJT6OdWgxLLvGlC2N7bmJyUm9m4QYaD4O3KtIV+1A=;
        b=TmZq2r8sCRzPpFr/+8w66yZ16KfhwbuATVIM3Nta0DzmCAhgv22gA/8XTG857h5BiT
         VzDIyChAgiyvi/W6lo98YJNor9r5ocRrbSzQg5dPHnTEOAIuYPqM/TCjmUjTI2lF8Oii
         /1rXTIbhL4td9dyP8AeTkbHyweqQHbT1F14/T9aJHRPfAuR6iwGhxB9Yqh9mjte6CzxS
         +dFdb6WjAgTXAFLiUlbJkvRhv36PNiIsgq2o4zuehu23FHRQRvvYcJa8O8+UWZR7DXsb
         7KYaR2XCjTDMupqcEoBynXi42Nxzy4w4++qGZfmn0vW2YAYWjzzsp27DOeTEX9BQfpS6
         c/ng==
X-Forwarded-Encrypted: i=1; AKwUvBxFx5JIUZHEa0sxZQsA2Dovg+UVODwe4BEL+UwBt8DI4nffl6gMNkSTkyETu71gWzpFNYMON24T6WULu7JjPPzunQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvJS259JJvD1Ipf7OGiKyvcOVh7RTB2rytfv+PugNIG+nhn8It
	vOlaOWS2oEtFplNCRiWJH8r0NAwNvuIsaQ8FYBjvBXEqb2/UMYOSOwvjxpNr+LDxiSThzzWfGsc
	eCz4V8Y8bVGMFx6CkmsDpQPTm/YvMr6fwMBRaet1m+pouNomqdhibVHADToq/hzcWrhhzMnosYQ
	==
X-Gm-Gg: AYBFou3A2Jtmppnak4sORnQ0UKtZ7GwxklmkhSMLev+u9xwB6+ypzSdWMKoK66d1t+M
	tzarTrVOoQECvscjvt70JSA2xya3LPItpOoupEPqOG8LaM9LNcdQHXRp6coDWisRhZbXUpvK/ze
	rp7w4feJA9HeV068JvWi0WLKQfst8mZFR7YziwZVdOdNb8nCZl493gUr4hiW/c26l4uRUkdDCH3
	rMGAZjTNnnk7rLuBJvYnZCp2gH+3m7FZVSCsVrc5nbgMl5l24KEBfQNJYE/NRQK2XBMHEcoTGeV
	lYTS8PUUA9R5vZN3BN6p4BOLDjZv0CJSIKEsczEiA5nlW/VCbknSNu/YnrSKmcko1n2wEc7nEg/
	AHhE9jOphBd14TPW0K/ZjhLbR4NvRUngBqcGh6t8L76xi5BLpn1zA+PBcm8vFhK9fgTIQ7ua1cH
	pOgG1g7lhmJbtZ
X-Received: by 2002:a05:6122:124f:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5ec3ea462d5mr652334e0c.6.1793102575721;
        Tue, 27 Oct 2026 05:02:55 -0700 (PDT)
X-Received: by 2002:a05:6122:124f:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5ec3ea462d5mr652238e0c.6.1793102575110;
        Tue, 27 Oct 2026 05:02:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9558esm2089787e87.70.2026.10.27.05.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:02:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:02:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
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
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
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
Subject: Re: [PATCH 00/35] drm/panel: let the panels use the atomic state
Message-ID: <cxsgo7u2hfb4jskscqcbeaaneiyfh7bdmlvku2wxwtduekwhxz@3vsizgxvekw7>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
X-Proofpoint-GUID: 7TDYp1qDUSqXp3ONDPwvw2w6D2cJHhkG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX6ZDP5ZDrpbbr
 eSxrGCaxfOCQ9Be4DdYqcJs4MVT33zmmDHUbEDu5bCoHGXxFZl6l2uPryQvgKzV4DEbfR7ykyQ5
 jGbJs+ggavimByQN7XYl0ol7q/Q5Qrg=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae092f0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dDezlKT4IyV31VqxjHAA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 7TDYp1qDUSqXp3ONDPwvw2w6D2cJHhkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXySskjmFYwjV/
 w8ry+e7CSmTM4bKz2V8sWqde56C8+k3qAaJYqHrNX2wyHeVt3ZH7aYTxhq8R5NFJDTsdgazj3C0
 7Q3DEO6RLm9HvkZnxi4//Fxm8js7nV6FHRMX3XwrYm25NYqITyRDqTLEVD53EesKuwplA6iywzf
 j98ZnmyhFy8n12uSz0rLtQvtQMtMTMQCTj7QBZWbPrvXLUvk9GyxqPcsRODd2Pyx55ZI7AvS7V3
 qbBXof03AiPf8VrkKW87964pYAXKmGSat8ZNAx2HhMtYd/TxQY1oL/e3xLiWLjY85dLp4owHuU7
 87vKvEP+zI/SUNv+4tRJlE7HTDGzC3Y5+Wt+3l91C4g37YOkGhkMMulGue7NFuNdagpyw2WpNAR
 T1xnsKKcwWwQZ2ZNeSmL1z/zvaB45vL8aj0C289IZVovjctr/7PYGopkLjdnmNhiPpqDzIoiByj
 CmMwIa7gUsQhVVkLvaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On Mon, Oct 26, 2026 at 01:09:49PM +0200, Dmitry Baryshkov wrote:
> The panel is the only element of the display pipeline which never sees
> the atomic commit. Its prepare() and enable() callbacks get nothing but
> the panel, so a panel which has to be programmed differently depending
> on the mode can only guess it. The NT35950 driver, for example, saves
> the connector in get_modes() and reads connector->state->crtc->state
> while being prepared: without the locks, from the current state rather
> than from the one being committed, and with no way to reject a mode it
> doesn't know.
> 
> Every panel has a struct drm_bridge embedded into it, and the bridge
> already has all the missing parts: atomic_check(), a state object which
> can be subclassed and the commit passed to the callbacks. Rather than
> growing struct drm_panel_funcs into a copy of that, let the panel driver
> provide struct drm_bridge_funcs for the embedded bridge. This is opt-in:
> the panels which have no use for the atomic state keep using struct
> drm_panel_funcs and are not touched by it.
> 
> To get there the bridge callbacks become the entry point to the panel,
> with drm_panel_prepare() and friends calling them rather than the other
> way around. The panel core still has to track the panel state, notify
> the panel followers and handle the backlight, so the driver doesn't fill
> in the power callbacks directly, it wraps its functions with the macros
> doing that part. NT35950 is converted as the first user.
> 
> The bulk of the series is the cleanup of what the panel core and the
> bridge need from the panel driver, so that a panel providing the bridge
> callbacks doesn't need struct drm_panel_funcs for anything:
> 
> - get_timings() had no callers.
> 
> - The connector type was stored both in the panel and in its bridge, and
>   the display drivers could override it while creating the panel bridge.
> 
> - The orientation was read from the DT, stored and returned by nearly
>   identical code in more than twenty panel drivers, and some of them
>   also had to set it on the connector from get_modes(), with a TODO
>   asking for a better place. The core reads it now. It is applied to the
>   connector from the new connector_init() bridge callback, which is not
>   specific to the panels: other bridges have properties to set up on the
>   connector being created too (HDCP, DP link properties), and currently
>   have nowhere to do it.
> 
> - disable() and unprepare() returned an error which nobody could act on.
>   Worse, a failed unprepare() left the panel marked as prepared, so it
>   was never initialised again.
> 
> Behaviour changes worth knowing about:
> 
> - Panels with the rotation property whose driver ignored it now get the
>   orientation property. In the tree this is the Motorola Mapphone panel
>   (panel-dsi-cm).
> 
> - sun6i_mipi_dsi, sti_dvo and the Tegra DSI get their panel after the
>   DRM device has been registered, which is too late to create the
>   property, so they lose the orientation which the panel drivers used to
>   set from get_modes(). None of the rotated panels in the tree are used
>   with them.
> 
> - A panel implementing atomic_check() can only be driven through the
>   bridge chain. The display drivers calling drm_panel_prepare() directly
>   have no commit to pass.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (35):
>       drm/panel: remove the get_timings() callback
>       drm/panel: remove the unused struct panel_bridge
>       drm/tidss: get the panel type from the embedded bridge
>       drm/bridge: lvds-codec: use devm_drm_panel_bridge_add()
>       drm/ingenic: use devm_drm_panel_bridge_add()
>       drm: mxsfb: use devm_drm_panel_bridge_add()
>       drm: rcar-du: use devm_drm_panel_bridge_add()
>       drm: rz-du: use devm_drm_panel_bridge_add()
>       drm/mcde: use drm_panel_bridge_add()
>       drm/pl111: use drm_panel_bridge_add()
>       drm/rockchip: lvds: use drm_panel_bridge_add()
>       drm/rockchip: rgb: use drm_panel_bridge_add()
>       drm/panel: remove the _typed() panel bridge functions

Gmail barked at me for sending too many emails for too many recipients
in the middle of the series. I guess, I'll have to split the series into
smaller parts. Please consider reviewing the posted patches, letting me
split / land the series in parts.

>       drm/panel: remove drm_panel.connector_type
>       drm/bridge: anx6345: set the panel orientation on the connector
>       drm/exynos: dpi: set the panel orientation on the connector
>       drm/fsl-dcu: set the panel orientation on the connector
>       drm/logicvc: set the panel orientation on the connector
>       drm/stm: lvds: set the panel orientation on the connector
>       drm/sun4i: set the panel orientation on the connector
>       drm/tegra: sor: set the panel orientation on the connector
>       drm/panel: drop the orientation workaround from get_modes()
>       drm/panel: read the panel orientation in the core
>       drm/panel: use the orientation from the panel core
>       drm/panel: remove the get_orientation() callback
>       drm/bridge: add the connector_init callback
>       drm/bridge-connector: let the bridges set up the connector
>       drm/panel: let the bridges set up the panel connector
>       drm/panel: set the orientation from the connector_init callback
>       drm/panel: make the disable and unprepare callbacks return void
>       drm/panel: don't hold the follower lock over the panel callbacks
>       drm/panel: route the panel calls through the bridge callbacks
>       drm/panel: let the panel drivers provide struct drm_bridge_funcs
>       drm/panel: novatek-nt35950: provide struct drm_bridge_funcs
>       drm/panel: novatek-nt35950: use the atomic state to select the mode
> 

-- 
With best wishes
Dmitry
