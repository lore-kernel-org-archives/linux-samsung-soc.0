Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117763;
	b=vf0btX7pcmZdv+pgcaipFZYoxyCqX+gS7No7nBAPjsXpX2JcTLF4AlN4lqbyUNZS4mJr
	 T9gECmUdDh7GHXWtXMIDQ7BPT3sHozfxwtOsZr2LFtUr3fisjrsOwm0kHiOOfJLnJgefL
	 tx3biPYLrM97/57OvwZ4kvYNKNQRpsYGvoCRnKpWhg62PTeBua8oUWRLDzLheGyN0gk5P
	 de4T45elG/dJ6cjss81zEYXigTomB44ULJL1v27KFDg42bUM7v3KrW6kcz/KRMbXpKB1Y
	 75SdRgLy2j+2jPyzdRjM9eQO56xYlpK/qSfk1PupOR3+hCthZyLmYe5mVNO2D94ubOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117763;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=n9rU9fO5Qrq2rYBu3VO9CChwd+KRDmH7T4kLHduQ4Uw=;
	b=SzzNUEXAz0wa4X88miSKVrDjcTZpQXThJy4vXkSdZ+45ppB69ZXmiwgpQyCbf7yYrrm5
	 Q2s1lKDtsvtHB7SLTuoURo32VkPdsm1vdLacyh3DY+Jj2EOIeyhPbMjX8rrXIecsZeTF4
	 UdV8M7GzusT12fOd7qdIxc5MxJWlKWp8ZJieyqSrvH//jAMqT6hsDhlIzq3DPk5FRZPr8
	 K9somyUr84536mwp2A6ToTGGUGo+aFM/qoK+OZfG3suh+9sbqHX8EA8y/cVQSPqUGV6MO
	 6K3lboL9KeFWtR/6gqls0NOzZJcHz3xxuIlIEPjRAb2RyQAQZ7e6P9KkV06imwEGyqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=evak3zEa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2A060A2603;
	Thu, 19 Nov 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=evak3zEa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117762;
	b=AOQ39pSQcAYlTGexZuK3+D8cCU9NiMhBSBynePNOJw/XeWCeI9NCh6pOPzvxkZ0OyJY8
	 26vFOYHzgASU/hzu3yxLKiW4EhqZfrQspldSwD0jGy50ChFr3HaFI2o3bN/2sj/K9iE+b
	 YtlzEeYdtDjdxsfKNTQcyPmWNP/uXVhc2+s+5Qq+rmcrZSZy+idqAQeMP2eGCJakBysEn
	 AtNPe4A4T9hmmn2KXf127Lt3iSvG9e2hRi2UYvVE7Q48JODEx4BTKR4y5XqG54aMYGFze
	 gB/QmolBJuenDk2tm+v1UIn+iZSngeJLxys2VdEoEIu3XPwXIpIkkUqMU0Jln8uGw4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=n9rU9fO5Qrq2rYBu3VO9CChwd+KRDmH7T4kLHduQ4Uw=;
	b=HZOe0CspcgyAw6mJ8Fnc2LDehZy+kNGq62JqUl0oVTWH8gC1kKXCLFKFYjKQLDNlsM7K
	 fJnjB0KmRxHPV4wH79vug/bbEJ5+mekJrXsjuXoBHGr9eopkxP65Jxy1tqTMT+LsulAAO
	 PCkuBCTO1k8P/Rg8pH63iVMVo55xY6Npm+k7sRRvsnjVEDd6R7emJtCG09Ca1QqDfQI+r
	 lpzSTjX+c3w6O7PL0t5/3kfLWD4YLDkobKXCd+gip/lQRRk85bq+sZOB71nTLRb94rdr1
	 Bpvd9CqIQbVOro0eza9f8W1slWuq9OYn1pqM7WteRsiQCkF0rEFPO5CAIB00HDcPNug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 920AE1F000C7;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117762;
	bh=n9rU9fO5Qrq2rYBu3VO9CChwd+KRDmH7T4kLHduQ4Uw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=evak3zEadtcM26+vGTGzFWrBbIVYKOrVIPvyBC8S52ZOR/dRnS2ZWpLs0p9WhNO1r
	 MuM5QZvOp5MlpThLqr8MyYl9Xc/46JJXM7ftbEjJni9JRcYJvfCE/IVsm5WJHTvL5A
	 uX7YU4Bm5sYihyL48V0XhR96veF7faZZwzM+laBLX/zZCJU4ejS6G4nRj7PuGhFYuZ
	 jspfFeqnC95zH4RkLptvs/L6QnQ32e7V3adcGoVilPifeEY0sxr7J5xds/pnKvNYIH
	 fjx4tSLj4GJASdaonP6+0KqbThMrEECxx7EPevu2PBopcwTTczLkmAIAn8H0hO3Wy6
	 ErgHGbuyzQu8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F3DE4B3FD;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:17 +0000
Subject: [PATCH 1/6] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885
 support
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gta3xllte-usb-battery-v1-1-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1416;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=hf78BaYPHXU8fTomC50BXpD7afJqnpvHdHzfX9Bswkg=;
 b=hMXfPZsZK+A9lZWD6eOC0XTSbJyALSYtYEkVrFQGLpAuCihutOJA6vGD4DgZXJ8wZaWwZjhMf
 c3mO7shKsDDDvIZTyvpTc77yj/oa4tgZTRlBIRSriVoPXElCP4gVcg3
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Reply-To: umer.uddin@mentallysanemainliners.org

From: David Virag <virag.david003@gmail.com>

Document Exynos7885 compatible.
Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
are already described in bindings.

Signed-off-by: David Virag <virag.david003@gmail.com>
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..f644a4aa1e95 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
+      - samsung,exynos7885-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
       - samsung,exynosautov920-usb31drd-combo-ssphy
@@ -234,6 +235,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
+              - samsung,exynos7885-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
               - samsung,exynosautov920-usb31drd-combo-ssphy

-- 
2.56.1


