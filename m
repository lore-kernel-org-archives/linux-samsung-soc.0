Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB30274B35;
	Mon, 25 Aug 2025 05:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756101081; cv=none; b=Rkf5r8FCMN5IOluHytkTNqOFTBDnsfYEvrLYkeNj7iG11h6ZJLYAOkJzHirD5wXG8IvAyRnI1DjlgQei7f+U+DErEcipCbK4VoBeJ6Ry6TbLyPXQk5ZVkdMQh2JESVdVmC45/lKMoK8JwoxUjj17SXD9PXMhuHTQqZrJ9/D4INI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756101081; c=relaxed/simple;
	bh=AFWxNCwJDRPuUp625KmPRnIz16SzHb+8zKtDFa4qFN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXAoHEtfWFTk8n2B7mlHq2kG4fiHpiRQaVAzfeChaw9EA4XdHuQR7SDXlu79rh7H75tnHBi0++5K/bQfhoYiv5/myI6xCuPwbBUPzTIa7xcnweh8n5yZ2rZkw+0+t96Kn9Wd3TFHpzu/JrUO9UK7Y0peEvcn++xRBozKbNOpsqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaxqAEVp; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaxqAEVp"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70d9a65c356so23913026d6.3;
        Sun, 24 Aug 2025 22:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101079; x=1756705879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DnDUtD4Qj8iqvDFoINyvhmeadku9ykxvDw0dyGhUEU=;
        b=TaxqAEVptSMUs59VEawvX7Gr9ScW0UjIjRTlWG+dRutQFSmp2jiKv3q11abLz9svp8
         EcFseGDqchbSoQX25AoDmiZFA0eQViNOjlJBmKJT6t9LjSfbui1mnchLIWGLdtlnWeZa
         7E4po25kx9R7EKS/CGcu4u0WOpfv27HGLSarHpveo8TLIFSRugwtDLbrrEAH6uScwj8U
         hBWDmFXAfqZo/B8xXN9P6XmKFbCkx2yv1QDirmjTJFAOzQcYCnT640ETWsHwtua8MZed
         Wqnw0ujoWWV0iAFypOP/ImSRZJFSstqeF+8cBIQ7PQlXpQaqIh7z6xh8XqwergFqAvU9
         QrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101079; x=1756705879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DnDUtD4Qj8iqvDFoINyvhmeadku9ykxvDw0dyGhUEU=;
        b=Muxp6tpKwr1OK4HexIHJXAKd349KYq1wjk0WIC5CFeR1tClGMCCKP+bxGb355/ZlwD
         LOzpcykBqMJnC3731sfUlx2hNoyOQfw4qnZoNaXE5/0NRvNtTRDc8gSwe+15fhTm55UJ
         g5zmVENj0irxJmnGRMhC9zbr4iu/ObotO5HfufRtrm6k8hZZX7oOL6Qmjmakoy7/Q262
         k3jai621XICSFMOEHQXo6WExBwGLY3bnl0PGFjyjYdqoYX2wzBH9YPcGQwJKZwhffWaA
         0FofHNJ5N6toL/uAnNpGYhWlVtQoM2sKfgM2VPiebo6Vt7+hppS+SZkTzWwaj36jfTdv
         Zi2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFDKvaujMmcqKz607snM6UT5Pcxq04Nssgd9q7jzv4YsENLBMVZegLemPp00Stx8wy2n00B3mZmU7q5wBc@vger.kernel.org, AJvYcCWxRmff7jDfWpqIT/Ywcq2ZT/FlpFeZelF+1MpghxT4kXy1QwntsTQMB9d+GJNuNe1dZ1Q7G+RWbvHk@vger.kernel.org, AJvYcCXx0fpN1G3Zk6BEBaDBdQW2bSIp6c+mvfOfuaACXPEsqdmrunY6V1Oxw94uoOfAs7PvFOihdlCC6HlH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq58Ytd8b4KWaWQIzj2Hd0HS35kvaPVCkljAJU/YNaMDUemnpz
	T6A5nnS1EhPB7e5u+4Yc0H0BOcsTHraveLTfeYOAryQ8VwZ6gAScesSR
X-Gm-Gg: ASbGnctIkP0qU0bwJeqUQVQKR59b6KvjBgvnYbmedYfilvvuVWrdo4ExTidIwUSEJFG
	Wc5COu7XTA4OsAYbNEvCSUsvLAGrtvwXuEqaEmlKE9dphwGuLfsgWEaHMbModVFgChDX9HIMgUK
	fw13sBTehD5XpHFzh6sNOEiP+TXp8JBMMZr/1ygAx0K/vRfAoKJ6NNNggDtjGPrrvbq2isFOa9e
	HctJplYFpzbNH9jQHluHOCHWydYTlbhcs5quZYRhh1JTWyHITDbkwwA2g8/DbKRGIQWgXqKhMbs
	OquqN6govUKEZJjVvHHZ8bQqMHCrNYC7TUx0Ph6YIc+zgENPyJ7UqymQLwOdotn3OF5h0jz68AN
	mWAWBfr2E744mG6RRITLu5QxkQrEyEw==
X-Google-Smtp-Source: AGHT+IFm+RMujGED47u1rJf/yAfC0k8em4ZiXhJUlGDICEJjixloJsVgiXb6kkwGGSGYn4pkBZneiQ==
X-Received: by 2002:a05:6214:29c2:b0:70d:6df4:1b23 with SMTP id 6a1803df08f44-70d97245950mr109479426d6.64.1756101079219;
        Sun, 24 Aug 2025 22:51:19 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:18 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 05:51:16 +0000
Subject: [PATCH v4 2/4] dt-bindings: clock: exynos990: Extend clocks IDs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v4-2-71d783680529@gmail.com>
References: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
In-Reply-To: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=810;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=AFWxNCwJDRPuUp625KmPRnIz16SzHb+8zKtDFa4qFN0=;
 b=86l9x9jH4KH7N9/7czWjjlqusOscAoMLCTWzrM9rQcezqMzVH5dh6OLzn+x6z5pWd0ZqngQAY
 IGmd+ZOsuP3D/Qa0TERWIGlb7opv9J3RSwXziV3+Fb3b9h1QMgteBki
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=

Add missing clock definitions for DPU and CMUREF.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2..c5c79e078 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -208,6 +208,10 @@
 #define CLK_GOUT_CMU_SSP_BUS		197
 #define CLK_GOUT_CMU_TNR_BUS		198
 #define CLK_GOUT_CMU_VRA_BUS		199
+#define CLK_MOUT_CMU_CMUREF		200
+#define CLK_MOUT_CMU_DPU_BUS		201
+#define CLK_MOUT_CMU_CLK_CMUREF		202
+#define CLK_DOUT_CMU_CLK_CMUREF		203
 
 /* CMU_HSI0 */
 #define CLK_MOUT_HSI0_BUS_USER				1

-- 
2.50.1

