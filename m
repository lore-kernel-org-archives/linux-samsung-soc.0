Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21377EAC6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294998; cv=none; b=H/EOZFmSgEkzyPdRng7vr8q2WH7h1j0ktj4A2NN5t7uEeMmcY2MsNafIxJIMci+L8S3oleaSsspp5y+IuGCQpJLfpTAv7O9TnMa4QgoVk3kPgPrrNJoWhL307J/gaoWQLxU0WQOitaE/rlKoEdGefpM9yjfZVdR1Li/yaB4MtFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294998; c=relaxed/simple;
	bh=M6gXxN9cPAeDUPC0shHp+FrrarsI1on6AdO3sQ6zfks=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GSbQpbLg8LZX9s796ZtIlPUATo+zEkgQeu5BW2QLme/y+fNg/nrsG6js+DBxgPnLHDNJMBRVyDuEB/POKMrIGhaaQtAiQ4ehfPXzPWcA4I7iBoKPtkyOWHowFTSZbhBCp/9iwmh1xa1By2mmvFzyuXaaKyuqBGlMQnDrvf0LmxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ABNMuS0w; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ABNMuS0w"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250318104953epoutp01e1faf978045d567a65f0a742cd224bd1~t4BDg2ab_1863918639epoutp01Y
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 10:49:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250318104953epoutp01e1faf978045d567a65f0a742cd224bd1~t4BDg2ab_1863918639epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742294993;
	bh=ym3JInl4vR0nG186B998FYal7OWkBgTZa/2aQcc7KTU=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=ABNMuS0w1oN5eCXY88m8C/24HFNrziboGlTK2I34+eG6wPxem2LIXCiChBQilMLGJ
	 f6Ivcg6ydXkEjYyi/eCGXvUs234X3QMRt1aZLfxIc+NqwElTGG9JUVF22iHGg0lgtE
	 BoxE97ZAYzY8JmavTeEpbmwwL7VKMp4c3tQtKLLI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250318104952epcas5p1bab98c72fe30d154e48be3ccc50988bc~t4BCd4Bn31421314213epcas5p1q;
	Tue, 18 Mar 2025 10:49:52 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4ZH7rv40Dtz4x9Pw; Tue, 18 Mar
	2025 10:49:51 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.14.19956.FCF49D76; Tue, 18 Mar 2025 19:49:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250318104951epcas5p1bbd5161355a2945697a30731f5c5693e~t4BA2pTUw1189511895epcas5p14;
	Tue, 18 Mar 2025 10:49:51 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250318104951epsmtrp121ba47b1053e067737a67ac4abd40616~t4BA1X0cE1339813398epsmtrp1S;
	Tue, 18 Mar 2025 10:49:51 +0000 (GMT)
X-AuditID: b6c32a4b-fe9f470000004df4-25-67d94fcf9868
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7C.42.18729.ECF49D76; Tue, 18 Mar 2025 19:49:50 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250318104949epsmtip2af533e8fe37fcd9e8210461e70ef00d2~t4A-Rg1DL1762917629epsmtip2u;
	Tue, 18 Mar 2025 10:49:49 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Inki Dae'"
	<inki.dae@samsung.com>, "'Seung-Woo Kim'" <sw0312.kim@samsung.com>,
	"'Kyungmin Park'" <kyungmin.park@samsung.com>, "'David Airlie'"
	<airlied@gmail.com>, "'Simona Vetter'" <simona@ffwll.ch>, "'Krzysztof
 Kozlowski'" <krzk@kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250318080738.29292-1-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH] drm/exynos: exynos7_drm_decon: Consstify struct
 decon_data
Date: Tue, 18 Mar 2025 16:19:48 +0530
Message-ID: <000c01db97f3$7976af70$6c640e50$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMPSnGnw8L0peP48BxqkWeMoAcDzwE4FBB6sQeQ6cA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmuu55/5vpBkd/SFqcuL6IyeLK1/ds
	FpPuT2CxOH9+A7vF3tdb2S3ONr1ht9j0+BqrxeVdc9gsZpzfx2Qx+91+dosZk1+yOXB77P22
	gMVj56y77B6bVnWyedy5tofN4373cSaPzUvqPfq2rGL0+LxJLoAjKtsmIzUxJbVIITUvOT8l
	My/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hQJYWyxJxSoFBAYnGxkr6dTVF+
	aUmqQkZ+cYmtUmpBSk6BSYFecWJucWleul5eaomVoYGBkSlQYUJ2xoQHX1kLNrBX3P5ymq2B
	cQNbFyMnh4SAicTPtSfYQWwhgd2MEtPn60PYnxgletvzuhi5gOxvjBLdu06wwDT86mljg0js
	ZZT4/OcwI4TzklFizaPnTCBVbAK6EjsWQ1SJCJxjlnjXsgUswSngIvF0/UtGEFtYIFDixucv
	YLtZBFQlZsybzAxi8wpYSvz/v48NwhaUODnzCdhqZgF5ie1v5zBDnKEg8fPpMtYuRg6gBVYS
	d2/VQJSIS7w8eoQdZK+EwB4Oiel717BD1LtI7F/yDeoFYYlXx7dAxaUkXva3QdnxEvverGCC
	sAsk1lz7B1VvL7F6wRmwXcwCmhLrd+lD7OKT6P39hAkkLCHAK9HRJgRRrSrR/O4qVKe0xMTu
	blYI20Pi855OJkhYTWeUOPL7MPMERoVZSL6cheTLWUjemYWweQEjyypGydSC4tz01GLTAuO8
	1HJ4fCfn525iBCdjLe8djI8efNA7xMjEwXiIUYKDWUmE1/3J9XQh3pTEyqrUovz4otKc1OJD
	jKbAoJ/ILCWanA/MB3kl8YYmlgYmZmZmJpbGZoZK4rzNO1vShQTSE0tSs1NTC1KLYPqYODil
	Gpj6Jj/cziM4403KrDRr+9zfaXYTQyLET0dGzrX+mvjkv9XDwo6E3M+PPjTM4pv1WeZZ8lOL
	sMjuG66Wjb6n2OUi739ZumQyy3Qf14OZHe9NfszpEXxgkx7LXMLlEvep5r1vn+zzad5evf48
	mtLdf0vDHhuxrepq9BVIu3V+hx3f5p5Vp7ojV1qzyboJqbTrhAo1S6jtlfrr1HHwhumjVbr2
	MizLDqjO5Pz2uzD6Yvlrl5Jas++iEdW21x62Ce20MG258ezdpHuZO5c5yb4MKGe7wD/TZca+
	4+f2NS0LkC80maW+/Gj3OtaT9Q1qpxjM/JYdZGaPuqC87+027v0Ggct3cZeYruHZfZIreofv
	diWW4oxEQy3mouJEANqX1itPBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvO45/5vpBr8e21icuL6IyeLK1/ds
	FpPuT2CxOH9+A7vF3tdb2S3ONr1ht9j0+BqrxeVdc9gsZpzfx2Qx+91+dosZk1+yOXB77P22
	gMVj56y77B6bVnWyedy5tofN4373cSaPzUvqPfq2rGL0+LxJLoAjissmJTUnsyy1SN8ugStj
	woOvrAUb2CtufznN1sC4ga2LkZNDQsBE4ldPG5DNxSEksJtRor/jPQtEQlri+sYJ7BC2sMTK
	f8/BbCGB54wSrZfrQWw2AV2JHYshmkUErjFLbP3azg4xaSqjxM4d28E6OAVcJJ6uf8kIYgsL
	+Euc6FgGFmcRUJWYMW8yM4jNK2Ap8f//PjYIW1Di5MwnQFdwcDAL6Em0bQRrZRaQl9j+dg4z
	xEEKEj+fLmMFKRERsJK4e6sGokRc4uXRI+wTGIVmIRk0C2HQLCSDZiHpWMDIsopRMrWgODc9
	t9iwwDAvtVyvODG3uDQvXS85P3cTIzjutDR3MG5f9UHvECMTB+MhRgkOZiURXvcn19OFeFMS
	K6tSi/Lji0pzUosPMUpzsCiJ84q/6E0REkhPLEnNTk0tSC2CyTJxcEo1MJVMe7TJ66y/4bVl
	nUdY12topEhzPrp5110g/8Ud/QI+lZuT9ZqrzBIfcCptCNXI4s7rZJCr3sZ6h2uKG1umksvr
	6Kb+wOiL/ous8q2Y/zfelJLstTSbVB8R5Bmx7tWZVtc7l4rNPV9NaNvsEb120g/eYrecVOMp
	ERF3ZHtDs6eV+0yZENNrqiwZs0KysE8l5tAZB4W1DYlfly5dxPTp//lH9gFT6yfGbT9a+2vy
	1RJb9+9X/lnnqt1M5toq23P0XN1r9fonOpujq9WWsFTX/Z5imD4p3FiJUf3Bn0zzS6wKL67K
	LbFh4Sh+cVh0UflE+8MGEb4a3LLxl+vvSi7nsY+fXtY0M0lvh2jEHnMlluKMREMt5qLiRACB
	4ZkMKgMAAA==
X-CMS-MailID: 20250318104951epcas5p1bbd5161355a2945697a30731f5c5693e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318080746epcas5p476317bb7bae69a8a85b5ad870bb3d0a5
References: <CGME20250318080746epcas5p476317bb7bae69a8a85b5ad870bb3d0a5@epcas5p4.samsung.com>
	<20250318080738.29292-1-krzysztof.kozlowski@linaro.org>

Hello Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Tuesday, March 18, 2025 1:38 PM
> To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> <sw0312.kim@samsung.com>; Kyungmin Park
> <kyungmin.park@samsung.com>; David Airlie <airlied@gmail.com>; Simona
> Vetter <simona@ffwll.ch>; Krzysztof Kozlowski <krzk@kernel.org>; Alim
> Akhtar <alim.akhtar@samsung.com>; dri-devel@lists.freedesktop.org; linux-
> arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: [PATCH] drm/exynos: exynos7_drm_decon: Consstify struct
> decon_data
> 
> static 'struct decon_data' is only read, so it can be const for code
safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



