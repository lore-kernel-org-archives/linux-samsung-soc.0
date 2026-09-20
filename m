Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C6390999;
	Sun, 20 Sep 2026 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924145; cv=none; b=S+i0/nq0nLU321dYouF7q5uMIeli4W2MvzIOUQvMX7oPRMAxeqOMPcrlwMvcFodTQq1hGEa94W0lA3tiTrpggkNUW2XSCxLp2wXqk2jarj9c3ox6kDiXkE040j/HnTXZ9GLi4iUi/RzUr/5PeHo+nEnZGaqBCkvsxNTaYap8WcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924145; c=relaxed/simple;
	bh=Z3uEuNBmQKwma9vxWujWTL5worfS8Jbi0ubAliPHrME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=szpG3gMNOxbpIvwmICzoq4bRhtBaXBsbVRz4K4dGh1EofJY6FQZ6lCwQim7WdXV9YwJFmepjko/N+nU5taBURfPC/tM4NvPOCnQQ9vjrg6mNxXNUpeQRGlytuw10NwJjBEF9p6zwnhysiYXA49uhpMm81tx5HRSjSk7ItGKcxkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTt+FY3X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTt+FY3X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570571F00893;
	Sun, 20 Sep 2026 17:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924144;
	bh=HCdz1wdJC9OT+zficoFF7wL3rJKkBYpCcd00vySQmSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WTt+FY3X0e3VfK5ZIxtZsFFwfHPXo+Q2G1REdEZuOMqR7YR7YExSSjvGtVrd8KfWk
	 KUi10bPASdWNkO2100raKxwhToUCDf0j0g1SE/4B9z+BLQXmK2QohjinjJpKu3IdQx
	 dDZj0QFRutamod5aohNmg4mBcE7biYaqDmBiIoeXm35Q586Fxo43cLQ/AehjiHQsrc
	 XY7EXp60EqzUYHMYe7BqMUzEvR+C/lQXAX5kpFw1ZzJHi5g1s6KDIV80WI2e9EI3SB
	 qx0emCe+hKGINnF3ejUzsnmZ9/ONOZQ9S52XFB2B/koRwLQW4jIG74enb0GItgxcbK
	 sQTYXlFWZgcOw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
Date: Sun, 20 Sep 2026 19:08:52 +0200
Message-ID: <178992412363.36366.4345126158825411848.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=krzk@kernel.org; h=from:subject:message-id; bh=wOpdMdU3DF1mK2QyVbqdQ3Xb/N3uH3K53tS2Mz8dBc8=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqsBMl/GgAuARyHXtA4+qfMaSKoMGlGdUJEAnYa WJZ1S4bpiyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCarATJQAKCRDBN2bmhouD 112OD/9YYnniZyiMj2BLPJQLkMeB32hp+SuhzEWi3EgUOz4TMHKCgT6wxKoKeGH3AdQKC4AupLa iiKC1CWoHH5bk7ZVEsH7dabLaEfEqtF1+tLrQhDLKC5OtdyUcwKh9e4IfkwrcvoPg2HgLig4e8a qRmMbNH0OgU9VhIFAYSA54a1Ud0Vrg+jXdfNOpH+j89jWNKeNnUBNlflMcBI0UYPhLuSGlpnugy Xu2W1iI+X7V6xQ66h6monxJT1BnzOxaMX0ln0BYnNqzweGaIQrlmcn6pt4T/xDl21hoGkelh8JO P01qpdb3WcUXwXXqhgw4FP2sgpldWPZT25/Msvou2Qb8ez0iNgPvQvTeXdSHxt19a6FxkkIa7gE ktRA8o522xaDWA+BGTEA95yq43I+kLnRpn47u4+ysFwlPz+jYZv2cfT5IogJJA2m6WamVa0nrm2 04jdcLgn6vWQcIF/V/AZrp+2wMHVAK8wRhQ5OPk05xt8KD+iMvkhzuhibYGSLHppbG/8RAaZcih 7/QBdFxPJ91r2IuklYoNXWs2GLpCH45cCGDR1q4CiscdMb0usScYUnR0sasYF8l9OiJrMHqsnnw t6xyHgp9BHoXFVHEQo3YJKIofD3Aiv8SxQdfmqpncfvs0m/jbZPt+dPF9VOoxbYRv9/vGM7uMPi xOb5FC7SDzqNr+
 A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 17:58:44 +0100, Alexey Klimov wrote:
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
> for ACPM communication on Samsung-based SoCs.
> 
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required, that is why "mmio-sram"
> compatible can't be used for ACPM purposes because it requires child nodes
> to be declared, which are not needed and make no sense in case of ACPM.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
      https://git.kernel.org/krzk/linux/c/ca4fb89e677527e32d16c5eb779eb34bccd2b967

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
