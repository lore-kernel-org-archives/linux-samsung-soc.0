Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E812D73B0
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762156999; cv=none; b=rFmwPCXmiCCdoB28OmUrVntwUJOBh2IgAqxfupeJbrYN4K3YJSBiUUa0GLxgnQ1q/hWW805GXPqyYcBukmfZ5iC0YADEB9PHX+xIaXU3zaivH2s7IM71dw78yvS9fPq7bZ03bFzbDLIEZcZSpjg+f3mRgSIwkAwCGmL5WWqbDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762156999; c=relaxed/simple;
	bh=0hmkBcwNi/15Hg41v/9tEZRSOuxBPIYSMFT8w80PEDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dVKc75Qo9prABX8vgkQKzNmVWVBq8Pj0NusT64oYfgXZxiyHn0AiOuwC+K2Kd2xRNir0c2FYHKNTeBW3DeRkf4YCFOgJQmjYAcZPWPhCezTvNR2Gpzqzk2aTMU8qaLkDFScGI8eCet7W1DP3ycfiLgehjHalTOWbRETWrKToHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2tUll6Q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2tUll6Q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso32702785e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 00:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762156996; x=1762761796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIjsDBL7JuwSES1NzAI+XGn3v3VOxvwOWZrbhNp0OgA=;
        b=d2tUll6QszivAmkUL2SHCAQIZT0Gr76sh0lxdbRFLgeRpCOCILWsYAq3QT6nv/GEg0
         0vAsflTtnHy+p0Q/apnyXSes+nmVkrkEnyu2EDG0RKN1l4aareTk7W7FO9iX0RqFsBWo
         xmMxMxikVJWHyIxUIRGtBqJy1EqZ94+z33YM9D9IUCV8MLDLQIbU3vtddsVjBtrs8fxu
         gMJ7Cd/zV5hTTqLh2K3DWns4yNuWKeyMG+1EjWauJThw5meKKxxW58F7KmHA3oiCb3G+
         B1Qe4sIjNvmuMXUEmlppl3vQHFb++ndFpBog5EE6g7noUL1GbYgqcQ2jl/GwRr4lPhdu
         fjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156996; x=1762761796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIjsDBL7JuwSES1NzAI+XGn3v3VOxvwOWZrbhNp0OgA=;
        b=uDezpldtwWmwr8WvqAXw9vG06P6cduDIi7NPKHQKszi7H2zX/FMv0URdMeYIc+CLcw
         h3FgsbJlva5e5k4ntSpMXss4KX2g1NYRAquh4hHHBFlJmafFzex4TCRcYP9meWrGjRee
         ooWVdRyzN1/dhJu9lDafoqakuSr2ecd/9r91xfjrwDlWkoP3H8A/A27Xcrjiti+dQO+Q
         F2J+vr1AuWnIbwSwNP0QmWzTAVTby/F8Dl9B58o6/DeaSkrN1mnlOA8E/rrWnIbtwCCD
         WK21BC4TF9fftHcwRlsnvdelS2PrdnFM7se4XdkoWFAUURSvlmb7UYP6R92WHDan7YIg
         pZDw==
X-Forwarded-Encrypted: i=1; AJvYcCXpAwZILqWhSae133kEacZAby8uVl+MNnZ9pSdV17j6NCwajfrZHwGRHnC+3ZBsRDike6l05+fsK8Ns1UNptWLJJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbWDKHU/apJ7L3k48W1NlGTjXIsN1pwqXVuCLYPngSmal6FQCc
	5/aO7wRUj6KRPE17f6iN0DdWUcX8r/o7GKHcEiuSXj9zqRZLMREI0an3nvwvTXeubFTYKm49p+u
	rCRoglvY=
X-Gm-Gg: ASbGnctZfuvtBat4Tb7p9PKoEZKHaQoCvTOYQmKjvQo3PhijDVIiW9/MaKLOBVOqN4m
	iXU53rlh4p59dWI9rzmUXdthz7jxWeF7O82Qyw9cN5w1hZH7uQ/ocTWud3wF7XHf0ln1MQ/hDvM
	gyhur8odANq8t2jgg/q3fGV1Y4kTY7NfU5uby63QfgyRJkaD1I/7IZFVOVaJrXZDTlDXFcYK4xK
	WiFIK5yCzzY4LFw7IKvbrPogVDSKt1gTy0apcz/tm3JpQAi/kWodduj4iSlrnAitfCx/3nknadR
	6ohZDEKfU711cnD2MTLD5liJD1b9LOQuZ1Kh89w0Q6c3cTFexQ4HeW0j1XKLEge++ok6xdMQ//w
	rWMtzXMztmWK0cr/D/EzDtCopRSZtqVFCxtxccH2gZy4HXQ3JKqWjuQCLepE4V0Sn3t0YuJJVbZ
	7uNxLPMhjMQdxTpSawX9rDQQVE9mlND/ePS3ViYQaRTA==
X-Google-Smtp-Source: AGHT+IFBlY4u+ylxa1NMbQq9AwRhhCZn287qUFC/y/Dpy2fHSIi/d11buCiKW+zA4wCy87Zp0t7RxA==
X-Received: by 2002:a05:600c:19d4:b0:475:dd59:d8da with SMTP id 5b1f17b1804b1-477308c8e97mr105117325e9.40.1762156996201;
        Mon, 03 Nov 2025 00:03:16 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm142336215e9.8.2025.11.03.00.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:03:15 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 03 Nov 2025 08:03:10 +0000
Subject: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org>
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
In-Reply-To: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 dan.carpenter@linaro.org, arnd@arndb.de, robh@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=0hmkBcwNi/15Hg41v/9tEZRSOuxBPIYSMFT8w80PEDE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpCGHAMuubZFKeP+YxESCfaJLCuZ7D8o+Eo/F4L
 pwst4jEZ0+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQhhwAAKCRDO6LjWAjRy
 uhoDD/94q/HSFeBMa4TMs0/aCpk+xFrvu4g/2QXL8QS8v2ZMGq7YC1ME6g6+tXQSMP87ztouMke
 PgxoQsUiJnpdFZM4skWp3URtpnWw+gBXhecAPHLHBSVNcdlP8I5rp3aBgj0hg8bkXFbYzJuApyJ
 xzReuVHfHxmG439toyIxW3hFEeFL9jfp27Sw7rxjsjmeXlDJpYzFpq1x2hU35tJDUN/iKmZcbNg
 UKs2tIEWRCLHdRh3qKupwgJ/Na0VWuykESGVmi7KZp8xgl/HR5+4zazpKCTIJZhFtFcq8ng7VyA
 0CCgD1lvOCZkNJ6eH5USMT4y3c1g+GK5o1rmr1LV7Bxc9MFijfpU0DWA2JOGeYvUjqpgGn7cyTs
 qO8McQ1j5xcHHSX2CPbyM1YQQqdXgo1t+/of+3A04GmR9Yhev+PqIrO7faAx0VxDsEz6PHdaIzE
 pkpBxC2XMEpQduylJlQSBylhManiiOMf6X1aKD6+/iVST92YboV7AxV4+etL934GSyVRkOlgxU+
 mI+2JXOkDBR+iUU4MHqLd/M49nNtibv3GdVOG8j9OsH91SAv6wdNZrQCsLksQ+WV9sx8sbCPP4m
 RIOFEvkpq1+IGK8HvRHKp2SaklEbxA2iLWEe/AO+65uLHuiOaWYAQx5JwofB5n7aBfZOrb12dbP
 Ozg1X2C/dJkz9Yg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

Update the bindings for google,gs101-pmu so that the syscon compatible is
no longer required. As it isn't really correct to claim we are compatible with
syscon (as a mmio regmap created by syscon will not work on gs101).

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index be1441193feeea1c12d0d5370168e9316c8dcf76..c5dd132a2b6948f8eda93e4a32ddd1b57a83fcc0 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -34,9 +34,10 @@ select:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: google,gs101-pmu
       - items:
           - enum:
-              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu

-- 
2.51.1.930.gacf6e81ea2-goog

