Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18243218A7;
	Tue, 16 Sep 2025 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031426; cv=none; b=dsl9lRpjaORz9E8LefRjffkzlBf53lYjSkQdAX1mWKJ1li1FBIpAocU8LnTlVWEVHQPdHqgBlOn9RPB8iBiSbZilvzn7lNvK2GpnRqTIi5tDopS4VQ2zQOtIKcRD2qqUPyONevuY1iCktdhz2qoLJ8y7bh621CYpGXh8Koz7lBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031426; c=relaxed/simple;
	bh=mOMVb4ceSql7gWrPmpuG+PWsLpqwNKJpa/AwZtcyHEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dwYZoLOVarLH7tuKvpJIEaRTWWUFPZKIzQTzBzpg3ndE8Q9AMBr9TCLHCt2RvmWPpddagfSQpwLRl3dM7H9yxafriy4R5P0hY+b1taHFHiwsC1mKnqKUxBqvE5NrXOItV8fZSTWkKXkA5ufrF1Py+uPfvi5eTojWwZC2xb+wwhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbL+JlZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbL+JlZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0B5C4CEEB;
	Tue, 16 Sep 2025 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758031426;
	bh=mOMVb4ceSql7gWrPmpuG+PWsLpqwNKJpa/AwZtcyHEc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dbL+JlZTrji9h7CFM1y/lb/vdNW9/BiOxU38htyEKKywwWwuTO9nqdVL/BH8hxqcM
	 ov1M15aUi7lBJdvBZNW94pypFSzxqATD5ORsmPGMBNBQH1k+g8S9S+u4UaX0wdJOcB
	 JG8japYyrWchHasWnqyJ1E/2gbFNFFKxb75PX1FHNIj+LS1LNRR2v5rahBL9Ga09NQ
	 OeOxJM0Q2NE5C5ZclIkLt6eEo0vbkb5L0yiLVdnPgOERYtdYRZzVjpcwZaFOZrM5Ih
	 EHWE/KtShGiFtBL742x5XxnQAF0XYJTiWpdXbfI1k1RGH3IAY720CVlt5XHVOHvJ+F
	 TALi6iv0xvZiA==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/2] regulator: max77838: add max77838 regulator
 driver
Message-Id: <175803142485.152509.15790223699274954393.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 15:03:44 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Sun, 14 Sep 2025 16:02:28 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds support for the max77838 PMIC. It's used on the Galaxy
> S7 lineup of phones, and provides regulators for the display.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] dt-bindings: regulator: document max77838 pmic
      commit: 0f101028407605c7b7cea53946ee4d25f82cfb6c
[2/2] regulator: max77838: add max77838 regulator driver
      commit: 41b5c85ba94057c955f0f6348c551093917da06d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

