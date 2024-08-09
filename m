Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96618193096
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723204511; cv=none; b=U6WHK8cX5PLDEdhEJOC91psR56hX6Np4nF66SSWqCsyZP6mQx8Nk9k7ad0fpHW5/tBtcumYoFz9/zQqhflqLssehYZc1VHsf9N93q12k8OkaYIK4NHxu9sM1yox7MiqbhFVb7kkgsVUyxQbr8/NpUJLTSEghobfTzhEEUZPAWsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723204511; c=relaxed/simple;
	bh=fuxZv2eCh2IV1zHesJOejSS8b43wG9G5je2OixEJx+I=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type:
	 References; b=fFrK1+/cV9dpPXy5Z9fM//QC79I2+NsrIh5xr5ekXZTqvQUfHbEnMk11gi9xkCfPdD3JjlnKz2dNlC+fgm1QaBC+0eL7AgQ04jP0ddfX0r9zNMAK7p7C6xAM6Tq7l5wZhX7s5QEkFA505aia0quy0p4pjBcsrsYjAUp5loMMY+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Zm5ICHet; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Zm5ICHet"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240809115502epoutp02f58ccc421419f5032e6644f2f925e4bf~qDV1opHRk2922029220epoutp02k
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Aug 2024 11:55:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240809115502epoutp02f58ccc421419f5032e6644f2f925e4bf~qDV1opHRk2922029220epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1723204502;
	bh=dDe4YxLtLtuk7RHpscfnTpM/xthitqJCjjmV1wookHI=;
	h=From:Subject:Date:To:Cc:References:From;
	b=Zm5ICHetKxYSYpJf3ji8w+yCGGFKlORTaDagKog7tMlSa1d7F5e0FOrcyH6nFNPMA
	 hcN0Car0lpqu/oVzIbmPH/LV1P6o5UnRclPHMMtldLMkSl0BQOBVaZrTo4JRs9zmnl
	 uCkKSZl9Dp8luxzrsvVECEvdALb4SElYCR04NcJA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240809115501epcas1p2f4cc43a786cfdefadd4dd27995cf170e~qDV07uoWg2527425274epcas1p22;
	Fri,  9 Aug 2024 11:55:01 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.145]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WgMm44RhXz4x9Px; Fri,  9 Aug
	2024 11:55:00 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	79.F2.10258.49306B66; Fri,  9 Aug 2024 20:55:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20240809115500epcas1p44cb69cea78a73833de38eab552b204fc~qDVzt4H8o2221722217epcas1p4V;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240809115500epsmtrp2f0dcdf01c84706b4d0e45109830db2a2~qDVzs-Iz72146221462epsmtrp2V;
	Fri,  9 Aug 2024 11:55:00 +0000 (GMT)
X-AuditID: b6c32a38-9ebb870000002812-79-66b60394dce5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C4.80.08964.49306B66; Fri,  9 Aug 2024 20:55:00 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240809115459epsmtip1eca7d57d21a050baf5938e958a7762a0~qDVzZdGem0525105251epsmtip1H;
	Fri,  9 Aug 2024 11:54:59 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Subject: [PATCH v3 0/3] dpum clock support for Exynos Auto v9 SoC
Date: Fri, 09 Aug 2024 20:54:11 +0900
Message-Id: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGMDtmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
	vPSU3UzU4B8JSMDIxMDCwNL3eSc7PiUgtJcXTOzRIskI4u0FPM0EyWg8oKi1LTMCrBR0bG1tQC
	gisIgWgAAAA==
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
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmvu4U5m1pBhPfylk8mLeNzeLyfm2L
	NXvPMVlc//Kc1WL+kXOsFr1rrjJZvJx1j83i/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4
	eMrV4v+eHewWh9+0s1r8u7aRxWLVrj+MDoIe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8
	SS6ALSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfo
	dCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEp
	UGFCdsac9RPYCuZzVHx+upS9gfEaWxcjB4eEgInEghNpXYxcHEICOxglbj1ZwwrhfGKUuNi8
	ih3C+cYoMf3wLaYuRk6wjhf/F7FAJPYySnw69h6q5RWjxKTr98Cq2ATUJZa0rWUHsYUFHCWW
	nG5mBrFZBFQlNjU2gtXwCthKPD2+lRHCFpQ4OfMJC4jNLCAvsf3tHGaQoRICKxgldt9/xQTi
	iAjsZ5Y49fA5G4jDLHCCUeLX7QWMEEcJS3zevYYNouUEh8TBJ9dZIRIuEk0zl7LCFL06voUd
	wpaS+PxuLxuEnS1x9COMXSJxfdYiqHpjif1LJzOBwolZQFNi/S59iPP4JN597WGFBB+vREeb
	EIQpL3GrsxyiUVTizNOPUAM9JGb2zwezhQRiJe5MamCfwCg/C8nPs5D8PAth1wJG5lWMYqkF
	xbnpqcWGBSbwaE3Oz93ECE6/WhY7GOe+/aB3iJGJg/EQowQHs5IIb3P4pjQh3pTEyqrUovz4
	otKc1OJDjKbAkJ/ILCWanA/MAHkl8YYmlgYmZkbGJhaGZoZK4rxnrpSlCgmkJ5akZqemFqQW
	wfQxcXBKNTB1FIS8C/vCoVq0cP3SEh/5/uJd5pwZKn08s8Q7Z7tOXDbF+LlUp0ATT8arJtfe
	BfXbLLUkt8v5Z/xcMf3P9KU5jOcNd+sdezeL/W68T9UcHTVHy82Bpe/+B7fPWf7OedKj+0/d
	pLiapnpHHJlTbT3l0rGH6xfcuLng+8c9iSqP6soYTshbfkuUZUiaIRp1YYO89RflfSolmy43
	K2+bseLK6Zj7IiYLzJ6wTX4vdDLGcN+q6oJzbGqnVAN6JE61edQpZnROjt0Ubea50UtQxmRz
	2ix7xv5zWUnHQxT/sN3SWMDEoeeUKLrf0GyBlnmHroCHtlGG05w29xucItYSlZz3Gbi0pfbO
	2bVxe6xfvhJLcUaioRZzUXEiAHVJd5xIBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42LZdlhJTncK87Y0g0fHWCwezNvGZnF5v7bF
	mr3nmCyuf3nOajH/yDlWi941V5ksXs66x2Zx/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlc
	POVq8X/PDnaLw2/aWS3+XdvIYrFq1x9GB0GP9zda2T12zrrL7rFpVSebx+Yl9R59W1Yxenze
	JBfAFsVlk5Kak1mWWqRvl8CVMWf9BLaC+RwVn58uZW9gvMbWxcjJISFgIvHi/yKWLkYuDiGB
	3YwSn/ofsUIkRCU6LjcydjFyANnCEocPF0PUvGCUeHlrN1gzm4C6xJK2tewgtrCAo8SS083M
	IDaLgKrEpsZGJhCbV8BW4unxrYwQtqDEyZlPWEBmMgtoSqzfpQ8SZhaQl9j+dg4zyHwJgRWM
	Eo+3LWcHcUQEDjJL/H7zDcxhFjjJKDFxwXZ2iOuEJT7vXsM2gVFgFpLBsxAGz0IyeAEj8ypG
	ydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOC40tLcwbh91Qe9Q4xMHIyHGCU4mJVEeJvD
	N6UJ8aYkVlalFuXHF5XmpBYfYpTmYFES5xV/0ZsiJJCeWJKanZpakFoEk2Xi4JRqYOLS29x0
	Y6/IRRumtzetTqzfP+GAm/JJzb9Mq1dovsk83z3JbvLXlLN1ezaaqIdqt1y8NEdGgmlz18wT
	WxeuXjG1XX6i5v1XdgwtRUF8R1YtTbrdyFS+O8S75POJCUYMqllHriXF8ZvsXeu32ZRNt1Jj
	n+8Uu4C4RJl7+paemk9vWV25lqtmJC0iN4c94HTe+ge9KfP3v1n0z7Jzxib52dkn+/Y8lyy/
	U+BQGuuR/d7u3E4ntxuLy/12/FgyZ9GOtU9OP3su5T8x28Ck2XdLCCN/7Z7CVrUZbM/nrXBy
	W8mwTO9V2cPOK/+tWUP6XuyrDDtxK/7R3TCLo+bOxk7Rq2Ypfz06/2VYRHD18X8q83SUWIoz
	Eg21mIuKEwHk5OBxGgMAAA==
X-CMS-MailID: 20240809115500epcas1p44cb69cea78a73833de38eab552b204fc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240809115500epcas1p44cb69cea78a73833de38eab552b204fc
References: <CGME20240809115500epcas1p44cb69cea78a73833de38eab552b204fc@epcas1p4.samsung.com>

DPUM (Display Processing Unit Main) is main dpu for Exynosautov9.
    
This patches enable clock for dpum, sysmmu(iommu).

I tested using sysmmu, DPP, DECON, DP on sdk board (modetest works).

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
Changes in v3:
- Rename clock-names dout_clkcmu_dpum_bus to bus

Changes in v2:
- Squash patch 1,2 to make headers with schema.

---
Kwanghoon Son (3):
      dt-bindings: clock: exynosautov9: add dpum clock
      arm64: dts: exynosautov9: add dpum clock DT nodes
      clk: samsung: exynosautov9: add dpum clock support

 .../bindings/clock/samsung,exynosautov9-clock.yaml | 19 +++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       | 10 +++
 drivers/clk/samsung/clk-exynosautov9.c             | 83 ++++++++++++++++++++++
 include/dt-bindings/clock/samsung,exynosautov9.h   | 11 +++
 4 files changed, 123 insertions(+)
---
base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
change-id: 20240809-clk_dpum-66a8b28fd7f4

Best regards,
-- 
Kwanghoon Son <k.son@samsung.com>

