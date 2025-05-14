Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841531F428F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238994; cv=none; b=tdH3N65LKD0zihConSGJOKJ1dA5riet/+UBLJ4x+oEzIM26QF2YSKHLUKFxBf1sRyHiQeUcOq7eByh5P4kW6EAg4YaJuI2LMwWLprS+HIe9vD8n0zdVG4Rk5Aj52fGBHxR57vKyCP4eeUA/0o9BQqa1jRmlEWIGJr3Zf0aPuQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238994; c=relaxed/simple;
	bh=dAFXgv/Th++PeeqT0mudyRhiM3RKBJOKB7qx9Gr+mJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=VaZfE8Bemv/WR5dut4K53tVnAeqLOdrmdFRTckTDYfrd/6SGTsJuSeoQKTntLpsPwXsXRODLNjzEphk+Sa5CW/l0VWzZjfJH1PoQqHMoz7PCprvw4akDkbxDnm+3k5rCd0SNoIKVPxsUPdJJPbdj5Ppmq3UVsTuMCaSrIOo99Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bqH+LKhU; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bqH+LKhU"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514160948epoutp042cfedb7e95eea9c422c8cf7a479a3454~-cJpjO46R3160131601epoutp04b
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 May 2025 16:09:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514160948epoutp042cfedb7e95eea9c422c8cf7a479a3454~-cJpjO46R3160131601epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747238988;
	bh=5ZASWR2F8/aLstx6zx2qdaQhNiFkyY03eKEnIDBlPMY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=bqH+LKhUmbuvpHStQhZpv3R4meWUlwdJqguz5WHAZfR+RgIGQMYqvXOO7jx/WXIPD
	 lFjp8MvurU4+2u/vrikwlmL/QTHMtX/f9U8BUmaqU8PgbjICkT6iAHJbBztR6qPWlJ
	 T6Nn0m2/Qr+EP7B7jeNn0rZ4Njw1gy/5wogzanHY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250514160947epcas5p1df70417edde2fa2ae8a55591eaefdb7b~-cJom4x1H3248132481epcas5p1P;
	Wed, 14 May 2025 16:09:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.182]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyJFk47ngz6B9m4; Wed, 14 May
	2025 16:09:46 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250514135752epcas5p2c05acfa026f884fabb631bf15d20e4c6~-aWdBD1Zj1178911789epcas5p2k;
	Wed, 14 May 2025 13:57:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250514135752epsmtrp2563895c03fb8aeb0acc1e67de5378004~-aWdAJ_nk1245012450epsmtrp2F;
	Wed, 14 May 2025 13:57:52 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-a6-6824a16036dc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	16.2D.08766.061A4286; Wed, 14 May 2025 22:57:52 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514135750epsmtip2a7aee6cb8b0cbf9da77a2704dae5b760~-aWarW5jT0379903799epsmtip2d;
	Wed, 14 May 2025 13:57:50 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: pritam.sutar@samsung.com, gregkh@linuxfoundation.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: [PATCH 0/2] initial usb support for ExynosAutov920 soc
Date: Wed, 14 May 2025 19:37:39 +0530
Message-Id: <20250514140741.415981-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSvG7CQpUMg3dbZSwezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BbNi9ezWbycdY/NYtPja6wWl3fNYbOYcX4fk8WiZa3MFudfdLFa
	PLu3gs3i/54d7BZffj5gtjiy/COTxaoFB9gdBD02repk89g/dw27x+Yl9R59W1YxemzZ/5nR
	4/MmuQC2KC6blNSczLLUIn27BK6MXy9vMhe0cVbcfOnfwPiKrYuRk0NCwERi/t6TTF2MXBxC
	ArsZJe7uOs0KkZCReDRtI5QtLLHy33N2EFtI4C2jxJ92oDgHB5uAqcTEPQkgvSICmxgljqw4
	yQxSwyywmkni9NQMEFtYwF5i9/zlTCA2i4CqxO53E8Fm8grYSdyfv5EZYr68xP6DZ5kh4oIS
	J2c+YYGYIy/RvHU28wRGvllIUrOQpBYwMq1ilEwtKM5Nzy02LDDMSy3XK07MLS7NS9dLzs/d
	xAiOBy3NHYzbV33QO8TIxMF4iFGCg1lJhPd6lnKGEG9KYmVValF+fFFpTmrxIUZpDhYlcV7x
	F70pQgLpiSWp2ampBalFMFkmDk6pBiaOn3pBewyyfyzKdX0S67fw4HGvqZUGv+b8NPU8pj3H
	6Gx13YaeCsVFl1T2bLsXL+fZoBUZzb/0mkJKVswuzwMPXipPlTVxuuZUXe7cundWccL114er
	V5xwm7pmp1zU5mSuOXcenhN7MME1bc7lx4sTvTU0/y7JP3Ww44i8b1Pgad3tjhkLj83guFn7
	XcP2vvrbRTwbvv88O23Jr9BP8jcqOr5stBZ41S03J3rRzTviaR57WXbLpsy3n7T57cSVl+0k
	WRoOO09Q/BcwbeHJBIeEh+WGDN+Ec38dFee1X/dt0WqmAg8Tdcm2y5td+Jtj5PbnZZ6K8rFq
	yj3yb9FG3fCghDV8HSbnTrw5OlHcKj1OiaU4I9FQi7moOBEAYsMXc/YCAAA=
X-CMS-MailID: 20250514135752epcas5p2c05acfa026f884fabb631bf15d20e4c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135752epcas5p2c05acfa026f884fabb631bf15d20e4c6
References: <CGME20250514135752epcas5p2c05acfa026f884fabb631bf15d20e4c6@epcas5p2.samsung.com>

This SoC has a DWC3 compatible USB controller

The USB 3.1 DRD controller has the following features:
    * compliant with both USB device 3.1 and USB device 2.0 standards
    * compliant with USB host 3.1 and USB host 2.0 standards
    * supports USB device 3.1 and USB device 2.0 interfaces
    * supports USB host 3.1 and USB host 2.0 interfaces
    * full-speed (12 Mbps) and high-speed (480 Mbps) modes with USB device
      2.0 interface
    * super-speed (5 Gbps) mode with USB device 3.1 Gen1 interface
    * super-speed plus (10 Gbps) mode with USB device 3.1 Gen2 interface
    * single USB port which can be used for USB 3.1 or USB 2.0
    * on-chip USB PHY transceiver
    * DWC3 compatible
    * supports up to 16 bi-directional endpoints
    * compliant with xHCI 1.1 specification

Pritam Manohar Sutar (2):
  dt-bindings: usb: samsung,exynos-dwc3: add dt-schema ExynosAutov920
  usb: dwc3-exynos: add support for ExynosAutov920

 .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                   |  9 +++++++++
 2 files changed, 25 insertions(+)

-- 
2.34.1

