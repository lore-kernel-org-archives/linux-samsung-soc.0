Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C5B383C84
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958039; cv=none; b=keUPJzM0ifQhQPUDnlhSIpSrZ+iChXGQgEOhmZQzMXydYo3BLn45fV78Z2S/HcvJi7BbTP0x+pgfG2J7x966EC9NuC/54yaH0D9lOnTVs+JtHsFqVqmwL8Ep9FyqbAEeHGYtWfS6ptlzFtInhrD0pkpNT87zGO5bnWEgK1HUlKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958039; c=relaxed/simple;
	bh=XsjnXd2LhmM50WR6xaUdTRMhEQ5lDRCHpmh2LyoJ7Mw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=SPt3OpXW5B7aA39iJg31tYlmsZlK/TT8Nmyg9Q6UHlV0jse+nzQe2JmZ8UiMNiorqJY6uDDw9MHkvGCdFtMak2oB8bDUwxKgMmiI+s1FqRCR/WoLFCrkKCNec3QryKXfjr57rMcxzFfwoYSk7rEJGe1fO0slnGwfVIc/dgK8wUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lXk7I5Q0; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lXk7I5Q0"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260528084713euoutp02918c35abd7e6dae9d2e1ad28586aa47d~zrmats5Vt0468404684euoutp02a
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 08:47:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260528084713euoutp02918c35abd7e6dae9d2e1ad28586aa47d~zrmats5Vt0468404684euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779958033;
	bh=NiUIzz2J4mK7mbZjU50iRpjfnP1Bj6jF4LC/ZLFwGZk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lXk7I5Q0jQmOD+6ZQRsJIigr0AAzUwJloV41D4rzZWnq69/Ps4zCX/SQNbVip9WNC
	 dchsF/l3HfBFtas0kw/r1g6tUNqdn0P1NZqoj1EkM76DB4xp8QUKEMHJTGZeaZB5Mt
	 z1yivN1LA4R0opi2WSs89Bv0Y67DwM9UOOKZBvg0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260528084713eucas1p27b7c9bec1fd4c966be3666c74b4227b1~zrmafLrN62545125451eucas1p2g;
	Thu, 28 May 2026 08:47:13 +0000 (GMT)
Received: from AMDN5751 (unknown [106.210.134.141]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260528084713eusmtip2e222380135653e043b49419fbba35dde~zrmaDLlLt2118521185eusmtip2J;
	Thu, 28 May 2026 08:47:13 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Linus Walleij'"
	<linusw@kernel.org>, "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>
In-Reply-To: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
Subject: RE: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
Date: Thu, 28 May 2026 10:47:13 +0200
Message-ID: <001f01dcee7e$94730c50$bd5924f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHUkhLpbWZfxeh6MF+vd143+1Jt/wKaMwmyth8HM7A=
Content-Language: pl
X-CMS-MailID: 20260528084713eucas1p27b7c9bec1fd4c966be3666c74b4227b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47
X-EPHeader: CA
X-CMS-RootMailID: 20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47
References: <CGME20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47@eucas1p1.samsung.com>
	<20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>

> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>

> Subject: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
> pinctrl drivers
> 
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung pinctrl drivers and have an interest in helping
> maintain this code.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> This follows discussions with Krzysztof about expanding the Samsung SoC
> maintenance team in the kernel.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

