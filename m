Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D442063F3;
	Thu, 26 Jun 2025 20:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968136; cv=none; b=Im8qBol7vuVVRfTFRRS2NHHHf9vQWwntboe1yLNx5slmvnJLsk+a71r7yA/sKBfyJjJVa8L1gSHFJ6mD90jp+RC0L9ZxQXCtzJRriFtLt5DuKG/3r05yOKk6MbVJWJFkjglsC52hyIF/zLonZXaHc9VJ8gAed2DsIA4BX0hk6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968136; c=relaxed/simple;
	bh=oLEQGcXfmwkTXW2635WHw9QtoP6OjHr6Fdq+O046/X0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G6F70co+kHoIH56hU3tSlKfNreyq1e0/+Y1v7zbwD57u9uUJaKHAEE0F2azzS/ssjuQUZsfYtY4O9OzYwvScDCsVdMMFTNM+lPX1W23qzKA/cLfhm4b2FxEVgjuo7vgtw1EtWFYE2FFhT3wGZWSPzKNSXi+TC+6HoTsFMrrA0Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QvPbf8Yb; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QvPbf8Yb"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7239A25DB0;
	Thu, 26 Jun 2025 22:02:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwtKvea1B_oe; Thu, 26 Jun 2025 22:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968132; bh=oLEQGcXfmwkTXW2635WHw9QtoP6OjHr6Fdq+O046/X0=;
	h=From:Subject:Date:To:Cc;
	b=QvPbf8YbZqK/yody6Z1qtcnZxwQlfA2RV3+DKL32vyJwah3Bf17Pl8q+iPF7Z53Rf
	 vGg+fQVTJjmXffgBWM7zFDm7COawfFwQ4AeEpigJMZaOFWG3y/CevzfmaVw+nXUF2t
	 4zSwCEJ4ZQCT0n31YKCCnrhJLpJfIHjak5XoxUQx2vaB5CGhpUASUeSMP71CZmMlp7
	 occC0/HOJ5MvN3GmKZrrGoYT+DQjzSGY6AOjHL3SVIkxkiZmEjkj+oTq513ozQ4VPO
	 o3yoDerMQka7mUGPqWs2R3s25GfyYNE9Kz9Huf8eXSb35jbiN3yEQob3MEbs9lem+2
	 EgYS36pjHq3tw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Fixes for Exynos7870 MIPI PHY support
Date: Fri, 27 Jun 2025 01:31:53 +0530
Message-Id: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGnXWgC/x2MQQqAIBAAvxJ7bmEzzOor0SFyrT1kohBJ9Pek4
 wzMPJA4CicYqwciX5Lk9AWauoJ1X/zGKLYwKFKaOqWR7+zPZHpDeEgQDHtGJzealkmz6wdLK5Q
 6RC76P0/z+36p8aziaQAAAA==
X-Change-ID: 20250625-exynos7870-mipi-phy-fix-73e05ef89d0c
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968126; l=853;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=oLEQGcXfmwkTXW2635WHw9QtoP6OjHr6Fdq+O046/X0=;
 b=l22ARppv4FdNrrIxIPioB4sYgrfvPuIUVxz3PSz9MWQNbePyQ/HGHSZf9esAQAadMmMpw2lkz
 hhA6aww7qUjD17J5bF2XGxVfjdolANncv2/o1ygEsRwSTYz71O0SV8J
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

A few issues have been realized after Exynos7870 MIPI PHY support got
merged [1], this patch series aims to address them.

More information about the fixes is provided in respective commit
descriptions.

[1] https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      phy: exynos-mipi-video: correct cam0 sysreg compatible for exynos7870
      phy: exynos-mipi-video: allow skipping absent PHYs

 drivers/phy/samsung/phy-exynos-mipi-video.c | 102 ++++++++++++++++------------
 1 file changed, 58 insertions(+), 44 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250625-exynos7870-mipi-phy-fix-73e05ef89d0c

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

