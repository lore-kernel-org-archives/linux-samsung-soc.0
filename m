Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499277;
	b=bYX5uCghU5GznXB62IZ11+jw8Qdf/ogOmUtc8qd6RTAgsd2FK05oMPxsVz9uiYDhT43H
	 5YqxcXTwwy+pmEyMnVi7OKdvN4zpboWKDLBPjqmGeSW/239VRXqPdrJr5qD45uWME0jH5
	 swIsbMBxHsusrZFhRRuhNwI9HNBoamdpP0oKpDUbpAqukrC9TT8eb2IejiqSte49qzb7d
	 8zJ4Am0A7XYQ/pZWfOr2q7Z/mChFJu/+/r9Sg5JVSoC2i4Un5IJX1by2MOZLXwLOfnBJt
	 TMYjnAYeHwA84MaeTD6VlaCsZx+Gdr03+VSJBjTM+21h5D9Mu4Jk/uBfjXiANH1le9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499277;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4fS8JsWi87lgCJfrvj9ZOh/iM3TaVnYX1NFeiZcZli4=;
	b=RfLoctfI4EWknp9etnZq/s4mvEqG9GqpgLRH8LlPLkZs7MZLrFoTMwgi8OPAFRf/cia8
	 UTO2Ud5uiay5Aa44EVdLVMGdD/i6wRAQfCkamF8ap3o3WACtZxXro0H1R83jg9ly52D9i
	 uk6mH5RTsXz5vfc1UrKsHREiyRa/0RpKQmh/S9GOO7xHW3WPrp4smWv+xALiX1b7sx0it
	 Ocd+GO8GfDoARpQsHaZBv4r7DAP7LV0Il3fUZBt5mTgA+9XV01LCnXcaLf1sCn2rfPLgA
	 GRYYIDBKzZ4zo3KidQ+VLcxq2bvUJLPa4QIHp5zOIQoZQwDnVtdBDTIJKLo+Nvom0Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7A7606A31B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 12:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DBF1F000C6;
	Tue, 20 Oct 2026 12:27:54 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Roy Luo <royluo@google.com>,
	Naveen Kumar <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
Date: Tue, 20 Oct 2026 14:27:51 +0200
Message-ID: <90a172c2980073a09b4f01c21a251c3d0d2d6fe5.1792499240.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Tensor SoC USB PHY is only present on Google Tensor G5
(Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
the user about this driver when configuring a kernel without Google
Tensor SoC support.

Fixes: cbce66669c82ee9a ("phy: Add Google Tensor SoC USB PHY driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - ARCH_GOOGLE exists as of commit cf3df78629f24b40 ("arm64: dts:
    google: Add dts directory for Google-designed silicon") in
    soc/for-next.
---
 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 105fbe408aa25b35..d151c05297d7e57a 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -93,6 +93,7 @@ config PHY_ECONET_PCIE
 
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
+	depends on ARCH_GOOGLE || COMPILE_TEST
 	select GENERIC_PHY
 	depends on TYPEC
 	help
-- 
2.43.0

