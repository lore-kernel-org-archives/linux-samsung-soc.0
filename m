Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44058628;
	Sat,  9 Dec 2023 01:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjMf8GNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F92FC433C8;
	Sat,  9 Dec 2023 01:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702084080;
	bh=kXWYA3mSxP8VzhealiNpxsyNEKB9eXotXgUvGIBgK9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SjMf8GNzAMocyqt70R8V7uKEuoCvpCjQWbVJJU5j3q5fpD9xeKFw7+8U5fMBDS1eG
	 TPyCshmqibzyE83uTdlebPyVwTwvsETq36qD0Z2o4ykm/P1hX9NRW9UeBQyuEgtFhD
	 NuHI5SmdA+BT/MBc9eBn9rjqiDFYHEAzwuTgF2/yFcHrIZTYNzliVpzVoTBEaB6By0
	 hHiUvhRl4qVayjC2378Nl/lgmf+v3S4LjLW4+FEB6uwaAT+BWXasKUcRm9fTyaIm6n
	 SG02N+QFVwpqyrwyHRJlEhxphIwUAzoYicTbeZxkjYtH3FCPd8MW37TADkMahE0Uml
	 MdgU8wtfSpMHg==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
References: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
Subject: Re: [PATCH 0/5] GPIO descriptor cleanup for some Wolfson codecs
Message-Id: <170208407816.2911119.4303388917102358684.b4-ty@kernel.org>
Date: Sat, 09 Dec 2023 01:07:58 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 08 Dec 2023 11:09:24 +0100, Linus Walleij wrote:
> This converts the remaining Wolfson ASoC codecs to
> use GPIO descriptors.
> 
> These Wolfson codecs are mostly used with different
> Samsung S3C (especially Cragganmore 6410) board files,
> so the in-tree users are fixed up in the process.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: wm0010: Convert to GPIO descriptors
      commit: b53d47775651aa51bb98cdeb968dedb45699d9a1
[2/5] ASoC: wm1250-ev1: Convert to GPIO descriptors
      commit: 10a366f36e2a2e240d9db6da90e501fa16655282
[3/5] ASoC: wm2200: Convert to GPIO descriptors
      commit: 0119b2a24eb592f967a2849b772887c96617ad80
[4/5] ASoC: wm5100: Convert to GPIO descriptors
      commit: 8563cfe39ba5d00d974df25e310fb61b5b3687e1
[5/5] ASoC: wm8996: Convert to GPIO descriptors
      commit: 729f02ec02ae12e5d8a53171bd37e9de56f33677

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

