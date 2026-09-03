Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BB3FE66F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2026 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419601; cv=none; b=EI82/zDA1K8OnGnh0OZUGAor49PTvJ3YjfESTmcqnk4Kp8zAug55WyqX/4iMkiSkqNdCKFGU2WVUiqDKwL/Zzalco39tSHdaCO3+EIQ54t+S2H0cgIIN6oTjqqC66Bmhq3UyCobR9sDlcfk6hQ3X1I9eaUZ6tvNxb6lWOhmGmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419601; c=relaxed/simple;
	bh=ERX0PKOLTtysOZYlLBWEj4GDxpy+Su8kFHXn19+mz7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=ikPNNKTJCwKiglC9Agq86SLwdKW8uVIu0X4Q3Mpj7KkYflVeOTJKyRFUNM11YF/V1xEyNmJvPTkdGng1QXlezrSItTDPTBWhRMXRP/BWe9jxXjt2Ujj1XZf8PPYW3Fr11AEdYsd4iZ9pS422fjxx1YjXF3aMPKfoKh0XQMVJscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=p9TJ+0F/; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p9TJ+0F/"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260903071313epoutp0157cecb3155a99d7fdbd68cb01641ed9a~RviUJVv4X1826118261epoutp01l
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2026 07:13:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260903071313epoutp0157cecb3155a99d7fdbd68cb01641ed9a~RviUJVv4X1826118261epoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788419593;
	bh=O+Oa9E6Qny0/U97J+PnwQI9eiS4VMGRYOtNKxkWoERk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=p9TJ+0F/Tbz6dm5Opj5PQnWxwUoXyIX9H19JD5b8YePGKlXpkBQ3czou2JMu4coub
	 zbQmltxlk76PBhjPuRXZU0gOz41D5Gyp9nB/m6O7GvHaqXSrrbj+/B8UBgbGSTMXEX
	 dlN3hpKHUkZhQO37gUM4bTfaKUhYkygQS3+fnbiI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260903071312epcas5p4d1005b5ac362f142932be092f36724e7~RviTlTlDQ0465204652epcas5p4w;
	Thu,  3 Sep 2026 07:13:12 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hb9mS032fz3hhT3; Thu,  3 Sep
	2026 07:13:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260903071311epcas5p24c547d69b769818834ae2b7285cb541b~RviSbxOkT2559925599epcas5p2V;
	Thu,  3 Sep 2026 07:13:11 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903071308epsmtip1dfebd129056ef4e6573b6bc6036f1c46~RviPvk0wn2578325783epsmtip1H;
	Thu,  3 Sep 2026 07:13:08 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH 0/3] Add USB DWC3 support for Samsung Exynos8855
Date: Thu,  3 Sep 2026 12:42:47 +0530
Message-Id: <20260903071250.3421499-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20260903071311epcas5p24c547d69b769818834ae2b7285cb541b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071311epcas5p24c547d69b769818834ae2b7285cb541b
References: <CGME20260903071311epcas5p24c547d69b769818834ae2b7285cb541b@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

The Samsung Exynos8855 SoC implements a Synopsys DesignWare USB3 DRD
controller. The DWC3 core on the Exynos8855 is instantiated with the
generic dwc3 platform driver using a flattened model, where the
controller is directly addressable without a separate glue layer.

This series adds the device tree binding and platform driver support
for this configuration. The binding follows qcom,snps-dwc3 pattern:
a single node referencing snps,dwc3-common.yaml for shared DWC3
properties, with per-SoC constraints enforced via if-then conditionals.

The MAINTAINERS entry is updated first so that the new binding falls
under the existing ARM/Samsung SoC maintainership.

Selvarasu Ganesan (3):
  MAINTAINERS: add Samsung USB DT binding to ARM/SAMSUNG entry
  dt-bindings: usb: Introduce samsung,snps-dwc3
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/usb/dwc3/dwc3-generic-plat.c          |  1 +
 3 files changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml

-- 
2.17.1

