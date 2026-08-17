Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C033F823B;
	Mon, 17 Aug 2026 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962457; cv=none; b=Eh/uko6eLI9Wavi9K8o3FFJd7l5QeMoJQhUN/4R9kxEzl37z7tVbXvlmvkwc61DLmPz8tsyU0JmTOlg+eAY3bAwAH0jnV8yU0kvxQ0XJrM/sy5XZFe6YPPzyQpwKD0tt52N/+K+/Cws/7hltKDugrRkqkhjFQB0xcEB+DUCO7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962457; c=relaxed/simple;
	bh=f+Yhy4mCUFZnwR9Avc8QcKYxy2n2JxO8lpjuhASWq5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AuSQuwDuB3s6IYmqQAioHtiOJq7fA86YxuIq1T2HxOIBQfWg+B2oD0G30iWCytXdOO9VFYUhGrFJ3185yWviauE+hAgWHn0PzY4W3C0zw6YO7alyTgPHigRCLknvyqUw5kghVEkucL0lpwGqFGoMsRR86iUWLLI4FfPNm/9Orak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8YWm2DW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8YWm2DW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62C83C2BCB3;
	Mon, 17 Aug 2026 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786962457;
	bh=f+Yhy4mCUFZnwR9Avc8QcKYxy2n2JxO8lpjuhASWq5k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=d8YWm2DWQnYHT6z7+xHSklaFGSZpVYYmTG2VDXkJuXXVNNHiWNqmiYPdRLmzSjV9q
	 nPcDpnvmtDofYes1YyWi20GhvVz5gl6BkMidJ4DD9115T1ooOqxzXIBapmmktc5daO
	 eLyISXW1+RspKgkruWC2FgNgOwjhfj+QyUYc4ouOV0EskcDJ9LJMIrYQniDELmsIRK
	 SmU/mRt5O1q1fCpjIP2Y0SV3m34a9vcxhnibPqqujxcj9PUHe2NbRq5U2oIm9Jd1ND
	 1IpC40j1FBVXD8B0D1UAzMweEOok+xUvlYkgyH+zq3wBAC4apUKu5LSGnkKogOINVU
	 m1OgG/YNOSxpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA6BC5DF70;
	Mon, 17 Aug 2026 10:27:37 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH 0/2] Hi there,
Date: Mon, 17 Aug 2026 11:27:29 +0100
Message-Id: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHigmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NT3bT8It281IoS3ZzS5OxKc91U06Q0Y0tTg6SUpFQloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loAnoNuaHMAAAA=
X-Change-ID: 20260815-for-next-lucky7-e5bf3950bdbe
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=f+Yhy4mCUFZnwR9Avc8QcKYxy2n2JxO8lpjuhASWq5k=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqguIVmBymH/hvV78jWokIS4novz0NaqNzuCSq6
 opqDD65f62JAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLiFQAKCRBJJwGyxHrX
 6zgWEADmS1+Z7nmYpvit6j6ti/snKs4bL16HZUbVgsd2CG+W0lNT7bK2k5/csJiWrOWFsKsX1kV
 cIZ6QHdmZszN1FEepvRfcOME8uWPhuB28GW7WK7FoopnHlNLT/ALKjqyP//4aOA42PHIoIFep+R
 Et3huF9j2QqvQz6OZXiQ4tKyCVq6aqRZX0udEGj6rSkY54/lGoZ/9T1jRvvfJ77hfigkt5IL9FH
 ARYxL58Uc+mEA1w7MbOFhBKAPl4pU8NeCI4IUTxGpSdwvsdxkW9WsFcglPbZWhCXIFCEnLH6O1D
 1KKrkaPgRJh0EA5B9N2Y+a2AmL23qpH8qJNN7oAB3oL7PowsldYGLcXg2/oJa2JTxzpsWcJSsgv
 8WPXb5kQr0SzMl1rNl7riSh5TFMgCwcdrN0yYIiNv9Ju6mGvI/KIIs3AOU9341iqP8mdhKlFSgI
 w6d9C8N+YxK6rnH4fv4yVKYIT8JKqH7HrKdOC7Yb+S2zjRu+pYphZr4CgXq4blliWbEwKRPxbyc
 ZpLqlWX2w4u2f9Fuiu/n7YJDdkuZV4zGt5tB2tSV9wxZ3XcTFuNQElgDETnHrm5kUO+Rqkm1CtH
 Bh0Oi+/qd+JrOSCZ+oynmBlIwgD82Y+l/uD1mF8KkFXin/ZgP3SS92VtJd6hV9xHZl04mgnsPpN
 L/XfARzcnMaQL7Q==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

This patchset adds initial support for the Exynos 5515 SoC, along with
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

Only the lowest 490MiB and highest 512MiB of memory are used for now.
The 488MiB between the addresses of 0x9ea00000 and 0xbe680000 is excluded
from the memory node due to a bug where if the kernel even knows about
the existence of this memory, one or both cores will lock up and cause
an RCU stall. There are several regions between this addresses which will
lock up the core, so the issue is difficult to bisect, and attempting to
dump memory information on panic will just lock up the second core.

Currently, these device trees support booting the device to an initramfs.

I am getting checkpatch warnings on this patchset advising to check
MAINTAINERS as new files were added, but I assume they can be ignored
as I am not a maintainer.

This patchset depends on [1], [2], and [3], for drivers and device tree
bindings.

[1] https://lore.kernel.org/all/20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org/
[2] https://lore.kernel.org/all/20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org/
[3] https://lore.kernel.org/all/20260817-for-next-lucky7-watchdog-v1-0-a14370e20b92@member.fsf.org/

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
Aiden Isik (2):
      arm64: dts: exynos: Add initial support for Exynos5515 SoC
      arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE

 arch/arm64/boot/dts/exynos/exynos5515-lucky7.dts | 106 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos5515.dtsi       | 186 +++++++++++++++++++++++
 2 files changed, 292 insertions(+)
---
base-commit: add58997023d8fbf429745f8a2e25289bbe22885
change-id: 20260815-for-next-lucky7-e5bf3950bdbe

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>


