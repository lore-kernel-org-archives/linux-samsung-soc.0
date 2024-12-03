Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A66D1E0E0C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733231037; cv=none; b=XCQedvf9u2VvRGae6DJphL9DShWLAyWCTM8mTTMPjNp6R/EE+AfR6Y5DLHIrofCXg4yfF4WEMgaWc8v+7/Iw9nm+g0W0ShVU8h4x5umcBCu/7utLSnyzFAtc7R0VpwCETNxHemjGWd6O19EJLbp0AhNYZtK+9jFA9u4BgtW1/WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733231037; c=relaxed/simple;
	bh=G9Zx6yR+781XCG/n/fbfDfT+/1Gr/1cauqBqJjTW8o4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TdzqTATIfQNehzpn+wMedXpCjasSeXsud5sc7XHXcBjFVaW1SwcO0C3FbxuvJDFMhrsEXAyNEQlOEmd0wo1t55XVz6PR0xt7yClVYqZBuxHSVSx/pyAopgTQG1xqPnhsrABmCqDpCXzaPhnn32MO14IpNUiXr03sfgwwLMfhre0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3HUhj5c; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3HUhj5c"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so271587266b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2024 05:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733231033; x=1733835833; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIGcxZ8Psy2FDVunuCyBKosiOVkthQlOppOTs772mFg=;
        b=P3HUhj5cV7QQkHf1f7rcuE2rwFgZ3iFEKXFb09h1YurUVPf0FFGmhh9ARitGFxHlg4
         k/8+Jc97iw7rtaMCkCef83eHxpWDVnsQzOmsOadhvHvoSyDeULDbbWCAcA666KW9kHOG
         Rb1BLDX/fccih5cKOpx5ApZ7A4WdIXGxsuG13Wtz8nceCNrCz7v4/mhZNd9FE8f6svEh
         4ga8afdL6kFh06loDfAhXHPKeRrR3rC0QkcXA0pQsscn7ZcoNh9yhml7U8tL9pcTqPDs
         D6R3mEVrVrj5Nimk91Qyj+C0uhF8bLoMWEyEp7FquamYbHYr7BCWyWwViFXKbVGszPQQ
         MvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231033; x=1733835833;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIGcxZ8Psy2FDVunuCyBKosiOVkthQlOppOTs772mFg=;
        b=F27dWVcoB2MUvGCXvTVTINOATMRaLxe1PQ9xxKC8y/n6kfxIdPhdK8mo9uR4xYHutM
         QNf3HB6l/ftAWdVYQqk072bbsFQA4OZ30LAhpQCWlgWh+xzsMFvecGOM5KR4qpM5uxOC
         zK84pSk0KKe50BQL8BmrPotdw+9o/sXsQctKb8+iNYtl9+u3SCTQUObLSfdi1DdcF12s
         8SHYatp2w+swD9BRHF+C75ipuZzcboHUfSoYmAnRAQYoEKAu+q8gvaCnF29Kefhk66Hk
         GSgEHV0AIlgXDb58W4vrT/ldwlPvmBYyexW8XS0zi4Cuc8aItCMjLWDqIqlrUrTcE6uj
         dpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+tEnbhz5AkRi3J5cJj/MgY1CQ85/F6+apMwi7ooxfRJ2isJ+G/DK24yEACR03SGkAYM/9qm9gCRofcwUcQ0nNCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhPULxuL1C3mXJ6tI47fMuvpQVwsXVMTzyVkLEQ5KbUhaYCUX
	oM4C1ZRh1H6FrLjr98Mpg0lwWblVBM4bGr0NTsh0gyi3rZqI+DTV7AiVWezBXbI=
X-Gm-Gg: ASbGnct/zhrtiu5f1sPiqGZmA8JQejTfyg8KKQ/yIfavI6W+P7OXvCaU9mBFKTvi/bL
	4X7zFKyb3VLRGcmUBS9RaiU+WTmFnTBg3bKN48/G1e7pY4DCze5hJ/+6bB5m5KtOEgs4gft8fdx
	tw/tGax+WjnhrBhf8AQCcK+HryJ0HvyL0mGMgaqkvbG+8uZqLPPKtPNaTJtHvVtLaVqVo6AtWjC
	9IdYfYtWrcqupgCppraHJPbX0Ahb2BhXnors2Iiv5fkuBTeNXWrwJ1CeiMp5oXhn0OSaPh8YaNm
	z7tI1JKTWUlfnNYsmcoCQVSOidHhKoTD3g==
X-Google-Smtp-Source: AGHT+IEK4L2mxFtzL87PS4BcKmkcVwHyuFe2W4bjoaXvNg7AkfFZpDGSmmvKTSD8eht+D7KFJe38yg==
X-Received: by 2002:a17:906:bfea:b0:aa5:3ce3:7fde with SMTP id a640c23a62f3a-aa6017f0beamr7769166b.24.1733231033374;
        Tue, 03 Dec 2024 05:03:53 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6d7esm611425866b.114.2024.12.03.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:03:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 13:03:52 +0000
Subject: [PATCH] MAINTAINERS: add myself and Tudor as reviewers for Google
 Tensor SoC
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-maintainers-v1-1-f287036dbde5@linaro.org>
X-B4-Tracking: v=1; b=H4sIALgBT2cC/x2MMQqAMAwAv1IyW2hTB/Ur4lA1agarNCKC9O8Gh
 xtuuHtBKDMJdOaFTDcLH0nFVwamLaaVLM/qgA5rjy7YVbzzdo+cLoWy2DZiPTUjoqMA2p2ZFn7
 +Zz+U8gF9KQ9WYwAAAA==
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Add myself and Tudor as reviewers for the Google Tensor SoC alongside
Peter.

While at it, also add our IRC channel.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf1d81bd04a7..2039cc57d8a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9754,9 +9754,12 @@ F:	drivers/firmware/google/
 
 GOOGLE TENSOR SoC SUPPORT
 M:	Peter Griffin <peter.griffin@linaro.org>
+R:	André Draszik <andre.draszik@linaro.org>
+R:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c

---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241203-gs101-maintainers-9a24c8b220e3

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

