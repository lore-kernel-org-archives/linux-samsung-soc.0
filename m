Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9312C2EC0BB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388708; cv=none; b=P+mGa5N5nE57E6YW5EoYBt4POoGnmdxXMpXzUNihuzrSFhO3KFjz2s7xDu9SHELD+3jKzgX8Kfskv2ePYDm5+Arc/i3Z5yFrP8o+brhkof5rdDx6BDDhttpJp5qossDMPi79WsUJhTZpFj9e7da9w7cEFWM2kpkTWstOTnDfJuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388708; c=relaxed/simple;
	bh=+oCGKuWrWlzzBKoMEL3/FfWoYnYmDhmOoA3Dn2HMS1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u14Bw1TSExrNYaGexLF3BAqkg9psfboyPeFm0r2Zh/VenX55rlug2ooHwyyQJAbA2sasyz4kHrZ88vfzeGWoU5iFsJwqSqOmPNQy/NrH1uc1dyUtaR7p2cIme/ot5og6IedXVEI9VAWnNAQtBsEAOeBx0LAWsep9oG7XkDgFsdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=whd88L0g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whd88L0g"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso28066355e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388704; x=1760993504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyAHXZfiSiZUnBesnTj/zEW972y8t9X4DG0As5mUToM=;
        b=whd88L0gxlkCJEHNSMRw0rggeUWlkVWWFyk/RaqoqV8Z/DNANWLGEXXAqeJVl8Cw/a
         CwRMEUR9k3ma9WJK7Ro04HuNuzWtaLW8Wa+Ac/qQKfTYbp6xpuNdMrLmSwp/6qMysT0G
         a6fpVqDumpvratMKokWtmdoTI6pevaZ6XhkBHHV9JlX9vCfgOcD6PfpVVPXL4Ck3AXSy
         TsKfHP7tcSlVAEW/e6qVloXRMBUhwKkM71Wl9VhoO9fkSlK5Gw8HZwcePwHUAe99Hp81
         ARG9Ue5IGQm1MANE7ia/69uYiCfINgd+eJC6CpAmwU+lqWpGhnL4pEE7nCaoVDorpNrL
         BV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388704; x=1760993504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyAHXZfiSiZUnBesnTj/zEW972y8t9X4DG0As5mUToM=;
        b=U0R6mHy41aVq/ivLKA78k0pldkNbf0/xYYxep9xKARoX1FdkHXIPy0TWARtXqqZP0Q
         L2RpHweH/MJ4N2R2Abg6eBb9ck49aXwGwMBQLVVBVgVERrKfW3pLnHr4tvxVx8hvVTls
         s1kcp2HdX1Lm3HE659T8IvuQsSDL1P97hXwSlHQgeaPLeEYMCD1rt7G9W2Irbpjd9BSZ
         UP3O4RTZDJgHtPLmaiDfAHBBdEwqAYENe6Kb6USPsLaL7oEaoohZRWZij/M630JA7a32
         y+aq3tTtSEKaX/HIMNNGUsATr5kydCPRQGoEu/vL3mHhrdoUGHYz9tbICo+b53mZrwAg
         R9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUY0wZdAR6pxMkrCTL++lYI9MbNYwZNoxlIszvwEfkUYf3niKRLQ4qjWMDu7ElA2lhj3BsTxuoJJfmOrsQf3hIcjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoims3wJSGWtdEakDQa+++A0rmsf5Fz8r5xn/++zwEssnL6HT4
	BIm04BwyM3bcBaIWvg49Gukp/9OmzQUgPZdag+BHlcqYzkgDMYmePY/VwJI9ZIP5l+A=
X-Gm-Gg: ASbGncsypZigFyNlI5ztVK0yZUwJS7RKq2WkPbKcp85RXUbtpHoRcBsT1i2HCdqZNx9
	f9mNAlSz11FJ5yC/UeCG8WT2u8+9RNdV9Mi51W0gAhAoB75ZxfVOa33BKiMF6UDcbvnsTj3zfpM
	qO8anOkoWZrlABPPnUunGfnNzDt1K6x3dRwnUduvwqHnDbKmkHZwopgvtu0I6L2Zy76VO5mvJtU
	ENzvog857wYFQeFlosM7w/1eAWyMZNT6QeDVlxUlP4c4s53eBkHFTijeReXyWFegZHz/1fH2Ztf
	SCFKHEmtKtMF6VJQMvneg4GzJ26mJYELW4BN9SWT4SM2p0Sx0dJHlaAjjWat1P7UtU0QUtA9GPg
	gKPxE9VRe2Ovii1qBqrmhLo91J7M2lFT0GBOZJYzGvHcsRbhMN/H5OxqVIDn27pZlfA0qjYLS5S
	uZ8wuEwT7b5vAGo4ftWB1k
X-Google-Smtp-Source: AGHT+IGM/ohxNTkB5I5MkU/rwu4FNgrucoZDaWYhj1yomWR4i7pKzGV277cj7BDpJ/M4YUeEMDupkg==
X-Received: by 2002:a05:600c:4752:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-46fa9a9f05emr144983335e9.11.1760388703969;
        Mon, 13 Oct 2025 13:51:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:30 +0100
Subject: [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101
 hsi0 and misc compatibles
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=+oCGKuWrWlzzBKoMEL3/FfWoYnYmDhmOoA3Dn2HMS1M=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZX52tjaL/uhAfhCWfI8+Pih5EXQZpOFieP4
 jF2DKC4+SmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mVwAKCRDO6LjWAjRy
 uksXD/9TEH4aYwfIIwWKepmKdYexuyHJ3CBlsgHDqQplGtpixAO+QJV8YjxA1Yz2onhlSyDIReF
 LJ8S+5U97RrsWGDfLSRYIhgqfg+QM5ZJuC0GigZTPmh16qtd/jgr1tMsVCp71ymyVAXkKfJS6iT
 FhpOs2hM1ji3uqQNRTrm0w7k8Alh3lzTnoLkCdfy5a8YE0famciNH6ejpx+oyp+sC0QEuTDJtlS
 KsnfpNGv6obmQKx3DnR4Q4WIZhN4dlEraL4VwKfgmXUqRvujLeDPEvNVQumFNusyQD7pAw8leKX
 OiNpSkvLKtnq0X97+BX8NOUo1LSxieGNLpspBQuqZ+Zxeh+xZXiieXLU/A5I5zuGK0R0ZEUR+/O
 PSvAq6gPM2ZZf0mLZDxbj86nxtgspkfB7ViGWTzZzuMu0Wjbg3lD6YHDi0wJfO/ZQqD01UmARkG
 tFp/+8W9gykbIzOkxBqp06LeHQ8YLfP0EoKGNy/DVUDFx5O12In7qt86z7He7iYx1ExOvOglm0g
 u6XNjHSbxlttVpjOzgx7RgjmYdUhexg/KWG3CzZERx3mNqddVFJCF10z2se9vovsK7oeF+iE3ET
 b7xtbfB2zSJCEFqoqbUgeGmr+0X4PoyQC5bZ1+WAQ1efzxidhCoyDxgvHaiCigKIwiPz8BOqHJQ
 2oG8XmMM35so5rQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to the
documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..289406fb586e1a8a9eccb8eb781f159fd5b9d6eb 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,7 +15,9 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
+              - google,gs101-misc-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos2200-cmgp-sysreg
@@ -83,7 +85,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
+              - google,gs101-misc-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos850-cmgp-sysreg

-- 
2.51.0.760.g7b8bcc2412-goog

