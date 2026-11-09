Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254829;
	b=T/TrCAwhPOT6pxiid7SnBCtCv9v/nm0RVZweOgEFU1xCAyfIin+WG+iQr2AhZT3gnnFd
	 iPTvVK/VC7QknnRFcfWqoAZcozxoDeX7/FRi9Og7WXQ4Lo3YWgS/NyMcV4K5oc3+6OOPG
	 +1WU4a9lJ6RIDmeJDzhOMn+irDGFlSzU3Klt50/eSxvjSHcFKQqA/k/UmaW9YYOEDrjeI
	 FpjJlGcmJIpgtJ5J6aZRcOIYR1ELlG+0JbWDxZiAG0mGaoIv+vHmDI+hkAyaxk7F3jmS5
	 Fe6ltd27GplgfNzZgAWp/HcnD+4B8MiUdpmmZMTi4nDx4XC1QEiQlA7t0Rc1U0PjsiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254829;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	b=FKCMUodBJcovXhMwEhuzcLTfS+rpvkKB96RPWccSTc2FY74AB79+Nak2LTV1fyy45W4G
	 W2GDy3o1zOyDr1M4Y6PUWQWa+4E9PrGUseoz7H8KHqFytXEsAtXUVgSQyJPdk0rK66iAw
	 RqhQ55pQghy3XSczt2UQnICXiwJc2Y5V17jTWF5MCKz63pZUMHViUhaP3gQ20YzpzWnot
	 xH3g+pvziVXEuWBZ8aOj9Ulgywb76DON9ituQP6YbAStFHPHOfkxW+X9tM0hdr+ypjWcB
	 9+92EkwvR56UuenvHu6mDZmQCb7rTjK9aU7kf1AXGOuv7x8gUE6a5fN/QoYIfC/NI4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GIvVzQAs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3813A606A325;
	Mon,  9 Nov 2026 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GIvVzQAs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794254827;
	b=tM44VgB91l1lDECACOvhA7f2d/8ZcJ30pZZF3tY+nRoAwzzchAPLntCvEEiZxXElnya9
	 1u+niqWgKtozAeKqUPxp/9MIIoQjcDpdHTBVI+dEwOUeN5SvYR4vPEIwLZMWzZYb5R0BH
	 fMuPoERYYVWGnwAtSY0K71mweKDo/TnCNDwj7iFlYHywLCS+a0T48Ju8T4nPdWyrw6Nl9
	 9lwhYoJWwsn6B5RRLRIBxXFICrFSI5AOMWognpUgs9muuJgKDE8DL6WaBb4uMfu7MUXmx
	 U1PAPzSTmqd+GIgvNm1DyY9a6WxP+F32nItFfzsNIf+pckItx4eaxPZhpctaMGkSezg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794254827;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	b=HVzr7S36eVVljLmyRIlIeckVYr3nU4Gy8vGeuhr4WWbeAnI0ksgvPSgDIfkzhSGP8c0q
	 GWvRpNKMqTfTJkQmciBCVSfRY/lVzwZQMtp54yBvjgQ1pWSMdGntLt3oZxFvpCDwopXcQ
	 7BTXjpDcMYfIWN9uZb4PWsSbUYWexzxeatf9ifYf+gZaI+9CLYc3hB08r3ZIOUr1TjpD3
	 Ibt2El3FQHAGCSeDZ51wQDCuipaKT50IHgwMBHDBVFIVZDCkgZI6y+WUYqEZePuBAu7Ju
	 kIYM3c3Kljo3VnNhaHsZ5MUDa5uPKGtXUrDHAbdLyr7AErZz9DSfNOzs4ncjI6sALzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 106CB1F008A1;
	Mon,  9 Nov 2026 20:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254827;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GIvVzQAszu2rCEhjy+keDca1R0NFGGh0QtWLCYwalQqdUEcLCzEGUGjErHNICmVLz
	 L4IvTt9vsFeDJ8nNvghd0QWuqAzXxzg3mE/GTEdQI2TrmX7plH7AV9NzrrPZNmPZiS
	 NbYSr6EdT9y1K6vj/B5TGzUDxWt6QVUU2S0A+krCYJN/OjQHauGGEzlcHJHsOaAiIG
	 aAQca4FDtNFk25/BQg9e+Su0xMthofiprbNnbhvbXCfokclSz2aTBHQ0XV++lZ0usL
	 dN5RXKWNwc31Mq3WsD6fK5PSUBKHHDWV7H4eN34F138QJXBNe+s+2CzhTuRQARAY7v
	 ZsvQYXLp1kjZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 822EC4862A;
	Mon,  9 Nov 2026 20:07:06 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Mon, 09 Nov 2026 20:07:05 +0000
Subject: [PATCH 1/2] dt-bindings: arm: samsung: samsung-boards: Add
 bindings for SM-T515 board
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
Message-Id: <20261109-gta3xllte-support-v1-1-dc0c4bfa8b44@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
In-Reply-To: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794254826; l=932;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=rPHV+1f50EZ85D3csJMso8rMA1UhcD9FsDkCoV1Wx3o=;
 b=XOuWDcNOs8m+GJEgfb9tmoTv4apibIJ5dJIdge/oQlS3SGu2pm1t4v2v8wCnZcNuXa9uImopz
 +230PByXa6ZACljBVP6ehxeP9Ixx+kpeTmjb6x8MZcMJ5cNfxGuL+/4
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Reply-To: umer.uddin@mentallysanemainliners.org
Content-Transfer-Encoding: 7bit

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Add devicetree bindings for Samsung Galaxy Tab A 10.1 (2019, 4G) board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index db19a686f490..6ac7f895351e 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -226,6 +226,7 @@ properties:
       - description: Exynos7885 based boards
         items:
           - enum:
+              - samsung,gta3xllte               # Samsung Galaxy Tab A 10.1 (2019, 4G)
               - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
           - const: samsung,exynos7885
 

-- 
2.56.0


