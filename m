Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0493A8724;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065628; cv=none; b=EhZO+L9JLOL+rgswR5ayVzb+RTGLwmi7B0B2iARCcbEjUfeCpIXQjpRMS89slCyl7p+ny1++EbzvZ1DrRvgEwhkLUIECQA0HLcTZl66UmzZjYe8v0ZNEvemvcwbkgSWkXpNdaHOIWGwHyheZWRYknHis1FgWLkmXfvvNQp2hh1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065628; c=relaxed/simple;
	bh=1EE9IJsz5rW59JTc+8Gbzasb4kXPgPy0MaTkkiCXn+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/ebAdIku0kBwmWpXijDe/0GPhL3za8/7+8PvNkmQTNpzFkJpS8eZRqqUgBRtS5QtkoEibY1pksCm7n8d7ii+MP2wQuftm6YKDu+8vDNkpRwf1XHSyZP1wFD+iOXRw5mKPgBigOLLU1QDQ+VeFnS9f0SWVKalbrxWaO8XTOlaUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrSAe/XS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrSAe/XS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C01CC2BCF4;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787065628;
	bh=1EE9IJsz5rW59JTc+8Gbzasb4kXPgPy0MaTkkiCXn+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NrSAe/XS23jDuitV2fwXr6sOGiUI63PFhNUpl3uKtlRJrhyBHXFmnSIP2Dgjy+Qhq
	 y7w/pBs5ETs16DzR0z62ieysJundhvNdnTIrWcYj/cdmid5KfuDhBfJobkZwhycG4k
	 BFpr+LOiRu3cIcmgAGzQX0Lw0/yBs4Lte3euMnEgiIcAvHlEUb3sAxTvklQfp1YrZV
	 EffhsX7XC1MG9S7AMV9xsDJnZPOXMiu2kp7+yhcqIE6uRV1gUqVXjNcTRyNErCepxX
	 qngENrPoNBwdgI2jA11kO4lqGJE50p7g8kuV2RQl3nE8KX3MUkHK4dsqNmldHQclfP
	 8lDzRHMB+mzsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D694AC5DF7D;
	Tue, 18 Aug 2026 15:07:07 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 18 Aug 2026 16:05:42 +0100
Subject: [PATCH v2 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Exynos5515 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-for-next-lucky7-chipid-v2-1-28ae49f5c349@member.fsf.org>
References: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
In-Reply-To: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=HkPlddHKQwmqWY1ufNhu6MddjjvEqgdH7uQbcVq9NGo=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhHUY7ydlaLNNK0/u9GgxtdHJziy1rKsqJDZ6e
 CEaOqscgRGJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoR1GAAKCRBJJwGyxHrX
 6yh2EACcHTH6X8Oxhu2iTKt+S/NSJkPZbr05I7QQwLnen0SomU4mSTbVSPFObCQKD4/J/oEiJ90
 yGGFaYKEG/ZECSrOIEFSNj6tfA+JuDkxV3Xikbj0HEDnSCQ1cNlk9JZJ3HBO1h/z/NKBUcPeQnc
 FV8zxiZ/va3xUT0s68afQY9ecQMV2xwzotSM9qS9tUx7AVkJvS6MciB7KC0dvadeB9PjGw4VplX
 D5SwECOHsZIOsgtJyrCDMgSvTx48fLCZflE1i9dUYKushaZPvMdAU4OU+0Qqz0Vfs+2Qs744zNn
 NResE0AA6KkEGh9XUhM0AYCoDtQ4rCjNy7hNnpIkMfI3yuG2g3DTkaMNf2Wm4V/1o6hqQOK1m9o
 MV8glC88kJlEZaVEP4MXGlRs3MbidYNjYlVJuT7BgQ2YfEnhBU6Vajm15kM2XUiXy3uNzVdXCXE
 vb/21em44JXEb8yl8OCBk0wmq+LyaSgL20BCyLsFakPKU2OFvy3LMLEdbt9xfkCB1cGwEGfZJlg
 0A1C5J/g5Hp9Ca4du6sTNkL3JJZvNpb9x0bDJPh1ROc6yyoNL0h5B39Ulw7dTIMhpgj68ppJzIY
 Y5ACoFYzawEm6mC5DMMF3l7dwpacBMNpBehwfQarzj6DXXpzx9i++C7frjN6lVbR/TVH/1cFFTk
 pM8PYmwr7jDa2mw==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add "samsung,exynos5515-chipid" compatible string to binding document,
which is fully compatible with "samsung,exynos850-chipid".

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index b9cdfe52b62f..619faf33214b 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos2200-chipid
+              - samsung,exynos5515-chipid
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
               - samsung,exynos9610-chipid

-- 
2.54.0


