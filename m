Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000E62ECEBA;
	Tue, 12 Aug 2025 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996737; cv=none; b=bmntdzZ6WWkn4WfH4QQJnEtTAfSvo2Z/Khjc9YUcCfuvEF3PJwDFM+5rHzqBFAirMyFkKXWS/9mKxAXLx1XYhNe2QIrwQ6eHob3P4GSD9sF08QO2VhMI/qY7CKtpvqWC6aZDkH36J8HJXGGvjhK+cQl+/mysitWpvCppZRSVrQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996737; c=relaxed/simple;
	bh=UKCmf5RiS8hzLgpwR79YEpQepRcjhp5ZkjHO4+I/vMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jzcnSEAfhchZ98rnq5sJvQwwM6DivvHb/vgv1r01f2BrHuc3oCk3cSKbOnauRI9Cfdp448fbM50pf5BXNhmyBL7R8GWGtSP29nHVrujbGR1IlRqHqpA91EPwKHYb1jaJ0BKo+cQNCSLCVnl/7iv7j4ncAbt+uTOJT3As7vJzQ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igHhMXGP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igHhMXGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AD5C4CEF6;
	Tue, 12 Aug 2025 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996736;
	bh=UKCmf5RiS8hzLgpwR79YEpQepRcjhp5ZkjHO4+I/vMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=igHhMXGPnXgIy+4M00EKA7zqcB0NanYYfB4fwo9wqwsW5iG4fMh7dIK8XbAF/9Ufj
	 gyY+6WBfTy2GT8rnAW4tobVY23HZEWPhaSBQSEdi2Ir+W644ut8mOde+XlHcdYyrks
	 9LSmnge2SOlz2RdEOgXFUE2e1ZW9m35rxNyfxIUzqKuayOFJseU46a2SSO07FFSemR
	 VQaMKi8DTq31eoYzY/2NU+1HiE6RTovirZ+9usuCuJ0Uw5J4x2ovGAO2Xb2nludE43
	 6wDOixSvdIioIQk8fJUyE34rlMcIymriNx/bYd99Jc+aHbs+0ohcenWUMHsi4+TiMZ
	 nwrywfSPPUIFQ==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250802-starqltechn_integration_upstream-v7-1-98ed0e1e1185@gmail.com>
References: <20250802-starqltechn_integration_upstream-v7-1-98ed0e1e1185@gmail.com>
Subject: Re: [PATCH v7] regulator: add s2dos05 regulator support
Message-Id: <175499673481.16220.3331767092992671586.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:34 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Sat, 02 Aug 2025 14:22:22 +0300, Dzmitry Sankouski wrote:
> S2DOS05 has 1 buck and 4 LDO regulators, used for powering
> panel/touchscreen.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: add s2dos05 regulator support
      commit: bb2441402392ef1f49563be68e8f0dcb127ac965

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

