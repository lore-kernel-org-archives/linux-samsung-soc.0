Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E02EE617;
	Tue, 12 Aug 2025 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996739; cv=none; b=pFG5m8yZq4exfEa2ccjn5vIIUUq82bMiCZOGhLECsvVCLNXuiAFBpVWgNdreF10xiV0RoN9VpSLSZWikiOlsw3XbmPgYEbRcxATKtgRFwdWaOP0UzHMi/EJp9ElPjfwQ2uSoWHQJQ7NToIuTJx2i7DbnO0e5hkmgKM7dLKKRUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996739; c=relaxed/simple;
	bh=sPpT/31FEoxwbyG26q2M4osJ/52Rr/J0gte2gCGjdDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZTn24FMXDMhZWDhazS0qbfwl8ULHeZ/XCuwhd2sk9j6rwf0j8pgN8kan3IlUt9THXoBSjHtppKL25SL52vO0hQObKcGKBEEnH5d4v6fUyjjXAGJlDcedcLbF6rXVbSC8pKku3C2CIFnk6BnxXlTJtawAYoKLTplcafuhaayfuag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J86l1yrL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J86l1yrL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47314C4CEF7;
	Tue, 12 Aug 2025 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996739;
	bh=sPpT/31FEoxwbyG26q2M4osJ/52Rr/J0gte2gCGjdDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J86l1yrLymyGibOHNWlIdlnu29DzIusjsM/hmtmRyMo4XwfUT3mACTIdk9pBjgrtr
	 7dMrZn46/eRn40BvrpanTDG8IyG/tpaoN4YdCFct+iqQDr6MPPlkaTL5luLYm4pAiJ
	 QZS/qD9x4dPGs6SG8sQpO9AP+2lZCMSLOqtnuRV4WB+1RkOPcKU7Nk9f2ZZKQ+3DoF
	 Muqo9+4qGyJ5OTV8dSj88Vr51gFyCLpYeFw52R0K24aphx+CSghYtR0Gwrr/n12RNt
	 tz4TDZKaISIVKqHY+dP49s7FhmxVEcZrrRWdLvbDkdhxU6bYoyQE6aMJBdTdMJWkGu
	 BFPOSyrMVPTcw==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250805-starqltechn_integration_upstream-v8-1-09d8a321fafe@gmail.com>
References: <20250805-starqltechn_integration_upstream-v8-1-09d8a321fafe@gmail.com>
Subject: Re: [PATCH v8] regulator: add s2dos05 regulator support
Message-Id: <175499673703.16220.16675557166066099726.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:37 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 05 Aug 2025 22:40:56 +0300, Dzmitry Sankouski wrote:
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

