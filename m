Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1DF24676B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Jun 2025 04:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749441956; cv=none; b=YIPrEufLWyC2pzEgM2nzRLqYAvPB3uby0OO5yPCIoxCrdRZIvQ4cYqjJ0Zf3R9Ul0l3PkvzwGXeV45qrWOElV2p/5xuRqYcnfmvW1szZxTLU4QMbzvTXzmW0NSxgnGIdqC4VIhaKOOQecENK9KZwn6gkO04h96i5LNus/iR+fCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749441956; c=relaxed/simple;
	bh=L6+1C4CzYabfehH0G4+8SaStDGBeWyrLmUOvSeRJYh4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=bddQMtqXgObBr/A3iF61AQ/71SZjguaWkcniLZdYuSmpCSsCm4BUCJrZnq2lctxXfvPakwZVYuamTykCcqagvQhGVAR942VXSooBtOmT1/f8qpc3iU0P0o0pJ2B81SggIExZKm1GyNRRt4m1Pb9+kn1si8Ztx6MPX438MxMpY1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rN3/KtQr; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rN3/KtQr"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250609040550epoutp03ba20dff13c9e16f9742ff38b0f0c8c8e~HRC9l4ydi2446624466epoutp03i
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Jun 2025 04:05:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250609040550epoutp03ba20dff13c9e16f9742ff38b0f0c8c8e~HRC9l4ydi2446624466epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749441950;
	bh=W0Ty8uQC2ggf7ArBdnQeDtKQVIMY78+qF9VWC+NFGdo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=rN3/KtQrvZoO5EJWpXFAE+yCgtvoPe7amkm1tf5cMF7fvZ8T0UTH9fjy4usrOHJAh
	 NpvEbnOX/rv9zDxq2MAyKUMi3Yaxq6RwNNpFqVXAjg7IFwLMnndpieOCpPNZacU381
	 079KqPrn/a2xLCYM8AuH05zDe665qLdT1Lp6xaPs=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250609040550epcas5p44ffe74ab72a0659449132c1e2595348c~HRC9FgbNP1796017960epcas5p4L;
	Mon,  9 Jun 2025 04:05:50 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bFyyH4tpDz2SSKY; Mon,  9 Jun
	2025 04:05:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250609040543epcas5p4a339f4920addf5bd274e54778172e78b~HRC2pfZzh2015720157epcas5p4t;
	Mon,  9 Jun 2025 04:05:43 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250609040540epsmtip23ac06c81db24768155a370ce8cdcaa13~HRC0J7VFH1644916449epsmtip2m;
	Mon,  9 Jun 2025 04:05:40 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <richardcochran@gmail.com>,
	<sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<chandan.vn@samsung.com>, <karthik.sun@samsung.com>,
	<dev.tailor@samsung.com>
In-Reply-To: <20250529112640.1646740-2-raghav.s@samsung.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: clock: exynosautov920: sort clock
 definitions
Date: Mon, 9 Jun 2025 09:35:38 +0530
Message-ID: <03cd01dbd8f3$c4c18130$4e448390$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRyuXPQglR2pg1tLiplohNF2WAzQJJNEBAALUq35Ozdl5VAA==
Content-Language: en-us
X-CMS-MailID: 20250609040543epcas5p4a339f4920addf5bd274e54778172e78b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111708epcas5p232b8bb6b05795b7014d718003daef0cb@epcas5p2.samsung.com>
	<20250529112640.1646740-2-raghav.s@samsung.com>

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Thursday, May 29, 2025 4:57 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> sunyeal.hong@samsung.com; shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; netdev@vger.kernel.org;
> chandan.vn@samsung.com; karthik.sun@samsung.com;
> dev.tailor@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v3 1/4] dt-bindings: clock: exynosautov920: sort clock
> definitions
> 
> Sort all the clock compatible strings in alphabetical order
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

