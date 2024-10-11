Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD796210182;
	Fri, 11 Oct 2024 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641650; cv=none; b=imYRSsN9hHt+6En44lDxKssKi3F3NOkWsYsKFnHtcVJz+U9u1sEm/bbd5AZW47SPvh10xbbhfl3uatfN/bvk0qmNZpG6uhvdpj0HQ6mvI15mtztynM/pr4O2XWy6uo1vPjD2/wWDwJLLKiUELnxS7V1cHzcKhtPDZNUMqcyQ7Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641650; c=relaxed/simple;
	bh=REVZTIJAy9FQsHSv/lLjJzgIPSP7Spv7rDiLIhURfB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KBkMFQI0II5QtrVPp19tjDYpj4XzcPyIJln5tW6GDz1QqV+sZkuimWESrwAaRn/pGbPfF4PHVfy4BaMrSZ1fmlDSjBrjze9n86CiiUchpIO4PoonAnbgyIMKnn7cR3RUKFyLVmlNUacxQIsznt0YJn7jN3roA40szBpOZGpG9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWSNzcHg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWSNzcHg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDABC4CEC3;
	Fri, 11 Oct 2024 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728641650;
	bh=REVZTIJAy9FQsHSv/lLjJzgIPSP7Spv7rDiLIhURfB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uWSNzcHgkJ5WKx1RrP+LuntaSCnwKm7ijB1URpeFn5r0bTalwdIZTRUVC0hSwlil2
	 PHV5dt0A1KuDaQfZ2p2mcxV/q9YUKDWvGRL+vm373tzj/urE9s7J4miGk5o/i5jfAw
	 AHs0ADXuGjsfjcCdCrlQ9nF4s8AyQAu2KOUsANsVjAO1wwn51Uhsqf2a1b3yJ7xseg
	 TDV6xLkrO1ysWmyQ1fwZ0d3hLJeFDv2rcp6FgyOGAUhXReZMvlzsB6b25RexMLAobQ
	 wqtq++zVQunmw08/yNYiBqYXICvihsS6ElwffaTFAYyg0HS0yD2HtpsUbdTKLRvkBI
	 ebBVtBxk/UmmA==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
References: <20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com>
Subject: Re: [PATCH v6 0/3] Add Samsung s2dos05 pmic support
Message-Id: <172864164727.3853713.7051380602109888746.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 11:14:07 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 07 Oct 2024 17:49:58 +0300, Dzmitry Sankouski wrote:
> The S2DOS05 is a companion power management IC for the panel and touchscreen
> in smart phones. Provides voltage regulators and
> ADC for power/current measurements.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] dt-bindings: mfd: add samsung,s2dos05
      commit: ef9690c04f3b2deebf08f6a889fbe9032f75855d
[2/3] mfd: sec-core: add s2dos05 support
      commit: d7a5f27342a84e2999b9d1195c537832a11e85a0
[3/3] regulator: add s2dos05 regulator support
      commit: 2ba4dbb7b763df343df7741fca1bfda15fd1e0cb

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

