Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B5334FF79
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957990; cv=none; b=VzpPDX56j2sp62u8n84FqpfU0SBsJP4UdL6FtwT4vU405D72JEQoh5HKoKHZuDQhtIV8/+WVuHegbvMOd8fV0HmH8xRj6QzWO6JGONUot74VEvHOHe7Pr5VXeZKWPq+8kO4tXkC6jNH5EnjLIj2HrG7fhbxVA6b/AHMmiEP+YGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957990; c=relaxed/simple;
	bh=7mp4N0QTUq6d2IRoEd48LEAfXGIOJj7w/sFE/VmeZaQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=OKulUjCgWXuXICZFQXQOobqIqKi7QaCCEEY6AQw6lWfKUjCRCVEo4/J2M9TLa4NeHqSub0hD8OrnujAnJ6ysq/0DrK7n9/GQCj88Jww1DUyeKyhydVAhfKJZ0HX/ZgCldVj9do5fqtfa9R+6xdsHl1Gxae2v9XjH+waEBJyVl5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KeoZE8GV; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KeoZE8GV"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260528084621euoutp02d8c468e09a633dcd690f1254594afe86~zrlp21fjQ3074130741euoutp02h
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 08:46:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260528084621euoutp02d8c468e09a633dcd690f1254594afe86~zrlp21fjQ3074130741euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779957981;
	bh=5KpXoMlUBIo07hkMUGdEi14XEgmQe4bZb6aHSf3DYdw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=KeoZE8GVf5b1OEe6UFSGQLiROB02q4qaaDAArsfCMX58Gd8ErSxREKheEPOmUfWRH
	 RzZ6Y2XEuMP4Sq73zIHdLdmIdbNEjS4pR8bktyU1TVRld9xxAu+gI0BGhwXaizQAQv
	 6Cyx4MHBwN7y1xtNUj6SZg+6MZO6Xu2FKJoXoUck=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260528084620eucas1p178159f6b7f3eed6806a848db6587a9f7~zrlpjYHfw0286802868eucas1p1U;
	Thu, 28 May 2026 08:46:20 +0000 (GMT)
Received: from AMDN5751 (unknown [106.210.134.141]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260528084620eusmtip158031719a5ee8ffa2ec70f2df3e3bb3c~zrlpDenNy3061430614eusmtip1_;
	Thu, 28 May 2026 08:46:20 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Chanwoo
 Choi'" <cw00.choi@samsung.com>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	"'Stephen Boyd'" <sboyd@kernel.org>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Brian Masney'" <bmasney@redhat.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
Subject: RE: [PATCH] MAINTAINERS: add myself as a co-maintainer for Samsung
 SoC clock drivers
Date: Thu, 28 May 2026 10:46:20 +0200
Message-ID: <001a01dcee7e$75221490$5f663db0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMRLRiS7x6EsXGdyHJNlMCP943byQGZPUDss63YNJA=
Content-Language: pl
X-CMS-MailID: 20260528084620eucas1p178159f6b7f3eed6806a848db6587a9f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260527205405eucas1p15ef3a9c4021f760ababa4bfdde18251f
X-EPHeader: CA
X-CMS-RootMailID: 20260527205405eucas1p15ef3a9c4021f760ababa4bfdde18251f
References: <CGME20260527205405eucas1p15ef3a9c4021f760ababa4bfdde18251f@eucas1p1.samsung.com>
	<20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>

> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>

> Subject: [PATCH] MAINTAINERS: add myself as a co-maintainer for Samsung
> SoC clock drivers
> 
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung SoC clock drivers and have an interest in helping
> maintain this code in the kernel.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> This follows discussions with Krzysztof about expanding the Samsung SoC
> maintenance team in the kernel.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

