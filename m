Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCDA46EF9E;
	Sun, 20 Sep 2026 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924142; cv=none; b=PzJc+5j8fVBVxV0x5hEc6oaWCLNzyeo2FcWgivCYY60uhCRCbvWFeeuc4qcSOqYk5CrleMi9hni0UeKsthep6HJq/yVxVf0ExcJyOaeVdpBjSQJI857ywQ4e0C1FO49PsRE6QLwgd0P5R7g4Pl449uVDDtHx52SudBi92WHbNRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924142; c=relaxed/simple;
	bh=Cz8aAEHCET7PDGGZmUWTpZ615Ysgq5x24VBlftyT804=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yj9ikXysrAV2dRh16uMZSV6wGPSBM6KeyvTIWUdlw8KyAaY/PdKDSmfBcD5gY+S0F5dy2d64pm/Y+jqdZeID4NGWYaOcdWK8baboYXly3HY2kikYQYBrHpuPMktG8E3ou0139dC0ZHmtgeLnWBTrxcFLfPmcn5fzvlLbIISUPco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fn6OROla; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fn6OROla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D291F000FF;
	Sun, 20 Sep 2026 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924140;
	bh=G0AIexTylDQKGyj0LYzgTbOpm1KgvzAAkXzvOx31f2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fn6OROla21N5vjU8yxB0ipK+L2QWLIs+pLIPLYjCgzSWZcnru7Ced/fczNV7D/yfM
	 ntMcDxlhN23If1SiIAUFvoUa6H2YCoK33Q8VXDpUgFZwD7CaBtv+gJVGePod51Tu5O
	 g1xboPxdzICBnC3n7AjHu5pBqOprJtyT6vxmMY71Z8j/IxRIQXB84t7M9t2S/1Z+pa
	 DkC8LMDCoFVrie9BJA86PWHj6Msnyx2OBohJ4CffuiyOmEJ2sc1n/vMY7c+NJQ62G9
	 /0xWHvbmM+CyrOvBOLA5R0PBqU7EZlI38sv0OKNVr4fdiYXoL5cXEpZw4MjAs2vcL4
	 8ypTpYg2EwvNg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Initial support for Exynos850 SoC in ACPM clk driver
Date: Sun, 20 Sep 2026 19:08:51 +0200
Message-ID: <178992412361.36366.5238549762792308688.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
References: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=krzk@kernel.org; h=from:subject:message-id; bh=7wplxD/oR2Nq2GI6TJ66Ky2oI7HWOdnf/PCgl2pYFVU=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqsBMkGN/1aHzqtAW7baGS4zy9XIqjJ5RNw4WEP hLIY3IhFoOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCarATJAAKCRDBN2bmhouD 18RTEACCH5yxwdL9EGbg/5CYuO1NCNu4dDHyK42Gz0UpK2qh/KOiwbgMm3u0rj60fAvFizsDMga ntr0bAtKphpEG6Yjue2+5Zga+eq8aqAEVEr1u6RxwRA6YsG7b9PJz5fuCWNeiSaMdxR6lCf0g2C NkrOOpgrVnrx7cG6NuzuJuKIGXRw4UkvbQeWfJ3/1HAx/8M39a+7r1Po0xAqM24Y8UApbCcq0Kt B/Sh8Nt/Ph9RWlpGS2JnfilHfrx1q49ybout397QMeyRQiqrXw4Tvk392L4ShhT6FjuWJYWG2uz VUWrL7SneWNrvzAZQI60T7CNFdMUezGlfpML7K+EmPgQsJITMZxAx3U8AacCOtj0AXbMiya4UKO uVuhRaPp6go2LRiJy+mbwEUxTrPWHE22XwNMQvMxWyuMXJgMMfXrrcmcKconZKS2pqMpZtwrEYK a9Do2lfb3/+9ZWuZwuLQJKfAGkhiwAUXse8uY8uNVupqTvWWn6O638cw8IgruW1TVzAfbKPivub ynKk5G1cuMLjiqllOc7AtKAyJHTnNdl2IjRACBxSa4gLzKNiEXVdCZCmOfzaSeqLLDkRRomgh7f Qzi3HTb/cqEnRB/bV71QkVkpWYwkHfqvRpjr0v+BbSm/yYxujN4GZChVsAkcBR3//5SaKxlxpM3 Gwv9GEzqSopgwL
 w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Tue, 15 Sep 2026 00:05:42 +0100, Alexey Klimov wrote:
> This series adds support for the Exynos850 SoC to the Samsung ACPM clock
> driver.
> 
> Currently, the driver hardcodes the GS101 clock variants directly within
> its probe() routine. To cleanly support Exynos850 (and potentially other
> SoCs that utilize the ACPM protocol in future), this series first
> refactors the driver a little bit to be SoC-agnostic, and then wires up
> the new Exynos850 data.
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: acpm: introduce driver data for SoC-specific clocks
      https://git.kernel.org/krzk/linux/c/802a1a97c41dff82a557223f7a43655fc02920bd
[2/2] clk: samsung: acpm: add Exynos850 support
      https://git.kernel.org/krzk/linux/c/13634cde9771811488847ef76cd64a785599fdb5

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
