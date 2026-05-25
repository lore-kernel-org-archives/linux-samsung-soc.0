Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07C538398F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 May 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713435; cv=none; b=an+WhdkmBIb//BhX3hB4BZrbWHtvEVpsrJZpEOe1iGSwCqoxMzwMQo4P4g1JgA8oEfZc6HgDC83E+7oKIkJdd1RhFw89m7x2aBjv66ca/8Qt2qk5YKmHV7NrqBqln3IGz6Q+hjUi88xLjGrTUhqi5BXZ8Qt5PeXyAM01il9CaCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713435; c=relaxed/simple;
	bh=j2bS/h+sguKS9/qgJjI48x6qOqG+tkwy92XDxvAI8yY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgkaEDpEJqTwuAHGCQc6/m/GEKraTPJdXLZvly54SxFu+b5ddZLZJOiHxDASs+vMlVj74hHAW/GUYi8fqf93/zRcvrCU9nNjklGBEzpug35Est9QRoVHMnw89zhhP2Yat7G4QqmbxtREZ9FsMy+ob30fA/7de/ZaLnbSSrZpISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZtCK1oVa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZtCK1oVa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso39313965e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 May 2026 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713432; x=1780318232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeWjSlPEDikRvLF1aU9lZbkxd+9N7RugqZlM/tjJ0Bs=;
        b=ZtCK1oVakbBOBeF7teScTDXDYTb1wh47DRq3QNmsOu92Aq5LECw0ALWoFn3FU1E4/P
         bkUh2U2obVuEIG2qc7RDwPtio8DFxBLy92TskAwhJ6Lyest5jI3M6fUmxoVV/OwKeXWc
         80nsy9VNDab8k8wOyxPcynbwV4gpmFEd2wLFvn8BBPZR1u0mY9KzyOKs7abX2s3hCbYw
         +3ZRuAWPMJdUkHq6gfWX4Zj6/rBeDD0u3mdhvlOGVSOSqUY/v2keVXnVZIbPEUfY7OJ+
         lWkhRyp7PTcJl2d7/jteiZTD1ZHvkGts1CxZggu6eRv/o0Pm4iVtOmTNpAvPW0gluuad
         MlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713432; x=1780318232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QeWjSlPEDikRvLF1aU9lZbkxd+9N7RugqZlM/tjJ0Bs=;
        b=M0usUVnutasbmYl87Ac72NUMbxbai22YEpOaxpFXN0zyquTOpE6POwlYA+OgDCQ2L1
         NulVt49xNNEYq6/jL7LiwKHoE3VoVFd/324nTLxUcwYXaLTNU6lmBO9euccZLc4nUuSk
         mOfzDfwEoFivf4PpXfnu6AIcZ5oXgS4vTRwx6XJGCjnARvgD93CtYO52YfzK1GlsbfMX
         Xt6dbYwUh+RLm21eZlKvLfyyi3MxtI77uWfpuwyxRXhwOBJdQstnGv6KUXTLHK4feORs
         efbwbsZz3Yq3iMip4uJu+qlxvZE96bYFBGZXzU8Q8CozXK+9b/OxOcrm/LelUNYvTidY
         mrpw==
X-Forwarded-Encrypted: i=1; AFNElJ9TjYBRDH6hfz341vpweahl1ALHt6PbLSzLxv1wKgZJ8DXYJJXzNX6Z5r588BfWi+b1Xsei9kH0+YaUHt3suQ1qhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZp4WAOqn4VTahWkbLyJj8dr1lmRopb5je+v8rIuBpRmlyBuHo
	OS3b2eHk73rdj/wYyIaAXtnbnZrFnmRjIhDkztbGAmsGNdLGzQiW5WlQ+tWsqqlUhrk=
X-Gm-Gg: Acq92OHQk4S+OMvcJy+nbkJsRIyr/Vkv61SVSIN8DTW2/u7oN1wirIbnN62E6HZlcfO
	xTl9beVfYw+gZ7133xXCH9Eap+A851IV9w0bHBllKqPXdK0Zc9hXRdnEXm76UdMnewKSdbbv5gI
	D30ys32fw74zm/RDeSPeAup8i08rlMzNflw/1ccZPq8Ez4u95+NpAYY757XEKs29QmbstY9DVH9
	o90NB1bX56NaGMawzvZzB3JNpTolD0/MuqSTWRnzGHpRmkthGxcKIzAIuJgnkn5gnP0bpx5/BuU
	oMFkcmTM3zJ9b+1X/6FMFGgthLZaw7p5mTKiCkwAmydwqW8ZgdFXddh15FrWUuNws3hVgM3uWgl
	QKlAYaP/877JnXub7Ommt8FfEtH6gpKe3ez73i3mO93kf49ZdgXFkGcbwC5L3mQMH2NZ0pbv+L4
	OW9QCoRqIud5agNx4T3DTZKPIelCRD0Rr8JRTxkssWhoWhN1ejMy7C1DvlpQ+rKs44gt0x3OWQ8
	yOV91w=
X-Received: by 2002:a05:600c:45ce:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-49052c07823mr151219345e9.9.1779713431711;
        Mon, 25 May 2026 05:50:31 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 25 May 2026 12:50:23 +0000
Subject: [PATCH v5 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpm-tmu-v5-3-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
In-Reply-To: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=988;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=j2bS/h+sguKS9/qgJjI48x6qOqG+tkwy92XDxvAI8yY=;
 b=wGj/ffuuA+IGQ5pRdRuMChnrz10mIrbyGhYYPnunxYqt6E370YQjJM3fCVLiK7mzpJhj+Uf/C
 82tUXkViWFXCDZJnfAcgY+c8oE7hfjIUHprgnbQm2BqPxOtrLUp7s5v
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..7ea3b9d95ccd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23660,6 +23660,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.746.g67dd491aae-goog

