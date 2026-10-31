Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465059;
	b=E6UqrcUIJuRDeBqIZR8JRdM8YMveF3YaB6yGCE1LRJSXYEODgDsZapAVZH/XspmdRBJc
	 a3AXobCZLWJY0hiDp0RUAhEnfbvT3Cd9rBviiw/23YZxmR9pgQpcZGQ9BvPuUOwZ/Sqia
	 w6CrvCZ8dEoy0fUJDB/pQ4Mp/LY5QNEjUaiNgHYLw8yysJ6YJ9WxhC8Pne5H5+HgWyki9
	 BzCLrEBCXtN6qbwnoecRwxJqnSUfa7YGkwEkd6j0tR0y1RRnisyh3Q7hwJUyCKDlIqqzP
	 aXGmVo+xySkM8TMishKXgfXg500/h69cLFNecbLRlpwEYU+tBA8Vx9KAp5CbZYv8kww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
	b=2yjTZEw53B3y8HofHMFwyDtmg7+FlcxstfDaR9TTxhYMskHGwWC/d1hy7q2lEajqTmnz
	 UVmTaXPpFpiu5uryM9F4XZWANWWxXxk5/1zEHqk1GQaJpPzYURapTN5iMEeRit2yZx4C3
	 Un+9HTPbQRzGmbXsnzaL1SNG3aLc9EyWLCftETcWg68+YOwjcpFmxsjU2EMBUAWy1cuBX
	 Rd9+WlgmepJPY3hWiRA05eSNB/NBJzpV6NIWmPlQ8h7LbS6Q14DQPcyYV6R6CPXFgmkHr
	 ZlCWTlnmjDjTQZXsFLUr56CF0g3yrorRJkHBEN7k0IrcUIIp/k8cPiLkfs8Ah5WAmEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdWMOV2z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwhZbRLK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC5F606A32D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AC5F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdWMOV2z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwhZbRLK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VGUSRw1020483
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AxPaqqR7JQ477yDdRMMPNaR6
	fhRM87wS+96sE2dqDu8=; b=DdWMOV2zuAcTmxoxESfa0mRiVck5d3ot4T6wTvkn
	yr7gIlkhDjxYophT68C9VCeg5uY00oW5ZoeSXPnEjEaqePR2Q8nbQW8Xa+qS0dig
	wyFR8xvA/YcJsCQ/A2m8uQD+qG0Hq0Ph4zLv0/UvPovKUHRsiJQ3x8JrIjg+qvBy
	8W7X80/OYoIl9M5BCR5yGjNYS27fpc7/yearZw2P4HVKmW6XIanjK9VlT6DPIKvW
	bB3nWBjPKKrSOdO468EAHhmlrMPpgBDB6+LVkJ8UgH53hlHtXymHV6jhjq6sWWEq
	tbexGPO0M/CWaqqzHd4e5fZObFGADZ/+RRPuvLLrJhF3Iw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk1cvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 16:44:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so349679285a.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793465056; x=1794069856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
        b=iwhZbRLKl7XfZWeuQ5jm64yJ+D7hIqc+mz/a5Hf6xA/0E9iwo0evXHhKF9MDfEx4D5
         fkhwbSNWVeuSBFBozpgNs/01PJUW/EdiqHhlaBbRX4Tg77xKsoVkyhL4h6PNEKVbfK6S
         0Ok2u+JQbGTIfZc9cBytMpYv/B9wPxUm+LgkQAw76JT5mwXXCFRVZc2ybYkLBytKrdDK
         O1P7txqH7SARE4CbvbBxrXhxMsqli8cABcrEsktee/eZ9IqfKGT7GlkeUFgzsGcpHQee
         /I3OSE2K6o3VbMnoqWuFqOR5YoyeW45qIf7Nbz7Rq8t2H/tEftPk9h6aEclHucIcIph1
         xiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465056; x=1794069856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AxPaqqR7JQ477yDdRMMPNaR6fhRM87wS+96sE2dqDu8=;
        b=tCK0OMqYkcYLnXwsCEhcxSnWgeNYkxh3Vz3iZ3BK6zKqSfeuX6QDsZ6KZbxcBs6jCb
         r8XknYIxnqaGpKt6puDyDrvM65K/XAw+Y8wml4FNoU6MjvujEm33CprOEAutWydabwxK
         HpTVKTgARGj0lglhlo+UAS8EYs2MbDDq5m/trMNl9qK32aGPvdvJuIhDDhbalOjjOkiu
         WJL9EZokltQGP9dRyALoKXLzbPi59vFCRyE00vtRQJf860m1kQ2WReeWqTPltDdBZ9Z9
         8NH/gAs3iUf3g6p2szi5VM13klPilAsQpzs+w4aeXb0XKxheAlPvXTzR6kw1gpe8cXN2
         /agw==
X-Forwarded-Encrypted: i=1; AKwUvByUa0XbDAx9k7utRR1lmpzqkeUxagBE1+wOX/mrMVUIXlQxwXNmHvobGyMLOgWaQs1pZzayHaEe41mYuBOLvIrJ4A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKFN+JBhP+wCJPyBUQOtWErdVYVvf5o3XwRfQ2e+Yl9udryvoJF
	edMIObU6WZ1F4zyobLnPDXb9nZOSBpuMIgzKm8BmWfIk+btfBexQcck9viduEs6Qc/+C+6cESz4
	KgmmhQgmXNLX26fjfwniTGyySbrFsw3RU7lpECdC9GCJxTZiy24rK2PIFtzLBuJ/AIjzmxxAdbw
	==
X-Gm-Gg: AYBFou3eniFqHmSN0SIP/lKAoxS78wcqwy2ylFH81vLOYZAxtZK99rTl2Ov0lxgfvKE
	LqG2Exdlwdf1I5PZ08jjLLF80jyNfcSwBGi/oA3hw7Do6zeBC5wIbmih5JnzGJ5ydYdYX7yChSA
	2YhIWH29g/1cH80Zed/8Q5cT/aL4wL2aPnTSg0+ef3JyCh6gBcMn3Tq53+SIGWlMqcW6JWvmsqx
	eyGe6oB8rVJUpVSABJV4aefR50G1h33IhZHbFb/R3tXO4QO69yM/r0nTWL8+LP0nN6B5yZkhQYI
	BD3oH6LHPmI22cmM3wV0IwpMrGbDnKhtTO2YqMWujLVoT8iLowTuribpR0oUqQwDX+kSGgBgPy1
	hDB/KFLeueCUWIiTKCR8hobPvhMqNDvLXVI1vjJ6RLKsiaN2lyYm8KJhsVa8qrKPkvNFPx7gBok
	irRrSxSTXO7r+YWL9MtmYGpKQW/MHqvUwF1x+10rSn20Wlv8sww9UBEWjsuAXy+Q==
X-Received: by 2002:a05:620a:1a17:b0:93f:3120:6c82 with SMTP id af79cd13be357-9442186437cmr915824385a.78.1793465055945;
        Sat, 31 Oct 2026 09:44:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93f:3120:6c82 with SMTP id af79cd13be357-9442186437cmr915810385a.78.1793465055075;
        Sat, 31 Oct 2026 09:44:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d1a8sm660313e87.32.2026.10.31.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:44:13 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:44:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Douglas Anderson <dianders@chromium.org>,
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
        Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 00/35] drm/panel: let the panels use the atomic state
Message-ID: <py3tch5wmx4g2zjpebzbgtpwji4ci3vk5obeuy44fbi4vw2em2@gpjmxyvwpimn>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <cxsgo7u2hfb4jskscqcbeaaneiyfh7bdmlvku2wxwtduekwhxz@3vsizgxvekw7>
 <DMICO60J4G03.1QBH2T9SQ7XEZ@bootlin.com>
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
In-Reply-To: <DMICO60J4G03.1QBH2T9SQ7XEZ@bootlin.com>
X-Proofpoint-GUID: iEdn1OIwQo0DgcakU-4Qm9VRM3HNLN_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NiBTYWx0ZWRfX1wW/d7vKh7Uv
 k5A5suVujULo0sk+uLBalXNsozX0lEyXDeqR9hei7yX/6cYdugzEtR+jtjWuIVc7B4Hn68Ta5wL
 VnDmQmKDr+zPKYjTmsoNjQgsjsQ1V1x25mVnmWotXqUGl9wyUbbW1KCPIrg5TERIq6lU4BQo6rL
 KCdTElCmLpUbfpyEk3InaIUF7JF0FLIJE61H2NylJcE/gRlGI5wMoxxAQrA8QYlm8EFRh42MTwc
 ZytdFES7GbNS5Crvr4CvEvowWkie4SqUrf3DmtlAgQd5mEAX3IgednBW4wl3UHpWTl+Y8oV/zea
 jfJR9sFECu0ZIMZH0G957dZ7SnpLN+asUdBti0MyFv33sRXpZ4vvKJnhvVkj4/nvjdFgM/m8zcI
 F891soCTH1wel+uf7pfSziStf+y+NB4CVNKL2P9uGl3VXP7hlestmXu8WTVafMSLH3y1WDeUT/L
 mBTyGYG9CV9mS79O8+w==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae61ae1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0sqqXKTFXRObX0Cx7wsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NiBTYWx0ZWRfX6S0f5BqHrjjL
 7vxSx2vqgVCFgliki2W4nBXj4AQLflODccc5U7kTWANcQaK5fituOeq+fQ+KcFtV4KX/k5Iuzmh
 VrQjAgwKK6iZWz4vYwAhbOA/X/w52D4=
X-Proofpoint-ORIG-GUID: iEdn1OIwQo0DgcakU-4Qm9VRM3HNLN_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310066

On Fri, Oct 30, 2026 at 06:31:02PM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On Tue Oct 27, 2026 at 1:02 PM CET, Dmitry Baryshkov wrote:
> > On Mon, Oct 26, 2026 at 01:09:49PM +0200, Dmitry Baryshkov wrote:
> >> The panel is the only element of the display pipeline which never sees
> >> the atomic commit. Its prepare() and enable() callbacks get nothing but
> >> the panel, so a panel which has to be programmed differently depending
> >> on the mode can only guess it. The NT35950 driver, for example, saves
> >> the connector in get_modes() and reads connector->state->crtc->state
> >> while being prepared: without the locks, from the current state rather
> >> than from the one being committed, and with no way to reject a mode it
> >> doesn't know.
> >>
> >> Every panel has a struct drm_bridge embedded into it, and the bridge
> >> already has all the missing parts: atomic_check(), a state object which
> >> can be subclassed and the commit passed to the callbacks. Rather than
> >> growing struct drm_panel_funcs into a copy of that, let the panel driver
> >> provide struct drm_bridge_funcs for the embedded bridge. This is opt-in:
> >> the panels which have no use for the atomic state keep using struct
> >> drm_panel_funcs and are not touched by it.
> >>
> >> To get there the bridge callbacks become the entry point to the panel,
> >> with drm_panel_prepare() and friends calling them rather than the other
> >> way around. The panel core still has to track the panel state, notify
> >> the panel followers and handle the backlight, so the driver doesn't fill
> >> in the power callbacks directly, it wraps its functions with the macros
> >> doing that part. NT35950 is converted as the first user.
> >>
> >> The bulk of the series is the cleanup of what the panel core and the
> >> bridge need from the panel driver, so that a panel providing the bridge
> >> callbacks doesn't need struct drm_panel_funcs for anything:
> >>
> >> - get_timings() had no callers.
> >>
> >> - The connector type was stored both in the panel and in its bridge, and
> >>   the display drivers could override it while creating the panel bridge.
> >>
> >> - The orientation was read from the DT, stored and returned by nearly
> >>   identical code in more than twenty panel drivers, and some of them
> >>   also had to set it on the connector from get_modes(), with a TODO
> >>   asking for a better place. The core reads it now. It is applied to the
> >>   connector from the new connector_init() bridge callback, which is not
> >>   specific to the panels: other bridges have properties to set up on the
> >>   connector being created too (HDCP, DP link properties), and currently
> >>   have nowhere to do it.
> >>
> >> - disable() and unprepare() returned an error which nobody could act on.
> >>   Worse, a failed unprepare() left the panel marked as prepared, so it
> >>   was never initialised again.
> >>
> >> Behaviour changes worth knowing about:
> >>
> >> - Panels with the rotation property whose driver ignored it now get the
> >>   orientation property. In the tree this is the Motorola Mapphone panel
> >>   (panel-dsi-cm).
> >>
> >> - sun6i_mipi_dsi, sti_dvo and the Tegra DSI get their panel after the
> >>   DRM device has been registered, which is too late to create the
> >>   property, so they lose the orientation which the panel drivers used to
> >>   set from get_modes(). None of the rotated panels in the tree are used
> >>   with them.
> >>
> >> - A panel implementing atomic_check() can only be driven through the
> >>   bridge chain. The display drivers calling drm_panel_prepare() directly
> >>   have no commit to pass.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >> Dmitry Baryshkov (35):
> >>       drm/panel: remove the get_timings() callback
> >>       drm/panel: remove the unused struct panel_bridge
> >>       drm/tidss: get the panel type from the embedded bridge
> >>       drm/bridge: lvds-codec: use devm_drm_panel_bridge_add()
> >>       drm/ingenic: use devm_drm_panel_bridge_add()
> >>       drm: mxsfb: use devm_drm_panel_bridge_add()
> >>       drm: rcar-du: use devm_drm_panel_bridge_add()
> >>       drm: rz-du: use devm_drm_panel_bridge_add()
> >>       drm/mcde: use drm_panel_bridge_add()
> >>       drm/pl111: use drm_panel_bridge_add()
> >>       drm/rockchip: lvds: use drm_panel_bridge_add()
> >>       drm/rockchip: rgb: use drm_panel_bridge_add()
> >>       drm/panel: remove the _typed() panel bridge functions
> >
> > Gmail barked at me for sending too many emails for too many recipients
> > in the middle of the series. I guess, I'll have to split the series into
> > smaller parts. Please consider reviewing the posted patches, letting me
> > split / land the series in parts.
> 
> The first 13~14 patches are nice and fairly independent cleanups. I guess
> they can be sent separately, or just be applied. However I'd still want to
> review patch 14 and do some testing next week before I consider them ready
> for applying.

Sounds like a plan. Would you ack the patch 14? I'll review and repost
patches 15+.


-- 
With best wishes
Dmitry
