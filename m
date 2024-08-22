Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA411D279C;
	Thu, 22 Aug 2024 22:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724366671; cv=none; b=euT6p3Z1AxmxcSFm5IsPlg200s+NrTg1teSmBV3z6hygYEgim2jQJbG3C7FQL8kyiIgPp52KUHAyObIvAePPvBshy67PKLAWNxJa4U2FXPKw+1VxWkz7fMRAg70mVbNzbu4G0GXkhazdS3LVZDDWfElEhK5aYzXg9GtnxxEqCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724366671; c=relaxed/simple;
	bh=mquV+s3KU1t0azcWWuajBdkZrt/hfdfFmflTETXRXn4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oe3miuywJTjchZTcK10lxH96anOdZsn8fYE/+ZwLQu4qmZGIjEqfqyGbh8LlgaMY5X0QlgxGITFHKadR3TVtd6LuKPKEUD19kBFUIEdHDj6quRIjMpye8PwdPJxpL0P9eVODsj5K3y118b5AsR8+7DssLjxIQ2NH9ld7o8xY3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tScGXS8v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tScGXS8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C551C4AF0B;
	Thu, 22 Aug 2024 22:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724366670;
	bh=mquV+s3KU1t0azcWWuajBdkZrt/hfdfFmflTETXRXn4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tScGXS8vpwq1du6LpBsoN5ZibAQeU8tdtpsJYAVc6FsgN0QyFgaxlVZf+PQNXQ2sC
	 smDavf55JNrACxYrk/pnG1IpLPQJmFrK5ZSWzRrMXEDLdi6rKYzrZXeLOAhqo9PvDT
	 EOrKktxt3cV295UJGTFa7N9WcH4MF6wTYVi4DFCT8heKHGBKON1kyY2xLAsdCQ4yT6
	 NCzXJ6bcZ6Nr6gCcBqw6kEjni3Yk2Do90dcsobXF2MTnvKaCTzmdbHhKRE700NsTRx
	 a3g78dVITm3SuiGfHEOelIZrv8HAiQa01whPu/qbqwqhbIZ6Ni9aYT9YSo8ruYtHza
	 YHDJG6jp0cL0g==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240822161231.106744-1-krzysztof.kozlowski@linaro.org>
References: <20240822161231.106744-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] regulator: s2mps11: use scoped memory allocation to
 simplify probe
Message-Id: <172436666902.826139.10127269886665482573.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 23:44:29 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Thu, 22 Aug 2024 18:12:31 +0200, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling (less
> error paths) and make the code a bit simpler.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: s2mps11: use scoped memory allocation to simplify probe
      commit: b8195520e8b486a0922b4baf511a2fd19bbfc25f

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

