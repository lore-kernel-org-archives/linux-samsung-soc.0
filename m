Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8C36CE06
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 21:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041324; cv=none; b=ffn3BbPRais15yYSiEiaEolsZZp9QUQ9nAFWrG+lGbYGMHC+OJ42fJxDh7dM2T03asJZai3VmiKpCQyqwDAy/1+zpe2S1u3GY5v1vLkFVXrhP+acfQJ0Djbq4ZuJmkEuSDXCUDWl/Cu3O2KWRkVx7Ucjx33frNA217Jel3z+IBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041324; c=relaxed/simple;
	bh=tORFLLP5Z3xE+++LHG+od0OJITEzcIAfc8OUfQm3olw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnzVztu7oOG2DUhNaoSP5HKNP22hQUaXuerB8XMsasWos/s0qkQCJ8OIjmA0yeZxnTLU3huhzStqiZAYR2CKXvHshDgqDK673Ou1UwLuPOBxRK6YRvL/djdXKMtgi/tsL11VvmDL4oKHBmUD22gW3zeVRZ4sPW2lBJKabhgSexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZcujz17; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZcujz17"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fb112c09so8068225e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041321; x=1774646121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=;
        b=GZcujz17vGvOmlznudcNKkx5oG0QauWBtI7sFBTY4Ohf3TvlyAeImWXXaKFCe2Yt1F
         wxHcq/7nZHjw+3gVSxFtfDZhwGDKZKYCxPBCyoZBmBTvFbBmXCSq4/YquEEOHF04BwSe
         gjQuXs7eomJ85Vn0FBGB5lj9B9WbXLiazT0/2QdSAorW/mdxZFX531PMAcyCtzSY+PYo
         bhkVAaAfqSP0NnI6dyThtQLU81HwIxuy8FI2MCxq2IF5v130SxpGNlGKFzdHC81c1/tA
         kiW+bb7HO0IFEoQ7QTcTym4DxGwZC/6/cb0inqMYx0U/+h+vcFkJDqbNrvJ0cnzkObyZ
         MwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041321; x=1774646121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=;
        b=iuTvVGZfd9p4EFVpTxO8pyTHoA2f5gprfdpuMNE8Gw5YMkGw3a4Qx/kztwihC8dcCO
         eMuvAQPt+JuVFTxCoMnaRLK3jPR9vE8kMhdI5Vv7xqRCZzpkUaAVxhQZukZD6XV/rxVW
         VGlIS5Ewg2CNUnAusDElM3LAW7iXpun7O5d3PHL8wowXYmABD8z6K7SOFzZRzadVtN6r
         cRaPbXA22vv9G/NlP/VWIcwuXNi/kNwdBeieSifPNy9MB2L92B6I0n3UJQ/EYERfJFlI
         BXXEcQX5t6VCP3zbSFsQdIVlIZJPhfJ/Gf9ZlnhnX5QHYXwJtTMaoY+gNVJZZLW6dRMk
         +ong==
X-Forwarded-Encrypted: i=1; AJvYcCXuvs38SCOqkFtKDGnPDpo0RZX6pfES8Kxp407MPq50eOGFf7RSmVK1ge+XsajifwMczTbFP0x16L92r/N4MUQNCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznY95nHIsnCcBxGOr5uZxdouNouwsNT9HJv53XKCUAx0uHRjOV
	7rZvXSP+Sed8gU99TEKNmFRGcPBhVCSx+xq9G5154TSad6VQkJjlpcT6dnWqJpb7vxw=
X-Gm-Gg: ATEYQzwMuLTKupBigJ8JTq+pJ2xH+sdQU2MLrSc6nnjKT7wtMhXfhfZuR9gq3z1OhS5
	9YUWZ1yleMOTEMjEKrb0a07r3KwBdp/CT7CtNz1GdsQVEQY5eoNPhWlZMBZqSHGSM/nNOljA2UB
	1yAqZn1I1tdUqG28IDZ3GlqjZHYE1heyF4I28cE7ledzzPYbyuLg7tLIGq9w89jYoUYEBFGyY4a
	l//Z0BRmHHeM5vpCAh36o6Rf/8CO6mFkHEX2FvIlyu6rHXBRSEph4CWkzV+QVsLk56gZ98jMomD
	trL/2UpfD72RSJJVR3w9Ua8BYc7G+SVC4bmKv0Gij0Eq+1wlBAsA1hLYaRPM9lZDxusJS6ig2iL
	CwhiFnCIcTxESqxn6maSbGew61tsXV5UlCGGRP4+RLIN9x/ZigT/h0eRP3L/KZPEvgceVbopAy6
	TsdTP08T1zr0WuSswbGhrEXkl3Zzxa0Nq3ev6gZOTJKAaAIJ+6L85Sf6wcBPWdJFnWWOuay+sTy
	AlxJG4uQX3gT7k=
X-Received: by 2002:a05:6000:400f:b0:43b:50d6:4f04 with SMTP id ffacd0b85a97d-43b64281491mr7630137f8f.38.1774041320661;
        Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:15 +0000
Subject: [PATCH 3/5] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-3-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Document support for a mailbox present on Exynos850-based platforms.
While at this, convert the compatibles selection to enum.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
index e249db4c1fbc..c109c1f7af24 100644
--- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: google,gs101-mbox
+    enum:
+      - google,gs101-mbox
+      - samsung,exynos850-mbox
 
   reg:
     maxItems: 1

-- 
2.51.0

