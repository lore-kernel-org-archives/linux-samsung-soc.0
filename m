Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013077;
	b=i/oC/KvdHAalpcc1lVVQow27XpAUi964oJY7u2ubTI77EK1B4JXi5cnOmyHFJe5oJDgr
	 y70vXvCdNmrxf5WljOFo4Cy/OH9Psj/8bS828kzcIcnoHMhn7RQ6Z3VuBHHgLLfVGdvUM
	 bje/FEpzH27Y1WolTbxXy9lwRtUQ4vHIK3+DU59Rj/NvGZB1y1DXhmtCCbG5yZsXGuvlK
	 O7ioo6XCbmHyQHvglPrsBLMOeI2ujbi+Q2QhN4zh5CVmO45/t4QlvSs9iMPEE7gqQQUPV
	 qHXtdGnJVommejfrbyTzuvg9X7JP7tMeLOEv3AvjWbcV4mkyOfoM73DvkVszlrTf8WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bd/tkiqVzenDqQaerpQa4vrKpCXNrWIRtIeqf1xIoFo=;
	b=lrBgzEbYJrHtwSdbAgw2uTaqMkfMio8OdNnLYxtA0tCWzue6LBPCa88goyZB66+iW+ga
	 fn7YFHBoAE7jgG7V4qR3ESuFal9XF6rUgGrRiX5hQ38Sy/QTBPmX837t2RLi/9d2YXrze
	 R99CI91TUXkPadmnnrMm8Hi9qre/ocnYPCk1ad45aHEcwVKwXMK2QIOALX3M/zgrtQb2Z
	 l32f3S2Tyx1Sr6zxooYmhaPk8ddO37h10NN8F6F2Le6n5drQx0TD8URLytHbd7PxbEsjB
	 ftjaR3eWDerskEgEDn+w6VdKIkXQIGShGzVA7H+xOPHfptUlf6C6fKM+Y+ZoiMmSy6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JLAEoqAs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq8J+lWN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28C860A3838
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28C860A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JLAEoqAs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq8J+lWN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKSn2541824
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bd/tkiqVzenDqQaerpQa4vrKpCXNrWIRtIeqf1xIoFo=; b=JLAEoqAsBNZR9IHk
	1SGGZMbCjUNPTfrQtsT/HSOCaL1PUEcOFnFZfdHkPORatQTjahNgegUlZcYTwhFX
	mQLlbeqOyqCAtopa7A0Wzzec7z4R5S5MLhWq1uE0iMeluxfeoOmx44SdYlyT7HFk
	aDXQcNxz/yw8kZU0BxQHF627Gx7tvpL+BHrm9w86M1cb59CHF1eoZv9QuXCxSZ0g
	Z1cZAIhNXxYv9dALtya0CEcwn6pC85u0l0sWgl0q6NXg9nb1jinMmFWlAEggKDJw
	97OJ3b5Rn9ApFQxYF2HT81n99CzrrGMXGXqEpfQH4H8Esa7IHYJTWutWxOwVlz2x
	ztdeXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda5qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so571311285a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013075; x=1793617875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bd/tkiqVzenDqQaerpQa4vrKpCXNrWIRtIeqf1xIoFo=;
        b=bq8J+lWNinA/mM1Tv4we4yE1ecs5SUnIKndtqPw9qPEzO/iA5fPKwbfZIL053Io864
         e1MBu+tcV+Msp1I2kSVZxkk99kQ7P/Lyltxb26xIWWk9nWvNJWZzsIk4BY/Oq1V5LP2N
         d0HJZZ8mrD+vQyRoDjs2lm/1kD3iUmw/Fssqt675mvphzOyuE56bEvjVy7cHN4vQYStd
         bxtbXZQO5wiRuhvhZF4n89eFvJKUwktJWc53BKFtmlxkIupHZ4cRujKPiQGGDEcrxIZp
         mHB7lNtCAAEAAib6ZKiktZ+7Y56B+fMTa5fNYW5HGoiNghm5zTvxBeocPh/vn+TiFvom
         RWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013075; x=1793617875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bd/tkiqVzenDqQaerpQa4vrKpCXNrWIRtIeqf1xIoFo=;
        b=PnjFxBawQ0oT88Lfad/p+n3GgGEwDWzgquTYqg4l7fBmHLNCyjTeQsLkbWZ20DIk5Q
         E+fK/x3m3LNx3Eb9PlMttOVgSXQdGg7ydzSi+nx2Esw52vQPIcxvqYV/J8UGJjJ7IOVB
         RsfEl/w3IAUteCdr6rNYZe1yxzTFH/gL9Z/75RywpluFx3f8w8godimULjjzUu3VF0VL
         tA3ekf6zG/o+maAlDYajKAj9IoqyGTXT996aYDcdLyc5Lt25FWSlRGC6Ci/5hoGVOpZ8
         72RrV3JfaxLxmS0l4Combmr/CGmsbT1dngEU2Xu9zvpR/jaCqe9iml8jvC3tBWZiXH69
         dXtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKb4gxqu7NOresDgyITsZYtY29ds6BAyUsWHW1JLqP6wlGsvj7nj09VlE0Ro4hKl4oBSDsIcpturz57PqNxoRUpA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIFcmUh/9YcL/+Vy2ILn/aHbCr2FNtwQINY8mVRyv/uD2PVWFaI
	GQumbEsAn4lxTBxMGh+jyn7UI8qaywuGJDhKcGp4pyd0GopkOgePL/p/LeKUNn+K8drduFB/qy0
	fE9jHZFd24CqV7u8zdfX8YIgtqsP3N7R/LFT89gkyxZCr87cuI0CjHgZY+dK2SBgaltktn2Zx3Q
	==
X-Gm-Gg: AYBFou2s3tGxD0HH/0T6YYl9BQjS7R6lgSkQ5KRmDGPSOsJfexmukxTKZb0mOgMn6xU
	ZWnJPuLRw0DiUWYK/VbS1Jo4EhEwdvXII1gYgxu740FyWCPvsB4RId9kpq0R+5jx0aCZNH/ODtf
	oNvTsHfloIdijfe3OmZnAzg5MruY2UzhvjoOycrQMFcsSJeOgrHv/DJPwwI/AaI4akB08NJ88bw
	Bjuc+kJDrFrrZ6/1yz3H4NRsW0iV6fFzDZXoDksDULz7nVZnJLD7LrQ+paKYbHl+KX1mfk+MOSh
	YUKaRF1UWrPPBTxnMQxe9g0F+UgKUKmVZo87OhPM23tbgDG+bk6UxF8qnr20MKUjsuH69oGbin+
	6Mo8skoDxnUBR3OOkmSl1056MwUNer9KPqlbd3WKasG6ckb9MgXs8+c+9PDmq9bqoOwiEewR0mn
	dsWTygi/1kfBDg
X-Received: by 2002:a05:620a:29ca:b0:93c:5958:9de9 with SMTP id af79cd13be357-940ef929fadmr939355785a.33.1793013074961;
        Mon, 26 Oct 2026 04:11:14 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:93c:5958:9de9 with SMTP id af79cd13be357-940ef929fadmr939340485a.33.1793013074187;
        Mon, 26 Oct 2026 04:11:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:10 +0200
Subject: [PATCH 21/35] drm/tegra: sor: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-21-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/outNjSURWZgfU/axTPqoMDdzePU4xE3WfSUxwhB5XY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUQf2X4xVHMMwWYkcC9NEE9wb2mDewMQuyAE
 0As6tLwmSiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81EAAKCRCLPIo+Aiko
 1arhB/9sqDRp4peKgSFVx7h0COLlGN3vaVAt3LtxYz7eCenBFXiKoOGrHw1rqEMCCEB/y+a6Yza
 tFckli8pctkchrV2Y0HQpeHAgIwi93PSI4jWe5dDSuQtgc4JfIgs2aD3mnvYGM3FcCOdzaYadsT
 Dl9LbEYK3sUeV5a5oAoD9mfKi9P2/f7AFlaS27WJXO1cVoo6RbGZRLPdB20DofGt6iTaVyh/4Lc
 QehhgfHVuwNnAdQA86i1CC/W+8tdzn59tANbLgwFBFxhNwMsDQu8MN2Uu+lmWAS8uMShM2/SC3r
 3hbyl3OhTmzeUEP62yWCU07EgJaZLJc+iI/EhvxZkYQNxBTH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: y2U3EYl3klbhwXJlq9tATTrv3Z4Ox-7V
X-Proofpoint-GUID: y2U3EYl3klbhwXJlq9tATTrv3Z4Ox-7V
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf3554 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1e1h5Y4J_Snmv77hf4sA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3kZPNC1dBQ/M
 I1BNVZqqJepuMaypXaVG5JrDHLu3eJmO7Gm9t+GtGTcQQiywx8GGVogmtYFxxnusdwH8TdGiSwm
 C7mH+yrvbQhJCAPPvGNDPAF/M4z1uCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX8dnNBkRqHaSm
 spvWe5Q7l4dgS0+UEoI6rvEnTkGwpDEoKeD++Na1pDpV8VHXODb21BZsedu8R8LP9s/1Uq+MG38
 NRw9NClDSaPN35at0pfcpvaHfDf1l9vOvutPPpE1tnDb4xE6rsqkEMy/UWdtGCn2xUG6+z2BfEZ
 UAMKe49Z1IEHp4PsY5Dp70jNR+A8q8tXfGhkCidgf/NEZSCDrm8bI/1yxHhwdkE9ylL7gOCt/Ck
 bstVLfnfksUs2MIqvEqiE4PyDt7Avh7+linTlYlpzVh6iCixkCMmAQDP94BnDPKza51eiCFvIhQ
 SrRlx8DTgeaOG5jNn+M1mOJjI0HLkBm9Z7y3G6YUauYv21tMO7/kr+07mDMwT3Iy2gD5UYwPwKM
 mmr/JxFjrUJLWd9yzuC90s8/WbXH2nisbVwKxgN44rr/ivKTuFVet4pSogwVH/m0P2vTWvSLX9L
 tA99Nvz0okw1FbMn5UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tegra/sor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e384cbd0cbf7..8e419918671c 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3112,6 +3112,8 @@ static int tegra_sor_init(struct host1x_client *client)
 	drm_connector_helper_add(&sor->output.connector,
 				 &tegra_sor_connector_helper_funcs);
 	sor->output.connector.dpms = DRM_MODE_DPMS_OFF;
+	drm_connector_set_orientation_from_panel(&sor->output.connector,
+						 sor->output.panel);
 
 	drm_encoder_init(drm, &sor->output.encoder,
 			 &tegra_sor_encoder_funcs_cleanup, encoder, NULL);

-- 
2.47.3

