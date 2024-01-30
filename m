Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E935C5E0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706647273; cv=none; b=Be9wa6JYtKKQ9lTLLFfr/G8OLQhEhfcAxDh9pEKBJDnKW8Hs99v0WPAcIvj9P27dOHw8liVx1j6etnrjDrCr98nocNztEZLvi1H6gKBo0v/GR/jfdCdrAkgqWUwvyRXfSqQA72z+WscNmIkb+ZluRkr0Sr5UJsmCmolHmdqhKUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706647273; c=relaxed/simple;
	bh=8PzOVgfO3wYB39pdWO/JXBhwi39Pfy0F/N4Vo5QOofk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nolYZ1/6DICL+nauuZ/malcf4+5CMFQUsjvQZ0YvhhHI9EAOoAXPv3DKQRvIUtk7W/Ob8dUWsbBaI9HmeEeEFlF6u6jQ7Da7TUWsmuSPOUnhNlMRVsta+TG0ms1rfm6a5gV/giyfMaMSOTiN3eu+OgGlfV9WYoEwK5dHXTz+5mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=FC4OJL2W; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="FC4OJL2W"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1706647267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zM7gBsHINXnI27rsymf8P8R4h9e6Mdp280o+IUjJVAg=;
	b=FC4OJL2W0OlB6UiFqqT/dU9xmaeZLBVHl8nvuR4+KSY/yhn4lljmeD7pb2OYqd3UdP3a4x
	Rw3m+6jTHovIgY5gi2+I69E+6MPEUhpaZqpRQzXhKw0rg67kzGdq8M613ia6QmKNy+g5ij
	c4GfNeac//l8QGhTOTeUunE7r+TwqsY=
From: Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 0/3] ARM: dts: samsung: enable wifi and cleanup
 exynos5420-galaxy-tab dts'es
Date: Tue, 30 Jan 2024 21:40:38 +0100
Message-Id: <20240130-galaxy-tab-s-cleanup-v1-0-d4e17857241d@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMZeuWUC/x3MQQ5AMBBA0avIrE3SlgiuIhZDB5NISYsQ6d01l
 m/x/wuBvXCANnvB8yVBNpeg8wzGhdzMKDYZjDKFNlrhTCvdDx40YMBxZXLnjrq01NSDKSpVQUp
 3z5Pc/7brY/wAAioH+WYAAAA=
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=henrik@grimler.se;
 h=from:subject:message-id; bh=8PzOVgfO3wYB39pdWO/JXBhwi39Pfy0F/N4Vo5QOofk=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBluV7Xk4LCCoPprjBcTUUwoIzGMRjLWqm7OFuFo
 OjZ9CvfbG2JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCZble1wAKCRCwB25JC3Fh
 a+4PB/sEz0E2++WHDYxoieAhRX4HhGfXaJqxdUkx6PZIv5HwcgGLq4pWzPzHO8kNITDuy2UEOM0
 KOFtASUcssb5KH1iwpCxAln4xADwEp8aF/THd3YT/KQVAV15Q1NWzKXPGrPKuf218LQazraFtH9
 zGIYVlehy16XXpolm2CrR/BQ/Ypj//2KwKjfRztCyVsV5LAqk2k/MP/bFAb1Lg4VV868iHwGg/3
 9dmf25g+NdIHZIWwUNgbCuki3GxwlNRHX8cefFi/QeRkUhNyww6gO33EiaZDC0ZDkNHwsm3UpOT
 k5b+J+CEeKUfYxcrCvgkY2b2cJK9tXYlikpu+tm1WhNGBjGK
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

Describe wifi node for exynos5420-chagall-wifi and
exynos5420-klimt-wifi, and cleanup their dtsi to accurately describe
available memory and adhere to the DTS Coding Style document.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
Henrik Grimler (3):
      ARM: dts: samsung: exynos5420-galaxy-tab-common: sort node properties
      ARM: dts: samsung: exynos5420-galaxy-tab-common: add wifi node
      ARM: dts: samsung: exynos5420-galaxy-tab-common: decrease available memory

 .../dts/samsung/exynos5420-galaxy-tab-common.dtsi  | 57 +++++++++++++++++-----
 1 file changed, 44 insertions(+), 13 deletions(-)
---
base-commit: 497b447cf89b87c8fb0d0b27994258ed18ac355e
change-id: 20231210-galaxy-tab-s-cleanup-14da98b23606

Best regards,
-- 
Henrik Grimler <henrik@grimler.se>

