Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BF92FFDEA;
	Mon, 27 Apr 2026 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300775; cv=none; b=o6TEYFJTDRGDMsimB1NivBV2Y7Ewj87eloK7PRUyiwl1LsuhDfKT4Dl49fIcMmdQgri6K8bfKFcEFKNmm3WPPfMm3Z+K0Ucg6c7i3vby09I6d/zwFFmz/iifcVx8eQ+4OUMJwLSSaRvDYexm1S6XBzNIfvU5okOyiO09ZJQoeh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300775; c=relaxed/simple;
	bh=5o8Vn0VfKa9iHTmdV9NEJbe00uDoTtZ9qzMRpAPOvXc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qIToOpd5t1x1i7Jwlk1VadVxiDCKcAdxO1LOOJsdNjAZaQPQpPjnBKXlfLLNQpL+lOItKDy2XeKGAjeBvU0gDKKVM5sJu6KSZooLooeUleHCX7kOrCeZ9gnCObH42QljQcjf1PVPV5zWUYhzaiIUMhS2O8DbzsbOHdi1gyuL8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=xyUJI61o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ey8oL7D1; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="xyUJI61o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ey8oL7D1"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 0BC2AEC0509;
	Mon, 27 Apr 2026 10:39:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 10:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777300773;
	 x=1777387173; bh=+dJ5ddWA2Hk2Ekn5t9qHr4ZYbm1sDBGcyRCd9iQq3Do=; b=
	xyUJI61otV5UMkHvraD2sJXyoI25W8uXq5H0DVZGrgseGXWeyNVF4LifZUnrptGW
	RSLsZO0Yl/+FNndVNOapHKBRHLxd5jc1WlMY3YZGvyoZXAkXs0HT3oEWExB+6BEE
	yqjhaor2zLJSeB0VyYb2qyKHjsvm/TTTVi63aiHOMcsltDxhIxP+Brr4fG2M+Zwx
	Fe1NSlNNBjijGbZ7BmkI70HfWzoDfBl7j/iaR0W81emKoqgUUn5XrAGRSkjVa9L+
	ufpzcPzUWHonZY9nZD5nQYu43fTL6OlRekPXU3Ac9wgD7gWqnVcjBvQK6Q2PnBor
	71XfUd7d5NVSgHTkvKGQqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777300773; x=
	1777387173; bh=+dJ5ddWA2Hk2Ekn5t9qHr4ZYbm1sDBGcyRCd9iQq3Do=; b=e
	y8oL7D1a1t53eit4GXvhsDy3TPt5MPi4B/lXDJXwPefN30f99Y+i2VcmLovilI4G
	/a8P/or5Rv27Rq9mZ2FYKRUD1D4IHAOX1L++vPi3SJPjG8R/2MYUimD5DDPhxKbs
	gmolHIhOCiBg2h89Ro4xB9jxXRD4qe6tMZXNhd22V96/dOh0mxnzxanvtTZXDeHv
	yfwqBA/VxgHicCtshP8dnEI1Bw/VhAf0b3stdilI3IbTmydx5IivQMIdXkRH3WhE
	HbBaQdzZ6xuUbAn5yELeHKaVJVhi5a3Z3iyVz5LFhL7tp5Epo6ERGmJSzHvom6HC
	n+vyEUMnH7WRx7gNrFRIA==
X-ME-Sender: <xms:JHXvaTJfali91FjGgiTlqV3MlpAalfmddC7lf-IOCjWlTqZbEZGy2w>
    <xme:JHXvaR9IeDB1EsxCKvgnPZAATjrcHwSZWrf2ZyAaHt9AbWGVg2Drn1iCE1CfFD6FB
    xfE-XCx_pYbAdbNaeaTW9I9238EPScKtn1rt0YvVUQVLf0AFcED1rVr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejkeelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhglh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtoheptghkvggvphgrgiesohhpvghnshhouhhrtggvrdgtihhrrhhushdrtghomh
    dprhgtphhtthhopehprghttghhvghssehophgvnhhsohhurhgtvgdrtghirhhruhhsrdgt
    ohhmpdhrtghpthhtoheprghlihhmrdgrkhhhthgrrhesshgrmhhsuhhnghdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JHXvaUvSe6A_Ax0B_UbU5WGZicEJ-6BDsJ5dToCOMNI_x5d612TJiA>
    <xmx:JHXvadW-sHFz6yxPuiPhXXuony25Wy_cABk8tqyjS2rsDCHXxKVjHA>
    <xmx:JHXvacy526Xdrdel3YxejNJR1b0wIbBPnOtbeq4dLEf_1lJ8dZBW-g>
    <xmx:JHXvacHOvPQPjaQ5JZHyW-cWG5JZjIn6giBCHRAlWlowsPtU5o73kQ>
    <xmx:JXXvaf2ZmdfpIKl3Zo7G4FirjuAxmKswKpDHzdYve6M44Vh1GryYpwsd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A3C5700065; Mon, 27 Apr 2026 10:39:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ajj86gnT9gH3
Date: Mon, 27 Apr 2026 16:38:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>, patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <1441dc76-764b-4490-8d7a-85dc3b01edac@app.fastmail.com>
In-Reply-To: <20260427143546.3098519-1-arnd@kernel.org>
References: <20260427143546.3098519-1-arnd@kernel.org>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 27, 2026, at 16:35, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sorry, I accidentally sent this without a changelog text, this should
have contained

"The crag6410 board is one of the last users of the gpio-led driver
with plain gpio numbers. The driver has several ways to pass this
information without using gpio numbers, using a lookup table is
the easiest way."

      Arnd
