Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DC01E521B;
	Fri, 14 Mar 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942647; cv=none; b=fneD15ZjOMBATEvTyHlTxr8zO6JX4HiQLbI/l99TbJxyKWESY2Kmi3G4dE0DQ8/UeXoVR5YjqXBRhRO2HQglhFPA+GGcfJSufdAnKiQ91csNSFMmz2v+FMagme7+BLcFoMrDJH60fNUhEZy5HYXDKtciw3KGesqpmEYZs4Ujjhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942647; c=relaxed/simple;
	bh=2kWg8ACuhQH/LEWr57RRJJKXqDK/UHcHdofX5RooQ2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BP85SpP/PC7S0K60op3jVfMkum2H6NPZ4nsOLEgPqfUI2hN42IpxF51y9QOmH7WHrQN4NPrxfCnSyEm0tIV52THtcmQnB/bol88fFn8P0Wco22SADDzoCmiMsJwkyLm66FKOItStRAS6jRHFZRBC/1fyiDgC0Lrop/vnkP0AAWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ah133TXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ah133TXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86E7C4CEE5;
	Fri, 14 Mar 2025 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741942646;
	bh=2kWg8ACuhQH/LEWr57RRJJKXqDK/UHcHdofX5RooQ2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ah133TXpFMYw05MybzIuUYMGY86fC3EWq2ZmMtHL4Qu8uMloUHv0Df5nGYRlfVoIF
	 LsKuz8l836qQ1FoSKi6lwz4BWOZLqb2q2ohy+3KN8gQxSYq0OdX7up/ItLOIbcckgE
	 vCR2EggZyiRbPSW9GXv+gYIYZ1pbm6xrncgwJJzlOkfPe2gO44RaA+237IbjgASk31
	 F5LB5Vm/feGYIVQq3o3D6Erzo2sJEgSZ4eLNw+RPgc1PqiRxK4hgCZdX+TMVj5qvf0
	 qo4anUIEV2WFFQKLz8PqNztWsbF3WvjrKSj5fKhJpCFwlOnJqlIv8SHGHCcg6xfI8T
	 qw7KaYAJmOwDw==
Date: Fri, 14 Mar 2025 08:57:22 +0000
From: Lee Jones <lee@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.15 merge window
Message-ID: <20250314085722.GK3645863@google.com>
References: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>

Enjoy!

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.15

for you to fetch changes up to 169cd52fd9445b30379ea6deafa28a260d489699:

  regulator: s2mps11: Add support for S2MPU05 regulators (2025-03-13 12:38:52 +0000)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v6.15 merge window

----------------------------------------------------------------
Kaustabh Chakraborty (3):
      regulator: dt-bindings: add documentation for s2mpu05-pmic regulators
      mfd: sec: Add support for S2MPU05 PMIC
      regulator: s2mps11: Add support for S2MPU05 regulators

 .../bindings/regulator/samsung,s2mpu05.yaml        |  47 ++++++
 drivers/mfd/sec-core.c                             |  12 ++
 drivers/mfd/sec-irq.c                              |  34 ++++
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/s2mps11.c                        |  92 ++++++++++-
 include/linux/mfd/samsung/core.h                   |   1 +
 include/linux/mfd/samsung/irq.h                    |  44 +++++
 include/linux/mfd/samsung/s2mpu05.h                | 183 +++++++++++++++++++++
 8 files changed, 414 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml
 create mode 100644 include/linux/mfd/samsung/s2mpu05.h

-- 
Lee Jones [李琼斯]

