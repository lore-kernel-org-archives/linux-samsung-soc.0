Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6D34BA4E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561625; cv=none; b=JBGhRf7qRQnW74NrZzQ79vHqVTATMKErQqkIk6TCxlMjKUkmWAKMfwJtAVcHAau7TJp8/0bxy9SjQlqcMHCUp7m9Hzhy2B2DnW31Htt9SCKLYwjCeO7352QyQrB9JVb3cWxu41Cjdk+A9TKE+tKBJXu8kVqEmT+45s+TJVKNfis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561625; c=relaxed/simple;
	bh=3ac5SJKMjKJl0XCG4C8b937fepS/iDUfIgc/8/56LoQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=YsbQ8iXzEo20DKitsVFtvDWfLxKDamala+mtlAnVL/AMilItbkrbH5q2BLt/jh4AwbwQjS3KbRlyB870hzY8UOpVcGcULRdriFOBhkJy4jURswm06h8wDBZUNhtQwmIqLWnyhoBDMGaP1bevFPNJI1wPmfLS6LCtqSxfSKOeWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JQjfe2qG; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JQjfe2qG"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251119141339epoutp048982342c0be2245d92104aca064f6823~5bfMVJKSD0059900599epoutp04w
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:13:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251119141339epoutp048982342c0be2245d92104aca064f6823~5bfMVJKSD0059900599epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763561619;
	bh=1S7tTJAGx8X1EU34gb6ZrEUZYE/FdslFurqubAmzMPs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=JQjfe2qGkL6exHWlU2EeFzu3tnLxZc3SCExfEHPptu6yh3Pv2QovgHi5Exv+wcqIn
	 UufyXhJUi6O0iAUOouyJustlEaYiL/9ZsbhtjWpwnu5WPxA9AmFJCRJkqQfdDyFNiS
	 xw24ThVIzhzEMRM175+FmVpBfjjCsEfNKRJv8uaI=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251119141339epcas5p24b187482617982dd3b7f9612e2bcae08~5bfLqcXcF3126631266epcas5p2q;
	Wed, 19 Nov 2025 14:13:39 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dBNkV1bksz6B9m7; Wed, 19 Nov
	2025 14:13:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251119141337epcas5p2d2164b21347c47f951bf0a1fa13f4fb7~5bfKAfLHK3126631266epcas5p2m;
	Wed, 19 Nov 2025 14:13:37 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251119141329epsmtip256bd93a175b81fa594cd342d022c26fc~5bfCatMzG3230632306epsmtip2Q;
	Wed, 19 Nov 2025 14:13:29 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jesper.nilsson@axis.com>, <lars.persson@axis.com>,
	<alim.akhtar@samsung.com>
Cc: <ksk4725@coasia.com>, <smn1196@coasia.com>, <linux-arm-kernel@axis.com>,
	<krzk@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <bread@coasia.com>, <jspark@coasia.com>,
	<limjh0823@coasia.com>, <lightwise@coasia.com>, <hgkim05@coasia.com>,
	<mingyoungbo@coasia.com>, <shradha.t@samsung.com>, <swathi.ks@samsung.com>,
	<kenkim@coasia.com>, <kitak81.kim@samsung.com>
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
Subject: RE: [PATCH v2 0/3] Add basic device tree support for the Axis
 ARTPEC-9 SoC
Date: Wed, 19 Nov 2025 19:43:26 +0530
Message-ID: <03ee01dc595e$b2a3cf30$17eb6d90$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFoEMcjarJV4Z6YO4Zds6s0TR8sjQFTOXLytdgBLzA=
Content-Language: en-in
X-CMS-MailID: 20251119141337epcas5p2d2164b21347c47f951bf0a1fa13f4fb7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714
References: <CGME20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714@epcas5p4.samsung.com>
	<20251119131302.79088-1-ravi.patel@samsung.com>

Forgot to add clock and pmu bindings which are listed below:
- https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=for-next&id=11cfb42e9e1a3fb641137e0033f10a5263d3d751
- https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=for-next&id=dfb59d7319915926a5606ffbccdb924b09f08cdb 

Thanks,
Ravi

> -----Original Message-----
> From: Ravi Patel <ravi.patel@samsung.com>
> Sent: 19 November 2025 18:43
...
> Subject: [PATCH v2 0/3] Add basic device tree support for the Axis ARTPEC-9 SoC
> 
> Add basic device tree support for the Axis ARTPEC-9 SoC
> which contains 6-core Cortex-A55 CPU and other several IPs.
> This SoC is an Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> This patch series includes below changes:
> - Bindings document update for ARTPEC-9 board (patch #1)
> - Device tree for ARTPEC-9 board (patch #2 and #3)
> 
> The patch series has been tested on the ARTPEC-9 EVB with
> Linux Samsung SoC tree (for-next branch) and intended
> to be merged via the `arm-soc` tree.
> 
> Pinctrl and UART DT-bindings are present in another patches which are listed below:
> - https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/commit/?id=e671a1bb5d1cf9ca4dbab61b9a3e1e77579f99ba
> - https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=85f17e130dc7189acf03eb0f8e2455c4ea2c4f9e
> 
> ---
> Changes in v2:
> - Decouple the device tree related patches which was present in v1 (Patch #5 to #7)
>   Device tree related patches will be sent in separate series.
> 
> Link to v1: https://lore.kernel.org/linux-samsung-soc/20250917085005.89819-1-ravi.patel@samsung.com/
> ---
> 
> Ravi Patel (2):
>   dt-bindings: arm: axis: Add ARTPEC-9 alfred board
>   arm64: dts: axis: Add ARTPEC-9 Alfred board support
> 
> SungMin Park (1):
>   arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support
> 
>  .../devicetree/bindings/arm/axis.yaml         |   6 +
>  arch/arm64/boot/dts/exynos/axis/Makefile      |   3 +-
>  .../boot/dts/exynos/axis/artpec9-alfred.dts   |  36 +++
>  .../boot/dts/exynos/axis/artpec9-pinctrl.dtsi | 115 ++++++++
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi  | 277 ++++++++++++++++++
>  5 files changed, 436 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-alfred.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
> 
> --
> 2.17.1


