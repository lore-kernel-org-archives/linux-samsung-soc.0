Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A6134320F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555531; cv=none; b=EHa37KFu52sq0Nlnamokv4bfbJ3GXfwSOR6JZhoCRLWLVi5r0La4Xm59sHTDpLLMu710vzfahJUh+pjswgqIy7aWBNMD2InQacNF+wMUU1kpUzErF9JLv6fvfGsV2OU1oUdTkpBtOsjVgqCBp69TbubJAMrW4zM2bQil10f3hw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555531; c=relaxed/simple;
	bh=PZPwRC9NTS19AKjvwWboxFPsOd+EmRW0YrND1bb3kqI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=hYKG3yM7PHA6i38nVpoof/8Qu70RLhwPChCuLrNrBAQVzs4OORXocwuCU7STUGVzzUZZfEcf+LOwn7EWSwLlEcrg86wVPzwpgdVsiik2aCRp4TaBY+tOPKMAZr0kgJ2AoGcicQldytmzW6+FDPJuHHTdQ9qDooTexWKvYKR6Eo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uPLF5zSB; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uPLF5zSB"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251119123206epoutp011b7ce98097d94d9522210cd7ce03cf1d~5aGhcB6222664026640epoutp01V
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 12:32:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251119123206epoutp011b7ce98097d94d9522210cd7ce03cf1d~5aGhcB6222664026640epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763555526;
	bh=emxCFhe6JqYKv2dF3aZnO8Bo+hWOx+Kdh42BHQei1RI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=uPLF5zSBFNWPpoauRbyrvM9qj+kgMmrDj2+FL4BP7z3Mz5z6xprbK4/aD4GOkPbz0
	 RxHcLWvpXz9lplG85zylF9VF44Yhw2PdtBjA7CwgLt+fjG3d7ZJJVLZkAAgbPitAb+
	 K5ZK/Pvl9s/augmmxaS1GM0pLOwdyuDCzH0+WLw4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251119123205epcas5p32b4bdf32def98ead9a370bc9d5eec895~5aGgdYLD_0313203132epcas5p3W;
	Wed, 19 Nov 2025 12:32:05 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dBLTJ3WC9z2SSKf; Wed, 19 Nov
	2025 12:32:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251119123203epcas5p4dd8f8d47fe08b9875f99f7d61eeda57a~5aGe_2NT10773007730epcas5p4Z;
	Wed, 19 Nov 2025 12:32:03 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251119123159epsmtip175bc7abf4ad459f5bd64c41bf4a42406~5aGbPORQD2984229842epsmtip1d;
	Wed, 19 Nov 2025 12:31:59 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jesper.nilsson@axis.com>,
	<lars.persson@axis.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<alim.akhtar@samsung.com>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>
Cc: <ksk4725@coasia.com>, <smn1196@coasia.com>, <linux-arm-kernel@axis.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <pjsin865@coasia.com>, <gwk1013@coasia.com>,
	<bread@coasia.com>, <jspark@coasia.com>, <limjh0823@coasia.com>,
	<lightwise@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<shradha.t@samsung.com>, <swathi.ks@samsung.com>, <kenkim@coasia.com>
In-Reply-To: <de2f6c52-e9d6-48ae-8620-7c518b686ffd@kernel.org>
Subject: RE: (subset) [PATCH v3 1/4] dt-bindings: clock: Add ARTPEC-9 clock
 controller
Date: Wed, 19 Nov 2025 18:01:57 +0530
Message-ID: <03e701dc5950$824d44f0$86e7ced0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLr0KoHjPqm8iVboT8Q2O7+qgWovgMI9Oa5AjEfx9QCeSN36wHF7Q86so815vA=
Content-Language: en-in
X-CMS-MailID: 20251119123203epcas5p4dd8f8d47fe08b9875f99f7d61eeda57a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c
References: <20251029130731.51305-1-ravi.patel@samsung.com>
	<CGME20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c@epcas5p1.samsung.com>
	<20251029130731.51305-2-ravi.patel@samsung.com>
	<176355242978.116968.261312419155141714.b4-ty@kernel.org>
	<de2f6c52-e9d6-48ae-8620-7c518b686ffd@kernel.org>

Thanks Krzysztof!

I will send the ARTPEC-9 device tree related patches soon.

Thanks,
Ravi

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 19 November 2025 17:13
...
> 
> On 19/11/2025 12:40, Krzysztof Kozlowski wrote:
> >
> > On Wed, 29 Oct 2025 18:37:28 +0530, Ravi Patel wrote:
> >> Add dt-schema for Axis ARTPEC-9 SoC clock controller.
> >>
> >> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> >> which generates clocks for other blocks.
> >>
> >> Add device-tree binding definitions for following CMU blocks:
> >> - CMU_CMU
> >> - CMU_BUS
> >> - CMU_CORE
> >> - CMU_CPUCL
> >> - CMU_FSYS0
> >> - CMU_FSYS1
> >> - CMU_IMEM
> >> - CMU_PERI
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/4] dt-bindings: clock: Add ARTPEC-9 clock controller
> >       (no commit info)
> 
> 
> All applied regardless of above missing commit info.
> 
> Best regards,
> Krzysztof

