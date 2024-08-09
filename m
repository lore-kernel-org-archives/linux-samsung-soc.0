Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62346194085
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723204512; cv=none; b=k4sACht+rhqIX6azr1IfrXP8IEat6Igdk/BVIdBTogSW60n3I54jiulNvFgaCdL7nK3ovBEOZZ+FoteaY3rPfPKvmynSCz2J2lKzPyY/+034P87B1NLTbZRNp0LLLLp2wcDZvhsudq1OmK3b/7KqU9RdeZa3ECg/ZUW4kSnwTms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723204512; c=relaxed/simple;
	bh=DlwwV/cfqJEJotoxvSuOqqNb11r+qX2+3KI5M671GPQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=o0uJkur0puIcUDigATN37bDjKUdX7qUaCQU+zSraP+AP2NW7umgnNYHIRZdeqB3xhZsgV5e4MRmb0V/UmTVYoUd9vcxfTaiJn4M4mIjdM/A2wtUi4kXr/y38jLFRr7MMIZLHdaGl/GT+WUy+grW8H3066wNMOK0eEKM6IWE8OlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dhkBcsZ2; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dhkBcsZ2"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240809115502epoutp013a138767c9184a46bcc3f5704a5af032~qDV2HYbzB0936709367epoutp01B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 11:55:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240809115502epoutp013a138767c9184a46bcc3f5704a5af032~qDV2HYbzB0936709367epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723204502;
	bh=oaBrU9ww+8KkBsQRcTa2HOJ8kACKTNUvLohCkg5ah1A=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=dhkBcsZ28TdRcCC6sey4iMVNa2q+vsuGeddMtU1y4J5mfJnP77obC+jUnLb1so5rO
	 yqvYUOAzkqegcCxhurc8KuIda63wufhj8hxcOxh//6n9Og8ZObEUUuOKVH1uIeGLQx
	 hI+c6PXJKjcNBubc0X32J+kX/LuWgsUZxUexiJ7s=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240809115502epcas1p19e884a1e6d6b4b847d4cc756534c44f8~qDV1iDMbN1785917859epcas1p1P;
	Fri,  9 Aug 2024 11:55:02 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.135]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WgMm45zC3z4x9Pr; Fri,  9 Aug
	2024 11:55:00 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.71.09734.49306B66; Fri,  9 Aug 2024 20:55:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20240809115500epcas1p32a698c821765e1a0d5fa998e6e08f1cd~qDVz28AP01889518895epcas1p37;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240809115500epsmtrp2c80367f8d87080c5a19cf92e7fb19545~qDVz2GAPg2146221462epsmtrp2X;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
X-AuditID: b6c32a39-8f9ff70000002606-a7-66b6039443c7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	7F.43.19367.49306B66; Fri,  9 Aug 2024 20:55:00 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240809115500epsmtip191c8ab68ce01f1f077dc7530ec32c4d0~qDVzjDugK0371703717epsmtip1h;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Fri, 09 Aug 2024 20:54:12 +0900
Subject: [PATCH v3 1/3] dt-bindings: clock: exynosautov9: add dpum clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-clk_dpum-v3-1-359decc30fe2@samsung.com>
In-Reply-To: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,  Sylwester Nawrocki
	<s.nawrocki@samsung.com>,  Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCJsWRmVeSWpSXmKPExsWy7bCmnu4U5m1pBue/alk8mLeNzeLyfm2L
	NXvPMVlc//Kc1WL+kXOsFr1rrjJZvJx1j83i/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4
	eMrV4v+eHewWh9+0s1r8u7aRxWLVrj+MDoIe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8
	SS6ALSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfo
	dCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEp
	UGFCdsa1+xeZC44LV/zo7WZuYDzE38XIySEhYCJxedt6RhBbSGAHo8T//yVdjFxA9idGib7J
	jaxwTsfaZSwwHc29H9kgEjsZJRrXbYeqesUocfDST7BZbALqEkva1rKD2CwCqhLzru4D6xYW
	8JC43feRGcTmFRCUODnzCVicWUBeYvvbOVBxW4mfvR/B4pwCdhLHjp0CWyAisJ9Z4tTD52Cr
	mQVOMEr8ur2AEeImYYnPu9eAJSQETnBILJj6kB0i4SKx+cFRFpiiV8e3QMWlJD6/28sGYWdL
	HP0IY5dIXJ+1iBXCNpbYv3QyUxcjB9A2TYn1u/QhLuWTePe1hxUkLCHAK9HRJgRhykvc6iyH
	aBSVOPMUFEIgYQ+JSf91IeEzkVGi/VAj+wRG+VlI3p+F5P1ZCLsWMDKvYhRLLSjOTU8tNiww
	hcdqcn7uJkZw8tWy3ME4/e0HvUOMTByMhxglOJiVRHibwzelCfGmJFZWpRblxxeV5qQWH2I0
	BUbCRGYp0eR8YPrPK4k3NLE0MDEzMjaxMDQzVBLnPXOlLFVIID2xJDU7NbUgtQimj4mDU6qB
	SSFtTVCq9JPywqN6k3v42npn7f/+6e5Bjja1FM3Unfyno+YZR2vVlbw8Jm5/tHXG1zmqTyc6
	mNz3Weaw7gPrSevEJvEN/58uP/9sDruZNa+VANtCr7bc1CJebVvxGeyVXo/1j8Yf/PIqc3LW
	9tBCsTr+Jx9L53p91pwZM9c+b/MW8XMGGQ0VRgt4ZX7P9u3ap6sb4e+1qvnH4nvSfbx72WXb
	DkTJS69Ntzsvffa7suw29frG46/DGOYfPsW4ZPOZZbsK/3/bsOrm/DPnPO13/chQkHadI53w
	9EKcoFK2rWt/1RIze/PO07NeMcasDFxiaLBSfZru9yD1+Jar7M01ZhnSHrptmp8jmS/wsagq
	sRRnJBpqMRcVJwIAjN9AcUcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTncK87Y0g5VL+SwezNvGZnF5v7bF
	mr3nmCyuf3nOajH/yDlWi941V5ksXs66x2Zx/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlc
	POVq8X/PDnaLw2/aWS3+XdvIYrFq1x9GB0GP9zda2T12zrrL7rFpVSebx+Yl9R59W1Yxenze
	JBfAFsVlk5Kak1mWWqRvl8CVce3+ReaC48IVP3q7mRsYD/F3MXJySAiYSDT3fmTrYuTiEBLY
	zigxa81DdoiEqETH5UbGLkYOIFtY4vDhYoiaF4wS51ongtWwCahLLGlbC2azCKhKzLu6jwXE
	FhbwkLjd95EZxOYVEJQ4OfMJC8gcZgFNifW79EHCzALyEtvfzoEqsZX42fsRrEQIyD7/hA0k
	zClgJ3Hs2ClWkLUiAgeZJX6/+cYO4jALnGSUmLhgO9SdwhKfd69hm8AoOAvJulkI62YhWbeA
	kXkVo2hqQXFuem5ygaFecWJucWleul5yfu4mRnCMaQXtYFy2/q/eIUYmDsZDjBIczEoivM3h
	m9KEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8yrndKYICaQnlqRmp6YWpBbBZJk4OKUamFbJ1+2r
	rSp18HU3+5zR2stVqqB2/MkPy7VCvFGXnAT5V099u6V18Q6NjVkX1VTeJdyc0l/sPftg2KPP
	cz9oC34TfCy1TmJC1e+TrjPkLJpfaeyczt+fsut+hNFK45/7c65cvtsVz8bbNeOl6hGu8gTR
	a6e3MzvYxlyZurxkueGjvHU+2wwezGfy1oh4yBO8ivsz5+aJc1u/ny+S5nm+ROAD02rWpp28
	XfzCnrsmPbkdo83w6cX+IHO2J5k5/gq3rq7MC1ljc3Cbg+y3W3ll57iuB6Xs94/Xm7Ez8dNP
	4z05rj/+71s371jfUpmtr1y7u+a+CmCr91HfM1Hw48m0GeJR7qvLd78R3rb+7yJF611KLMUZ
	iYZazEXFiQBvmRBBIAMAAA==
X-CMS-MailID: 20240809115500epcas1p32a698c821765e1a0d5fa998e6e08f1cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240809115500epcas1p32a698c821765e1a0d5fa998e6e08f1cd
References: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
	<CGME20240809115500epcas1p32a698c821765e1a0d5fa998e6e08f1cd@epcas1p3.samsung.com>

Add dpum clock definitions and compatibles.

Also used clock name 'bus' instead of full clock name
dout_clkcmu_dpum_bus like other board cmu schema (GS101).

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 .../bindings/clock/samsung,exynosautov9-clock.yaml    | 19 +++++++++++++++++++
 include/dt-bindings/clock/samsung,exynosautov9.h      | 11 +++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index 55c4f94a14d1..32f39e543b36 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -35,6 +35,7 @@ properties:
       - samsung,exynosautov9-cmu-top
       - samsung,exynosautov9-cmu-busmc
       - samsung,exynosautov9-cmu-core
+      - samsung,exynosautov9-cmu-dpum
       - samsung,exynosautov9-cmu-fsys0
       - samsung,exynosautov9-cmu-fsys1
       - samsung,exynosautov9-cmu-fsys2
@@ -109,6 +110,24 @@ allOf:
             - const: oscclk
             - const: dout_clkcmu_core_bus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov9-cmu-dpum
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: DPU Main bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index 3065375c2d8b..ce8fb8f7d718 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -179,6 +179,17 @@
 #define CLK_GOUT_CORE_CCI_PCLK		4
 #define CLK_GOUT_CORE_CMU_CORE_PCLK	5
 
+/* CMU_DPUM */
+#define CLK_MOUT_DPUM_BUS_USER		1
+#define CLK_DOUT_DPUM_BUSP		2
+#define CLK_GOUT_DPUM_ACLK_DECON	3
+#define CLK_GOUT_DPUM_ACLK_DMA		4
+#define CLK_GOUT_DPUM_ACLK_DPP		5
+#define CLK_GOUT_DPUM_SYSMMU_D0_CLK	6
+#define CLK_GOUT_DPUM_SYSMMU_D1_CLK	7
+#define CLK_GOUT_DPUM_SYSMMU_D2_CLK	8
+#define CLK_GOUT_DPUM_SYSMMU_D3_CLK	9
+
 /* CMU_FSYS0 */
 #define CLK_MOUT_FSYS0_BUS_USER		1
 #define CLK_MOUT_FSYS0_PCIE_USER	2

-- 
2.39.2

