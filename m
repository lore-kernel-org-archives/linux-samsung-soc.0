Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792687599;
	b=1Q4PrQ6rr9pPe2RNG2cJIae0HNoc1fsU+8MEBqX5TBNiXLPeKcAh3RkQS9Ubqb5dl+h4
	 EpShriiBhiKXXq8ggBfSSGXmPh3hQCSPhtJP5gwrxgp5PTdtgwfyESjhSNfmvz7hLDYIS
	 UfhPW5I95M8u1TRW1PxvLMY2d8yLy5Mtxt3loXpj39LMeCa2WnntD1MWw4n2RF79MITNt
	 EXKDn61GYZKCa5E8zEMx2GcFxZ8vozOm4STuZdhv0vaONN3ztWC05qNiPErH4/Ez2jANt
	 Ptll47qNYoHnYLc8nXm+SizktK6RmjGO04Cdi3Zn1s+6+TCf0h6699HMsfD91TLJKcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687599;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8MPpLo9g8WmfTBzYjDgl1YuODB/LFoNptN280IeFyBE=;
	b=yLAHK5XAp5fbzfcRQzpx7C5QIlpnHOXYbjG69NidCvUldlPGGTOg7nNg2PckatCkJNAn
	 UV1zxfSzO/z5W3C3ioSwhiP5eCyBmEY059u960hlMbKo8XDqF9ERnmNrikwYVu03rJw8h
	 4w5Ak+yxn9UuSsWWowmgKYP5G3YawD2XGjp67LiQAPWZoCxinwlORCP0JMfppMQOyWMPE
	 m2oKSD5yo3PlIrprxf6fTJa/mRN88JXwwBlyppO1XVrNUFAd/1fhtuz4qFjTCdqozZJUv
	 pACmbW42GP14zZhMf6vpT4jmzbw8rRgVMTRVL7/P4ISAWq94P/zQTcu8AOBfvneNuQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5QWTSwY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA8606A319;
	Thu, 22 Oct 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5QWTSwY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792687599;
	b=EE77ZGeAuyizkhiMFaBwPiMGDYDSDDaBaceEhj3/RYsshZJ7vTFihKarumEEovWrX/fc
	 Dl3KzPWTdFkGAf2xc9ofklmBsbvebw30ILCmUigtMoAjtX6uLrxMlYGhr/ldvm7pWlnut
	 /ZHg6Kb/prp8BCLhpousGODVQM8f0qCj0rFPCOvFue8EQ4uJUoK1iUsvVstvG3Ur3VWiF
	 MGIGkid/PKeoMmTXQwZwtIu/XDfZKbm3w+vnTYkztvp1d1W+KBJ86HhamuSgAJ4r5XdkZ
	 pnvoYUoK/c3hgz7RGe7MaD/x7TawW5Ma+5HIZGD0nzoNo92aIVYTIXn2m0VSDcL2HKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792687599;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8MPpLo9g8WmfTBzYjDgl1YuODB/LFoNptN280IeFyBE=;
	b=WxfQjnkrBQoK3f6aU6ZEQyD1NcfB8y0J3e8l7S/ThZGdH61N78NzzmQdOIcfxe1apfOw
	 GK/smtg5Ppjn7qALT+G1SxY97rk+4TqITBQqASWcjCq1dI5aYyXwjxnmIeI2Dkn7t+kKd
	 57mmfTnRbNNm+sgl12oCSNqISrG2Pwrca497P8aNLYT6mHogjj+aKx82o37/+MVIN/rll
	 K3ItgQ2PofTMz7kPRPnj+TWMwMh0pKaCgIGFvAL7InN010xhg9ap33UEH7luhqNBE0bsY
	 hqoFi0/z44gy7qCDC4kIgUbDbbzE18gnkNrzFtIDECLDihUWRYL/aKMHYIlqHlMIxqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A8EB1F01825;
	Thu, 22 Oct 2026 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792687599;
	bh=8MPpLo9g8WmfTBzYjDgl1YuODB/LFoNptN280IeFyBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=V5QWTSwYr/J+3WexfvGixiQ5Xczrz43XYlHletgDdEGGa7Af/ljYYH231HBeZEazL
	 hgGPN4OD6GppuYxIC9DOdReVCOREhkWoCWg8EX0WDZ0MinIFwjK4zpqRlYxPRfNpg5
	 J8NwMhhYfc28t+xsseQ90+IipUzpgAiu6IyAbwKQb7HslqhjRPG1jXaQwAT7v7FdrY
	 aiQvtUrcpJczV3qLetmVv1InNTAMmdelS5IBTNSQzV8UA+a91sW3OJHgIDV3qDUDIP
	 1QaZIv/F5VqzhqcNgsaeHe/P1sfFwj8D6iqCWxTZmHNiJabWRmOCB82ne4cVD4vtll
	 lwZoKtNAKIcKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0083441E7F;
	Thu, 22 Oct 2026 16:46:38 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Thu, 22 Oct 2026 17:46:36 +0100
Subject: [PATCH 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos5515
 compatible
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
Message-Id: <20261022-for-next-lucky7-usb-phy-v1-1-2e47f8484bf4@member.fsf.org>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=TSsA+fRx4RBo19oCHI+BqN+RycpJHWo/dLkXD94y3zQ=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq2j3ssieeYp5OpBBa7/6qfdEtFIdA4uG3F7T2S
 7t+nJe7sCeJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCato97BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+sn+RAA5RsY9YeLzM9rKsLA3zt2qepMy9qla5K
 8Ym4GmxLjGv4RGD1b34/5GxOOjTG19kRdtsQQkK8Cai+N79QSEw3IcfiMIjplw/iIbdgGyLRdBo
 X4lyTKCnB6ElPcURLBg5hdUuw5nzs820738ld96WELDcelDiZFmzfSQgjWORZYlRdZXK35ODdBA
 0Eo3SDYoExdOsqjcQEb7yfRdwhU5q5D3/vaub0F/JjmbaHk7JWAn48PCTOf6SLr/kAO8tA6GU56
 Z+0G6oVqzGXSBI4TyXnXQwbWB0eMCgVYedtNByQhWs5w+GdwJKUhJVce/AloHaTBvKbj6154NeE
 ZLFcNZ6usUTnzGQtY6tLQcHkGGYC56oJdpinpvOpzpndeLrSmP3ySjjgJDGYb8vAIeSaus8Kbg+
 iKtSuTBqWviOXF0+IB03T6BAQ8bvaIH2LPuUrtzuGy9se5e6cx0SmJe6lRnf0mTVAoh5qDczFnJ
 56gC8Lvhqrq3VpqKl8oMLpREgn1qU9P810ITZjTW12Scj7tsXvojTZ/myNUzdGSRAzcrt121o1Y
 PcpwzYnU8uJFz6VCUFBYar3Y+mX3KwjVdUsBRK92wZkpoZX5pwDcnQcHmyG9f1YI0WSGVadHQ9h
 MJ53kzDKK+VyQmOdwT4B8ScpFh33mcRrmFTcA/flKQUU/9jCZYOs=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org
Content-Transfer-Encoding: 7bit

From: Aiden Isik <aidenisik@member.fsf.org>

Add the compatible string for exynos5515-usbdrd-phy. This PHY is
compatible with the Exynos5420 PHY when running in High-Speed mode,
in that it uses two clocks, phy and ref, so document it as such.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..a9af03066d8d 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
+      - samsung,exynos5515-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
@@ -233,6 +234,7 @@ allOf:
             enum:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos5515-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy

-- 
2.54.0


