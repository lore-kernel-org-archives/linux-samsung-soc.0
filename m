Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013053;
	b=BK/x3wIZeeKnJ2kEUULrjqb9E/BDc8mzakFw/Tt8bxS3G/LOw/PaMO0cppCEvlyQC/Qu
	 50R3H81vudzOGUSyj+9tuXuufDeJjf5JwsGUEBzgSMYarJFAldl0usz8uFAdWcj5VKtvu
	 caG1KN8jBcYf9jLA7W94jW9k4p99Xx0NJWhZ+CBVcHMLI++u3wE7MK+ylPvqg4FcZQVTH
	 8Cos3AYhZjOGXyyzpNDkV0h7CmDnCEw3g8jSqqqEwEapwkMjUFfGJXYUxB2vjA67CYvVB
	 r9E0Wvuwawmu5Yq11cfCg3ThHhIrqGmS0AFdS/fUUxVMoF78FsouTxVY6aWqttxeGlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013053;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CcjOekiXLWxe/7/1hEWEOJKSkOmsFR1V+/VqYLTRRqM=;
	b=3lUET5hg3BLoDI7a/CYFeF1hsU/aGPv7K42Qg/3WJsg5+UvCTL7eNZElHhqmPISRa3yw
	 SYOVByAO3ukqoj1pNMA0yu3gNrirDbjJQjwJm4AsQxJqFfUyb11coegPmpDwSOpkgnPQq
	 c9S77QR5ePMGI0GGehTE0zzKFGF84/lfxO4Pse3QznVnid/7T4Q75tdCYRPbNi/ZmeFid
	 bvZo3DjgUy+MdsuZ20AiDvqhjOJGVkxcV5qwVaRK/Ri4foCNPel3sgaJVeDWrnG0IUOlv
	 YW2f14Yu1K67oZ45mivl20q6PO45gbtn54CCKZQtozu8pbkDfxVLAtkpxzmqPS9M1pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XgxWJLiP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDQ6wINu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465D0606C9E9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 465D0606C9E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XgxWJLiP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDQ6wINu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt3kg2733304
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcjOekiXLWxe/7/1hEWEOJKSkOmsFR1V+/VqYLTRRqM=; b=XgxWJLiP9e2y8eBq
	+EMObEajhPjWxClKTTAqY0xfGvXsCvqBiLNsbkaPmujcpiI08Hr80htWgQ255ueL
	O0B+mwpc9QGF3hF1I67Zrs58Kacq/5VekmaebhrKkpKpYih/g3Udlj+vHPLK182Z
	dVsSkUL8nGbmwciqKYfCvd0ZWuWaHohDH7NGw0Dqk/E5Gbz0Nj505viuims5wSeV
	VrS1BqyE/MwJ3oDceomdfHmkGZq1wcfaSK7JpjsNuv04ya53FZas9Lmn0ltQPSVU
	lHiClo60O9P4qlJijeTv2sq1DmujfzPOAtolKYr+kwR3MbY6QIIUGMnuhwjmFM68
	KLLz3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8bcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so589477985a.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013051; x=1793617851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcjOekiXLWxe/7/1hEWEOJKSkOmsFR1V+/VqYLTRRqM=;
        b=LDQ6wINutC7j04aVQ7HV3cX21HYA9qul8ytkDSRC5rdVd3Rsx88qB7RvSBUs6ctnoQ
         a5cDaVvr06vxg7QFKzTW1HPfHEOoCbKf/z29kSenmMRm4Go9qS/LF1hhGlpqFOjyloIc
         88FNc67gC/HN814izGe4j1/c4fXELExA+HHIl1fy6c6KkR+1Twpn78N2SyIvBCTTvt9f
         aFOPE0fFK4fIgHnmGmOXXb6S+r1MeWFSMpRK5m/jFZyFJkChq0wE/j++UxuAHAzhUl2I
         fZSByAeyRwNxBogF1JEgfEyBuRGtu+nPbFVkUc7fMknYVbirrSgMWQqeHZEUO97/Xkje
         9EWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013051; x=1793617851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcjOekiXLWxe/7/1hEWEOJKSkOmsFR1V+/VqYLTRRqM=;
        b=bs4d5FJMTDYeHHvKJRQqMNelBcNLJ/Zcvv7OEWdgbvm8aW136cSQyYcrqnzGwfn8YU
         3eZk2Ls2gncL8aX01UqA4azgaKCHDQWgVYv39sUUia43Aa11YTg40RR9Mtw5eDPOPXaG
         v3RrKGc9EeI/e7QEIcoP3Xyrd5cKNR+TF97HGAiF0qCv70amTIyWJPTTBxI7H3So4ZKE
         ZmcZrkwah6QW/OtHBxxmsrGDhIVBZhro6LqRef1l22gteuwTUldvewN0BTFNAXJ+InY+
         JnFbce7Mi7HFde4NY7+r/z3QU/AcNWtfBDQ7cXp+cAP0IkK3lER4uecFWz5g1OWZJgoG
         HvHg==
X-Forwarded-Encrypted: i=1; AKwUvBzNBuirlJGBUx3rmYkd960srEJmypVzicU4T+SndJOeF7D3D84FimKqP8aYRZUW1TmZBR5EoQitZ9jAGbGe1xJTkg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKY/ULxz1WQrdck2mV/11s1un7cLM6BLNNLEIsLFSDgHdz6n1oj
	Ex/+ta8yKre7Pk4h04q4UybF6xSD83MU1NPBHIijN1OHn8dBnLQxEDh9BahZMEabFZJIkd35Y3I
	8FkTEqoubABvNa+dn40nbI0C3Dgux25eUIbdobhXQmyox7z869HOpdXHKtCsFB4P+QUP3FK6+yg
	==
X-Gm-Gg: AYBFou1qUh/r6F5em6DDrnz2Rl962jsx4k539uEH2oCcK+okLrv19vMQmDONPNuwqb/
	fLAdV5Z4Pf/9gZWNQKk3qq7eSxGD/nKGZIu/jaD/PHL3xhCdSY1pZ01fTw4jIj7uCp10ZWT2Z6a
	zy2GTEwA1iDnQldR9jR4VjSqElg5YPuiAVnVjKmDETVEAQ6J9YxRDUzk89KWQv2r5HrGDrBd5pN
	Eow8g8o9clKSsaY9DmeHSWerhnam5AUNH4eD9pWQF0+I7/zisMnrunoJ6l0yguTr5yMRkKyfEOa
	lGPOAS8haiWSeKU9Z9wRPo5BeIjptmDs9gOa6eUdpQPULYUnw9W2YAGIidtQI7xiwgBrgOHZoSE
	o8eceh7VPcRxnxVLeL3lk1PcjRo768XaHZG3g42rIe/F4eVxNfcb1llsla/sdtJDbEqjagOXYYF
	jiwYZqTk/BWWT+
X-Received: by 2002:a05:620a:2985:b0:93e:f499:43b0 with SMTP id af79cd13be357-940ef8fcd8fmr993251685a.22.1793013051317;
        Mon, 26 Oct 2026 04:10:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93e:f499:43b0 with SMTP id af79cd13be357-940ef8fcd8fmr993247785a.22.1793013050795;
        Mon, 26 Oct 2026 04:10:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:02 +0200
Subject: [PATCH 13/35] drm/panel: remove the _typed() panel bridge
 functions
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
Message-Id: <20261026-drm-panel-funcs-v1-13-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5701;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PsyqjoGaSgNE7nK0s4wZMtJ1rwL2WBpxNDlkW4hwgwI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUMPeK3u+Ehpvg+nMYckz20XnOB2X6DrWiGp
 ivt9hZIDiaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DAAKCRCLPIo+Aiko
 1WCTB/49xjv8bT+E14FUhCWg1zJPgoKza1B4TkNDaSoxvqp2OzTbFSqDJVoOzZPRr2MZ5GSnxer
 PafN5kN4s9ZxGzoCeVnc0VHsyHqFCcxnF7/hpJTvvFhU03b8zIAqv7yYymvLZECWUjw7pQFz8pj
 VPdwH4SZwjWC3IlxeHsEPyxrDkKW/cxusJcsm4QO/WPwH8Gh9qKc3q49M9tq3B0Tk1WHuyIOz4+
 +ATu84VfzohwMW4fT8dc7CCYV3NoPjk5ZGu0SKiX3XtNkbVmUn1mbQyjoaEZykmJM1426/jx6s8
 eVvXGxGPRQs+/82naDh7UwjuDT5PG7dnoGZoD79A48SIHg/O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX56dDf7XMFVAU
 1woIz2au3u/zRzwogOOzBPyuhUx9ciQBBXPFCklu80G5GrrJOYEte6rjYSnQQ8Hf+ZjUHNIFtkQ
 at+czr0QzU1Dv0zLDpxtJ6HQSmdctXL5Q46c7yL5iKQAv0LixZYeiRGW0y8PtDMA5Knf/zz80Q5
 DI/txqINH6a1FJ8JxZDeBcYdiYkZNFlJxTfHUmtVtX4MTx62oIBBoVjLGyi4/aCcdAmgVF6t/5F
 NkJssut+mH4UP+tzYu2loM6ijBbZ/fAXIE2aiEXvkeAx94g4rmP8dJnC+Cgj+EjSsFf86QE9EGJ
 t0rFw22+uMFkR/eDSQ7UbVHlAAXfBie5Y1iWjKI57aT9VBRMUE+TFNezkoM2rELhvzGtxh0F58h
 0C6Dilvjnqub2P7er/UGRe8Vrs4i3MY25BMJaT3FfWYPdGkXXQcpciaC+vaw7Jjz7MfhwG0vWs0
 jfyd0/0EoA6flKNuUzQ==
X-Proofpoint-GUID: 5AhCRpGg18zyHvgwCLViApgq8QuSTePE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/QL9xA9nBO54
 Cx7fuRPCtU1FiOjOnUoFcVm7bPX3VYlRbKlpHaXL4t1soxkrPKt2rikcjN2Sgyn4AUb1a/I3ODw
 k3DHbsuKzT5BppSas/RRxbGuqR13uY4=
X-Proofpoint-ORIG-GUID: 5AhCRpGg18zyHvgwCLViApgq8QuSTePE
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf353c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5Yw8aHIVc0SrouX_YTsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type argument of drm_panel_bridge_add_typed() and
devm_drm_panel_bridge_add_typed() has been ignored since commit
b7797081ccfe ("drm/panel: embed a drm_bridge into every drm_panel"),
and they have no users left.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/gpu/todo.rst  |  1 -
 drivers/gpu/drm/drm_panel.c | 55 ++++-----------------------------------------
 include/drm/drm_panel.h     |  5 -----
 3 files changed, 4 insertions(+), 57 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..f78455e4c97b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -475,7 +475,6 @@ not needed anymore. Its APIs are just accessing the embedded drm_bridge
 transparently, and the are deprecated.
 
 The funcions to remove are:
- - drm_panel_bridge_add_typed()
  - devm_drm_of_get_bridge()
  - drmm_of_get_bridge()
  - drm_panel_bridge_remove()
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 268e655140ac..ab701a526ef9 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -270,31 +270,9 @@ struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel)
 	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
 		return ERR_PTR(-EINVAL);
 
-	return drm_panel_bridge_add_typed(panel, panel->connector_type);
-}
-EXPORT_SYMBOL(drm_panel_bridge_add);
-
-/**
- * drm_panel_bridge_add_typed - Pretend to create a &drm_bridge and &drm_connector with
- * an explicit connector type.
- * @panel: The drm_panel being wrapped.  Must be non-NULL.
- * @connector_type: The connector type (DRM_MODE_CONNECTOR_*)
- *
- * This is just like drm_panel_bridge_add(), but forces the connector type to
- * @connector_type instead of infering it from the panel.
- *
- * This function is deprecated. A drm_bridge is embedded into every panel.
- * Don't use it in new drivers and update your driver to stop using it.
- */
-struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
-					      u32 connector_type)
-{
-	if (!panel)
-		return ERR_PTR(-EINVAL);
-
 	return drm_bridge_get(&panel->bridge);
 }
-EXPORT_SYMBOL(drm_panel_bridge_add_typed);
+EXPORT_SYMBOL(drm_panel_bridge_add);
 
 /**
  * drm_panel_bridge_remove - Unregisters and frees a drm_bridge
@@ -362,31 +340,6 @@ static void devm_drm_panel_bridge_release(struct device *dev, void *res)
  */
 struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 					     struct drm_panel *panel)
-{
-	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
-		return ERR_PTR(-EINVAL);
-
-	return devm_drm_panel_bridge_add_typed(dev, panel,
-					       panel->connector_type);
-}
-EXPORT_SYMBOL(devm_drm_panel_bridge_add);
-
-/**
- * devm_drm_panel_bridge_add_typed - Creates a managed &drm_bridge and
- * &drm_connector with an explicit connector type.
- * @dev: device to tie the bridge lifetime to
- * @panel: The drm_panel being wrapped.  Must be non-NULL.
- * @connector_type: The connector type (DRM_MODE_CONNECTOR_*)
- *
- * This is just like devm_drm_panel_bridge_add(), but forces the connector type
- * to @connector_type instead of infering it from the panel.
- *
- * This function is deprecated. A drm_bridge is embedded into every panel.
- * Don't use it in new drivers and update your driver to stop using it.
- */
-struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
-						   struct drm_panel *panel,
-						   u32 connector_type)
 {
 	struct drm_bridge **ptr, *bridge;
 
@@ -395,7 +348,7 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	bridge = drm_panel_bridge_add_typed(panel, connector_type);
+	bridge = drm_panel_bridge_add(panel);
 	if (IS_ERR(bridge)) {
 		devres_free(ptr);
 		return bridge;
@@ -406,7 +359,7 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 
 	return &panel->bridge;
 }
-EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
+EXPORT_SYMBOL(devm_drm_panel_bridge_add);
 
 static void drmm_drm_panel_bridge_release(struct drm_device *drm, void *ptr)
 {
@@ -436,7 +389,7 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 	struct drm_bridge *bridge;
 	int ret;
 
-	bridge = drm_panel_bridge_add_typed(panel, panel->connector_type);
+	bridge = drm_panel_bridge_add(panel);
 	if (IS_ERR(bridge))
 		return bridge;
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index deae4753a594..07612e9791cd 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -393,16 +393,11 @@ static inline int drm_panel_of_backlight(struct drm_panel *panel)
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
-struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
-					      u32 connector_type);
 void drm_panel_bridge_remove(struct drm_bridge *bridge);
 int drm_panel_bridge_set_orientation(struct drm_connector *connector,
 				     struct drm_bridge *bridge);
 struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
 					     struct drm_panel *panel);
-struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
-						   struct drm_panel *panel,
-						   u32 connector_type);
 struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 					 struct drm_panel *panel);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);

-- 
2.47.3

