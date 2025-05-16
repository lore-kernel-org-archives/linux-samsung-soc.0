Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FBD282E1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 May 2025 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385044; cv=none; b=oqc4hXiIWaniw6r3GiPtiUFLqjTto3Ol1m9AR3pj93jdIdDTRLWmckYZ9z+USApd52GcgOHE8WqHi1mJJSqIZ9B5XeAxaMpYs1kZbKqVYPRMGT8UlJqfiGnf2cx4Uwae0asP33mKuIERZ51h3bLzU6sQeJFPHoLAjb1RePkNQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385044; c=relaxed/simple;
	bh=RTh17wKWPYBiq7CWlWiqgQXRAXIrPv4zEk3aLTukMdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=nSnTLFwXwuSDYtw1TmCh+hjv3IQabIMgJqMdzMo+IYkAa0hdhcrxf/2lDAh7ewDCGGTv5e9/ktyxPHI/oVcfTLRsw+LyQLw5fj/kTUMs8f05aOfqeTYO+q/M6zZ6E8OCJmXuDo5oQ76Xx1OVhtdZ6RnZFshwH3EJN9ze38q/KKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UoyyS/jH; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UoyyS/jH"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250516084359epoutp03df95aad655d4403b75a7bd269c043d13~-9W9853Do0340503405epoutp03M
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 May 2025 08:43:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250516084359epoutp03df95aad655d4403b75a7bd269c043d13~-9W9853Do0340503405epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747385039;
	bh=oDUn4vGxqZ0dgmjFCUlqP7z0I19O5uz1oFEJFFgwGN0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=UoyyS/jHUfHBgn2s40CTQovf0uZEDIjk1ZbQcmnfIyarsh1XUGGVlDRHYt6u0OpWv
	 otsyupWW1nChjaSPUyKv5ykTycdpX7qvi1I6TmqZw+BUYG9U9pvA8N5mqtvsBaX8Vf
	 hW5KrDb1bpNe3/ZJvT9xfzi2YgeNRRyaBxsgwKTA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250516084358epcas5p3efd61ab4296640f46f59d806c92959a9~-9W9Gz9vg0984709847epcas5p3h;
	Fri, 16 May 2025 08:43:58 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.177]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZzLGN1Lchz2SSKb; Fri, 16 May
	2025 08:43:56 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250516070436epcas5p4204b77c1a146ab05ff897d930c32041e~-8AMna2Bk1740617406epcas5p4y;
	Fri, 16 May 2025 07:04:36 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250516070436epsmtrp2a81743acebd8ecc647593b88a5676dd0~-8AMmgodn0262802628epsmtrp2H;
	Fri, 16 May 2025 07:04:36 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-95-6826e3840519
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	27.A0.07818.483E6286; Fri, 16 May 2025 16:04:36 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516070434epsmtip25ce2feee6b9c38117999b0188e44db32~-8AKM8aYr0738607386epsmtip2I;
	Fri, 16 May 2025 07:04:34 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com,
	pritam.sutar@samsung.com
Subject: [PATCH v3 0/2] initial usb support for ExynosAutov920 soc
Date: Fri, 16 May 2025 12:43:31 +0530
Message-Id: <20250516071333.3223226-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSvG7LY7UMg5MTVCwezNvGZrFm7zkm
	i3s7lrFbzD9yjtXi2o2F7BbNi9ezWbycdY/NYtPja6wWl3fNYbOYcX4fk8WiZa3MFudfdLFa
	PLu3gs3i/54d7BZffj5gtjiy/COTxaoFB9gdBD02repk89g/dw27x+Yl9R59W1YxemzZ/5nR
	4/MmuQC2KC6blNSczLLUIn27BK6MbSfaWQs281S0r7nB3sB4l7OLkYNDQsBEYvom7S5GLg4h
	gd2MEnsWvmbpYuQEistIPJq2kRXCFpZY+e85O0TRW0aJzTMusoA0swmYSkzckwASFxGYxihx
	pGE/C4jDLHCcSWLKymZGkG5hASeJSbe3MIHYLAKqEl8+bwVr5hWwl/gyQRxigbzE/oNnmUFs
	XgFBiZMzn4AdwQwUb946m3kCI98sJKlZSFILGJlWMUqmFhTnpucmGxYY5qWW6xUn5haX5qXr
	JefnbmIER4SWxg7Gd9+a9A8xMnEwHmKU4GBWEuG9nqWcIcSbklhZlVqUH19UmpNafIhRmoNF
	SZx3pWFEupBAemJJanZqakFqEUyWiYNTqoEpI0tmZuqJOe6/tNd2cv+fdqDccR3vncR8nug4
	Z54NslX5e5c0MP7a/GH7Qgl7h3jFuI0K84Qc8jL3H22Z9FFJv351aNVd03bj4t5m3wuTL52O
	9BFP0Giz65FWTeZp4uO6KL3o7C/mNt/Hq5an7vq0ZF1gCOefRfWn/OxXcRXO8AxOfR476/X0
	bW3Sq5VYRf96y5xsmvlPe/om/ReCnFN+CL1oua53QdZNLdvxObfpbtdaUdaJ+2wU8vuPX11w
	/C6r5bOPYs+U37BJMEgwvrmyVm+e5Puiv033gyeXPmfZEM/ZOr9yeWR4jt//iP7WtoByi/Bb
	3tFJMd97Ygp/ybl9F/NSU74qe+DKH+1VD5VYijMSDbWYi4oTAWqHKu73AgAA
X-CMS-MailID: 20250516070436epcas5p4204b77c1a146ab05ff897d930c32041e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516070436epcas5p4204b77c1a146ab05ff897d930c32041e
References: <CGME20250516070436epcas5p4204b77c1a146ab05ff897d930c32041e@epcas5p4.samsung.com>

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

changelog
----------
Changes in v3:
- Added Acked-by, Reviewed-by tags.
- Added the usb mailing list.
  link for v2: https://lore.kernel.org/linux-usb/20250515225815.23sxkgior5wzsgsc@synopsys.com/

Changes in v2:
- Grouped compatible string "samsung,exynosautov920-dwusb3" along with
  the other Samsung compatibles.
  link for v1: https://lore.kernel.org/linux-usb/20250514140741.415981-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (2):
  dt-bindings: usb: samsung,exynos-dwc3: add dt-schema ExynosAutov920
  usb: dwc3-exynos: add support for ExynosAutov920

 .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                   |  9 +++++++++
 2 files changed, 25 insertions(+)

-- 
2.34.1

