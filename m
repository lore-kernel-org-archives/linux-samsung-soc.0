Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6734C4825CB;
	Wed,  7 Oct 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371753; cv=none; b=mWmgGxpqFep9y5RE3FyrB/AMRLUSuNAem7TlE19vlEEpNxzthnuhlZdoAeFRHQnNcoJq0QLHSS1J63kUsYJFlyohEhcvcd3aFu9C7UsrxmZtpnUK87pDFIGqqMTDtazd9WftykEwIPnMYHYcmDeGVlmyf7yZrpZ7l/V7+JRq3j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371753; c=relaxed/simple;
	bh=wf0zI6H8bcYyEFBdlZDq94pQEqoVauT/PfLam3NmUtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HXuzUPNDGoveiDCZftQ8UfbXYyoNkQuuxgTwfCCAjT5v3e/m2h5HYsh8SxDrm3DNrt4XSRdr3W/zlYVPNalW6MW3SAC9Ya5Oozm3OSDMRXJqSCU6h4Xbf99Lao9lUVRqljpwifayxI/MLs1cvbON0uum/i5vSXrF6QsI8w9DFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRagrg87; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRagrg87"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F4B1F0089C;
	Wed,  7 Oct 2026 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791371737;
	bh=n/LrCgRxEO/wee64tkUGlclz4M68swR/BLIkBXXHUoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TRagrg87G5hDKepuqnz4uj9Iw1r+L00lqyAZjEV//YINPPF17/GV5eGWxRSLyKPyY
	 ri2wOW77GWlkwS/tFw5KoTP8217wDiam3nTrWGalT5Zta+czdMq0X6rEAil7ATTbrv
	 W3ytnES6ZJ7ypDVnlU3KxkcCmHi2Z5ctP8ZaldHdryZlBzRdiNvBuuj+KvfvPCx4EZ
	 TjT4Ng9SDLGF3affnLRoE/Kq7RdxZR1l+l6T+QfEFqiBjaKXKs/IaHP8Dtm3urW0gX
	 PomgN7r00RpsCirdZT1lVn50hl3CtpH+E5RTN3QnLfjc9C3+3TljNUN4NyKZpGCFry
	 3Wbweej/W47Cw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20261002092116.585466-1-m.szyprowski@samsung.com>
References: <20261002092116.585466-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: i2s: enable op_clk in probe to balance
 runtime PM
Message-Id: <179130030303.150114.3704660640001534414.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:25:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wf0zI6H8bcYyEFBdlZDq94pQEqoVauT/PfLam3NmUtA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxinTepZwOFsSBefflSuIBDRLxKrBIukNAdQXB
 P6BmNYc/qyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasYp0wAKCRAk1otyXVSH
 0M5UB/9ytuNAqL+9UOSO7TgcW8m1U0SFYte/r73jmoFhxS74re92Bw8liP6ML6vTFvaJR/GYKgs
 nczU3aw6xr6M/4X63WFIVgltwT4Q1cYxcJoSxVfFTr96r3kLEdPQ4qxFvb9UYyhjK5KXAnuh1v3
 702wNQ8V0lVA3IViB0RlIJLvXQY07VEcjZMCLUKMJYVYEeHq5/7nGEXxtBpRrtKFSSi2qnRzEi5
 1osTBrUgFk0WWMSCFQQDq43/Sk7rjd+zw7TEn3ZJNIizaXIJZErvBy4ZJpMMzpm/ixsNwwdKoKt
 ejn0xGz0HfXUoNsh4X5cz3VSgyv8x1+usOq/Te/0pQEIWeCX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 02 Oct 2026 11:21:12 +0200, Marek Szyprowski wrote:
> ASoC: samsung: i2s: enable op_clk in probe to balance runtime PM

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: samsung: i2s: enable op_clk in probe to balance runtime PM
      https://git.kernel.org/broonie/sound/c/752925401476

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

