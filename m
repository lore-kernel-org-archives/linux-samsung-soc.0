Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD8A3218CF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129826; cv=none; b=Y41USksgm3ugjMc6w1FX/RAbOn7YxaDH3hVcBQ2/nQrx38yy6V+5wWsvQBwlcBNhXSZ+7dg0rts2nkvgd/4pbNTdcF07HrKuCmK4enTz8i8zjHVrmL7f5ipJfsRzuO58L6lOVMKmQyd0VIRg5PpUerXDYHziliN4tpS4u5n34K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129826; c=relaxed/simple;
	bh=6sKEmCOQ2W5VcemaPNloFrkmil66ilCQ7HCGLcFo2/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aM/QX1hyCjsIo5JPZ9Co8sX1AIaPr5z6ZMF1kvuUteLtxC3i/hCoxchWvqMaz6Cqb9IWYEkPgGDGDKVoWeOVq8EMFjEmKu5W6PJ8gbtFUASIiaeXRgGIddaddkiWI71drfSA5DsqnSLuOzMiQUmb8paIqIvIxA/FYLaREVIDdh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9O0Z889; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9O0Z889"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b38de7940so1229277f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129822; x=1763734622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oAM1SJwe5be5jeswFgKKg+ScqRvx3vPVGMPIZFDZGA=;
        b=v9O0Z889gVLPahMw1/IbXT7pUx5iN3A4OSdGJtiMGflzKiou2eQScf+7mtvr4Xradu
         Byjer04al+qXBKbO6vb1Uil2QjlArK0VsTJgSvAnVtkatb4vKlzWNEPn+EuPCJxpkx7Q
         +LsTzNOBoIbpypxpP6GxPKb+yP/+528yrvCoaV15N3wptkuIYc9tk5895vTaNKkcnj1/
         kX4OOZ69H0eNrKp+fG7hIStA0WXvwsBdCxQf3lDyl0EWzndtz711sJyQNhpmrerKmsd5
         00fFS2hPQsXh3ekTA7xghy9PfU1SV0s59xWQQM3d8K+YCgJzKb/q4dMxUuu38HPjYyD9
         ZMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129822; x=1763734622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4oAM1SJwe5be5jeswFgKKg+ScqRvx3vPVGMPIZFDZGA=;
        b=okXedCjnuPe7/QVn/zveN7H6EsfeW2anbSOL+fycz9EUTkiMn932nyISpwvnUk+VPD
         oFLJyewSOtlGSPoWBYb1uzYii5sOvMd6HqNFwvx1z93ZAmKpYlb1TYwyZGAFUFJGoDb/
         0cqZierlY120LsGyI44PJjOjnzrfG5ePeYwztrG4er/xNBRCsMoZOM7TS+yXzUV/wjhN
         p4uc00+4PmAaSHt3hGlzzie+TdY5znceFXDlXC6WngNkfMsFXMZaf30j06GO/p9bGiDr
         DOnBX+siFZtP3vNQg5VhaEpEsZKWojTiqmNT7+7hLkh9kyDaA9c4Z5gB3N+fJ+ir8T9Y
         R+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmr8pCX3lo+Fa+vV//KzxNRIfzbaC77oxDPOHjCVG3Xo8A71oIAX89Z/Cbncd6qYuWN3Iq3du+wJ9AQL14kNYKqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN7N0+jy9AmC491cV6cX/wotXQfNjhHQ7/OVbthrhijLtnD3a4
	xZXAs+A+7Lc1jszGV/bOK8gs+cRYhzxcWcGVDKECTtfxkQEh4rhyFo+qcuV0TLpIgRM=
X-Gm-Gg: ASbGncvXr7gq9GbTkJSh7JEiri28Ff7n8dHoOe4dRj84srMQ+krvdvycav5Gi5/xVIQ
	8T3LOB7uwyBjTTGxp7CVcBzVGF9jIvzKEVNX+ljv5OPrZfFwjJBNu6BH0swdApU+og88TCp+H5G
	uMonncUQNV091hZhoCkar+51uKXXP0bVooBYo5tNoR2orz2z6BybOq0nehdlBVoYgVOz5QWgMS8
	Higgf36wKwo6lwUdCRt8Qqb4EHqwDlqqIocy8dDJo+U3xex03p67foeoOpvKYyTMFqxVXfHFBhD
	se1c0vKOzsMHkOaExJxqVXIQ6zFjzET6izPV2zMVV6Hp55JGqCtGSfCVvo87JJoWJhVkUzXFwJO
	YpcTnziVu+b3kUz0oszVFCn2iCOUJQfm4mzClAIJltXwn6clbF60FglIJPkJVSCTAZuO5iqNNZK
	HNLa41ExH7BallWs3RfH6LxqJKmVC1DA==
X-Google-Smtp-Source: AGHT+IGqRwmbRj/CPbgz3UePg1W1Fi4Jf+p5TO4TwZlqbe762Q/tfUy4KsZ40D0BSKchWnm2kHW4JQ==
X-Received: by 2002:a05:6000:24c6:b0:42b:3131:542f with SMTP id ffacd0b85a97d-42b593395b6mr2819075f8f.24.1763129821651;
        Fri, 14 Nov 2025 06:17:01 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm10150958f8f.43.2025.11.14.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:17:00 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:16:48 +0000
Subject: [PATCH v5 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
In-Reply-To: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
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
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2886;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=6sKEmCOQ2W5VcemaPNloFrkmil66ilCQ7HCGLcFo2/k=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFznXNvLBNwl+BCqlq+ASU5nNnrkNHVGOcCAIA
 c6LVtvJOsSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRc51wAKCRDO6LjWAjRy
 uqU3EACgypkgEzt6O3RuGIUcTAvGF+i3BtDUdztrJqZeT5YnNtFtDpN3U1ocwD2/l92Z/7kIB7D
 A8IOXDPf7/Dac/8w65lPt5scyF6NJONoYcbVHwUy29QW+iwaHIrnalQexDIjp2SQ6JmKBCGJvPw
 Hp5cr7exmzHp0aWdLVnk5rriXqB2jZWcGEE43XyOfSLMRW3qhavXpaBVfNaz5NeqLRv+RRtCPbq
 EvixjewmBsZIyu26wShbPHO/nIG4H6HbC7tbS4v/dPnrawA99p/RvP3aQCHmA1KmtHcMdpnWdc5
 xmYIflwltaRET+sz3fxu9mQVA+NEcTFEjP19nw5/+A1L7+kE4g/IImeGVinTg7h5wwsRKQDR7kq
 3Vvp/8XzZZW6H2N/tZVOJJ9TNWUjvxuWOO/Q4J1ce4gkexA/POToJWgRAhiRYrl2ge0HB4hZJso
 zQAKWD4TVa1KtNgucU2jAwSX41m+POJ7ZqWFRlENCUOfgH0cqA6bNpGx0tfldpV8wi1iIGEdPJT
 LM5FzzLgO1rj7PECYoIHBsYtAmQzf1QdIdzJuzHXgiXgy1XCV9LLbik6t2IAkYp7mjxmk2VeSiP
 DoY7mQxBT+LwYIMhWvUmmEbWYIgLh7f6mAxhzphC30XKUmxR4a/gb2f65oGJnDe9i0zMiY4eUaK
 5GdBP9jOeYtZE4w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, to fully enable dynamic
root clock gating it is required to configure these registers. Update the
bindings documentation so that all CMUs (with the exception of
gs101-cmu-top) have samsung,sysreg as a required property.

Note this is NOT an ABI break, as if the property isn't specified the
clock driver will fallback to the current behaviour of not initializing
the registers. The system still boots, but bus components won't benefit
from dynamic root clock gating and dynamic power will be higher (which has
been the case until now anyway).

Additionally update the DT example to included the correct CMU size as
registers in that region are used for automatic clock mode.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v5:
- Invert the test for google,gs101-cmu-top (Andre)

Changes in v4
- Update commit description with additional requested details (Krzysztof)

Changes in v3:
- Update commit description as to why the sysreg is required (Krzysztof)

Changes in v2:
- Update commit description regarding updated example (Andre)
---
 .../devicetree/bindings/clock/google,gs101-clock.yaml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 31e106ef913dead9a038b3b6d8b43b950587f6aa..09e679c1a9def03d53b8b493929911ea902a1763 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -52,6 +52,11 @@ properties:
   reg:
     maxItems: 1
 
+  samsung,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to system registers interface.
+
 required:
   - compatible
   - "#clock-cells"
@@ -166,6 +171,18 @@ allOf:
             - const: bus
             - const: ip
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-top
+    then:
+      properties:
+        samsung,sysreg: false
+    else:
+      required:
+        - samsung,sysreg
+
 additionalProperties: false
 
 examples:
@@ -175,7 +192,7 @@ examples:
 
     cmu_top: clock-controller@1e080000 {
         compatible = "google,gs101-cmu-top";
-        reg = <0x1e080000 0x8000>;
+        reg = <0x1e080000 0x10000>;
         #clock-cells = <1>;
         clocks = <&ext_24_5m>;
         clock-names = "oscclk";

-- 
2.52.0.rc1.455.g30608eb744-goog

