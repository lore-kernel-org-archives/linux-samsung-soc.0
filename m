Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511391990A7;
	Sat, 17 Jan 2026 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768673059; cv=none; b=P4x/vsC9hHOJLxrzT6dIev+tBS0oK6aWGv1alTIStKvvKWkoUVjGbxheJ1BFFJNV5sgMIGCNqIF1dF5G68icdU4g456oC8VGwqTHE+6Mqd+ZCyszO8XMvQE53lcLmeHFORJMxgwyokpiK6iKka4Y5uSRbQcVpC/Qoi0Dq0JOUbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768673059; c=relaxed/simple;
	bh=jO4wFN6ADMUPguuADZtQazCJyHY4oOYWBZimBu/NM3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SRlFJG4oZ0yJ3bOl+JzX3NDKpQj/HoOpaBtaMK2voFW3bfjy1pJQGb34vhbgjh2icuSfr6O8p1HgK6FLz/WonWzuBpDzIydv3bPVXsdgDDk0Dw9Ajjh1SCoMhuYaWj7xPr32zZjissIQ+CfLWmTrouBh3iHkmD6Bko82SWUGUsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBUozLfe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBUozLfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15632C4CEF7;
	Sat, 17 Jan 2026 18:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768673058;
	bh=jO4wFN6ADMUPguuADZtQazCJyHY4oOYWBZimBu/NM3s=;
	h=From:To:Cc:Subject:Date:From;
	b=nBUozLfekytpq17arAb5lB+VEyr9T5PJ/BoSbp3hV1sPNnp3KaCoqp6uO8QZrzkOl
	 NgSzk5jmjnNX92wfgGe5knvf0Drp3qAmG/odN7AmEhjafveEGOxue0iBb2Ulo029L6
	 xea+IjLFXc0mkddLEy1WUq3jcRR3tu5eAl3M6eX8siUPjCkNI15umAYIP2X9i8PNuB
	 Li9J5yQgImo7byqIJ/XaMOLENqYl3CRH3O4DHbHdqMtHzKcAMFj0vGge5OrlrIYFAW
	 qdOQ0vamB+OOUFZcJOAa+axrPaLbhMYMpYEffsH/t7PXaVPx085jKaicvo2sUFxuy8
	 Q7teaKTq6ctQg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/3] samsung: drivers pull for v6.20/v7.0
Date: Sat, 17 Jan 2026 19:04:06 +0100
Message-ID: <20260117180406.9361-4-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972; i=krzk@kernel.org; h=from:subject; bh=jO4wFN6ADMUPguuADZtQazCJyHY4oOYWBZimBu/NM3s=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpa88WVB8MzjIMztTvli95pMIo8VpZOhFHjiuOn 49BbQW8Z8SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWvPFgAKCRDBN2bmhouD 1w3KD/9iZ4ODS9EURgoR8bgjtChO6i+0mkB3+FAIjxW3Ep2mGIVeqBPW9PHMcLELhb8kr5yRhmU 2fI2aTypUe8Tk7DSCXOuKHcXmN9MAVWh36sRYfRt6J9SGvok2x3OGEFCVkVb1KNTtf4d1wi4tB5 sRQQbB7oaIWsv6uC2SmkhmQXuKGmC8+KIzuovh18KEL29c82FwrzK0ydTvUezTD+dhP7QB87lTP 6dDPRpeDUS2CgJU7XqpUQFUQfKjNR9fbHzRxskAA3g5EzEJObyvq95vThHLVXZ9dD7A10fvP6CB o7mE5iKPaYWuvdb3DsSQQ22wjp95hPyB7bU14uQhtx8XBXVh4php3cXqbVHWdDfVR56sr6nOU6s DdT+7JOfQF0Qjn7peFNPtTws7acI2xj1N7LRKMt1gfvF3OS85rzMOSZW/rqa/KOC1SYNNoAuR66 n8hI/C2/w552VBqZ7CaDX08l+XyR5ob2EV6o1Wpi4uIoyAMOy7xkdo1px2VQ8UTi4xGr60tlEBT hv6+NUOwT4J7CPciXOY1JGyIpba1RqIQoCr8sDrGrzGB5/Q7T7vgPlMOz0yuct8isSiJUlDnlXN 4Qv1nWNLtaSm+6ekHnzMq00JAAFKXJf5jgQLguU+b7kOEIjtLyufrC9UcQwIpquiPBZXi4ZktDs uYsm9CphNny7bzw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.20

for you to fetch changes up to 900131320bc9a9ec1d84702b2694b813c11c91b7:

  ARM: s3c: remove a leftover hwmon-s3c.h header file (2026-01-14 11:14:31 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.20

1. Several improvements in Exynos ChipID Socinfo driver and finally
   adding Google GS101 SoC support.

2. Few cleanups from old code.

3. Documenting Axis Artpec-9 SoC PMU (Power Management Unit).

----------------------------------------------------------------
Rob Herring (Arm) (1):
      dt-bindings: soc: samsung: exynos-pmu: Drop unnecessary select schema

SungMin Park (1):
      dt-bindings: samsung: exynos-pmu: Add compatible for ARTPEC-9 SoC

Tudor Ambarus (6):
      soc: samsung: exynos-chipid: use devm action to unregister soc device
      soc: samsung: exynos-chipid: use dev_err_probe where appropiate
      dt-bindings: nvmem: add google,gs101-otp
      soc: samsung: exynos-chipid: rename method
      soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      soc: samsung: exynos-chipid: add google,gs101-otp support

Vladimir Zapolskiy (1):
      ARM: s3c: remove a leftover hwmon-s3c.h header file

 .../bindings/nvmem/google,gs101-otp.yaml           |  61 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           |  23 +---
 drivers/soc/samsung/exynos-chipid.c                | 133 ++++++++++++++-------
 include/linux/platform_data/hwmon-s3c.h            |  36 ------
 4 files changed, 154 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
 delete mode 100644 include/linux/platform_data/hwmon-s3c.h
