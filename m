Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5293EC83D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Aug 2026 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974403; cv=none; b=P2inU/9qyZjfZhegrz5SxtAyXsrOuVYPTW9Hm8SzszpARDsdRNENqKyrNGw34pJZsLCB2RMHckGr715S2yRUaUimKXq3jd5iatP6eTAqv1gYJtZg0XaRmzN3FPLxRCthOc6BqXgyvufjsY4FXaBVYcLgheHsMeNoLE1gXsJB2ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974403; c=relaxed/simple;
	bh=dhQKIZ+H8few0+TK0/wNTVTWNopXKBqleCxNSBB+9sc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHRmmSF6dwhailfzMFBz6fx3NfGl/Co3+XiElEaLYrHCJW+O7WiBItPxQTc4L/xSAWq0iKPwIBqcAerfYTlAJ3XnSKAjL+McIqPW756VH/361c7Idx0fSTNmlY3TULTEXlSE4SeSQVSXoIbdtEZFsjTo0twDGo+8IXwjHWhDU+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=zPBEohj6; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="zPBEohj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786974394; x=1787233594;
	bh=dhQKIZ+H8few0+TK0/wNTVTWNopXKBqleCxNSBB+9sc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=zPBEohj69XfdFScDD4KzdUMn1gIE5UzKzoqVxw8Q7RVeQF3G/KwhhPOtjPvlGmzgv
	 VLdpqjTWqctBwG6eJAVgKXp5jCma+QomA/UxzcS1vWMmLegDIU42npALzaEiHv3F06
	 R/OY9idad/n642d+tn5FlHCeegduIc+s80SR0xcsW9rsv94UEyTguh8wZHGz4pyeRD
	 TQgG+cX3RlCWlAld8a/Bl+jrnpjK4nOa2hW401fB3YdqgU/7dwLpXyhakgy/84ftyx
	 WptZbSgcEDOVDaCk6U1K7MaIZ63xBQW07vdLieLYgjUTnCoViDI4ceibdqzjuOe74x
	 c2/fERwMWfqVQ==
Date: Mon, 17 Aug 2026 13:46:10 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
Subject: Re: [PATCH 0/2] Hi there,
Message-ID: <SPrg6EUkZ-PCiypsZLk9LApr47E57LZWtI7X7sb9gutvVZNN8OoPLGPDddUpntWMxqmj3gwaxMLB0-laSpWjUouqThibUbg65waiKOc3aF8=@protonmail.com>
In-Reply-To: <9e0c8579-fc12-403b-8df5-9cfe0a779fd2@kernel.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org> <9e0c8579-fc12-403b-8df5-9cfe0a779fd2@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 74031ad895b61a08c1d1512d8e87aac5c2b45b7f
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> > This patchset adds initial support for the Exynos 5515 SoC, along with

> You already sent a thread called "Hi there,". One is enough. Please name
> cover letters correctly, so it won't get messed in our mailboxes.

Sorry about that. First time using b4 and a mailing list for patch
submissions, and I failed to notice the missing subject.
Will fix in v2 as I have issues Sashiko picked up to fix anyways.

> Best regards,
> Krzysztof

Kind regards,
- Aiden Isik

