Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5728C191F8E;
	Sun,  8 Dec 2024 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733677416; cv=none; b=HLEOtIXHpzy6S9zwUoGdAf6sJHA8mtk6pCvr99qx+uw/2tK17Mtz6QTqargUQ7VLivEPI47emoU1K/gf5DF4w0MAd35iFvOiCP4DlM8Yaug2fhgYvKnwwiCCV6VVZyS10ZjBvUODWGgdo5EYZ2nXYO1cX5Ujrbq4+7KRnc474tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733677416; c=relaxed/simple;
	bh=OjcAvwB2AK9aiYDMht3s2YvA/tWmdDIQS+AqF6PppMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I69ST4oDn2cxbm7J3Do9DCBVAsNWfgehbvQBgXbaVwMcKrIi7JaCsWFnpqBrx1zj9GWWznBnu8+oATixDqBeWPOI7SQBNeJqgRVnrrtb+modXfnm07rAivqxaVTN1b823+rDVIcRbnA3w4tYhxS37n2osQJxgZEmToRiaB7Oyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7L43cy7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7L43cy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4247CC4CEDD;
	Sun,  8 Dec 2024 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677416;
	bh=OjcAvwB2AK9aiYDMht3s2YvA/tWmdDIQS+AqF6PppMk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D7L43cy7tkH0KdAvN/EPahuuY5iAJ04EP85dKfeMN/DrSxJYzSy42DI8XMMwI+vOu
	 8j01hnxuCeJH9KxOQiIkCmKTxyKd5zsqj5M0Dj2FCRbCRPdad9EfZjNPhmjv6hBXCi
	 yntWkfMrByjJO/O7+ovF1L855z5fk8PXsML6CLzpVFPlWvjSWoicTRrqZWrL3t9oLA
	 kIjGlJ2PsZfVCnUB87CbNkbEdS9wWf034+QcWElpOwqGbfibbW5zv48jBLS39Ah4aC
	 yvzrxSXsOGiJ/ICdij94RXFWetBy+BTIePWSpJM1wnMRkjC/xaRBCHZB80fhuqtdBC
	 wATiMitUlCzPQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, krzysztof.kozlowski@linaro.org, 
 alim.akhtar@samsung.com, Peter Griffin <peter.griffin@linaro.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 kernel-team@android.com, willmcvicker@google.com, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20241029192107.2344279-1-peter.griffin@linaro.org>
References: <20241029192107.2344279-1-peter.griffin@linaro.org>
Subject: Re: [PATCH] phy: samsung-ufs: switch back to
 syscon_regmap_lookup_by_phandle()
Message-Id: <173367741186.1042266.15067476399278032405.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:33:31 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 29 Oct 2024 19:21:07 +0000, Peter Griffin wrote:
> Now exynos-pmu can register its custom regmap for gs101 via
> of_syscon_register_regmap() we can switch back to the standard
> syscon_regmap_lookup_by_phandle() api for obtaining the regmap.
> 
> Additionally add a Kconfig dependency for MFD_SYSCON.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: samsung-ufs: switch back to syscon_regmap_lookup_by_phandle()
      commit: 0d9fff6c57fee5cccba414a0c40d75812121bdd8

Best regards,
-- 
~Vinod


