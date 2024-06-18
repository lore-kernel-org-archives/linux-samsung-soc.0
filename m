Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAC8155736;
	Tue, 18 Jun 2024 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721816; cv=none; b=kDyD/wBJ0tbpmFbOfaWh+YQFh1kifus+HKYzyYB275XxLvzX0+/oGrwhpftS2FyT9gEzrj5hoG+17cs8WjFrfg0C+IRR6kx+5U9EsXYAlfZ2WurylXd4CAl3lkw9kkPNsYzAeUrNY2kl2DbsSHusP3HBhYD7Ry+ZUTVxtARDOSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721816; c=relaxed/simple;
	bh=jhtdxxiKcQtU8NOMbWdD78vYivZuvtKtjslQPk3fePs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Z51FS5WKHgbP/ZM/CP4xKKz5GIszBuz5/V7AD1T8kxOat1MD/+QCdhkdLEuL4LbNMCGRrWcTOCnPrHcXZsWp+eHi15BUIkD6LNQiLjTLg5VKN9QmVfY3+i6wgomYlvjOW/Y2H9k65r6ZUQskcDwOkitsD5eh3G8YjxQn+QF5i7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=OZGT7TAl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=adUJu2+m; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="OZGT7TAl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="adUJu2+m"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id D0C61180009D;
	Tue, 18 Jun 2024 10:43:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 18 Jun 2024 10:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718721812; x=1718808212; bh=jhtdxxiKcQ
	tU8NOMbWdD78vYivZuvtKtjslQPk3fePs=; b=OZGT7TAlONIb/zQP5k+AwuGJ8n
	VL9QkJkmGv5PM2ABgZXjlfWKtNlt72OoRtplQsOTGmRROA/5ix4Y8dGpQBrVYpaA
	Wd+HWhtZFl1KW8Uy77JFzWLwIdRbiBBZqCAmnEjiZtZcTYO4+aH0jMM3QYzpDOnE
	g509yL/4Un/TorQArgfO59BPpcJuhxDTKIgMyjdpeoyBgeYgJKvoeyfQDmPeOLke
	DyIKEW2xCfO/I4J7MYjUx5OL4w2biuCQupkKwLi3cdPYzLRLy+Gg1+Iw0OmnRjHc
	LqASTSQso/w2LAh6THAS9Z2a9uxpM+95GwWvh+9YYkbz0uff8Zp6wUaBqHuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1718721812; x=1718808212; bh=jhtdxxiKcQtU8NOMbWdD78vYivZu
	vtKtjslQPk3fePs=; b=adUJu2+mAf1d/pEttH9wSL4fuSdsPWfeVwtQmejQWD2I
	rEXBBT4fTYdTpKPrlbSj7Mv/786jpoXlEBmLpKeiHRfyootu+EOozVfftRZun5Ey
	2PTYp3NKFk3OwQ3r0AHBJPMCWLfc3xPuiUvAWX3tJT25phb/sSVwt1r2BMYNEFGI
	Q4+bI+OQMlubzS2tDRDMNGiD70Q9msEfmRdOnlGka3C16R5UY5b0kLxeQT4yGVQb
	mDaUl0QfLa0tmRrM8d+lV3/3Cw/dajS/rjl2WJQ8/FjIQTQnNBtasgDeWUURIdpu
	4109758U79+l/G7QAXmYygkNZncNDQjLLkaNGw5OwA==
X-ME-Sender: <xms:FJ1xZsZmV_dakUtxJD53WUwSKhyzW4L3HmLr8OuQZ0AewLrndJQ4RA>
    <xme:FJ1xZnbCCpEUibEW9plmF8M7CEaak4r42ZK2mJYwFbuhF9N3Qt0pouh7wSUiseiPp
    pC5ZxQRntsolv66Fxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FJ1xZm8oc_zVeZeV6bbhkjRRuzQ3ytXzOtrp3t0B_v1S6UZ0vTjC_w>
    <xmx:FJ1xZmpdk8D5H6_WcHXGen5CbnziQWtw9tBeWUzPn_jWAPYfxQfYNQ>
    <xmx:FJ1xZnrGp6pAXlLRggtrsNvovP8rPIbAvd6GsCCv3DIYjHFIKB15MA>
    <xmx:FJ1xZkS6H6v15-8t8Wt9HVqIGBaK3GJXOax73AW4-wMdCr0GTZifuQ>
    <xmx:FJ1xZlgLTJmSn0qezCyBceEzGkwA__0c9Rny1_trfpMao9noE7zgEbOp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F4168B60093; Tue, 18 Jun 2024 10:43:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <345206ea-512c-4781-b7c1-b53ef0da5f34@app.fastmail.com>
In-Reply-To: <20240614140421.3172674-3-peter.griffin@linaro.org>
References: <20240614140421.3172674-1-peter.griffin@linaro.org>
 <20240614140421.3172674-3-peter.griffin@linaro.org>
Date: Tue, 18 Jun 2024 16:43:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Lee Jones" <lee@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Saravana Kannan" <saravanak@google.com>,
 "William McVicker" <willmcvicker@google.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>, kernel-team@android.com
Subject: Re: [PATCH 2/2] soc: samsung: exynos-pmu: update to use
 of_syscon_register_regmap()
Content-Type: text/plain

On Fri, Jun 14, 2024, at 16:04, Peter Griffin wrote:
> For SoCs like gs101 that need a special regmap, register this with
> of_syscon_register_regmap api, so it can be returned by
> syscon_regmap_lookup_by_phandle() and friends.
>
> For SoCs that don't require a custom regmap, revert back to syscon
> creating the mmio regmap rather than duplicating the logic here.
>
> exynos_get_pmu_regmap_by_phandle() api is also updated to retrieve
> the regmap via syscon. The exynos_get_pmu_regmap_by_phandle() api
> is kept around until fw_devlink support for syscon property is added
> for the pinctrl-samsung driver that also runs at postcore_initcall
> level.
>
> All other exynos client drivers can revert back to
> syscon_regmap_lookup_by_phandle().
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
