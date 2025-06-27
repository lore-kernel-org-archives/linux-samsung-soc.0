Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4842951D2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015748; cv=none; b=XNr0PnBQcRKL3B/p6bJ4In87b5DPorQ+oiYIkZCl5xKcxI4A/1y6sGIKPPn449n1mEiFNcti8EUphzR+oMfuojVSQs9xXlI2wSV6ho7assxIsIAjRfEoTtv10dAa0b9ffQb8ddJGZouTIPRlWMXuhe+NPes9LdqnzAYwS0p4QzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015748; c=relaxed/simple;
	bh=yRbXyUmIWFZrQa8Jcj1B43/2CKJdjc19tHIKY4onRzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CJgqkgF2GFyO0EFu8/oxuWJJpTiC6nGdBBCHjmXNZ6XVbWk+qaOUby/Nu4oNHcKn5mXQw7LN4DYYtELk/FGsm2i1FfvZBjl8kN7UzQVcfYLuTadJypRFxJWoph9RPv9ry66BRSKqFRJHPF0tRz2Bx+2nRYeWUmrw5EN7NWlnbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DecnbPGr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DecnbPGr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so312456166b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751015745; x=1751620545; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oh5XF3KCgs+rtMgIdgbTUFGPWnYOjmm+hF8Cmx6SjzE=;
        b=DecnbPGrL3J/zPoLCX/i/NLhTi55Ntq7A2pg0zSZh7LPUoEIl7mTvko7nEpTxiPxBC
         GnU9TxxJ3nXqIhHdjS0pXgKtyfZUcVy3sSA5kpnYkdbV1DCDG5K89T31pYDhEvxkb44k
         yozhQ5nKDZVbI39PKDeCvGGbW6dCu7aw0yppVX/2WXm9mhAecbURcZcaAirh8DTsKBG2
         yWBart4OYBMhAhdsTRAQh1J5BucDdd9l2F2E6lnlTFKtldqp8Jf20Zf1h00Oede91Zmp
         fYa8OK3rhvP5GCUQ3TezLC/lsK5D2UtVilr77Ex9NJyC5FVxEwkRHkkX4a77EV/L/jSY
         KdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015745; x=1751620545;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh5XF3KCgs+rtMgIdgbTUFGPWnYOjmm+hF8Cmx6SjzE=;
        b=TN+mQ+ov5Aora8D0gQiGOxJU5IBQ4WEBgFvuNycXkcnNeL1u4/12DqpfMGSqDkm5s8
         Ck9GoFMUsC9zP6gJhlLziC2AihIzs2+L0tokr7TepTxxneTtgJghWB+PJtl2ZMJHsrmI
         ND7LnVIplw3NXTCnJNjnebW9yJx/dO1tXoDkAhX99NIkNNQ1zwIOYify14iy4kVCoiII
         etM85GRZSN1romVto1Fljf41JJm1FTZCpLilZH7Mpz4NWKS2L/mfa/iW4YcQPdiUvn8h
         qNsBT2YXwHzRKss+xLCfil/MVjtHO7vXGY2Ftq5XM1MglFZLiI2OmkgOFQaH9jXAUk/Y
         HSwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV58TIUhoH6ZCZYXhWdmQN2lYGD48jwhacx9oY3Z9mUvp12AVRmN65lg2qmrVntBz+2Z4s877StnbS1OUKUeelMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlvkNBjJ7C1Helvw4+DoVVHYL3J49Xq8oQiPT35c63Ogdrmfwh
	xLYI995GagGKOJhfXQcoMGqWyojHr5d96+VpWGH9btoJagDG+tDOTRsfEVMeyNvta2M=
X-Gm-Gg: ASbGncsRiC4WszOJNsMLTpQ6/i+gjt3s6z4xyY/FmB626IlOQgmH2iBo8zRU6HiDJBH
	YPQ5mtI1eGDvBsTCSuueqtstWRfpqvvfilLoKn9BEs/Lk2no8zX5KOQzghHXvgwIs25M0KBixZf
	4yyDdjhqP2eSux1CUiTnukKqT03AVVzqNVjh7Yiboc47HccsYGqWduQhkekhufqoL/6ZDr9euxr
	nHTgU6QO8lXD/aReK60DWKRpeRt1kUOqLqCQMrKDoEnankh1gFCn+lUplUHBfpa6CV3JjmA24gR
	oW7plaJ+cMXsrfYm6wp9e5ytniabTa9glBR8sWPu7Itm3LZq9h81UFGD5vicKoDqGJHwh+xKkcL
	W+LKlt0Bd4lla3577loOPPTK7eIRkeS4/SPDdOFPZLyh9hA==
X-Google-Smtp-Source: AGHT+IFhjITN++PVpHqIzdq5cOL1n5hDxRXOigxjiLZBcp92L2m6wtnp42f1b5hw+aCqwkXv34ltpg==
X-Received: by 2002:a17:907:7e93:b0:ae1:a695:a577 with SMTP id a640c23a62f3a-ae35015aecbmr181428366b.50.1751015745419;
        Fri, 27 Jun 2025 02:15:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01506sm88904366b.109.2025.06.27.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:15:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 10:15:25 +0100
Subject: [PATCH] dt-bindings: mfd: samsung,s2mps11: add comment about
 interrupts properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-s2mpg10-binding-comment-v1-1-f37e5187f0fd@linaro.org>
X-B4-Tracking: v=1; b=H4sIACxhXmgC/x3MPQqAMAxA4atIZgM1akWvIg7+xJqhUVoRQby7x
 fEb3nsgchCO0GUPBL4kyq4JRZ7BvI3qGGVJBjJUG0sNRvKHKwxOoouow3n3nvXEdrIljVTZmlp
 I9RF4lfs/98P7flc8vqFpAAAA
X-Change-ID: 20250627-s2mpg10-binding-comment-9b632a246529
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Document why the binding uses oneOf when specifying just one of the
interrupt properties is supposed to be enough.

dtschema's fixups.py has special treatment of the interrupts and
interrupts-extended properties, but that appears to work at the top
level only. Elsewhere, an explicit oneOf is required.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index d6b9e29147965b6d8eef786b0fb5b5f198ab69ab..31d544a9c05cad878d10a0ae9b99631f08eb04a8 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -81,6 +81,9 @@ allOf:
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
 
+      # oneOf is required, because dtschema's fixups.py doesn't handle this
+      # nesting here. Its special treatment to allow either interrupt property
+      # when only one is specified in the binding works at the top level only.
       oneOf:
         - required: [interrupts]
         - required: [interrupts-extended]

---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250627-s2mpg10-binding-comment-9b632a246529

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

