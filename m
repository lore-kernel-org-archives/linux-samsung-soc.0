Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B7643551B;
	Mon, 10 Aug 2026 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385175; cv=none; b=TYoczqTFJJwHIdr/YHYqVl/erXpZo75aNugQ/zhDALTMlXrjHQ7K2w0k0da4Tuunxarc3+fv3sHBbdq4andLYUTNr6Nk3qOqfUT32JvzSRun9F11cZC/DvCDvLQQ13XP9cEFxoWP5mZN28VzqYD8nJpyCJvfQ9oZL5vwOad2bWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385175; c=relaxed/simple;
	bh=bAhkAhfV+UwhDLmqT4RYDOVJXy9eV/GY8lQW0TkBwzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0sQ3Z95tSJNPnXRHm8dAU6ikxDj0yq1Di5utN1WjWflg4dyt7LeTayUVeOXGZeD7a877EuR74ud4lR4LLHso2Kh/SOyZ3WMzRfRe1df56Fsso4S2Ic1o6SY61FgS95qSZ2HTQXn9Q76wibzojQ5b3g0BNgeR/IIFHZcnlayTqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=byfFyMcy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="byfFyMcy"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8073887;
	Mon, 10 Aug 2026 20:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786385094;
	bh=bAhkAhfV+UwhDLmqT4RYDOVJXy9eV/GY8lQW0TkBwzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=byfFyMcyVnJ/m2y0hWL/dJUS0/6qfWMDj1O9zE8j3sEsT0feE5Fy6V+CXqO0bWwh6
	 3Su5oJAH3Xv5AJd6jMX9n3A7lH6mVYoxCxSSCjVT2n7/gFXk+TcW9Cj2NmaI50wPiB
	 PvRHATH5jrQLREHAI1cMIpN9jFP5/UmQ/hlsFbd0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 2/7] ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node
Date: Mon, 10 Aug 2026 21:05:59 +0300
Message-ID: <20260810180604.3034255-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 48245b1665a6..8b6c2e2baed4 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -638,10 +638,13 @@ image-sensor@10 {
 		svdda-supply = <&cam_io_reg>;
 		svddio-supply = <&ldo19_reg>;
 		afvdd-supply = <&ldo19_reg>;
-		clock-frequency = <24000000>;
+
 		/* CAM_B_CLKOUT */
 		clocks = <&camera 1>;
 		clock-names = "extclk";
+		assigned-clocks = <&camera 1>;
+		assigned-clock-rates = <24000000>;
+
 		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
-- 
Regards,

Laurent Pinchart

