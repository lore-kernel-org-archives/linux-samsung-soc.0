Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD641419A4;
	Wed, 12 Aug 2026 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786560769; cv=none; b=nUNGCNK+7BweZojcI4w42D9P0gljH5pMIwqv8844CGnBlTaMXnV5+vo5363O/fM+2qT8vzJI6HI2BD1Eak4uxFUAzfjvyD36XnPhwJLXIUaiYgUz+nfjTLBw8UZdyD1J6Rs/C7tWJZlzcIbNhFXvuRGcJwmK6zthiN1MdRHPW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786560769; c=relaxed/simple;
	bh=BeGSKXFCa8OiZVO1CeLHLND26U3KkRW0lwLDIr4DZ1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jrWvBX87z5xRqdgkvNiXoecYyby+eyciQg300IrFXh/yHjDFU1Xa+hQ+QkKpwG9ySZ+Cw25jnoGwIWfyvCS29w+34PESkUEdmPMTPudabV4Cfds4osJqHEekqXkrMr0/i1zcGzeFquFr8b/NPgSo4fDkwmT46L2LsIHopuNQm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fq6ImDdw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq6ImDdw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ECA1F000E9;
	Wed, 12 Aug 2026 18:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786560767;
	bh=tdB16vcLVB0RcAxFWaihJawN72hsoaVnDKuUQ6/Wb5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fq6ImDdwpT3+fG1IokwgYWJLhWR2HI1KE8AvN1LerUxGzXAzvgeiwk66lcONYnuXJ
	 GNeFxvL/zWvyy+CcFh1BinjdI8q3hobZSw2D3b255/zlzT0x0ChBAtnF0KBnZ2iFYJ
	 nsBOud63iSZLccpwkbs5EAt0dQysxcuqzKwjGC1qPeBhNLqHUKfdJ6g8rnt8VjtCbq
	 o4zAnSte81QCdyjBssH2mNEWIyhafXK/euEbGzHplLK0Po5Kav/bKP2ujIUTUblzjc
	 RGcxZvNaUNHP6r0w0vXOR0Eh49kD9QRgu28Ci9c3GHgMwv5Pv8icfOGjkItNwMwlg9
	 c8EXhhJ5JrsiA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
In-Reply-To: <20260812074438.3225001-1-m.szyprowski@samsung.com>
References: <20260812074438.3225001-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: i2s: drop secondary DAI for i2sv7
 hardware variant
Message-Id: <178655442848.342177.7702468476819498474.b4-ty@b4>
Date: Wed, 12 Aug 2026 18:07:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Wed, 12 Aug 2026 09:44:37 +0200, Marek Szyprowski wrote:
> ASoC: samsung: i2s: drop secondary DAI for i2sv7 hardware variant

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: samsung: i2s: drop secondary DAI for i2sv7 hardware variant
      https://git.kernel.org/broonie/sound/c/4fc945d8fdfc

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

