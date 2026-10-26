Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013046;
	b=rrwZtmdQPmJFma5sOwvVGFmz5g1avxmZ5nY+0xATxQg+9Zb6kBAEVtamIz6cOnkIB3Kb
	 po1r9SZ8eyddy/3LokZHXpuvaR0L+/3M3H4nE4P/ijDK6pRvntT8DCOmofgDr4plw3d2h
	 DeHYUhrro5CmJNXLoiMz5NjJI+rmxZNat7eXDAReWdgqfULkav7vt3WSGEGyi4yMpiAO7
	 3hXfK3xOC4tPzfBYtYxxb/4XPMo8vWccbNUMU5iyMvG9KSPK8V0eug1mzIffoohrbdOON
	 i0egdAAOl0H5CReShnSu36x6SA9yVIYcwj7iWLpcVQ/+/ql90Zky516cjBdvQH5FmFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
	b=jhIFcjJ4RdZ2ROmNMEkTICcAhWRQx+7HTrt/k8qqMTlahpGz+luvmaVZCR0ll3lb5Ja3
	 H3dpiNE0mcVxkrk7flKeHRQPkneum27wz8xjHv/4KUmSyTfeiyLq/feOr6vyzEQ8g4du/
	 kBx/UpSIcFXZMNlHHxn5ihVtF2SeUalHEYx2qI7NAe7vwz8SU0jUBN8qjRGBG/aLX8Okg
	 UtL4gfYab25IxKiDL4Q+2d/GXCkBF3UaLXIBVGdZZwC/3cOwdY8Iu+MNRpZGWHkXXaIHg
	 s1xq88Z9YaB0xQT+yzV9phA/h11d5bsLn+2qEgcYe6m9ZOO86iBhPIJfiUyOiq9bxfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8wy4+CX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVVtl2bz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F6606A979
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68F6606A979
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8wy4+CX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVVtl2bz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1A32732889
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=; b=F8wy4+CX/rG+lfZZ
	Lyan3IdiIs/84Gys8owEbGXfJk34r3CcF+b+Q4mmInADgr3eWsRbVJRNoe3mwtZs
	VsYyArKxzDCzwHEmIoYcnByfO17CNPFncRW770DuzziCcwveti8XS2tC1/lSLo8L
	VcYAwYtiaXmUyJ18o38o6ju/1YtKbApXJwjhwyMJoWlo97KMrZIHjSOUWj3ce3HG
	HZDtvZAaUCdsdJBDdPPY/mjwYQldfdKv8hWGKkBABkHzpGCi2uBWHRuFB7DPdLhO
	lmcr/DgeJjlEfhQ+cH8SDfA7E3E5NMHxb7kyjKXT7eh06NVWeuu1TbmHvDH7JPnV
	0YuW9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8bc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso728510785a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013044; x=1793617844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
        b=YVVtl2bznaS6SS/6vFgSQ4UcYPtj9oYp4dpt4ZjdigyQRHpLliIRvsXHskjfP63DCP
         xciX0bYC/xaMMWQXuCIX+dDlnG4bbC489vCTX3hRHxBeyXslpBVilJlHd83yoYZJa71Z
         3VGFcMeJRln+IAfQ0AVkrHe9PzNBVd92IfkiYoIXDGqNzo2DM8W5TYExi+Udk/CsFyPR
         HagYl4hlP5EqEBXfiK4aRvFSCLgxCL6Gk/6UsRQ2kceKnS3e11lCBM1bJNkyCw8bPNrd
         Z83HroJnDQimLPMvJNh2noFXLpU/mchaZ43VnM6JFc/O9uRBQBQxiYifq9o99mkysoef
         5+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013044; x=1793617844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
        b=e7/08Uul4fN3QSWhGr7QDIjh9Z+FDBS4v5y/29gAPwOg5xXIFsNZEQQwIdaUZJc8On
         05uMYl0BSdMweinE3qJR+djkWBTiIeA6JQ7PfMzWGyxj64bnh+1mSdPA7Kv7hiMzrsbc
         OYjak4N9Epv8+X653ktDmEM2ZCAXi/IM5y4NqZYWugxPOg9eybv4heeLWgRKJJKFNqpS
         Fl9lRxCIb3lDlTsZO5oEQO9C3hvK3zTmnfcBPA4qS1zXGhPH4hiRN+4qvPgx3rOUD29I
         l/9x5nI3jTJaf7CmLwIO/BMPUpxX0raqjpNBlLm8XEx25bVPDJXTW5qro3wnJOmZp+qc
         P84A==
X-Forwarded-Encrypted: i=1; AKwUvBwMR+v40oA+mskX8bt8ibbr6T6PxOPtHAB5OkdICCZxmyQxhaM5zHnXfh5fmkKRnCPLF8aoHkTmRnKmwKH7mJUVBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJs6n6zV37vcHnC1XZvEA8d27ojGWdKaTh2qNzXjGFaydVV+QuB
	AW26W7XJ9zmyVTxYVK9jI6Y+2YQwNLR4IdjaUJ3xtHK9QljHpaDkNDh3uylxi4essfh/I7pVDO5
	8glHirphQ0vgCLVXtue218aH1DRdyTsuU1LCBLRW4eGvGaPVYhmCO68QNp+tr+YYJ9hknQh0KRw
	==
X-Gm-Gg: AYBFou3wpQiXhWv7buq9PWMlvOC6BwgPUCOCXcC+VWzkUqB//c9Vz9SP2ZgFa92n2Su
	l1pm8g4gZ0NMdZy0HAAh0fo3hCPoBNGKIAcvww6FzQ0TCQkPozKEYWVSxAmMo1yhny/HSssuVxX
	+VWFkgAP+2IcU+Qu8nQrGbxWvzKsIwi9VI6DEa9IkwE+kQWyW1ktHVf0KtRDRIt04vomrKYXuy8
	/FUU60uiBYBoVNtoIz3V0ViGAH81oT4Ag+I+QF9PnvZ+dUVZH8gL2wVqjt7XpCGQEPiRX0mrK8D
	WtJi32mBG5MeVv/IgTZq4ey8h5R+s3B6xVJ79LuLTw0pkH49XXo0vrjD4EBietJKTNDaaSdlPcG
	HEZCFH8H5cby059PVTwuUn7jZf4SiKCbitYksOKLwftG/WRA8l8NNobaTMGSdkJNffopt2mGSJ4
	hgssV19WNs4J8E
X-Received: by 2002:a05:620a:17ab:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-940ef999832mr820050685a.60.1793013044008;
        Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-940ef999832mr820039885a.60.1793013043412;
        Mon, 26 Oct 2026 04:10:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:00 +0200
Subject: [PATCH 11/35] drm/rockchip: lvds: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-11-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VuuvMuByE/5au8TNoJGc8h1xnsMCd+SMeZ7MKGuRyyg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUKIUVSRGzZfc6qYgyaD9nRGfx+H/7o4CWdk
 wQOpg5J6z2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CgAKCRCLPIo+Aiko
 1QI8B/97uFs9wHHAcLSj02SUi5PXzEJMksmcQ7qKZIjNn7GfH8bLoBKSFnfP49YqCUduisOEhT6
 KTKuTU4S/KuVHEJBZ8F/LiOMPnVQBnq0NiQhbfywWC76Ly4pg+z9waoN70q5DcXEhbaE9tDRkX/
 MYkXObslKB4jt+l4aynd9Jnr6SEAxi0/kA+2541TxyDmriKD+P5IDDweHYYyiL0PKyYdNKx3OdL
 ZCouAJsrqTPTCfki5i1Jce4Kw4n+85mVUI4+LTmH77ya3K5dNFMJsfHdvnOYkmDaqyBghuWU49H
 T1iAXG1ZbmbO7m6dyfFHITSkUzX8Saqr43Axoe2knMHnYoPk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX//vZLScxOoVw
 sKAhuHhovzXXjnh7tHAWRbLuVLi63lGth/8xbYk9oM3ufWoSx0IeP6Ckvwd1YEyGRGEU46B2Ak0
 brLvRQ+bTzmSgQI5zn9PBMoy+IUnFsD6hj6+Lwz2AVI8Uc22Zp/0BfKc07eustGKQ5QXMX4H6Og
 Nksy2+N5wBNnhNwi29p1++cx7stsikF03tYckCNquWeBKaaaRyvLlFfprjAQy/746QkASZFI4UX
 LepbwKslFBeJBpH43JvmMuIfg0g9DfsQP1ofVh6zQG/Ay2zfXCr9jEVPegMbtC4rgeBqAqmZknh
 OnWuCZUSnuBDmZeh3NLQjyT6MsNmGc0sXbhXOkyCv1n50M1AlgBnh+bK5daS/vCtRf3ebTPiWX1
 xFVLoS6lDToEBoMg16sG7klZ3cVSD6prioXX+qMZn7hWMNduuIpNAjGCSCI/eKQng53ngfsq4sS
 1O+jf+1uTsjp6bmzegw==
X-Proofpoint-GUID: S2Ep7VE_PMQqjWfI0NASOkQRdh1cS4Zw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX219Slp1HzbRi
 6IoOgmV1RlJUrOYgmO4b4fWtZjrcwnhLkoIGwrqLJAwavSZhcdqA0mZftY9051TTYrnCPJ3SRJX
 k36oXB+Btq5hFRPlYZk3GavTvHFJ84E=
X-Proofpoint-ORIG-GUID: S2Ep7VE_PMQqjWfI0NASOkQRdh1cS4Zw
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf3534 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 505c6c56736d..d49870cdf906 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -609,7 +609,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, lvds->soc_data->helper_funcs);
 
 	if (lvds->panel) {
-		lvds->bridge = drm_panel_bridge_add_typed(lvds->panel, DRM_MODE_CONNECTOR_LVDS);
+		lvds->bridge = drm_panel_bridge_add(lvds->panel);
 		drm_panel_put(lvds->panel);
 		lvds->panel = NULL;
 		if (IS_ERR(lvds->bridge)) {

-- 
2.47.3

