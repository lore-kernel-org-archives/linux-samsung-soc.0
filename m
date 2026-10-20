Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792454558;
	b=fBfWq6p2QJvm4IVCBIjjDxjvidnw+GSfHnUU4sVDN8wgTz55tfJXQvSZpucvdG7Rxj4+
	 I+LV8OFhfMkrYnv51M9Z20wsdSif6OO9U47DzI6gaZmJGX+WT0XFFTrp76/2wLZeHQhO6
	 dVvAviOj3mkbjl0488Y30GiqbBS1PR1txp41/ePOpHSmN3gaADLxcd6XKXhQu+hC60giY
	 IZ6LpcdRMBT2Jcf/tIC/XLpb+M37R93JUA5mAaDahgbdm6FTrlhFskQYFNdScTqQ52+eB
	 Tcu5gK4gAQiM3pX3tr0PihCfhPT5yNS4z3G00NFhuDz/ur662dj6b1TNJR9vL0Gm7/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454558;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r+bP/OkQMM+P7mmo4+YcOuYgmu150zcrcZNTQBcMfBY=;
	b=WIQ8+UoyRReXePWaJ6JjgI3DEBHtebSOv7o+vob7w6dboc3Xk+5EVT5gXsyI3pOiP4gG
	 Opd+kzqpLDDbpZKl2k8bf2naaLl/X/Guw+LPeBsHP0fNQ1rE3OkUBshhYRE2GqY144pZD
	 xfRa9T7pHyNZLoXpNsEtufA0GFHURcYk39T8+Fgg1sEF2BOqJcU+fAdZxP7ny9gdEUEpr
	 bLw5HL1dTgoRgabhyxHIvlfEMykimzqI5eQBZrHRCwPV1PcQlDbZ5HkMcFidWrewHxpjv
	 +UZsb6BgWeuLfv71bFxIqT/bQyjJibUnEJL2ryHrn05Yu8YvwyCQuTQhMvSL0nLDgGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UK6Hqsrj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA06606A31B;
	Tue, 20 Oct 2026 00:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UK6Hqsrj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792454557;
	b=pjymp2w2O0sl7svlg5F1Ttjf80OzUB4dlBHn5NaX8Xuq/wYs6rAncQwu0oeQD6FovhAn
	 QxOxEB0g58iFVuASkIq16ZcA8OCZgZGStgPFe51NaN8t0J81h6YKa44jNRnkzSZ9v+lZH
	 151Kxu6F/7HMjmmHiRqYOQbrgwNhZlNYfCmnvkzO0X/StUk48owPr1wLxjMhxIXhfny38
	 nvR5Aj+gOulQxP9WeibkgkPOEpWl9PBbzLPAGaVSaYO977m/1svOo1wXuyigN6Hn5Emlw
	 t0gVfUr4sk5u7Pqjr4lfO8JN7URiCtEUqYk7nkIDWEFrf0p2qkfYayobX77ZWvwt1Wg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792454557;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r+bP/OkQMM+P7mmo4+YcOuYgmu150zcrcZNTQBcMfBY=;
	b=XKloYEIM66LqkDqVKO9X/an1nKvdAjhCRrcA2Cph+YCAsxVJ/Ber1EQYNO7dZ6wcVBUy
	 0lH6dsNK0S+hUKxsuFZ2FY5qQHx4flopgEgvGQyucm9VLLnQQ1QEoE5KijkgmbZjDirIX
	 jdN+Sp3dwhvIN+NIqD+coq5w4P/fz7EUaO8Zp/pIrY6Ue+DJ7IeuROSQh6/8VQvg0fcnC
	 CRCg7g/dGKoDT+5jmgJQ970cF/lezpdDZj/oN6DhF8uQ+MtTLnGM3pHNCdBCSaaU6/L5L
	 0ZUBodEJ3TLJT8kJyfA/vvN3RwLanudoXixfy096Ly3lGM6mhBkU5YafnUMJNAkvYlQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA7A81F000C7;
	Tue, 20 Oct 2026 00:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792454557;
	bh=r+bP/OkQMM+P7mmo4+YcOuYgmu150zcrcZNTQBcMfBY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UK6Hqsrj7ma17prqDcPFKi2sJKxSvZzXUvwKNdd5GUjRb791YIZYkvhmPl1bviE/0
	 3HlrOUmxXpIyCqUfU42BbyOtT0oLk7k1UxAACij4AvWAfUKB3hB3my5RPEUGUGG7Xi
	 0sNIuDZ3O2zHOXN8Et6eEX+0TRO85taW/Q4/9weT2vQW/rM1zCqAEP2y/HHeM3qf/u
	 2mP0rGad//ddqchZu7rQJol8RhnfB/XzavT2fRtt8hAWTU6Fhxbd574j05zu2kx2xA
	 hsuVmcZPcQE47iDATiaNK7q4RCbW0HmF48LL4XnOtlPLggtlcBm6kd4nDy0rfnD11k
	 OFoz+0FGMUeMw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6C9C4406C5;
	Tue, 20 Oct 2026 00:02:36 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 20 Oct 2026 01:02:35 +0100
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: add
 exynos5515-wakeup-eint compatible
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
Message-Id: <20261020-for-next-lucky7-pinctrl-v2-2-b6b0e6065452@member.fsf.org>
References: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
In-Reply-To: <20261020-for-next-lucky7-pinctrl-v2-0-b6b0e6065452@member.fsf.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=q5YBELZSChcm5N+9fv9roR9m2IQnUyRk2ttRDDQKDEc=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1q+byZGGHKqgzyYI/+ZhaVzdL/qMgghhguFuD
 yZsqKnXyiqJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatavmxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+tUiA/+LViUdNF3XYv0m1g86BaXq2JgvWOxiEE
 pyXBgh52h/KHHOhBTx7xF+3Pd5mEeT9NWIZUDmw659ZUZEwTXAGWsFKbKrXWuTgshl+6fB2kC6D
 tLxjn7k4mKrmVgaXbvo30ZfPz9MDU2zPE2n9ukRLfCOvyRaNqBI8YYQlz1ZKddUR7sEaigV3sRO
 I2VcIqeGTpcAmo+8Y1985B/rldNJFSmBsSxT7ph48VUfYIlFLZQro46GL3Wo9YHfLCpG0BASLSE
 fHzA+3kb+UMo78VWD6hL+PiZU8yS5z43qLamKQoWzF4P9ujqCgANYo54yMHC1QVIO+MR9lNUDcK
 CCoXL5u884oA+CFaYj43zEBdb4mzybj+JELRp2r4Hjf2Q42VJx12hGj7AdW8kzPECCGdEapxQfy
 7O79rCij5MXQRoh0uNQ3dZ3gdbQGgkpGIQvNqdtYqBbWS1jvz1c1AbebSXKJ6FlO70fDhi1j1OQ
 b+i19lBwcalbLY0H+7B5lZbaM9Erf109T1CnYzNPIoN3+vULiL96e985RYnHmJgMoQ7FwOLAILq
 LFRFQpm5emx7tT7hKiRAN1SCPHZWrV/NQBE5YKafrd6Nhib5DahFboeyArxsecizy67c+91Ar1T
 L5xvDQsjocOvfhdZTqzqMlmESq9PrXLk3A/ryw2REAEzwQBL1aBc=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org
Content-Transfer-Encoding: 7bit

From: Aiden Isik <aidenisik@member.fsf.org>

Add the pinctrl wakeup compatible for the Exynos5515 SoC. It is
register-compatible with Exynos850, so document it as such.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 802911e23aff..d5200b04a1dd 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -49,6 +49,7 @@ properties:
           - enum:
               - google,gs101-wakeup-eint
               - samsung,exynos2200-wakeup-eint
+              - samsung,exynos5515-wakeup-eint
               - samsung,exynos9610-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint

-- 
2.54.0


