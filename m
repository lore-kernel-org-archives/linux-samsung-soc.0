Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18B2376EC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819204; cv=none; b=E7LW40bVoY/9IMQK3Du1Bs2EU788Zsx5wEbzYtC05AsvUF00pNiwE8uH+TwJ4uGtDkcTKz0XWhuwhU8Yw2LsQdQOf+F6WG/N1GWdrRBaVrKCS/Omp8wawDsA1VCcbLA3j8iKgzos6MCZQ+hQCoDi2JT9/ROr5i6UiNiXBgeyWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819204; c=relaxed/simple;
	bh=3ay3/NpwCM4uEJeiShAcGmbiyZhukhe5T732PsCDCKY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o3Qqm7Rm+3M3LA3SnNLthvlhSP+yEmhs4m4x9VAZP8nuAlQUbij8MkX7+Ry5f3dwGGCLFc6pbNHLkhgZ9KWKmRd0s+0uf+tW4s5B5HjDdP3vG4+IQjw0mxYIt5B0XMG8NapMFPu/ojh8garxQhSXoRMKdKI1NdHRLTdhUG0s7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=zLynZRs8; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="zLynZRs8"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=zLynZRs8Q49O7Lsgn2PdPf2DNKCgae1hip94DaxzczZGDo41KfW0zZnJ6usqsU14O7mywRgAYOTHYhcISxezMbCYsY+zd1eZDKQfOpSVRJsy5q6lGBB92CtG8x+v25FgYV86XCQ1RVW+RDQ2fFT9XjxeaH15UY0ZBhxPhNq4WZkCY1lr2HwEvywuqrWz5/GSlW99D/sXHzj98/LSmWP7Uly9wEODTmNIKkN8PuZuBQDk48f8QGnl/wDdBEKZEz+m/8nXAWqB9k0rakpM5v93iw/Y/pX2+tMA6QzwZZkDVwC4AfiWZ8ln1Dim3lTeLt5UWXbaMYiOQO3Ih9f804QXjw==; s=purelymail3; d=purelymail.com; v=1; bh=3ay3/NpwCM4uEJeiShAcGmbiyZhukhe5T732PsCDCKY=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1350358103;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:05:51 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] watchdog: Exynos990 WDT enablement
Date: Mon, 17 Feb 2025 20:05:18 +0100
Message-Id: <20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6Is2cC/x3MPQqAMAxA4atIZgtpoUi8ijiITTVLlUb8QXp3i
 +M3vPeCchZW6JsXMp+isqUK2zYwr1Na2EioBofOo7Od4ftJmxKhucJhkMki8uwjEdRmzxzl/n/
 DWMoHR/wo9l8AAAA=
X-Change-ID: 20250217-exynos990-wdt-0e9100ec5f99
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739819149; l=885;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=3ay3/NpwCM4uEJeiShAcGmbiyZhukhe5T732PsCDCKY=;
 b=yLF3P0Avq7SlNcQxFp+m8USAXVOXTw9vvfL4PZpeHmmhG37wVGZnjHZFzYwZJ0VEyIKLKLs9v
 HNrcGtLa/GhB/i6Q1QS0ZZhpgCm1lio1+Zr093rk8cWjCMqHS4OHyG6
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Hi all!
This series enables the two clusters of the Exynos990 watchdog timer
to be used. Weirdly enough, this SoC is missing the cl1 cluster, it has
the cl0 cluster and then jumps over to cl2. As such, new cluster index
code has been added to accomodate this oddity.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
      watchdog: s3c2410_wdt: Add exynos990-wdt compatible data

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  |  9 +++--
 drivers/watchdog/s3c2410_wdt.c                     | 39 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
change-id: 20250217-exynos990-wdt-0e9100ec5f99

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

