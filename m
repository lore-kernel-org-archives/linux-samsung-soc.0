Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B991425A645;
	Wed, 12 Aug 2026 06:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514788; cv=none; b=BulEhbBk+3OoDO2vIgWn9r71yq8lwFWGNJ85g7sdpU3MpyMHEol8xaIo2eQthddIwD0E2Yw6QGiS8RGGfKLDGCPydLeHuGgkya/7L+aTYEBlZbI01sDkJHfayqbQVDP4YNuJBb1uKk8vFIZ0D0avQPsajtw4c5G6dbFsCVfnAMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514788; c=relaxed/simple;
	bh=2et1wKanz40dbw3hVXk5rV+vq60nF7quTXDWPfYyDBQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=eFjHbtv1T+tZloRuFKJmuww+Whx40XlJ/RlupT/+DGpx2MbLkOwiOte9bhNlB1toR5WBqNuWt0y1dsoJJruyyi+e1a9CP/qJ+jfXlRWATWrP+9eYmJzlzT7K4egWIVx4SHX0UXZnk2U+314oRXljca5G5ArYYvrVdPFv46dtAfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rc5RsEcS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rc5RsEcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C9B1F00A3A;
	Wed, 12 Aug 2026 06:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786514787;
	bh=kCvlCH6G6hLi7/+gEcb5Pr8BYZkvcHnMDP/PheZZ+p8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Rc5RsEcS+HSaDGPeWT2EOmCf5uMhb0+Gw5gtGTo9ulVSoqWSoIcyZLXoKtVMAzgXd
	 OdfQPfsPJnqQRyde20g+7gnC1MSLqErxayupPWJkmXGxUweJrgEEib34VuE0offnIB
	 YMT2mTjj4lTyI9Ju9O7bKuaWyg9see5+X6wksX4ssVf5KsbG0kN27/cBd8bA52li1U
	 L2KWzeddKJYeoCERHZuUMft+xBtFmTNXwfDltnMtKRFZ1zuyp+bNA70mO1uEmFIgU0
	 oOcfhT3mHJEcKi9DcjJ/PNmjr+jVZQeL0KUL9oTTBDTBuYdRUxcI2cwfFqr052Utpi
	 JW6FX/UaAwhnA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260806082130.165665-2-krzk@kernel.org>
References: <20260806082130.165665-2-krzk@kernel.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 11 Aug 2026 23:06:25 -0700
Message-ID: <178651478560.5862.9382305183926307170@lazor>
User-Agent: alot/0.12

Quoting Krzysztof Kozlowski (2026-08-06 01:21:30)
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-7.3
>=20
> for you to fetch changes up to 6d32ae6403694035896cbf0436088fca4c6a35f1:
>=20
>   clk: samsung: pll: use kzalloc_flex (2026-07-18 18:21:13 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
