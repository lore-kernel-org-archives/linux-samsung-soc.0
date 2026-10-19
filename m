Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C8491B23;
	Mon, 19 Oct 2026 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420894; cv=none; b=ON5BRhpYBUmWACgbf8xPlwKiOW3nc9SPvA+ycWMXUYyFrn60f7L6QTbdX2MKnyI1n2dhN4DY0xI6/wSFpn4zosWbUEvuLaj57FTc3XGWO9L9igdxGbTtDfRYbs/GcT8MOTEXwNkqoRntQq4DxlKAFO39yWt/xMc/ni51btdPp2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420894; c=relaxed/simple;
	bh=D8zB/kA+w2k1XCoyZlUlZ9QcLmAIr0JRLjRxo3NOqfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDR/9lxJVLKr6BwAVHeDFur6FufxiOlNFg+531HgO/yq3APDgyEwvumKSnQmFaSxUvUndMmzUWK73PQKfxYt36uF3hV364EjuwBeykB4LTlIcYNQ3FWGBUUy0xi0YvQHZyfEBRuxYcE0NHqm8hDm7/6H2gj3aELUZE12o/BOQis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5XvKq5Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5XvKq5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2F24C2BCF7;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792420894;
	bh=D8zB/kA+w2k1XCoyZlUlZ9QcLmAIr0JRLjRxo3NOqfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l5XvKq5QUX1pxWdINb0dR4gs6zOowd29x8d+RulSClRBhDv8hH8B/GNY/kkMTGYs1
	 IPkVLU4q4CMvPO9EEPH92z1G1cSeGjtggBHO9zn+dy8+51z8meM6TRHIP4s9XiZr1T
	 BqRbmg5zj05InDnU2E2aJs/2Q/Z8tfEkuLpFpOUHJQ2f8aFPXAgD+hN0RPLR9vcyG9
	 3PbmXUQepAi0S6PLdR+XswghkYqk6I5E8pVGBze+tcmiWxSYYGllvNQp+WQem9HfcX
	 0sQTAO0L4J6sxGaDCo74jcTZwjGP7BGhyvcKTj8/D4e8xoUWy6xPjx294BEMvlX38O
	 8pW4nCZhUWgFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9E3CCF2E6;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Mon, 19 Oct 2026 15:41:31 +0100
Subject: [PATCH 2/3] dt-bindings: pinctrl: samsung: add
 exynos5515-wakeup-eint compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-for-next-lucky7-pinctrl-v1-2-0f77e94c70bc@member.fsf.org>
References: <20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org>
In-Reply-To: <20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org>
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
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1iwajzFWg0aVeVqU+vV1FOodxeEllVHtW/OFH
 4mNd2Jlj++JAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatYsGhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+uaEBAAskBR84nnZ+fZUkuAU68wmG506UQBr2n
 3L2REb/7wvEQwpeyxuVH0eTvrWlytBIRzRVLQdTnRqIP0GpD5epet53OLL1NOLM/c5fvS5Hkclx
 /2FjEVtmtVAPZaLWpwEQUmnMob2SVxMKr01Pu8xo2onFrHKT6TrkwH5cd8rQpBbGX+1XTddx20o
 7UxfziSl6+rebTl3o6sq/rWBYHH2WVZ3M2M41MS5S2tuRTq15AQpAPMGzcbR4gfBYh314jmQX7f
 9L+LAxhCTJKISzUQGHJBsHBmQ0caaaqXClGffewEmxSM74EFZB3ogtLOpR5Gvk6yeaODnF0wfZx
 3kFJYZhWpmNHxSSVwZ3X0Fb20v6RQ99k5SCLtsQvrQVRafgIG3ApT4bCgxTR2WAqQxBhYXoaNi6
 bbZ2sBH8kbMHGk/1GkJw4Hi54jwU/DSaW+eDTPMqZoy+y2rvai2S+oxf4P8suKQeg3npJ34fKg/
 O3hsqEr6G8oyoop7bpRMt+P8/1cORxpjfORzqCXBZ+PuQ42sz3b/UDB1jmmP3+W4f9yEgBN05+K
 JZ/lR/Qsjhxxoe0LhVT1r6o8HZoW63uMYgh+WcMc98PWfZmtdLcy7nVuVYgkhh+F07TJ+HLH9oN
 ZBqCDnyvCvkle9iaxgOjDhkr6KQxpyeETjzSpQE5G+hfHxnQmxkE=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

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


