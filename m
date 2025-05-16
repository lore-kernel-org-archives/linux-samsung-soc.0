Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3264C22DF86
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 May 2025 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385051; cv=none; b=vEFUJrLBMFdomIF/8Uy5/R2BR/8Ui8KtnUG0ZAM+cmGGQxdtmV14kPpa2SGTjpMKmtoD0CuKUJos2jFguXV2I83QlYcvv9IFj2Bc0wxmm5MpOusr4tbKIoPn4mkcXf2RVhPnoBB2ikMijX4VVEjJfOjfl54uv9vp5olBVs3iv40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385051; c=relaxed/simple;
	bh=guqbbcJJ4uygibkW9rYzLym8SwwKXe1+y8iLv5mlONg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=pozVd+szwhuKRIYlA7nEQCPS2RfkT2ihSvqjtMKVRZy5QoI9NHX584k74AxYUFiUbZ4zPEz8/u9PffgklvK/9H4rBV5Z7EZ0Aked3Y2ahsdBmkiVCX/qDbIZwdHbW76EE/fmjTJlj4V5ZZ5sThgCVTbDEdU/sYv8/xVzkHjgPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gQGNE+2E; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gQGNE+2E"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250516084407epoutp046983e104a8c5255bd38f19cd548aa96d~-9XE15qEH2267022670epoutp04N
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 May 2025 08:44:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250516084407epoutp046983e104a8c5255bd38f19cd548aa96d~-9XE15qEH2267022670epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747385047;
	bh=XRRW8JE+xbSHTpm27mlbstWCdqSF3fKhZAwkdWaRTdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQGNE+2EPvPF+iCMZtVfYMYhRDyKcWRFz982atQJJWV01fw0DK2RN7WT4rfkyzSy/
	 x2uultatOq2uudMidoj8uVzK2TuKGK696RysjmkG7BSG2Sbwt2aD2gJc3iezQkNg1o
	 ZVdjQPKOsiWg9z7dmNnfKwMQlMii/hnwA6aoFONQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250516084406epcas5p22cef9118cb10f452d1682f6b43f2a0df~-9XELQzyP0158101581epcas5p2l;
	Fri, 16 May 2025 08:44:06 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.179]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZzLGX2wzDz2SSKm; Fri, 16 May
	2025 08:44:04 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250516070439epcas5p40c4425b8bf9bdb2719f23a1c830b2abd~-8APBfH-u1963319633epcas5p4K;
	Fri, 16 May 2025 07:04:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250516070439epsmtrp1b78e6d258643dfbf4a7dd8fa5d9cc59f~-8APATblx2478024780epsmtrp1k;
	Fri, 16 May 2025 07:04:39 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-bd-6826e387abe6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A3.66.08766.783E6286; Fri, 16 May 2025 16:04:39 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516070436epsmtip26ad8a9cc70cfcd548fec0f8af8f930b2~-8AMnymaO0739207392epsmtip2H;
	Fri, 16 May 2025 07:04:36 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com,
	pritam.sutar@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add dt-schema
 ExynosAutov920
Date: Fri, 16 May 2025 12:43:32 +0530
Message-Id: <20250516071333.3223226-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516071333.3223226-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJXrf9sVqGwf4OAYsH87axWazZe47J
	4t6OZewW84+cY7W4dmMhu0Xz4vVsFi9n3WOz2Pt6K7vFpsfXWC0u75rDZjHj/D4mi0XLWpkt
	zr/oYrV4dm8Fm8X/PTvYLb78fMBscWT5RyaLVQsOsDsIeWxa1cnmcefaHjaP/XPXsHtsXlLv
	0bdlFaPHlv2fGT0+b5ILYI/isklJzcksSy3St0vgyljUPI+pYBV3xe/bfcwNjFs5uhg5OSQE
	TCRW3DrF0sXIxSEksJtR4tqvFUwQCRmJR9M2skLYwhIr/z1nhyh6yyjxcuk2xi5GDg42AVOJ
	iXsSQOIiAtMYJY407AebxCzwn0ni96czYN3CAtESByd9B7NZBFQlrh3+DWbzCthLnDm4kxli
	g7zE/oNnwWxOAQeJo29es4HYQkA1c3q+MEPUC0qcnPmEBcRmBqpv3jqbeQKjwCwkqVlIUgsY
	mVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgRHlpbmDsbtqz7oHWJk4mA8xCjBwawk
	wns9SzlDiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/4i94UIYH0xJLU7NTUgtQimCwTB6dUAxNH
	5u8ufvZS4Qa2fO8t7fGpzm52DjKWKs2y/NN7OXQu1Tx6Zq9i039XKveHn7jotSgGVSkW+w+n
	N7xf1JCmPPvV2umzbgU27712989Tu+B1phpcpxQOsK/aveiS3A/biRluvc22a50/Nuus/3/P
	MVbqVOf9r1N1Yl9sTc16dl1yXxwPv9TBAGenxe8XBx8SF2DR3L0zfk8HlxZ/bQf3VuP7vBnX
	NsXeXNfp2hXpepjZ5COrxeSWe6fjBC81f5F5fO1iVlL2po98kfHLGgMESqfveu/neMo4JaPS
	8dTB8+HveV8x96oYuAebbFI2Wjn9w/e2Uyoc+bHhjIk5QVNXR3zUX+HwKCn+uVp6iOVvJZbi
	jERDLeai4kQA00jIcBsDAAA=
X-CMS-MailID: 20250516070439epcas5p40c4425b8bf9bdb2719f23a1c830b2abd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516070439epcas5p40c4425b8bf9bdb2719f23a1c830b2abd
References: <20250516071333.3223226-1-pritam.sutar@samsung.com>
	<CGME20250516070439epcas5p40c4425b8bf9bdb2719f23a1c830b2abd@epcas5p4.samsung.com>

Add a dedicated compatible for USB controller found in this SoC

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 892545b477ac..6d39e5066944 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -20,6 +20,7 @@ properties:
           - samsung,exynos7-dwusb3
           - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
+          - samsung,exynosautov920-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
@@ -179,6 +180,21 @@ allOf:
       required:
         - vdd10-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ref
+            - const: susp_clk
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

