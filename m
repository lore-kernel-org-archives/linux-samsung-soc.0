Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE114A8B;
	Tue, 17 Feb 2026 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328165; cv=none; b=jfsjO7Jh0c5oxWEuK/P9Kmt26OGfS3dRUEQce5dv5zIqpWT4/uxzUApRX51E4eOxeU6erYZtV4/U6+kT+0QToRc8tZlnHMxPcW8yi1iv7zl1mh5GkpxLYRDrs3w9T6SK3W9rnJ5C/Nq/7i4rr64q3oN19J46IOhSiTqI5AKI9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328165; c=relaxed/simple;
	bh=VI98Qbyap9F5ES5jFKcVF7/xFSkZBRjBPsuytwlNvh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dNN92vsZDAKYxS4mf5UE9qoH38vwELAcFs4ZeVJjy61ZWtDpmpAsP5Ji/FUhGnedBVpx/oKokSHSG67gvGywWW4jVlLvJX744mkbO10Bw+FBoBBwSUXexCEuPkxezZSq3+Zw+P50vvf0hHH8EErzBvmveb1bC45Za7Hb03Lf2yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tz2t/wRb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tz2t/wRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29425C4CEF7;
	Tue, 17 Feb 2026 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771328164;
	bh=VI98Qbyap9F5ES5jFKcVF7/xFSkZBRjBPsuytwlNvh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tz2t/wRb7HAZAur535TIKDVlP/iErjp44BnHMtXf+qlHdG20+eJWCTgv8EPDTJw70
	 0+VgA+w/HACXs04H3MuI4aRkEdob7blf1RXj5Crs0Jbzbx9EViXb9yAtPlexXKv/55
	 OeqfO6TzYFMRk25zXsA3D1mA76txzaAV+p5ELEt0YoyfFlRig4WqjEIREbyoFfLF/Q
	 OPXiGZt3k8PJPjakeX+KKT1rVJc4oi50VvdPWQuy1EeJ7Yh5Siwz/xtQIHpgj0dA4k
	 m1WXNRnz3IvORPlj/uFjmcQRvwbrCfbSWiEe0LdGizmR4QyvFslU50eRBr2rY1m+/g
	 Vl/2e0k8f1DVg==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260210-s2mpg1x-regulators-fixes-v2-0-ab3d3457f1ae@linaro.org>
References: <20260210-s2mpg1x-regulators-fixes-v2-0-ab3d3457f1ae@linaro.org>
Subject: Re: [PATCH v2 0/2] regulator: s2mps11: two small bug fixes
 (s2mpg1x)
Message-Id: <177132816291.11568.12962330540488724296.b4-ty@kernel.org>
Date: Tue, 17 Feb 2026 11:36:02 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-47773

On Tue, 10 Feb 2026 17:23:49 +0000, André Draszik wrote:
> These two patches fix some code quality / legibility issues in the
> newly added s2mpg1x support. Behaviour should not change.
> 
> Cheers,
> Andre'
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: s2mps11: drop redundant sanity checks in s2mpg10_of_parse_cb()
      commit: 5a1256acaa856e6770d74dd786b1b12548969c28
[2/2] regulator: s2mps11: fix pctrlsel macro usage in s2mpg10_of_parse_cb()
      commit: 09ad01a530bb6ad260bda4fa56bab84619d90968

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

