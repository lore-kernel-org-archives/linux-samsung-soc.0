Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2BE1CA8A;
	Sun, 10 Dec 2023 21:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1emxwvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF94EC433C8;
	Sun, 10 Dec 2023 21:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702242659;
	bh=jUd7hMOHLaa82q99A0oN/j3M29qBg78Jmx8IoDKYyIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d1emxwvOgl0ckKNWsWY5aDUasUsmJW4gW4YAc6OOaIS1LAYGp6sZEonR8Ejn/22Ao
	 tLF+OhiBicA/pjtdeFG57gizQ/7PcOgst5xwmrkIcp/QtVLUyE82UAXtX9h8RBE32P
	 X6bA3Wsb3E7zqnTs0c9OKeqiDkICH9hA9usMcxGwIlaosBnBvzOkbs/xYzv+yPoKAm
	 eNVKGLMd6v6u83+Y/jqemzhz6mFj56QQGIQ7hEFHsRbidQQIHXymHq2FHsqLxxZ6VM
	 fQuBKkqqVxbHb6c77JM5dsMlk2rL6I7yY3ppwJ6bho9rLM6zsU/iL4tExjYWo64wJn
	 RfJkZWdyC53XA==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20231209-descriptors-sound-wlf-v1-1-5b885ce43ae1@linaro.org>
References: <20231209-descriptors-sound-wlf-v1-1-5b885ce43ae1@linaro.org>
Subject: Re: [PATCH] ASoC: wm1250-ev1: Fix uninitialized ret
Message-Id: <170224265642.2977176.17197693476298409878.b4-ty@kernel.org>
Date: Sun, 10 Dec 2023 21:10:56 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Sat, 09 Dec 2023 23:01:27 +0100, Linus Walleij wrote:
> The GPIO descriptor conversion patch left an unitialized ret behind
> by mistake, fix it by getting rid of the variable altogether.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm1250-ev1: Fix uninitialized ret
      commit: 5012f9d8acd411bc86229d75c0bb9517f84a60ec

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

