Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212E5262BE
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847228; cv=none; b=IQr22Q9KU+DBdFn4SYEj/whIB/0eKlQfvD4xCGS99I6rLGEX5nHoAEp7DFr0KFWsjjsKfIrFKH1qGMVt1R7PnSiDkLJc6XwUU1shTil03xLPN+j0tZkq7u7rwN4vDOWr5JXPkwEUB2reQrwo4JV8oyzcmycs6UXHDgjwiHkFGG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847228; c=relaxed/simple;
	bh=xAdk25w4QKBHSXEZfL6SPJTxfBiBM9PNbijifYklXJY=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=fjAuioAHjz8qBu4JPJSm//36PnM9xuyzyZ2UbQBCNcSK984nnycYX0Z7gWju2kProxsT8ZYhYjrTOD1aZcDX+rfbC0XIuxkNOVlh4vzlbsKsgDt42+4Zx60TqwM/6i1NDAkFA4eEXbwqAzIf9RQ+oUx+YfXhQbw0FNnQh+ul5H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vD7KFuSh; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vD7KFuSh"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241002053344epoutp015182fa777a7c3bd2925ef74fb531842b~6i_VUkF7O2636226362epoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241002053344epoutp015182fa777a7c3bd2925ef74fb531842b~6i_VUkF7O2636226362epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727847224;
	bh=g2CWJMGP+z3zs4RAaBiaihDLbhVvbgYytCML7kcMty4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=vD7KFuSh2cS5r+1//Is4h4M24xnbtdJZQd42JcFjWgRYzOJXQ+aMOd1JRWwEwgwOL
	 ToR7PbpCTfm5vgL+5w8f5x8hxZ9cCGTwdna0fNInkvrWzBbODS8/7X33N4AsCHGQ4O
	 9OT+O5xDBmAYygbyj+Hj1FumttQd9at8pN0ZnPHA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20241002053343epcas1p3eec5d62868b2ae02ac3fd3b045f43685~6i_U75zxR3208932089epcas1p3a;
	Wed,  2 Oct 2024 05:33:43 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.235]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XJNlB4fcVz4x9Q9; Wed,  2 Oct
	2024 05:33:42 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	86.30.08588.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20241002053342epcas1p3c6973ab4e15e4f360deb8a3b58cebc04~6i_TnPPDR3203832038epcas1p3h;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241002053342epsmtrp159ca82b1f1ba94f8e737122b18b0f6f0~6i_TmcjmP1554915549epsmtrp1a;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
X-AuditID: b6c32a33-aadb87000000218c-c4-66fcdb36a286
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	62.74.08227.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241002053342epsmtip17b1160eb0218b1c735ed591da9e95e1a~6i_TXmFCi1646816468epsmtip1S;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Wed, 02 Oct 2024 14:33:26 +0900
Subject: [PATCH WIP 6/7] phy: samsung,dp-video-phy: Add exynosautov9 dp phy
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-auto9-v1-6-c4dc3385f415@samsung.com>
In-Reply-To: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,  David Virag
	<virag.david003@gmail.com>,  Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmrq7Z7T9pBttfqVo8mLeNzWLS/Qks
	Fr1rrjJZnD+/gd1ixvl9TBbP+4DE8fePGR3YPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
	NSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoDCWF
	ssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEpUGFC
	dsbD1R+YC7q5K24d6WVpYJzL2cXIySEhYCJxYNM/li5GLg4hgR2MEgvO3maGcD4xSux8cJ4R
	wvnGKDHnRydTFyMHWMvV7WkQ8b2MEr+n34PqeMUo8XnHN2aQuWwC6hJL2tayg9gsAqoSrx/s
	ZwSxhQW8JTb+28EEYvMKCEqcnPmEBcRmFpCX2P52DjNE3EriQPsBMJtTwFpi1a2nYL0iAqcZ
	Jf7PVYSo95CY8WwdO8QPwhKfd69hAzlCQqCRQ+LK1XtQCReJdefvM8EUvTq+BSouJfGyvw3K
	zpY4+nEvG4RdInF91iJWCNtYYv/SyWAfMwtoSqzfpQ+xl0/i3dceVkhA8Ep0tAlBmPIStzrL
	IRpFJc48/Qg10ENi2e5GVkjw9DFKXOt7wjiBUX4Wku9nIfl+FsKyBYzMqxjFUguKc9NTkw0L
	DOGRmpyfu4kRnBK1jHcwXp7/T+8QIxMH4yFGCQ5mJRHee4d+pgnxpiRWVqUW5ccXleakFh9i
	NAXGwURmKdHkfGBSziuJNzSxNDAxMzI2sTA0M1QS5z1zpSxVSCA9sSQ1OzW1ILUIpo+Jg1Oq
	gan61smaqtK//So7oopls7d8ENK5uf3/ujOJh5Z/zAmcvkl5q/r2OfrNnuctuS5M3m6WZHU4
	72//LrVQh8N9LJNm5UboczWcMLbf/eCgxPUNhuaHMvm4PKa/P+z0z5ol8prVg64Ve4VX3phd
	8uV5kaUyw3Tu71HK8ber1Y4Wrp9+6UmhPL9/youAj1/n6jYnqC06K7FVv0OUzzF8SqmBZumM
	CbKS/pM/zknaeWvaYnsNphnaFh3XzzzytE0L3mh+K3aNgYbMAiXu8KksjbvZ0t1fPWl527+I
	5/FpNXELNcMb1lPuJ041nfUxJEd422ErQ1sL7jdMJ1uyk1lMDm1cuFlS/cr15Neb1PZ8M2d8
	/EyJpTgj0VCLuag4EQCTONWGEgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWy7bCSnK7Z7T9pBn8ucFo8mLeNzWLS/Qks
	Fr1rrjJZnD+/gd1ixvl9TBbP+4DE8fePGR3YPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
	NYrLJiU1J7MstUjfLoEr4+HqD8wF3dwVt470sjQwzuXsYuTgkBAwkbi6Pa2LkYtDSGA3o8TK
	+59Zuhg5geKiEh2XGxkhaoQlDh8uhqh5wSjx5sNiNpAaNgF1iSVta9lBbBYBVYnXD/YzgtjC
	At4SG//tYAKxeQUEJU7OfMICModZQFNi/S59kDCzgLzE9rdzmCFKrCQOtB8As4WA7LU737CC
	2JwC1hKrbj1lBNkrInCOUeLan73sEM0eEjOerWOHuFNY4vPuNWwTGAVnIVk3C2HdLCTrFjAy
	r2KUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4ALa0djHtWfdA7xMjEwXiIUYKDWUmE
	996hn2lCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeb+97k0REkhPLEnNTk0tSC2CyTJxcEo1MO3s
	+G/ckbVvvtsWeWm3kKzypJ6e8IjmR0aevS/OHxD7Mj3g995dfqoTXW7zzDz31VpcO5RJ/Oy+
	NfOurPV7tTkwi+3gwtfPOivk9mb7ujE5WD7+5273IyZo8WnxwFkqfY6uU1wrfNdJbAufd/nm
	zEVdt6o/FkjGeNQt8pJR5Jm7ecKzvd42k01ffNolyic696T4cs22xFuct2WCPi1tVkp9dN8o
	47Sj86Odby69Stm5SPpo3QMNzyuqCXpvp93zCb1+jHGW/k/FDsebnvEKeYIrDJ/v912/UGRn
	qXHwt6QX2xsdQx8/fBY7PSXkS2lGxjLTnd2bT505EGcTPl85OrByd9353t9rxSymTJoZo6DE
	UpyRaKjFXFScCADjpmOG7wIAAA==
X-CMS-MailID: 20241002053342epcas1p3c6973ab4e15e4f360deb8a3b58cebc04
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241002053342epcas1p3c6973ab4e15e4f360deb8a3b58cebc04
References: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
	<CGME20241002053342epcas1p3c6973ab4e15e4f360deb8a3b58cebc04@epcas1p3.samsung.com>

I think this should refactoring to set offset on dt-binding.
In exynosautov9 there are 2 dp phy.

It will better like

dp_0: dp-phy {
    offset = <dp_0_value>;
}

dp_1: dp-phy {
    offset = <dp_1_value>;
}

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/phy/samsung/phy-exynos-dp-video.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos-dp-video.c b/drivers/phy/samsung/phy-exynos-dp-video.c
index a636dee07585..0ba929315abd 100644
--- a/drivers/phy/samsung/phy-exynos-dp-video.c
+++ b/drivers/phy/samsung/phy-exynos-dp-video.c
@@ -58,6 +58,10 @@ static const struct exynos_dp_video_phy_drvdata exynos5420_dp_video_phy = {
 	.phy_ctrl_offset	= EXYNOS5420_DPTX_PHY_CONTROL,
 };
 
+static const struct exynos_dp_video_phy_drvdata exynosautov9_dp_video_phy = {
+	.phy_ctrl_offset	= 0x073c,
+};
+
 static const struct of_device_id exynos_dp_video_phy_of_match[] = {
 	{
 		.compatible = "samsung,exynos5250-dp-video-phy",
@@ -65,8 +69,11 @@ static const struct of_device_id exynos_dp_video_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos5420-dp-video-phy",
 		.data = &exynos5420_dp_video_phy,
+	}, {
+		.compatible = "samsung,exynosautov9-dp-video-phy",
+		.data = &exynosautov9_dp_video_phy,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, exynos_dp_video_phy_of_match);
 

-- 
2.39.2

