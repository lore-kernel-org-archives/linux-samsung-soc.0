Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1311A8407
	for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Apr 2025 19:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745177355; cv=none; b=g2Sw/15asal+TWX4zsSIutElcs0ncPr3XSYwfVYpXcNiUTDPxlUwWBaWWwmH07MQ7DoFO78Wm3W2Y+mGWKAezkt6wCVCy8lqxmn/8me3dnVEyIrJN7wA2i7P8584O51QOs52J6sAwlO/8wCmVjCJwRJGAMYkhHHE18rBtKi1jYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745177355; c=relaxed/simple;
	bh=QOd6z6A83o0QZNnyI/ifSdk4jGhOOwca01N1b/7gQPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVDw8U+NVqKCT8Ak4fQSnQOAlj24821/e14IB+5M7UyxhDXU0Mnl97mJjF7s/KEqPMfVjtO9C1kPaSzCNEwbUP6hcvHhdAFu4tD9LtwOak4hd/24s5ADsGrNdwZooZNiBuPaPQXkJl/sHj69Hufll1kSZYjKdt/dfwOFqFXNvS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=qm2M5DXP; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="qm2M5DXP"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=qm2M5DXPtCKo1Glxkprzegx2dOakQczkJvbAJaxCH229JSjefyB1/6NIQWouVY/x1IMjuD50SfqHCyLIMMiT/7O2WvapNYAhaCQQNc1mtGQM8tuof5Xa6RCBz/ljUvaFGmfM7Ky9AzH9FafQB0sC4wEEwvo5U5QK5j7ELEPKJ0TRiIG0k5ZHNe6vlDcXaTKMdmwnJ53s6yRi3HZ08qOVqnB8C0ZXj0AGGq6anuBkBYukbyTk9W0NUwVhPZ8CyT0zVv6p+Tls4xCwJdGS/j0liwSPOAnFK9+Ojf6dRLs2qwwg8rq/bool3OlC6ctzn+xN/roTsnwFASufDdTzSlXc9A==; s=purelymail3; d=purelymail.com; v=1; bh=QOd6z6A83o0QZNnyI/ifSdk4jGhOOwca01N1b/7gQPA=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1149203934;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:28:44 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 20 Apr 2025 21:28:21 +0200
Subject: [PATCH v2 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add
 exynos990 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-usb-resends-april-v2-1-25dc7d2e6dd4@mentallysanemainliners.org>
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
In-Reply-To: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745177319; l=1286;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=QOd6z6A83o0QZNnyI/ifSdk4jGhOOwca01N1b/7gQPA=;
 b=2rOhwRtKIKC1Z2fHwV7rvy28V9+d3GYFQSW3KYruUkmRkeQ+jcbN3WSqq8YKLQGUsXsMHzLw5
 v52B2SKFmxkDd/JMv1JLXoNgfGWcxS/mv/JbF3ZgmcJCaQJpY0Y7eIY
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Add a compatible for the exynos990-usbdrd-phy. The PHY is compatible with
the older exynos5420 design (two clocks) when running in highspeed mode.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index fdddddc7d611364ce17870b5b8963b5a0c0c9668..5b240fc761c38b49fa4f673ea4fff0609470b414 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynos990-usbdrd-phy
 
   clocks:
     minItems: 2
@@ -187,6 +188,7 @@ allOf:
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
+              - samsung,exynos990-usbdrd-phy
     then:
       properties:
         clocks:

-- 
2.47.2

