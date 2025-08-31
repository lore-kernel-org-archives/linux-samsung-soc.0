Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B4F21E0BE;
	Sun, 31 Aug 2025 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756642399; cv=none; b=HNrYqkoCBjyWVJl0IzmUDiVfguwYzmv5CMcwDJAMZ+76EcnNIbbHb5EZPhju5nvNp0wACE/oaK4HQM5N7EWgqnBIZmgFB45Hl5pe5J9NmGDgM6J3/CLbVU9m+y32Q7D6bDLMoyiBB6NcRU9Xc+LABktK3UPNj9+8XCFsz3yaEWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756642399; c=relaxed/simple;
	bh=Y5ib2A821TGtO7Tso5IrBl4dNZg/AkkxdznejeB74+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccx+dYh1SjbDDzAcJFXU34iYS7XszGpwWzBXUWn3eXbwNABrnPax9l1S+zFwc4Rx7nEmhjfIpbfHkSLrJzc1VpBfffPqk623hxh3ob7q0d9ulMtLjugOJWqdI4ssdn/hucREpay2g68+8yojQmO4fRtcd6Rfuz5PBbxZ34r083s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hekUnBdk; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hekUnBdk"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70ba7aa136fso25920876d6.1;
        Sun, 31 Aug 2025 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756642396; x=1757247196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLW4o8TqjSoRJfpkzpJagxw2FMUA9RfZJvxZztgDSlU=;
        b=hekUnBdkBs2qA9bijG+OATUWl7RQYtjwPT2xycemtSIgfo1ZalOIE5F0ft9KHbPhMV
         MshLyCiUqpJJE7xxPGHpDm3nyRcoT3D/SqPYjBdbKu5wG9hRSPpThgqrcvQSekMmeJri
         5yjB27LDGQZIf1p4mObwsPxUgHNy7TAaNX+XBNLCBqKsb+rMk0obQto3dJxLKL8iQizZ
         R2JyhkPrGYft2lSGHeBrukxIm2LAKH0qDsY7J04wzZK95JOfvsZwE5XwDwPHZCqX+LNU
         yRV/Plq2/NnGsiT2U9Gzn3CuVNqmCiuwleIAI0hE3IKTncEgMx/mFBwMXfQFPDL6xvK9
         ctPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642396; x=1757247196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLW4o8TqjSoRJfpkzpJagxw2FMUA9RfZJvxZztgDSlU=;
        b=mDwtSNoD5KpgSzZEpAgrJspfzY1rRKYPWA+MHHXwQ++1rKYR0WhriTF2ggGdkRtw2j
         wqVDn+YRp4jyeRLJHlteyuhnfLRMILs51EYQWoqc4B1Y1bdFL+HVZnARayOuYAIuet5q
         SlzQaWPMZYGFP2KQp8yPJIXjlQBGhcCGVKZi8BtAkN7KlBls5IDE6LWF9qkeXSrd03gP
         jbVZE5dhmJgU4Dv9Z8AoG+gTbv62ClTFmq4+k200a3NL5VoJTrspWO3Q0jY+1YT6I2D5
         zakqmngJEHzkstT0eyGsqUwO/sms54nYQVIpqb2QRAo38DkJW9zQNQRP7xRv0DhX9EUj
         fKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC9AzkbWXFURgenVVnA2fkwgX5yN4jRNhZmkZfIEmPnSeyPkIlNLmvdw3hdmikcuZupaCGzBfSlpnOuEQg@vger.kernel.org, AJvYcCV9/hhIP/CA3IbL6m4+Tp9rgOqQyl9HM8RY7sRNuaSUYf7se9/YfRkfa+WypE/cM1PToSvYOYXOtSv4@vger.kernel.org, AJvYcCWg7cNmx9V+aRIPPx2l7/jnCdNfhilbaS7zFDq8ZF7l00FVGb+yrh63deWamq2VxuccNgdstVEl9xBv@vger.kernel.org
X-Gm-Message-State: AOJu0YzFhZbD4guDqs6U9LWwHlD4/X5k/ZkNMFuyDX9Usr7CBrgyTf1r
	gGWzsm7ZX0sVojagSy3bGRDXT5mnOtUb3WUclbzYlRrvHZ/Dnb7uXB8s1R9vv+fBDj8=
X-Gm-Gg: ASbGncuQqmC3TvL6CK8AaBgVMdocYL7Ef7UqZLQL1vYznXwJz0kSuJF+veVUiefb92j
	PD70MKjhoggQQSITWl6MqpMVHOvHJXiRU9K6H9cSfhuqA5jcn5hrr6X0Hn1oafLH3H2wvHhxZCR
	e9hkjqijUtsnOw/u89zXnGO3dY+n+QiIjbQ5JULahkIbtkRD1PNyQD+T2xECoSD8JAq8sAgjdWz
	nvxm4fsXCco37jHAnk+uR7DYMgtapW1SL5CajigtkexZirfGAsbJyCJUiX7inf1RHuIx0ItdMiO
	iBkWH4OIKyh7kmFhl+o/Z07lqCYcNI0lsvQueRYVQNwPc+c6o+Lx/AeSC/5ZhJ5XeXu/IN+vVTg
	giT/CtbEc2bDJjn9uHEEFU50ePzoLCuNcoaJZBCzmkQ==
X-Google-Smtp-Source: AGHT+IFq/g3TQ+XqqlFDsxHEBxwygx3QkvDCpE4NZLqCGV+ZN7ZX0rbuA35IX+mulLiCxO9MFziuXA==
X-Received: by 2002:ad4:5ce7:0:b0:70d:dfac:f191 with SMTP id 6a1803df08f44-70fac73fb82mr54801356d6.16.1756642396475;
        Sun, 31 Aug 2025 05:13:16 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb289f518sm21163776d6.56.2025.08.31.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:13:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 12:13:14 +0000
Subject: [PATCH v2 1/3] dt-bindings: clock: exynos990: Add LHS_ACEL clock
 ID for HSI0 block
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v2-1-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756642395; l=964;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=Y5ib2A821TGtO7Tso5IrBl4dNZg/AkkxdznejeB74+c=;
 b=zSaXZeYe/Hz8dpMJY0IGGqiUCvUC9X2v++PPU2nt4T5/ax+RG8q9r6kmZogQmtrX3FG5f5dc0
 FFrIl9UZnP7DuVn2PRKFg5/aeGZkRf76GZgDJZSiH5F5p7uZCxgGKbx
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add the missing LHS_ACEL clock ID for the HSI0 block. This clock is
required for proper USB operation, as without it, USB connections fail
with errors like device descriptor read timeouts and address response
issues.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index c5c79e078f2f60fdb2c0f61ba6e7f3c6f2fbe9f2..c60f15503d5b18b11ca9bdce86466512dc933901 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -236,6 +236,7 @@
 #define CLK_GOUT_HSI0_VGEN_LITE_HSI0_CLK		20
 #define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
+#define CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK		23
 
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER			1

-- 
2.50.1

