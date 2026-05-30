Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD73090F4;
	Sat, 30 May 2026 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780158891; cv=none; b=fMmIk8jbznZSYoaNqx9hkfW3KuR8SvO6jxzdI3QLjTvxmXot/US8cUcYDsJT+gr2SrubUCfV4Q0n1ME6dtPBZodLOEb5mEMZty+qt+kPC0sTCN0uTe5MdcWvuK0djc4dNwSNgvGwgXuSJAZxkDuPn82ngUQyqAbhnIyjzY8FA8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780158891; c=relaxed/simple;
	bh=etEL7Jq5EOfsSv+NrMtHQHU7RbGfKHV1R0hpQyd+EhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNBee/eUg5Re3IT/MCOGD5O/OscZGCRvS82DDxccsNofybjmiaXahV0dfloHeCdg4vg63hRf+G0HP/FXfPP1aQGwZbdiOdw0n5zQGbJB43LT4GNwwGNhE/lR9FS6qofWC7FfouVpo1MMhsn+Cr0nPgREtqVKgYD2Xu3qBg4EYfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AabGH03I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AabGH03I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B412D1F00893;
	Sat, 30 May 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780158889;
	bh=5L96VtSiC03dq1BdD8urFU7CrXJuq+FaNhs8xSL+/hU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AabGH03Ii1Tnyilz+KBLrISe+TT+FT2ZOIcPdlrAaK2mI8YuyNhyRUPo/rXwutOOP
	 zI94tvdDUSrPgRIYSlJ82xrswt6s7vNqKiF6h4wCtdPpdK6/J0F5ct1gQ21bI4/tvz
	 Y5UbSAoe9sO1flU+uyUMgUvO2+UZoXagk3eN1sb40qqc3PYfzQjYY93aBo/En8YVBI
	 BAngxXbGv9t805xtZ+BU7pMwGHPO+x0oIIOb5rG6u8JEAJ2PvkQiZ1mbCC1FmhNvTT
	 lLSl9/1aZi8SYKg5QeDVSHqVEWQZkPdh9J3KTuTdyk+oHHo/Gx/mp8EI6NVT1cPRcc
	 Y7pfQm8fcQ5nw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as a co-maintainer for Samsung SoC clock drivers
Date: Sat, 30 May 2026 18:34:39 +0200
Message-ID: <178015858045.36212.17396395017417877709.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
References: <20260527-samsung-clk-maintainer-v1-1-97b179224ca5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=505; i=krzk@kernel.org; h=from:subject:message-id; bh=yrpEQcYWGN8YA/WJWhQDt4erz2YnL0GxkJ/6OVEoh5k=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqGxGfdiGuWFX4jnt5lscUQeZustM3U9n3qHhQF 4O+78xuyx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCahsRnwAKCRDBN2bmhouD 15wrEACXpjts0e6PvbbLkQm5J6Q+NPuBb4qEIXMNX0mDwUfu4b1VEfECOeyzzi2EUSANSoYNcxq B3laKWbRjqsSrWokFeSSugjc487oTo0DviZWkrPG9dsRjD9c7OsvPDr5oJhO/QBlCB6CwHPnjdo 5j4/6Y5A6HY7HTImQZrEUta7IBUmlh+8uSAeDq165WUBOyHJ0/UtFZ9b/W6QRTs1qhkmgk77VwT MU8q9Y8zup6uBJUiFNNsDEnZ/g9Rl4IA9Q2F9LEM7e9onnkJY5pYSCrm2GW03eReGLmQfz1k3aj h0tPANaXb4dTVW4sm7KIwVHzRxM90D8mQxnCQV0ZArGvQj0enW+zXOESMF2iNMEabcXtOkr3PuX Zuwp/xkiyrEyY7M3VnxPfvaNOxcJxNRZJIT2NJqJ46qmxbF5TiZKNSxgm8fvlN92/Fjf2WIZsOj V+/CZjspAK5+Qt+IuYwT4dWhC+atXKuVSJdSEpOZUVRyPe0rAFZhx40IlBcZHA6c6rImkgcx4Z6 tAy3pmBEm4b/sIfjsZilvBzeagNgnVklU29pB9v3Ig6TvN6DdNDDmhvWYxcJLPv3qRzWSfXPP3n QfJENpNNJaY2Pk+BH36LJICNyBxEZ0K8prEn7/aixInFHPhCfQlPYhs3asblA8cOQFAaqzRxpk8 49lsVClAOnwUBy
 w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Wed, 27 May 2026 21:53:52 +0100, Peter Griffin wrote:
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung SoC clock drivers and have an interest in helping
> maintain this code in the kernel.

Squashed

Applied, thanks!


[1/1] MAINTAINERS: add myself as a co-maintainer for Samsung SoC clock drivers
      https://git.kernel.org/krzk/linux/c/20550601bf4c23effa013a5f37e5250618869e87

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
