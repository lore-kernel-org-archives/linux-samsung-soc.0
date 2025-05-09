Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3655521D3CD
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 May 2025 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797218; cv=none; b=hv3Omrxqbs4qPnEvO8S8GaX5OvecFg8pnYxlreWq04a8qookL/go0Ie6o0J3OVH04vWYM90yCUEnYOercBfQAqKN/so7XVpNtEaLP6CdI8vp6DTBltK/b7CpcyvSW0oRXjyqTc2r2i7I6ZTSXT257ibAfTiei4wexiWsOnS1rKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797218; c=relaxed/simple;
	bh=tPM06Iu4Z8+P5EtG8tgjuDyDEEfZr/lbw7DZWRVQNhU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=RdzCyo1OozhXnPZFiF3w2pmDLF/ASJuQyhgQms/1712AI8DJ9RTwchJgVt/qhE1ai+MxPSX/uzEBeyCDcJCIFENJnqr3KxEJSlnCo0tAgyQzU1DeC+Z5bgSjWreGM4zrWPLtSsiEnoLOZXh2C6/o1PnScvKA2lsiRLiwWPQ76TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gSecdX1o; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gSecdX1o"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250509132648epoutp04ae992d32f3a1c9672a24fe198586f913~93s5QeGyG2812728127epoutp04Y
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 May 2025 13:26:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250509132648epoutp04ae992d32f3a1c9672a24fe198586f913~93s5QeGyG2812728127epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746797208;
	bh=9orThWdcg4TfeCb68m3fWgyEG197G9T1RDce0h0a5uA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=gSecdX1oOe9APpkGq6S7+HbTi1lhUu6jVTwVac0Zz1BCe1QZvZgxuLuOWCgbVqNID
	 QJjFYn4AbLXmitK0CNCEnCAVhB07YnY1CbUDqeaPQbVOb5hdPqhNNUMdJium85RgW2
	 IlYzt4k6DvCedxx2nPK7e1li7kWFBAuzjfizQY/I=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250509132647epcas5p2b7230107602ed17c24fcda9d48d850eb~93s4VQ3x60975309753epcas5p25;
	Fri,  9 May 2025 13:26:47 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4Zv8sx2KR0z6B9m6; Fri,  9 May
	2025 13:26:45 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250509124701epcas5p3eee2e2e0d19914366a6759e13d561840~93KKoVN2C0832308323epcas5p3L;
	Fri,  9 May 2025 12:47:01 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250509124701epsmtrp2ab77079f3558be76c75d7002ac34b6e8~93KKnhEnM2652026520epsmtrp2D;
	Fri,  9 May 2025 12:47:01 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-2a-681df9451973
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	22.3C.19478.549FD186; Fri,  9 May 2025 21:47:01 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250509124700epsmtip2a2aea9a0075dd374a05f53a9d1ffaae9~93KJT_XeV2899828998epsmtip2x;
	Fri,  9 May 2025 12:47:00 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Raghav
	Sharma <raghav.s@samsung.com>
Subject: [PATCH v1] arm64: dts: exynosautov920: add cmu_hsi2 clock DT nodes
Date: Fri,  9 May 2025 18:26:46 +0530
Message-Id: <20250509125646.2727393-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSvK7rT9kMg4WHFS0ezNvGZrFm7zkm
	i/lHzrFavJx1j81i0+NrrBaXd81hs5hxfh+TxfeVdxgt/u/Zwe7A6bFpVSebx+Yl9R59W1Yx
	enzeJBfAEsVlk5Kak1mWWqRvl8CVsf3FTaaCB5wVW398Z29gfMvexcjJISFgIvF5513WLkYu
	DiGB7YwSFxZcY4VISEjs+/+bEcIWllj57zk7RNFbRokrV+6BdbMJaElc2f6ODcQWEYiWWHb3
	DBtIEbPAZkaJdTMPgU0SFvCW6Lj8BqyIRUBVYs2xy2BTeQWsJe5ensoCsUFeYv/Bs8wQcUGJ
	kzOfgMWZgeLNW2czT2Dkm4UkNQtJagEj0ypG0dSC4tz03OQCQ73ixNzi0rx0veT83E2M4EDV
	CtrBuGz9X71DjEwcjIcYJTiYlUR4n3fKZAjxpiRWVqUW5ccXleakFh9ilOZgURLnVc7pTBES
	SE8sSc1OTS1ILYLJMnFwSjUwCe20nn3CcIdytrfCjqAjjb+Ur2+PO9/eVfZ34+eeTULiVZd6
	rjDxH7Is5vNcKFozpVB5u7OOmP+WlU3FZU0FG/d/KG3ZO+P61b9rW2vWvdh6Vkemee62qL9O
	Lu3StzRXOn9/7/vzx9T2v5mPuqXvz7xj8ffx9rwgxdLiml+XZGur9da7yjdtW16S0uRryFl7
	JpTXPZRlv8zPF61zdKwYzlrd2sBvLRTy4ikfyyZDkXcLb0Wzd7P8c5zK/or1IbfHzWCBnhMu
	cyT+3u58xX9ga9qRY+9dvqh9uaaabvfsvvN3sWrvH6fTn+91L3Q8dvSuQ7WHUdOVyPY/R6P5
	Ga/Lhwb29etMf9MeU23V969RiaU4I9FQi7moOBEAu3XYC8MCAAA=
X-CMS-MailID: 20250509124701epcas5p3eee2e2e0d19914366a6759e13d561840
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509124701epcas5p3eee2e2e0d19914366a6759e13d561840
References: <CGME20250509124701epcas5p3eee2e2e0d19914366a6759e13d561840@epcas5p3.samsung.com>

Add required dt node for cmu_hsi2 block, which
provides clocks to ufs and ethernet IPs

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..7890373f5da0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,23 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi2: clock-controller@16b00000 {
+			compatible = "samsung,exynosautov920-cmu-hsi2";
+			reg = <0x16b00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC_UFS>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_UFS_EMBD>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_ETHERNET>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ufs",
+				      "embd",
+				      "ethernet";
+		};
+
 		pinctrl_hsi2: pinctrl@16c10000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16c10000 0x10000>;
-- 
2.34.1

