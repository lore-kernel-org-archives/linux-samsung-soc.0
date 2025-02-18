Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321021F582E;
	Tue, 18 Feb 2025 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904919; cv=none; b=hw15Vo2drH6+keaJPoEEoivYuCfqrAuwockWUXHkFVEPOYgAo/c+wazzAqn7EOwdEBPof38UTnMAJOy+gcQ+8ZRHpvBMfF10uOsQUQYdnzeqlKMJEv5rSETx3sN+ezLNOKcs3c7YOv1oZolqvsnh1+B2Myv8GtzFNeta2I9WfXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904919; c=relaxed/simple;
	bh=BxR9jFPEiAwMiqt5QfVjfx6zF42bwqi4ug6psMIP9Ls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bxp/YOnY7vmKDOR/wqgQzQ8ZELvaTCCHA2cuISNtJe+Wy6Y0AczCRAwYpshXqsvt46cfP1W7nZrAvjXyMe/gYywAHrarJg6gsnxy/+J5nSbFjJGZL0RqPMmhA+j5n2BAjIfRtG23B5sEg7KF8/Hu/Jv5ETdJXiGI+ZKpE86rf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=d93Dyk8W; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="d93Dyk8W"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A11C925F3D;
	Tue, 18 Feb 2025 19:55:14 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5LHm9JJqCpk; Tue, 18 Feb 2025 19:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904910; bh=BxR9jFPEiAwMiqt5QfVjfx6zF42bwqi4ug6psMIP9Ls=;
	h=From:Subject:Date:To:Cc;
	b=d93Dyk8Wa+n8vyZdIO1QSVsiuODg9kHdqbXykEq9cs9EgWmlIqp38Mgt2/I7a5kvC
	 pX6ehS9RyqbhpRjQNiZHBuYIlLazXWRrw7hGIScZOvtIEq6TYIdm18KrDr6DaguPK2
	 /ekKn0XDLWxqgSJc8TALoz8RVJNFYPeVDSk6g8d0xGYjBb8bLwgYpg3ZgxKYJI4wqg
	 Xte9vPq2Fkb/wtA61EbkJARftGqzD6PvXMAVhN5C+O7/t0+3MeiK9BqWZBQw7hL+4h
	 WM0imfqFQeuZKTOjOdftdmeS9Tu8YT5nvA4/bJWycCvXrvLtP3A4m2/SGwyorV/8CB
	 4ecjGV8PLA9OQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/2] Introduce DWC3 support for Exynos7870
Date: Wed, 19 Feb 2025 00:24:41 +0530
Message-Id: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHXtGcC/13MQQ6DIBCF4auYWZcGQQJ25T0aF7QOOhtpGEs0x
 ruXmnTT5f+S9+3AmAgZbtUOCTMxxbmEulTwnPw8oqChNCipjFRSC1y3ObJ1Voo3P0QbtDc4WMT
 WQDm9EgZaT/Del56Il5i208/1d/1RzT+VayGFt9bo4GqnfdMNxCnG5RrTCP1xHB/ptOaYrgAAA
 A==
X-Change-ID: 20250203-exynos7870-usb-9f3a5ed7ee95
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904902; l=905;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BxR9jFPEiAwMiqt5QfVjfx6zF42bwqi4ug6psMIP9Ls=;
 b=DD2ZhpEVbRcVE/PLP/ud3pf1ys+uU6rHRIfm3V2I8G99ZjAnCM7Lrmvc4KxOJ7/oFGSipmE/c
 tkZAAuXzt0XC3LZhemTjcrp0tf1oP7xnZUknXdr4igOhwNjiSUDVb0D
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Change compatible string (s/dwusb2/dwusb3).
- Rename clocks to "bus_early", "ctrl", and "ref".
- Set 3.0V regulator as mandatory.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: usb: samsung,exynos-dwc3: add exynos7870 support
      usb: dwc3: exynos: add support for exynos7870

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 28 +++++++++++++++++++++-
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 +++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-usb-9f3a5ed7ee95

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

