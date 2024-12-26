Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7A14AD3F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735182716; cv=none; b=cuK/vIaF2RCtcT887Taoi5A64PEDyLLdmXI5JpxREqd7fji/IRNztgAw5LixsEiFi1k3k3SHl0De1Yw2wzWqiR/JQmMMCw27Gt0Bl4j6sQBf8SgOoE4vccaxwFsOaHujMxTF32Rqz4U7+6tIruGUsUWy/4iFMUx+WZyWAAFQMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735182716; c=relaxed/simple;
	bh=IUkLEUroWcr6uQqWfVi9CIhLe+JRZIdb/SiZE0WaW1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=GZzLk2ECzgM6Q+rAwg2ouXx7eFo6/bjfpdiWc1ZoqHssZFVB3lOx1utvATi4kd9Mc+tcxE3CJvl0F699m3Me8kIl8r+LnusHgV/aSlR6KOaiTN0DyFwa+bCft9+MLHg+eqrGiyaLw6LQBMlKIarVzJwaGJ66W1mT6NVr2013dSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YjYFj25H; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YjYFj25H"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241226031147epoutp01eae28ebc2b1e54c6336da5c0653ea8ba~Um3qYh6nc2504325043epoutp01a
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 03:11:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241226031147epoutp01eae28ebc2b1e54c6336da5c0653ea8ba~Um3qYh6nc2504325043epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735182707;
	bh=yv1kSTrV8RYbSjCr2kARXDG7PFZGPEVKIAQvmaxq054=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YjYFj25HEKyFlR9cabp0CSWSHNg9YjMHWGuMM5GrbOzsPrcZ+CwCmV0voVXbcFIto
	 nfSD5RIbeuZQgppcir8jZ6uyyZD2LxwJsW3ssGMVAn73kGO0n+GrLSHW9K4vxQ5W4C
	 uyo+kyd9fFFzsXstTSKlyqUxtEz3b/IEhlI9Nr5M=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241226031146epcas2p146e9d700730d2e39108d4a541cf9b862~Um3p-ZpBb1307913079epcas2p19;
	Thu, 26 Dec 2024 03:11:46 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.92]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YJYZB0NhWz4x9Px; Thu, 26 Dec
	2024 03:11:46 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	E4.AB.22105.179CC676; Thu, 26 Dec 2024 12:11:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241226031145epcas2p25dc5ea4da8d8cd9170ed2f04c6334d1b~Um3o0khfA2140021400epcas2p2T;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241226031145epsmtrp2062e7968c7373e5b96a5533ff8cce159~Um3oz6CWP2151821518epsmtrp2X;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
X-AuditID: b6c32a47-f91c170000005659-cb-676cc971ca67
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	CA.49.33707.179CC676; Thu, 26 Dec 2024 12:11:45 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241226031145epsmtip27d0538eb6712c24ddfabcc2549e5a242~Um3oiVbM32891128911epsmtip2V;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v4 3/3] arm64: dts: exynosautov920: add ufs phy for
 ExynosAutov920 SoC
Date: Thu, 26 Dec 2024 12:11:38 +0900
Message-ID: <20241226031142.1764652-4-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241226031142.1764652-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmmW7hyZx0g6cfrS0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRb
	JRefAF23zBygg5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6
	eaklVoYGBkamQIUJ2Rmn1v1mKljIWbFq91K2Bsar7F2MnBwSAiYS/7s/M3YxcnEICexglHj+
	fS0zhPOJUWLfyQ1scM6ezSvhWu5POAjVspNRYu35uSwQzi9Gif2n7wI5HBxsAqoS1xqqQEwR
	gUqJucucQUqYBXoZJfrvrGUBGSQsECFxvmUumM0CVN6/bgMriM0rYC3x+OANRohl8hIX1zxn
	A7E5BWwkTrTNZIaoEZQ4OfMJWC8zUE3z1tlgZ0sIfGSXuLH7JhPIYgkBF4l7naYQc4QlXh3f
	AvWAlMTnd3vZIOx8ifUP70LZFRJ3D/1ngbDtJRad+ckOMoZZQFNi/S59iInKEkduQW3lk+g4
	/JcdIswr0dEmBNGoJNFxfg4ThC0hserFZKjhHhJfVm+Ghlo/o8SNqdcYJzAqzELyzCwkz8xC
	WLyAkXkVo1hqQXFuemqxUYExPH6T83M3MYKTp5b7DsYZbz/oHWJk4mA8xCjBwawkwntIKDNd
	iDclsbIqtSg/vqg0J7X4EKMpMKgnMkuJJucD03deSbyhiaWBiZmZobmRqYG5kjjvvda5KUIC
	6YklqdmpqQWpRTB9TBycUg1MwmEzBV57CSj1SO44lv3D4I3dXo7VvJfv3VMR6ZZsfpNX9He2
	pux6q0m9c7/KnkzrEZ6n0F18RmQ+A8NczXkTFlaL89xMmZ+5Qlwypz9VZUf1is1aljebYtUf
	s5k23dPYaxow6/iE4qttxkF3rdof8mW0Na7WP3IzVfvgl2+xn2JPsGVeudRUu8Rlwa+jOWJv
	5z7TvCp5lfv8U5dSxU9ONWm81db5GzZtC/s8X2LOJrlJZyzTY3eu+vLZ0rdv3c5nvLv1H3Sz
	rhK/8uvW2a8RLQGsMooXI0R+NkZulw+3POfw2fP2A64Jn1/vCSvef+34xb9J15+Z3zzot8jz
	HmNcxwr7Ep3NtR7f0o/69vGuUWIpzkg01GIuKk4EAAloSTEnBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWy7bCSvG7hyZx0g77pMhYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJXxql1v5kKFnJWrNq9lK2B8Sp7FyMnh4SAicT9
	CQcZuxi5OIQEtjNKHPtwgREiISHx7c0eJghbWOJ+yxFWiKIfjBKvdnxl7mLk4GATUJW41lAF
	EhcRaGSUeP5hMjOIwywwkVHi/LwjYCuEBcIk1h47xApiswA19K/bAGbzClhLPD54A2qbvMTF
	Nc/ZQGxOARuJE20zmUFsIaCaT9+Xs0PUC0qcnPmEBcRmBqpv3jqbeQKjwCwkqVlIUgsYmVYx
	iqYWFOem5yYXGOoVJ+YWl+al6yXn525iBAe5VtAOxmXr/+odYmTiYDzEKMHBrCTCe0goM12I
	NyWxsiq1KD++qDQntfgQozQHi5I4r3JOZ4qQQHpiSWp2ampBahFMlomDU6qBaY3r+3iTOcVh
	9+L/saQ2X07Pc833bd4euN3Qyv6jh2FyFMPlc9U8D8LNjgpXFy5lbH2RnvQ9SsSDayWjWovZ
	+6qYDfqb5OSeCvXf2KaaU2ScbSkqu353xBtNzlsKi+6XXBe/xX6Vh3vlWlkxrwN1pdtKY3Nu
	/ZvQdLXi9sr5nx7KdfssPf0nQzC/+sN6zg/VkxtiGw6WFWsd6Tn4pDDwmofN6iezJk+8czvi
	VGTf1TpzIQ22/om8l3hqLfNUpT+zJ3/JT49YdUOVLYUpzuGsMYO5n6esqSpLh39cWlLmL977
	x2/VaLEYbvhillCi8zUz9qOfxF79Pzwvme+vCTXlvlkz8XFJtXXeataDU5VYijMSDbWYi4oT
	ATYCXljhAgAA
X-CMS-MailID: 20241226031145epcas2p25dc5ea4da8d8cd9170ed2f04c6334d1b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241226031145epcas2p25dc5ea4da8d8cd9170ed2f04c6334d1b
References: <20241226031142.1764652-1-sowon.na@samsung.com>
	<CGME20241226031145epcas2p25dc5ea4da8d8cd9170ed2f04c6334d1b@epcas2p2.samsung.com>

Add UFS Phy for ExynosAutov920

Like ExynosAutov9, this also uses fixed-rate clock nodes until clock driver
has been supported. The clock nodes are initialized on bootloader stage
thus we don't need to control them so far.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index eb446cdc4ab6..c761e0a1c2c4 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -444,6 +444,17 @@ pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
 		};
+
+		ufs_0_phy: phy@16e04000 {
+			compatible = "samsung,exynosautov920-ufs-phy";
+			reg = <0x16e04000 0x4000>;
+			reg-names = "phy-pma";
+			clocks = <&xtcxo>;
+			clock-names = "ref_clk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.45.2

