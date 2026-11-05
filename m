Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880877;
	b=GQ85IHzMPVkwlM1gFj6caR3padZpbaEUjRnJ4zRkvP5wqb5nVx1/tgkliuMogETTTXXb
	 trbtFx2IZ277ZcajWK0ntNnqi9FiO+W2wBncZc5ufDczDRip4EykunmrE7jm5Dr34+LEr
	 ZfNwB+M8yYWgZAEYT9D+HE6LFz2p+RhqJxsPpQNhoLjgUz8WRY62meZmOjgq3t/A+albJ
	 GRpuC+1fvsunMsQzfQaI0kyH7FERhTKNPPJjWBevSRkWkPt/pQMrhJnPOwhjFIVvZ70wW
	 BhvvyyGZR3OXJsMgkIVRTrsjYpWqRq8fF0ofrwQVniuGxederGDr1lSKaqmDB/PD2CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880877;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=Y+gV7tHyKEL0otgCQlQTt2Pz/4VwismWKNTtEGO49oM=;
	b=KSU+69fsWGBELcmwFBGZBRmbvnr1ldX8q49I5ICbD1RgaO1+S35ihMaEebAhE+fXfr7V
	 IpEZWsc2kX9/vW7Jy8n5wNLgUkddwjdZGwJBlecbEyTQnlNX/CgPYe0A8Ttb3cghudHCa
	 oSst+hMPP6hgLvpCIAMV4c9wHPceD3RGi6oB+Hpzzcv0tPn10yPw3tjxKZU5kWZPrmcKU
	 tknVzz5LHj1DWauuCu9NnDFkCV2/fA5qAquaQUegMsnICSTnBTOGoBTj1abp/7wbSB3KL
	 3NILw/8R0SNY8KfZ2x/HHrefDCcvH8Y1gRIa1o3ov+uJAEwYhyTZoDiPTm+cVKtbcMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=s2wIy+V7;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78864606A330
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 12:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78864606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=s2wIy+V7
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261105121434epoutp0333ffcf7be053025ecac82cc7a8d2c11b~lJSbBUQfS2805628056epoutp03N
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 12:14:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261105121434epoutp0333ffcf7be053025ecac82cc7a8d2c11b~lJSbBUQfS2805628056epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793880874;
	bh=Y+gV7tHyKEL0otgCQlQTt2Pz/4VwismWKNTtEGO49oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s2wIy+V7A6rn7gzjWZ6JCgKgS2JxTf7NcTsSyZeK0GnbownEtSo+aCnjLx86lWM2b
	 bnM2I/CUp+GoBmvXJ1zndHJiOo2eAAg9ZqQm7PWhXnxRkFvDUnyjaG3GZrs6RmGUPY
	 oMUGlZxesLiupkwFYD4W1xIma7QUQVDeVdYyNxbM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261105121434epcas5p1c149e359c38860c237960af2d948a102~lJSaPN-5c0588705887epcas5p1t;
	Thu,  5 Nov 2026 12:14:34 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jL1T50Dmdz6B9m7; Thu,  5 Nov
	2026 12:14:33 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96~lJSYpwq6A2344923449epcas5p3B;
	Thu,  5 Nov 2026 12:14:32 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105121429epsmtip1207e894c73db06501ec40665dd115c3a~lJSV6EnKM3079930799epsmtip1i;
	Thu,  5 Nov 2026 12:14:29 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Thu,  5 Nov 2026 17:44:01 +0530
Message-Id: <20261105121401.1661711-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261105121401.1661711-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96
References: <20261105121401.1661711-1-selvarasu.g@samsung.com>
	<CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list

Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
so the Exynos8855 DWC3 controller can probe through the generic DWC3
platform glue.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..069b265c9808 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -236,6 +236,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "samsung,exynos8855-dwc3", },
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.17.1

