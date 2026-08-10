Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D5434E5C;
	Mon, 10 Aug 2026 18:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385171; cv=none; b=I8BUy4HzftGMUA17gnyzzJAIHGzBpfQ7M3Nie/dVi8VJ02svW1qAsqkTkhJXcuUjE3dEAW9MztHDPc+ihGq1Pz1Dgevq5/xv1eHAYea/yIo/qMLvzICPHd8xq0w9bYFHiIWVXruagNjlAyhpUEm0CqPHufBHEZoeavjdw+eS1xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385171; c=relaxed/simple;
	bh=G8H9Dl1uK5ID4BHhxZYuXgHaGIHDSo8WXQAFFX/Job4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kzafOdewgYxJtyIZdGisjY/LOSHEU/BABGcJo8IgdurxlCKd3E64lKr3DUtzbFdDk2DRXUq+bgVdbeU6nir2gAKBHg62DQmumwdrzlHconeOrcR1cvW6haApgMc6HqMk88tXRxBskavrR9dat33ngAWuJ9kUX/yGm7hCjFs8B+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bWpHhFi9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bWpHhFi9"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 359267CA;
	Mon, 10 Aug 2026 20:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786385093;
	bh=G8H9Dl1uK5ID4BHhxZYuXgHaGIHDSo8WXQAFFX/Job4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWpHhFi9IW6tX+2d6jrozjEpeuALY4v6CTcnoxv4SvW2lv8W+Cvd7gBKSVGClnv6S
	 CkSMZeeQRjfKyFBHil9NjnRxOIDdBPSk6S+UJcTRmYwg7Bbc9CevPYzY8Nzf/xKu20
	 xMT/o7MOkBmT/mAzF4qigI0+V0jFpSET2v8XQlGU=
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
Subject: [PATCH v3 1/7] ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
Date: Mon, 10 Aug 2026 21:05:58 +0300
Message-ID: <20260810180604.3034255-2-laurent.pinchart@ideasonboard.com>
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
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 8a635bee59fa..067a3264edf3 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -169,11 +169,14 @@ image-sensor@2d {
 			vdda-supply = <&cam_io_en_reg>;
 			vddreg-supply = <&vt_core_15v_reg>;
 			vddio-supply = <&vtcam_reg>;
+
 			clocks = <&camera 0>;
 			clock-names = "mclk";
+			assigned-clocks = <&camera 0>;
+			assigned-clock-rates = <24000000>;
+
 			stbyn-gpios = <&gpl2 0 GPIO_ACTIVE_LOW>;
 			rstn-gpios = <&gpl2 1 GPIO_ACTIVE_LOW>;
-			clock-frequency = <24000000>;
 
 			port {
 				s5k5bafx_ep: endpoint {
-- 
Regards,

Laurent Pinchart

