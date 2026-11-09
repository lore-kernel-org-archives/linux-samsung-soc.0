Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794258127;
	b=ea/i9Jw7e5FLfaPja9avyybuI2HfNhQRchi5VBNBo6WgAODSRPOCVUSyXx127wwDdd79
	 Fc4YToUA82rpbacx4VW4F39gAyUR9ulQUR6W/PN43gwjlY/5CM6hDgQcj9zo5q1YrHdp9
	 ct9sup3loexvqmdTChfbOBHLZHxZx0Frsl3VawgUnzr4jqExy4VPFeOsQjQ1vofISDu+2
	 0WCNDEY2C08AltUNJ981ENwCJuZZJiT/e6IhFEgI3Rc5VsFUKbCJapAXWvX1uUtotMIUW
	 pa5nxwmiFVbno6dxg042+ewKJX0iT1c99nsawswkFCni2Zhr1uWfAAX95diXuAH9fwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258127;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	b=VqONobnEbHJUZKGenTHP9uNs4PeErULNI8uJN47Bq7fTf7QdhzBkMZPj7gBeTA8Jog2N
	 W/7T5fv8mfI6HlBeOp9Kf7lUbO/dUAb+6lkXkYdVWwTwF0h2ZvcsU+HCFuyhtYPDrOfsk
	 d66G8PvyOxRslCVUrNTIdF5Jj1z/zHOhu7qKo8TqIvFGLCghic3PL1RRCFldxHh1mJKVR
	 1QRPTJDgFpVZA4i764oTbkHgOGMBhBwXZZIPa/1pfU1+CStI4D0r55Nm6iWcuzeR5c3nA
	 RLY37bkWXOsIljeMHb5flFjmT0sBpoYeEOk5tMj7HgyhPdLTrqOiG5uRX/Ncmb5Imiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWj3MRF1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA10606A326;
	Mon,  9 Nov 2026 21:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WWj3MRF1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794258125;
	b=11sk9D9ruzcBCmP+enM98k1o/hWa58Kba0Nk2bhi8sic9vWpEPF30OyVqfDk5qHgu4m/
	 YenGjYPNLmlmHqQ4g2CkuLVZKSnK7YYbesfMgfZQH98r13RpzHOtsg6UoXSm9Y+SRC1QU
	 FXy1neE/n7Dln79AWCoPgbwvdKaiEOOnhFpLi2pCoz3WGM0G2U162oNqlKNvU2ujVv/ld
	 rhwn39YelClNUf0UKSs1rNXXoehCQPeacIxmGJviPH4rCJG5wbIqqfGqQeTuGZQLvbv+3
	 2q4TIQq30UyD8VNUEtNvZ+X/ttszk3AU+vaO2X9KXnY9fmzRt+GccT9HDgJ9ZWV201A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794258125;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	b=En7L7vyYmO4C92yZU0R+Og1/U5inekiVljrQevCYT7NfmWL5cfIdwUHqMFtlPhonsR+4
	 k+ebHMHbK3YLeDUtme9n/5G+t7IEogkoDFAVWWf+WdeOQ7hOYG5UVdK0O09dkYSvG7POT
	 BY68yYG92q5McmHk2WGR66450GoTeb8O3gljtnIs2PRnqmLEPGYxrOgD8c8yYKXtGlqnF
	 TvcexYShwVubWFscPx1m8fDp2AzoLpSKiQ7bSDnP3YtCasKehB03/wuKxonyjk/hfa6hZ
	 OKJZDqb8qNB6MPuHKj2sG2z5GW4yoDBkTlxuUCZvqr+KHWfo2mHhPPqGqFBGOW4c59g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02B9B1F008A1;
	Mon,  9 Nov 2026 21:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258125;
	bh=dEmDwysiFkC37O/AIPW1WwJc9PVmtQkQhfxMRg9oKx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WWj3MRF1CsS9ekTN5vyqKz6GAcd8jUFwYzxz//21SOeahzRMhbLpxompo8VJ/r3x/
	 aCMALzfCfgMbsvRHzSyvFnWQ8HKRjg+8TYd5b6JKQHvb6ckvf8TpEWI6sySQIlAEs7
	 wwESC8yVYnVTZBRV24pxGYR/H/0NrvZPCNqLuOWG0z7Mg2RoLfEiyWLVXtDKshi1Pj
	 uhedAZzn5hwNILhzmZrOMbzxAASIdt4/1mYogb1PABq+TN81O16aCJ4900vjMmj9/2
	 YX/NRAWUk7y78sLX/vSAtUlCEarZVH+AkkBv4FThCRhAUCfxfH0BWYvhHpo4AEnAyI
	 zkK4KxVlDfPQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 69B8448645;
	Mon,  9 Nov 2026 21:02:04 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Mon, 09 Nov 2026 21:02:02 +0000
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: samsung-boards: Add
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
Message-Id: <20261109-gta3xllte-support-v2-1-85c31b6efebd@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
In-Reply-To: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794258123; l=932;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=rPHV+1f50EZ85D3csJMso8rMA1UhcD9FsDkCoV1Wx3o=;
 b=zUnWIrqvadiWfBOS7sVKmVI09UnbwQgEzT1TCWU/YJA2x+FMIDqrTIJwAk0MNH0+YVgWpLN9l
 xhuGqB0AkYwDYLxonFJPW+ZK1pX9fkNKksjEeJaueAvFfRf/pf93k2I
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


