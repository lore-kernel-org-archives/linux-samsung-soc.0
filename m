Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4224A051
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 05:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756705376; cv=none; b=Wtjo3Uog4Ri7Iz1pi/7EWjn/t6UDt0Jw3atnIHtBJzSrH/2RQ3spW7glGxzxplp/5szFjoXuRjq1wrmmXXGKR8r0jNUncBi4OmSOrP5ujl5Fm6cFn3LIuFDaXoOlY/FWDIsJRFHrV/rIcQAMzHBYivm/wlyFMP5iI53fHj6dHJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756705376; c=relaxed/simple;
	bh=HFgDvQWT2HyZdyNkGNo3jDHmPek971QxEVhOXxL/PLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=TfOcOxF26uVbqX9YT2CMvSeqRYwv2rar2dktyeP3JQ9r/dhZlgktQOl+HA/Xz4tJhnk1D/y67jJGQc6IAKwE1wQa41FxAnQpmf7wj3NeIxH49j2ZflImdpThuy92SFV9+tno4MYHzyuzknhSQmnjWZVkF7AMmX/65OHnETDGRtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KrZKyG8B; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KrZKyG8B"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901054252epoutp01cd5366f8ec07de28a8c35aa528109e67~hEjp-rn5Z1923219232epoutp01m
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 05:42:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901054252epoutp01cd5366f8ec07de28a8c35aa528109e67~hEjp-rn5Z1923219232epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756705372;
	bh=PZ1lD7/HiIrsx1nwS+to//VvpTeYHESswHKS1MyGRd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KrZKyG8BPhP7vmkk+cWjFKosTwK3UWl2AyEaYCImwTCAap3zgo0KP8dMA6Y2Gyo1f
	 3bpV8Jbu4RiYbN55UEAAR+T1LFIWud/DUgycu20cz6L8VeWeLW6PZhLNV/CKaNUuXP
	 BNSAAdJIWx2J36HmIUY3xorWqcc/0ydepbO5mM5o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250901054251epcas5p475f99c8efd986d517e5e335f8fe4f514~hEjpAtrz_2599425994epcas5p4Q;
	Mon,  1 Sep 2025 05:42:51 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cFd7Z0dP2z3hhT9; Mon,  1 Sep
	2025 05:42:50 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8~hEjnlIkfz2137821378epcas5p4E;
	Mon,  1 Sep 2025 05:42:49 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250901054244epsmtip284d5c2a46a5299c22e8e6bb99ea8e999~hEjjQRonB0761907619epsmtip2x;
	Mon,  1 Sep 2025 05:42:44 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, ravi.patel@samsung.com,
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com,
	dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 3/6] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
Date: Mon,  1 Sep 2025 10:49:23 +0530
Message-Id: <20250901051926.59970-4-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250901051926.59970-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8
References: <20250901051926.59970-1-ravi.patel@samsung.com>
	<CGME20250901054249epcas5p483e898d45e072cb0faa79a681f73f0d8@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

From: SungMin Park <smn1196@coasia.com>

Document the Axis ARTPEC-8 SoC binding and the grizzly board
which uses ARTPEC-8 SoC.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index f9c218dc6883..63e9aca85db7 100644
--- a/Documentation/devicetree/bindings/arm/axis.yaml
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -8,6 +8,7 @@ title: Axis ARTPEC platforms

 maintainers:
   - Jesper Nilsson <jesper.nilsson@axis.com>
+  - Lars Persson <lars.persson@axis.com>
   - linux-arm-kernel@axis.com

 description: |
@@ -24,6 +25,12 @@ properties:
               - axis,artpec6-dev-board
           - const: axis,artpec6

+      - description: Axis ARTPEC-8 SoC board
+        items:
+          - enum:
+              - axis,artpec8-grizzly
+          - const: axis,artpec8
+
 additionalProperties: true

 ...
--
2.49.0

