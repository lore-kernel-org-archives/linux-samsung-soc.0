Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9964C1502;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405438; cv=none; b=dzOLjfEqKYehf+jve2NmtNZYgHnUsyjgB5oI0ms/Hs/M17D6DCQXV0IifHb/LmmNHhbLXaGLe7kB+9gkJJoHDC167demcOJYVyH6kdfcNE4v72D9ij0dnkJF/ML5kiPfnh2SyyIMsiUPfnAw6wIRPd8OMzwEv2eQ7WJh9J5/HKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405438; c=relaxed/simple;
	bh=EQ/IbfNS9nKNdAEu6jhHR5zYzZlCmz/vHhGduVDUTHY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Oi34mF5yr8irS9nOagQTpA2AenEuJGM6THxGtiBP1ielRPikbpcNV94DEAA1QpuW32OJoPptpDSxeZMKFqkZ6p4ytUBuroF5aQPniNTaSS2osLUEgCHbLDuHpij2+hcYaQtSQM2/ofcn9tWAoJY5URuuQzjs3DwRwKWWwL9lwT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hD+z2glt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hD+z2glt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62758C2BCFC;
	Mon, 19 Oct 2026 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792405438;
	bh=EQ/IbfNS9nKNdAEu6jhHR5zYzZlCmz/vHhGduVDUTHY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hD+z2gltoW/k4FmSkPQdNNc4KTvEhagNVFWQlB/K8EL3YhFWDDajT7SE4R35jU1go
	 u7Rfj27VMEJVsB8fR+dp9xj6J9b8FDgENdXOOGWSJRkG5rnqVZzHAtoqH9C8DJ4RKR
	 eRa6ukXZrZYh0iatAhhFFvFFBr7ihNF1Y9SshEyJG/otyjtozsi23Mhs/7f9NwzWdp
	 x1w+cy/wCKd+1lSv21jn/hJx0PJHDwDsGT97l/ucjYcitpmD0Bl1xnJv5L2QFVZ0o9
	 v+YhSW45ULjOYKiFnqUXAp2w3RUsQ8JF0NuSSCYB/8vqUv2elRYB8jQcBVBf0fUspw
	 ZL2sULFcnsLXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7ABCCF2D3;
	Mon, 19 Oct 2026 10:23:57 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung
 Galaxy Watch FE
Date: Mon, 19 Oct 2026 11:23:46 +0100
Message-Id: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALLv1WoC/2WNQQ6CMBBFr2K6dkhbRdSV9zAsGJiBqlAzBQIh3
 F3AuHL5kvffn1QgcRTUdTcpod4F55sF7H6n8iprSgJXLKystid9NjGwF2hoaOHV5c8xAYqRD5d
 YY4GkltVbiN2wFe/pl0OHD8rbNbMalQutl3G77M3q/erJX703oOFomdFiYjCzt5pqJIk4cOSlV
 Ok8zx/wV4ZVxQAAAA==
X-Change-ID: 20260815-for-next-lucky7-e5bf3950bdbe
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3551;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=EQ/IbfNS9nKNdAEu6jhHR5zYzZlCmz/vHhGduVDUTHY=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1e+6YjzaaPOzeBdhgf8S+2tZ8ccJTr788n1nN
 SbeCkHVQR2JAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatXvuhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+v+1hAAyy3DLescGXWNJZh8B+AdAfWdBRZxlE3
 38Dt+0/UzbzWuN7RVY5UHqJHK6iHb9AaZ0JKv8lO4SPKmhjQ/dmwwezLjnKaHaqZhF3qHk7r7od
 vjtif9aUFVWoKGlON94ARrFvfb0AnLEfvj0aWRkOmIYmsjx+gBiXarh4aewaBRvniN5lF7S1XyN
 lHWkE04UzYTcpJgQfuyTp2b8BpD3Zynv1Q0YnQI8xpap7q/hq3sC96W5h047GU0nuUVELxH1iG0
 sq5Yve+dEHP2MXe0+3yFg1prfzae/2tZTOp01Cm2sjCkiSdR8N0vZZE5HYQvf2lqgdaa56GAfxy
 V9QsKySOyn0OrMoUdEf0JGhqmEgnvqYr8JHXU3Cf9ScJylqr4Awv813Y7FO1F99WDuuAJ81ltI3
 LWITfKehVjKTzhGuRWvCGYZGH17XUgX8BNR86tVTWNsZBLKH5x7/1fDG/J0xFx6HfVFIvJq3eut
 G7eRz90KDKxoJm8/14TPq/Odmnq1K3xpLJVsU2/R6i7AV5A1Q7aul7TeW7zHI0ycX9+aGjGGpTr
 BgLgJnm0vViKvGF1SYK4ACjIGefSgB//rBZV7KucW5ALRybBo0RLNnWpkUBcKoyl7Nuk6ffAgPd
 Huj7PemM6FIyiSyDIQcbQhq2N5CymzQWZJj/AWytUNZ8EBq+Iftk=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

Hi there,

This patchset adds initial support for the Exynos5515 SoC, along with
support for the Samsung Galaxy Watch FE (codenamed lucky7), which uses
this SoC.

Support for the following is added:
- Bootloader framebuffer
- Both CPU cores
- Memory
- Generic timer
- Watchdog timer
- CMU_TOP, CMU_FSYS, CMU_PERI clock management units
- ChipID

Currently, these device trees support booting the device to an initramfs.

There are quite a few regions of reserved memory, where usage of them
can crash the system and/or cause unexpected behaviour. Currently, most
of them are named "misc-rmem@addr". They will be given names as their
accompanying device drivers are added and their purpose becomes apparent.
If you would like them named feel differently, feel free to let me know.

The VGIC maintenance interrupt seems to be unavailable on this SoC.
I cannot find any reference to it, nor usage of it, anywhere.
It *could* very well still exist, but it is a mystery for now (and also
not a *huge* deal on a low-power SoC designed for smartwatches).

I am getting checkpatch warnings on this patchset advising to check
MAINTAINERS as new files were added, but I am ignoring them as the
entirety of arch/arm64/boot/dts/exynos is covered already.

This patchset depends on [1] for drivers and device tree bindings.
Note: This dependency was merged into the linux-watchdog tree.

[1] https://lore.kernel.org/all/20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org/

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Changes in v2:
- Fix patchset title
- Fix DCO email
- Fix style issues reported by dt-check-style in strict mode
- Added patches which were accidentally dropped in v1
- Fix reserved memory and make all memory accessible in the memory node
- Remove redundant PSCI 1.0 cpu_* function IDs
- Extend GIC registers to correct size
- Correct GIC unit address
- Correct CPU unit address
- Document unavailable VGIC maintenance interrupt
- Remove references to dependencies which have since been merged to this tree
- Link to v1: https://patch.msgid.link/20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Aiden Isik (5):
      dt-bindings: soc: samsung: exynos-sysreg: Add compatibles for Exynos5515
      dt-bindings: soc: samsung: exynos-pmu: Add Exynos5515 compatible
      dt-bindings: arm: samsung: Add lucky7 board binding
      arm64: dts: exynos: Add initial support for Exynos5515 SoC
      arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE

 .../bindings/arm/samsung/samsung-boards.yaml       |   6 +
 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   3 +
 arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts   | 219 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5515.dtsi         | 189 ++++++++++++++++++
 5 files changed, 418 insertions(+)
---
base-commit: 993e1bec85faedf90c5d27480793084e54357c09
change-id: 20260815-for-next-lucky7-e5bf3950bdbe

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>


