Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013095;
	b=dDyB8+o9EBkNKT+KnDFuzgXsrCIZZVwfP8lJRPofJguo3AeiFvxCWX6s+QRDBevC9kVC
	 wwEFLBme2ORRLqh8yhQZBO9rqYKe3FdwvCIj1lSrmzQ5UeWFXSoO1WAD5gM6a8wNPn/1x
	 zEV70BCVdehUNT89OyVsueHo5hbGBCr+szQolm8sEm2YGQlAlWPYMdbot34OX5hYHB53q
	 iF/IA9wB0gEoLhB414Oh2fEaSsgA0Z7ru8jHxlTKlft1X4y0SMRdMG5LCKSIYikJEU/7T
	 Urkk58h33sPlF0PzF7N9M4yxdB8Dt1jkQuz+yjE6KF0sc59IM3du/Vq0OmqQMxh0JFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013095;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z5YZFYelaCp0S0t2iFd1/TBQhefjKNohLtgK9G9gaag=;
	b=tbJIdrjZVs0B+djvFBUg5ZUrdPa4S1DkAdc/xjSRMYaofTLuxgCCzzysCgKaQEOLBFDY
	 kBxrfkxWbpjJiPjXsLn+KsbPzA62t7J/GRqZr1W2YESn47W8ix5qKkvOWPtf6E6M7TXPr
	 7jyqF0HFH+XWcy0nv+CIK/HaK9BbxK/PBpKGMhuBPWEl4rMTNCf71q5ZisMzey+Q7omNu
	 Bq8VnvBUKt9nUL4txI1RLvfuo1UiAh3ygEslcpRs4c7V1q0XkjDhSoz4RlmNoSiQXzZoA
	 bEkC7Yt+3PlZ+P6TMqXiIzdZ2v73FNl7gHanjWFKfxuE1YalG0b9q5sY8KklAUSPVdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAwCLMxO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9vqtu15;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE76072BCF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCEE76072BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAwCLMxO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X9vqtu15
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt23s2733226
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5YZFYelaCp0S0t2iFd1/TBQhefjKNohLtgK9G9gaag=; b=MAwCLMxOo+pF+xVw
	ujcXLzcdpL1N/34yRX8go9512wsTLh5exv3+HDiMhSWiGRLg7FS+ohFrsdVdiYHk
	9VQc8WSRgmLrUistp94jlhakjPKS1zVcLbFlj1xGqB2999yrFY7M3v3iLrZstDRw
	iPCEo6/JaIYF+v4dbhwRp+O7fLa/cC0W991VPBNn5RkufTxzvZxtxlEh4sHMKb5L
	MF1wh9pI2VdtTiL1uZcQwp4bigUW5Da2YqIHVD9gB5NbWWC5otd7RyatDKUT/IY1
	Z9uiBawrsqcXyJ0NqNFs/efwPyyotF3keQ2gkrC3PQh2oTh1f0o6lYF6DOGbXw3d
	+xoIUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8bmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so274762685a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013093; x=1793617893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5YZFYelaCp0S0t2iFd1/TBQhefjKNohLtgK9G9gaag=;
        b=X9vqtu15rUU1dSDpK8+AOrmhEr0GP2hrx5eQHX+KPvHITKevRirqWGFd8geiqra/eO
         aOaAZMdVMqXuanzSZ9dExTZc3dV1HCaRk8q7ech1ZXiE9Qtct4stAz6/hQsgyJaH1/7f
         EutXQmE3xe7B+dOyhvrK2uy8Ad4rM3UmvS8zGUpOq4w/8PdoplZu+4kw2hkJQ0MXmaGQ
         Fd5vyRTC0ub2TubCWJpiqTTRy6sXSM9kwySxMI3aVfoR7PJ5LhBJYbhMJ26FZpDHz22v
         rEen12FJzkdWVLgfBtkH8w04R4Mqu1yL5tjHFaVp4uiqpzhE0XzrabSWkH18DehnS0np
         ASYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013093; x=1793617893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5YZFYelaCp0S0t2iFd1/TBQhefjKNohLtgK9G9gaag=;
        b=ZYbVafa5Z1LO/JZFKkazNtksEcHr30DP9kMeaPpAVDepPyCmYd/BXQ+E3UIjAfFHDE
         HskA5o/hJ7/KoxJdoN7Txve1YOvH+6vPFa2LLWpqV73YXI5AJtA5njVOr0JOs78fMPnT
         +boPVpaMCM+8mjbpa9Wj8wu3WLw7C8/3boK1AV8QLl/XRRwNTaCIPpB5G++6vtQYG86X
         BOBwaV5Lrt9Daj9AVXisWBM5DadcHGT0HzSpve8fbYSI3gl1c+HaZXC+MnbBmZrAuJn9
         yzxW1oQKB4omsQcHJ0fmFFPJXhHlveprJK9bYZq24rxs2h4BlLaZsHc6J5AX7Y94sV4e
         42Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxytumN3Ddg13pwy7qfHEzLZ+UXiPLhTzzEm4t/RArBxJwuJEogp3CEaAzT0iGUSYdquH/3JyWn4ukxAnLLhyVEvA==@vger.kernel.org
X-Gm-Message-State: AFq9FYISv8co7JkBwsuyfABs78zQ1z/h0gEt/ffk9pQZVD9f2YF71MAj
	/5laqOvJ1/80A+eirpxy/jUYJI5le9Uz10KlEXrkIIcXTzIwazVAU1hJYbJ8pb4DJ7DBceKyTsk
	6DN7h61BHtmR6Bp6c7X4YJWAaofh5U40ik6jL0MIC38X28y3bIUmJYMCtDBzwxd1jTi0IdawjoQ
	==
X-Gm-Gg: AYBFou27NHrPyZsf7QrQ6/9ETvk/YUZEOaXInFx2zCMBXwnN0kbaJrD30tQm6Eza7z+
	+/glqAG/UsXPk9VYdWeK8qOS5qv2sqH2K8zv88rFdBE/Bbbp8ol60CwsQ04ILReiEqeWJk2Jwai
	oLGIJ+bqURmux/5cBnICc9fgN9PTLR8qLDeZGrMdAisTaYV2qm9my7bCn69fwb3VTQMOMlG/5L6
	i1DNptRIdJKrsLlJ8o1kZovSsZ9FbGWRcZzVmc++YodpezLY85FFWzrhzke5XlSWbHjE6RN0pSj
	4AeTFBFVs+nZncBwErMu5jUmli4bbyLvNvyTtclFFMM17+iykTTZRkbTqETJtzMkPworGl/BWmy
	D4R9sJR4hAP55j9KxFr3guZT5rjOyMMrS3IE6x+h+CS05eiqV0IpPDduazWo9eYCN//0KQxwQwF
	vkNqgO4xVtCgXe
X-Received: by 2002:a05:620a:628f:b0:93f:34c9:9248 with SMTP id af79cd13be357-940ef8adbfamr970679985a.22.1793013092993;
        Mon, 26 Oct 2026 04:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:628f:b0:93f:34c9:9248 with SMTP id af79cd13be357-940ef8adbfamr970667785a.22.1793013092405;
        Mon, 26 Oct 2026 04:11:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:16 +0200
Subject: [PATCH 27/35] drm/bridge-connector: let the bridges set up the
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
Message-Id: <20261026-drm-panel-funcs-v1-27-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AQGdPHb5gyBnobGv+f6DreCCZFLrKneWqxoZPFxxWcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUTUbk1R23nCOd8O6zZ/MtcgNxowkU4eN1Mc
 5Cnj43j4lKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81EwAKCRCLPIo+Aiko
 1W85B/46cJ4Sdk7p4J0zoiGZrHCbRYA2cPPlDcsPtE5Z04M4uiP546ooWW0HhZMFzzagUL2YSHD
 RJaZdzs7jv87tvD8PlGPUFUZXtHIIJB+DtBUeGwP8PmcUaM2Txi2MWRYPuDE6GViHH7HbBV9byE
 RdfjHPweL9TYvTw1yEwGvAKLF9DSA4B/PL/efch8Z4drVb3CZ7b6Vj4aPNQ67CzvqOPBvqNcp6q
 pdszfnU1ADzM6XzxOqHfkZUgJzJ+kVLBf7HpqKrHqwjS/kfhJrhWwmsxYVPAxFAEFziZIE1nXA4
 R4tXF+UF0FKjfU8MLRD/MxLcnN3D5cT4ZF3PdKwRy0G1eG6E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3CJ/eWf8Snbi
 55rxUycIj/YW3MapM7krfmvSEqX1unRmCuKFce+N3pIzgJMWhm/tNaX7rcAzuY32heexUpclHUa
 6my5qmxIGt3vqJ9TmtQkp2gqbh7U35XtFAx5WGPqqDN7+unglNWS3wnM2y2PJwjWFfs0yVNq++D
 mvhLBns669F4WCVKsc7HZob7RQyey9WcDL5ae6ncCtpOq02cdFzDnC7F9tvmSB4lvIJw+lpK+a7
 lDb0b+LUZSbb4hqF6VEZ4CaDIJPhGF+wwgQZea1ofNecb2np2jL9yRJnG8Oar97lBsHiMkcdLU7
 Hr6r1Y5kObLzsiqvbHdIDtQ6cdjaZ4hngyyhWjcSNL1m2hp0CjuYRUDGlkejGfaPGBy8ed59EdR
 db/eDiks9zkNnUnBAEYIINt7VOTiWvkJaZZqVanISpvwfPvMma42mv1ox2xaIHHCzTHyhv5bmh7
 anjh+iPCsiG/VqWN8mw==
X-Proofpoint-GUID: JP4mhzAXevtEVUxJY9U92BYbYjHPluCr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7KA3K3mq3qOX
 5h/+VCOZ2Az/r97j2QaANYzTueznLxWm6Gfj+L+K8u/0Gtbfbd5c3oxKH8zFgpyrECSqfqDUFeB
 D0dNqXj8xf3njjIsBODM7yXLi9giV08=
X-Proofpoint-ORIG-GUID: JP4mhzAXevtEVUxJY9U92BYbYjHPluCr
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf3565 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7DjRQ5CzWl9msXBk5SwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

Call drm_bridge_chain_connector_init() once the connector is initialized,
so that the bridges implementing the connector_init callback get to set
up their part of it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..2d982c7109b5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1141,6 +1141,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT
 				  | DRM_CONNECTOR_POLL_DISCONNECT;
 
+	ret = drm_bridge_chain_connector_init(encoder, connector);
+	if (ret)
+		return ERR_PTR(ret);
+
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 

-- 
2.47.3

