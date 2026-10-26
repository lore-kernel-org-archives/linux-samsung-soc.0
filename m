Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013083;
	b=hcMzFYNI2Qc/+1ugT5ptXXRz1/8SPgkrS7KEYmd+kmTHbERrJy4pMKlNVSyzukQpg/cw
	 X6XXSRmxTCPQLIbjVH1ugSZN9UYohq8mV3VuNmt6sslAoXqNWo5ZBsNaUoNoxpieqFZ0d
	 Y7+/3XdzTwUi7+zV7xv1k8woL44fk8ZnGx+WpTtXYPTfAdU/V5V/Vpu337HI/Rno7t8Q1
	 6yR9/h4oekW9DK37wUEnbPlbVz8VOuAl0hqxIXkJ6N93GBxXRVLjeKeVS1MDByHJCnCvb
	 qb4RD1WLW15STyj3PHtXxlnO4Ka17ivPcqs1n2TG3yNyT7+cpQISgxk8LRKn+iClYSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
	b=124xpyKhVA17tesQVtT/V0EGCrlMoithvJCeE8FOZS/75pdFxunzNT3Iol68CwSX2sD7
	 7b7WTZlfdY0uGamT4X00UzW2JO4E9s55byHA3fXWLt88DF4XHcS4DP8UFg0IjYCBK28QT
	 q3DB0jKeKQDdi3RuenrIT6flNcOeduca8WAtb1/ICBm9hede7im+AwCgy36oAr2HGVmyX
	 ky4JpOSJT1nZfp/hvKV8et/rT4xvZDa9moFqUUtGpUYGAX7XqH5eBak3BgzV2KNUE6Vqa
	 qOsdwA5w0WS1R0V6SixElR7o4cSltDv8onWjCmM1mzCsiikHUFKTWc6AJ7LmvEBUSgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pX9pQuBc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdoZo6Km;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BD60A2620
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D1BD60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pX9pQuBc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdoZo6Km
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKQr2541820
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=; b=pX9pQuBcYrrTZYGa
	IR+22GFFnxSXkCl4+r/Zm+k9MfSjpf1aScGy1/DAC4ZCAjvC528Rpe+c5+Y+xvrf
	rttqsAwh8D1k9BcXnB8ZtM9pMHkS9M66mTm/R355I1jtVcrbHrqCt4f7gTm9xTO4
	IO+wGHOOQrl+NTJ8ntssQC7uBwZGhN34/T+NMGacHbNqWbGg41VgJj67E2ff8T6o
	W4haZ4Ts3wym37/js8L+6lcr/mALsb/hHS6NcJ+wDB62BsWe2I0mzLNIWocDbQGD
	rkdz/I7wsuwGVuzIkCPqUfW3NsocbL+89jEfi6MmtMdDnuL3GBNlqWgoDXnWK8Wh
	AkVzkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda5rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so364928885a.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013081; x=1793617881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
        b=jdoZo6KmTlsbEuefjMpOwcvx6g70lL65lnkwo+NrySnv/jTiHik2CsxiCKVhHXIl/U
         Sk6U9K6YqUeUhepmeevdFqBy2ovKfI2hLsiX7TowPFv1EpNkeioEalvriVZJQWInZcpi
         t1yWVh0C4ygYnGiCRHqTP1aCAbYAkqOmeC7TXVPB+qe0I0LXF/y8DK/xlLQlbC3rKXdb
         c+NMW4KScTB4NCRMtINicP73ylLU/JaaUpqHDGygWGv3wLLYnNKpcat8pK8XIUiRNxXn
         gGUsHq1lr4NzYbHzQFfk0uhjvxNFPDGcgGnf9BMUUYrEM7P0lkqqy/QnS26v7z8RpNCf
         VRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013081; x=1793617881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2vd1zU0crihOsV46gq8VNj28qagdedntjkY+3zV8OY=;
        b=tpmzphkvqruEsAOV5FnjTTZr7P7j8opZ3BbwoQaiLEtflqzP1/9EWAyz0MJJxTpwyH
         KNDBxu4cAjMvPVTL+pBYw/DHQjMa3X+UtBMJoY+jEHn1z+ccvzYevsrbfiwTZxm+1qyA
         2CZCvpEENrbyYxuuL8xyCXcEMwFgDHSRu6wsrflywzxyD8Y8jgAbIdIHX6sR2UyVgrub
         C8ecRsFkKjI3ebRZSwG4DcV66BLumTuBu2763w2802hoB2wh8C3z//CkUIkm6hiNwWaJ
         pt+W88TOCxbNehLKo5YtYmsbW/stUbMTTGfXvRLdl8iSYNcDcogV/QzZnWGAss0Jcquz
         y7iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrDcM2o9Pu25BLT2l06JehuhU40iazG1yKi2/lXW2Zbm/Z3AJlvOQWQ1FvdYQb/+jrwZho9OnoqYcCVm90/RliKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvmuIsaCoeByvEFuWjDRUqNbbCfu3otmAoo4oMhr9iJ4qLIAsF
	t6az2NPsE+0X+kjbcJNRcVUIZg2Xqtp1XPfU1i3rfhz6/RClXr38j7D9XUaQW1VPKqNo9dMP3mh
	Fo+wKuSBNuu6miUbDVqa6RrwUtS/7XBIVfDmCB3ucay89N8I0ubnHKgb9cA7f3DdpJvBSOXBw6A
	==
X-Gm-Gg: AYBFou3AkkkK3xeAD02tcoC+cWI7jCD2+9fL++bdNWrtiDxYM5zkay3ynMc269U+rWa
	M9SYQgd7zfb9ga5H2uy+HMjjt6+1ulE2ZnZcWQQPFclQ5AT4d2+dc4oeyGBiPxGpaeZg0Uiuyuy
	1heM5mXIdNaVOFzE3tDM2QDPb/cMHTgAtliT4bBE2sJtZ3enlikvXmjQy6fPF851yy9v7MgVb/P
	IzmhopJn33pu1AvymywYoPc5x62eDFPID3kEMFpQAVHQAP43L2blc+clq+hEh/s924c5xlNRI2s
	0owK09A+2FIqVUfcfyqrWrVRCnrSlvVW4ZZ9ESnKM6SCUH9xdbiNgyFwsrWeMlazlUyfBo7wyr6
	YNUatSjz9j6qGng/PfXEn/PwRIX1XmvNFWuFLETwa+qdZ9NyU2GL/yhvQBAwgvFxkg3y5DhGQnA
	iY8HZPSfx2GkY9
X-Received: by 2002:a05:620a:7019:b0:93f:61a6:b89 with SMTP id af79cd13be357-940ef795b32mr912450685a.7.1793013080518;
        Mon, 26 Oct 2026 04:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:7019:b0:93f:61a6:b89 with SMTP id af79cd13be357-940ef795b32mr912444185a.7.1793013079978;
        Mon, 26 Oct 2026 04:11:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:12 +0200
Subject: [PATCH 23/35] drm/panel: read the panel orientation in the core
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
Message-Id: <20261026-drm-panel-funcs-v1-23-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZA0xjScANGe4uXdzYZMdIbyDNkhj47OSIZft8eKozp4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Z9U8Hj97lb+q5o/M1s3STd4Ol0RvJGQ6JrDPe866Wc8
 5KYzkh0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiBoHs/+O3ed60/KIuzfDS
 47Di5nv1s2Tiz0n+f7L37X/Ve0vO3Y+VsM7wO9knuIuJp3eGlVHekwX9WksTVzyJ3R7E/mR6TXA
 SV4PwHb1W4+DP5ufMZnI3bY1eOzPb61B3hjjTf/esiUKzeSoj7NWuiXcfk9wisYI5huXOVOPjj+
 c3LT7N+PgHV0KXmMs/uQe3c2RbTbVWtfeK3HJIvFRQ8Lde+abFtO2hJvkt4rXv2699LD7G8pffJ
 pM55c97/Z0HnzoUJu9g1rm1fqZc+hwXh8lMc9dLeC/8wsUYkz3LVU5XvHjfjcBmvsKnd65Nd/r9
 3GUKo3r40nsWzH1nl8iHNKa5Gea7Vyy84pLu9k/SuEABAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MgUoaCl6_ChorTxlCnA3-KLyt-DzW7ON
X-Proofpoint-GUID: MgUoaCl6_ChorTxlCnA3-KLyt-DzW7ON
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf3559 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=fdq7EawpxR3WxEXJaCsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3AhJ/VpnZd4P
 iBvcn/Tjs4AODQRXJCjy6HO1esCndzzi+UGgnQ3oE3GUdkMU/uiPH222q7M2pZvv4ljCAWSKdlU
 7qh5P8e9zrdhqLzotLbLu2VKaoQHFOE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX9b7nAlMffVz6
 3wtQIBm3b29yhULA/YDBP6rECOII6VOpRrvRKBDYkKJImbcNWEpSq9S6tBXLj/mcwnW4EeLd5L4
 w/bJdjgbz29EBVLKyguohJIFkmRE4HMVglF7qU88XHT5jq1bvEJrnv2+LNeIMPmPUyalYpW+/Ky
 9CuP98GFde8ay1GGSISESj6k9CjK9OFo7UV8bLm85E2wp5LNUyicKSgKqbemGHeiscAQD5XOXRW
 ggDp2WBPOi4NhWYtYAyScLRbprxwGmVozEhfXlDS6jdPcmIJQmV72NXy4C74gtVbbKiRBWGScz3
 6kF98GDLpaMKMdRtz98bix3IUVTgw9JAXiv/b/iDicT+20sCN2ig5i34vYzVruzBiwnrvrWZ65w
 ssv891hjC+eue4fhaZkVvx91DW+0N/YikIaCNGtay9MWJYsCpOOn5eBRLrBCxQJnO4HTReHtrgP
 Arbpz5YA4yJzXcbxb3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

Panel orientation describes how the panel is mounted and comes from the
common "rotation" DT property, yet each driver has to parse it and hand
it back through get_orientation(). 24 drivers carry an identical copy of
that code and the rest silently ignore the property.

Parse it once in devm_drm_panel_alloc(). The callback still takes
precedence until the drivers are converted. An invalid value fails the
allocation, just as it fails probe in those drivers today.

As a side effect all panels honour "rotation" now. Among the in-tree DTs
this only changes the Motorola Mapphone panel (panel-dsi-cm,
rotation = <90>).

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c |  5 ++++-
 drivers/gpu/drm/drm_panel.c     |  9 +++++++++
 include/drm/drm_panel.h         | 10 ++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..efcf1ce979a9 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3397,7 +3397,8 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
  * @panel: panel that can provide orientation information.
  *
  * Drm drivers should call this function before drm_dev_register().
- * Orientation is obtained from panel's .get_orientation() callback.
+ * Orientation is obtained from panel's .get_orientation() callback, falling
+ * back to &drm_panel.orientation if the panel doesn't implement it.
  *
  * Returns:
  * Zero on success, negative errno on failure.
@@ -3410,6 +3411,8 @@ int drm_connector_set_orientation_from_panel(
 
 	if (panel && panel->funcs && panel->funcs->get_orientation)
 		orientation = panel->funcs->get_orientation(panel);
+	else if (panel)
+		orientation = panel->orientation;
 	else
 		orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
 
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 5bc97166bcb8..1b7ff0bea68e 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -925,6 +925,15 @@ void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
 
 	drm_panel_init(panel, dev, funcs, connector_type);
 
+	panel->orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+	if (dev->of_node) {
+		err = drm_of_get_panel_orientation(dev->of_node,
+						   &panel->orientation);
+		if (err)
+			return ERR_PTR(dev_err_probe(dev, err,
+						     "failed to get orientation\n"));
+	}
+
 	return container;
 }
 EXPORT_SYMBOL(__devm_drm_panel_alloc);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 579b6be855c7..dc4fbeac796b 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -236,6 +236,16 @@ struct drm_panel {
 	 */
 	struct drm_connector connector;
 
+	/**
+	 * @orientation:
+	 *
+	 * Orientation of the panel, used to set the panel orientation property
+	 * of the connector. It is read from the "rotation" property of the
+	 * panel's device tree node by devm_drm_panel_alloc(). Drivers can
+	 * override it before calling drm_panel_add().
+	 */
+	enum drm_panel_orientation orientation;
+
 	/**
 	 * @list:
 	 *

-- 
2.47.3

