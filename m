Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBE31D367
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jun 2026 16:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579264; cv=none; b=kHZh26bwbZq+jVw3UPJROANYqzsAVRJ8lHusVW2nVzG3eXv3s59N/Ew05tgrDF4ICwW9wcngR7EWCxNOEtxu/vbUEeQWScx+2z+exlsk+oN6awR2MgAXdyhw7ksX6FD72ZyHlH+cNVFXiXLlvibpTcS+TNzArBkxAb9feWjZIaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579264; c=relaxed/simple;
	bh=Coc6+axgNyuKZ/w9tZNcDBOAp4QRsPLZuDPcvvKDRkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=uhkdvj4HitKd8Th5lvEZSUTuraW2YUceyBBg+U3flJkx/3OtVyaQH9Za7a+QaboqfAj7O/4LDKmrvZp+HJue0/pjCVmlMEHC46y81cxaSw5FMFZGlmujfQy1lhcVoGt8iNSILA0MVHc8sj/7w7lhTB+D5fDqmYfIA6vvVVRHW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dQUuWNwb; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dQUuWNwb"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260627165414epoutp028f0d39aea10dd5071e82de252f0e8d1d~8-mMtBAa90526505265epoutp02h
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jun 2026 16:54:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260627165414epoutp028f0d39aea10dd5071e82de252f0e8d1d~8-mMtBAa90526505265epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782579254;
	bh=Cz8/kWNTiABNBQS/iHlFdfUP/vEMQXqsBrLkZrtPWyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQUuWNwbiDV3wTRwJnC7hLlujGC+OvvIqgTlJPllGGN6jvd9pNd5qSoVZT7hz6LHJ
	 9R7AK1LF6jUExxtEciJ2DidWRjjaqLfdlOB3wNlB1xelh97S8gNcZp0bBEliRcJhEf
	 iSc9LK6/ZdQlOTbmu388208wa/HPChLZuLbhp4sc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260627165412epcas5p2e41e3f37b00f820b42a92267a50b87e1~8-mLWUmPf1145411454epcas5p2U;
	Sat, 27 Jun 2026 16:54:12 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4gndtD0G8kz2SSKX; Sat, 27 Jun
	2026 16:54:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260627165410epcas5p3567172b20a463006bcf3686b3771f212~8-mJczSvX1818718187epcas5p39;
	Sat, 27 Jun 2026 16:54:10 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165409epsmtip15be716c248d53818f664565f392a4050~8-mHznZ9m0993509935epsmtip1k;
	Sat, 27 Jun 2026 16:54:09 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 2/6] dt-binding: pinctrl: samsung: Add exynos8855-pinctrl
 compatible
Date: Sat, 27 Jun 2026 22:42:24 +0530
Message-Id: <20260627171228.2687857-3-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260627165410epcas5p3567172b20a463006bcf3686b3771f212
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165410epcas5p3567172b20a463006bcf3686b3771f212
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
	<CGME20260627165410epcas5p3567172b20a463006bcf3686b3771f212@epcas5p3.samsung.com>

Document pin controller support on Exynos8855 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7b006009ca0e..c4773701c92e 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -53,6 +53,7 @@ properties:
       - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
+      - samsung,exynos8855-pinctrl
       - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
       - samsung,exynos9610-pinctrl
-- 
2.34.1

