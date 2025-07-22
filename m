Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EAD2E49A7;
	Tue, 22 Jul 2025 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186279; cv=none; b=fn7l+ypBaRgzReviUgtemWoA4921r49SbS55BW6xkahm3GlRBDeEoc0aSxzpz3wv/QnAf2sm7vXw/3Tq01hLskIS9lTRH/p1IlOgUtcZCOV2tnhYTAYNncn4lOcWWZivMkX5z3U7u7/BMqBKVtPNzCgbDEvoYOrBHrLg2WXs/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186279; c=relaxed/simple;
	bh=GXncA0w4javqJF8zm5IGQt0DAzPIyizj3XcdH215mA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsvu0c4TEl9Hffz3H0NeG8TDWbAcOtLG5JLS3Y3i0f753iXJrr2X1GyjiQsZHm0c5U1BiVuXaEdQVdDxyfWskrBjzzV4I4aICVjN7fP8InsRsbwNgTFNU+DnFGHKfaMSn5u8wUtAWvTrh3lVQa1m+J5AhFSjq7E44fOY3zI7MXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW65TuZE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW65TuZE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so8283319a12.1;
        Tue, 22 Jul 2025 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186275; x=1753791075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv+tZhrl+Wcn6uFNNvEUj2UjskoQOzByDgdbubBH+Cc=;
        b=LW65TuZEybH4SymA06ueCXNMUhC2fu8ng9pL+ggBrvdlcgU2T9bQBAeErsqtrq/l0U
         O4JY0gfP//odbZBX5391zPqx9Yj5QivkQkurmVTQLS2NTtqSvYXQe7SiSVZCx0nClqwE
         avzhycn8GyLeUkep9J90nYZCRGW+NUlJ4r+ofznYfdHIWzkBggvp9YEvbV1BG51endU+
         tZiG/Ubuha561UiLRpEdSOsTfxVVnLyXnl0g1HofjaYtDOpwaO8jzro8FoKopd2cinI2
         0m95bTNf2nFIOyoOXrUpL2P6ae7wVnAykt1HVmERo/rHna09nF/uEg+c+pgrVVkyf1qD
         RNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186275; x=1753791075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zv+tZhrl+Wcn6uFNNvEUj2UjskoQOzByDgdbubBH+Cc=;
        b=o4lVxbuD0iYWw52PNKNcpOnwWyFqo+a1STNJPBRzyM1QtBCmvnqAjX8MvTmEhoNv1y
         EIAZ6Gw1yIu4HgR1YG0B3Xs5xQV06uEmHognJ3r9+mYcJxdznqDN9m1jLee1sh0ZiwCr
         7gcE6InOBz9zJJIkg8VLSwAwArFtfI6E8k6g1CzahMldffBHFkpJjCTQdIaaAh6SyfFp
         5XTKJTM1HKp8aKxNV6UzljpWoaiJTkP4jpndzVPFOjp9LzMbVetaLiv/+HZlnDAH+8XD
         kQDjRCyCZi2K3jkWYomzjBqi/TSnREh/F4tWspv3iw2ZuIy7CruVCBOMHKV7Qi1HSkH7
         b8hg==
X-Forwarded-Encrypted: i=1; AJvYcCUbU5I+rb8ev0uH2I5zJnzSfWEriexWvXpTZvMQrE4S4oyunefrz6on4brqBCX+JqmzSZuCxa9XrcNESrvE@vger.kernel.org, AJvYcCXJ3NuMT8D8X74G6+oSpf/RNdNmGztmnmS/GAi9YlDplW6OoTgoM9jETu6iUMSw5INskvja9FEvnQA7@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYM5wNypG5eZnqq2oBEPldHiFq6L2Tfk2rMaYFq5HzT1Gp/fH
	gnmtg426PuSmBn+xFycB+AAuUSuK9nABufyo4PjFQIfdEtjHnwN+CcUU
X-Gm-Gg: ASbGnctZ0h7Qjck6jFA3C3TeBVfdHTwBgpJcxmlY/iVR4eIlyfkkFYlKvE7QwL5yc/A
	onIgOv0fOSJ9Z1r2gZV5Ujqr2iPBX71yMTMINzKXMFUXjwZKL0vtEO01a2S9B8RmiFc5hu3YHdE
	z/wzZBLQ2cDjVfIFV2CsNLUIccy93dDgWRfMWpKhX2wrfP++W3/MRB5iwxtigBSHZzSy1ExGQfK
	W/pcXgMorTOscnOxq6JglprY2Ab34/RTgWbG19m3PEqNQ2f/sngb4vvH4bJQmMO0A0clZD91L4g
	4cGp4fF947LbEnHI1vQOxEaudu0o4xbDDsODaOWdycPZdcxFD7qvYZTCaUtkfgGbkprOK2BwgXc
	b/LQ/R/45lBCpYCafXZxm9gVl8KOd8e0bJtDmise2TsiUm9d/d85tg5OnBbVM+ZJf/o4U2TkDdw
	==
X-Google-Smtp-Source: AGHT+IEDGi9GxqWf228UYf4p1deeBYNNfVBgTG+JsaC5v6+BQixV/bogyGY53axRn5ejj5ISEIoQyA==
X-Received: by 2002:a50:954b:0:b0:60c:52aa:d685 with SMTP id 4fb4d7f45d1cf-612824ee8c4mr17190623a12.28.1753186275119;
        Tue, 22 Jul 2025 05:11:15 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612f15f596dsm5090257a12.51.2025.07.22.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:11:14 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible
Date: Tue, 22 Jul 2025 15:10:37 +0300
Message-ID: <20250722121037.443385-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung,exynos2200-usi dedicated compatible for representing the USI
of Samsung Exynos 2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 4ce871676..bbf6d3b2f 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -36,6 +36,7 @@ properties:
       - items:
           - enum:
               - google,gs101-usi
+              - samsung,exynos2200-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.43.0

