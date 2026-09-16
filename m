Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5854CCDD8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561437; cv=none; b=ZWVAr+zyoQtQ3wkRiFX/92jS6SwokWfkiIhZ547ibP71p3xZTVOBOMOpHjCGLBsDZ3GdHDix9JNkh4IMwTX6LzCl47GZxu51lVPK3HOCQhzFivmonfPglHMV0PuKTdETetUwArsm4DvdgirB2Y8MXbZElYUOh+L3+koU5clmZ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561437; c=relaxed/simple;
	bh=3a4AZ0K6fVksc/stSVhMbrd2aOqbLH8lJTBWQnltWIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=udTJI4B+UXNIveP6q/+sGnTcrNEBjUXnF5sWAWUGinxBWFLkUFd1gWax3t8EojZDMiT5yy4zE8XO4kQi1dZzVrUJkSrvhCj1VpSqN8Q6/gC7I2CvZUczmleTbt1CS5/UBpvx2gGu3n3RrbGRvn0A/u4lynmVD+OUrKjU75VnNXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KRuigGo2; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KRuigGo2"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260916122353epoutp039e216d26f3696d02836ee47b017a01f4~VzKRfM3hF0365203652epoutp03e
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 12:23:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260916122353epoutp039e216d26f3696d02836ee47b017a01f4~VzKRfM3hF0365203652epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789561433;
	bh=ak8Q6+fNBlU8q7MtsTksV589MUX4tYAzsPks4YDw7Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRuigGo21EnzTGn37Qtx8/XKXocFtIRjwbsd6H1CIhwuAHebhQhkewcBzfMKFXOIk
	 ijwuW+33coa2ZIIKTgLBSmHkHlcIaUtSP8FrYFQusiPRxgJAEc10pN/PwlQD1TAIUu
	 aFk0t3gMgy2SFiyx2XMiSYCvVwMUUeclJwwc8POw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260916122352epcas5p41a603ccf6197f984cd6a2b2de9559880~VzKRAL0uK2362423624epcas5p4t;
	Wed, 16 Sep 2026 12:23:52 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hlJ2v5YsMz2SSKX; Wed, 16 Sep
	2026 12:23:51 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142~VzKPm3pDt1908719087epcas5p3E;
	Wed, 16 Sep 2026 12:23:51 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260916122347epsmtip285ac663cc543167bf9709afe33e86de0~VzKMCPPGx1922219222epsmtip2q;
	Wed, 16 Sep 2026 12:23:47 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
 ARM/SAMSUNG entry
Date: Wed, 16 Sep 2026 17:52:27 +0530
Message-Id: <20260916122229.2604003-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260916122229.2604003-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Add the Samsung USB devicetree binding file path under the existing
ARM/Samsung SoC maintainership.

Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a53620839407..87a1ab24a375 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3576,6 +3576,7 @@ F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/hwinfo/samsung,*
 F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
 F:	Documentation/devicetree/bindings/soc/samsung/
+F:	Documentation/devicetree/bindings/usb/samsung,*
 F:	arch/arm/boot/dts/samsung/
 F:	arch/arm/mach-exynos*/
 F:	arch/arm/mach-s3c/
-- 
2.17.1

