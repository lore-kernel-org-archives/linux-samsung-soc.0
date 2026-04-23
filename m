Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2833DEF7;
	Thu, 23 Apr 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776978916; cv=none; b=MKeicGRNDzygVMsLTsWBnqk6PdhniOuPOwCfkMbJYSAReOGqUqEwM7uczobEMpoIEU7fQ2z+DJ4fpuYbYwJ5KHhAUk2f6OUZY02wcQV3q0ZS+BUu8PiTWVsGLv9Llx4/gmzeNjx0hMo2B8fGIqLSO3KTFCYTrK7wqq/+kkMjH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776978916; c=relaxed/simple;
	bh=7UQeyIPIlTXdREaZunxnL7xh3hHW64UsCQwSEpr4rdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqCAO4oEvz3a8MWzLk5j5C4oIhIckaWMzR9I9iyaibYqa3kUdXtplYqmO3O+LVNAJ4Q2MkAbrdzgAdEDr1bD5f6ySmLFPnO733pgutqFxBF5ugZbu+oP+YGCvr9GGgFDt2C25SL4YA58d46yJGbGP6zh8qK8WxDDMnjcl/G5A84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g1plP2QKPz9tZ4;
	Thu, 23 Apr 2026 23:15:13 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Thu, 23 Apr 2026 23:14:39 +0200
Subject: [PATCH 3/5] dt-bindings: clock: samsung: Add fimd1 and vpll muxes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-manta-display-v1-3-196f80c5673a@timmermann.space>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <linux@timmermann.space>
X-Rspamd-Queue-Id: 4g1plP2QKPz9tZ4

Add two clocks necessary for the google-manta board
display.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 include/dt-bindings/clock/exynos5250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5250.h b/include/dt-bindings/clock/exynos5250.h
index 2337c028bbe1..93122823c04d 100644
--- a/include/dt-bindings/clock/exynos5250.h
+++ b/include/dt-bindings/clock/exynos5250.h
@@ -176,5 +176,7 @@
 #define CLK_MOUT_APLL		1028
 #define CLK_MOUT_MPLL		1029
 #define CLK_MOUT_VPLLSRC	1030
+#define CLK_MOUT_FIMD1		1031
+#define CLK_MOUT_VPLL		1032
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_5250_H */

-- 
2.53.0

