Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E202819F113;
	Tue,  3 Dec 2024 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260559; cv=none; b=HPG1EgNlbpSD1d83pmw9wqdBrb8Bk42ifLaZ4ypE3xvXIImm5kloZXE0xNPV9MjNMQG9CS+HIGGUK4v4Not/GxAjV13MW79PiGGhQMgDNxUsmuQJCwfRTl0aM7BZSK2hqWeNoZb6TwpWwIxpip3ZLQi9E1ixQRehVPWgWusAHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260559; c=relaxed/simple;
	bh=czCvK2U+vJS4fE5syOg2GAFijCOBMLREdLTGdyULWSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=snYt8wRAc+ztm4sroIti5T/a+XJ2iQnV3xtuTu+uMw8wK4XkUHUesw9a1IO4W5DckFJnxYB3kZe5P1PUJrjEpxbbHB9zq+xZdLxQLxIa/xrJ6Wkvx/bcRA4CncjhGeaaHbXCKSlYEQOAPPTzHqHmyk23Cf7KSTS5Bg7JBFgKSas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=gVt6NKKZ; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="gVt6NKKZ"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2tjd5jWzz4wBd;
	Tue, 03 Dec 2024 21:15:49 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2tjV3S4Jz2x9D;
	Tue,  3 Dec 2024 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733260544;
	bh=czCvK2U+vJS4fE5syOg2GAFijCOBMLREdLTGdyULWSE=;
	h=From:To:Cc:Subject:Date:From;
	b=gVt6NKKZmVYhwa5qW5pMxeKgC6wcZUy4KNIOSfOZeB3/bMdmmLg0ELGvfSnALollB
	 ZbChtEy+KCYPhUYB76+hI1dNb/x86bY4F3yDdttd9AnIEWv4n2k64ETJ3yKZA2y6GG
	 y9/8LrwKJgXXhMOzw6bMbrZVMgB0oO/e9UARld/KFSdxRCMZTS0/XzTmOUeKy21ZjV
	 QVvBZw+k7X0XjCVaVu/emOmiO31hItiaeYTiXOQ7a3V2/QFnvzMRhJNz8xvd+h1YNk
	 EvhUMV7iaOIpj2ZIVL1y3RkDN9hBc/8Vezel7bknglA3rBbhiNeQ0HzA16PTzpPMeO
	 pa3sNVD6L1TUQ==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add pmu and syscon-reboot support to Exynos990
Date: Tue,  3 Dec 2024 22:13:42 +0100
Message-ID: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This small series adds support for the pmu, as well as syscon-reboot support to
the Exynos990 SoC. It has been tested with the reboot command in an initramfs.

Typically, this would be added during the initial SoC bringup, however I was
unsure as to if the syscon would work correctly until I could test it
(especially when it comes to reboot), which I just got around to doing.

Kind regards,

Igor

Igor Belwon (2):
  dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
  arm64: dts: exynos990: Add pmu and syscon-reboot nodes

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.45.2

