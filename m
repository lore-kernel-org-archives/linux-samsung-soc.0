Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1061FEE;
	Wed, 13 Dec 2023 14:42:20 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6d9da137748so14541a34.1;
        Wed, 13 Dec 2023 14:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507339; x=1703112139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7K59ooZxYuShhkvJvLN2CDgTZo+xPppYuqKw2W9W670=;
        b=JFAZwRQj4q8cNTgJ6GxwJHiRiRqr+Li4RfbnyuaQZeauoqD9ruLr48ZaZgMXVGEmgu
         4ktvPm+Rx5uhq7jqYtLZTCtS+pw9lxeRM/BdQHDmLPzS8qAhHLq8R/Luk+Ew8nIS2XLV
         erMHbxeSe+tjZS6n20zXgcL4fmav9+x+rkbis6pKw005zWcYUX4zSHN7Ee6Ti2RuZLZr
         ROXvrUSGdDEwl5gZN7P9HMIlz3szCrgzC7TApQgBYfCkgMMe7ztl0wYgbBc+D5rXqinE
         dhQwIBJVC2coyipyOha9sNDTYpiiufuEiwm1duBqWbluqRNOzwxnBngJphfhWjeTKb1e
         ttaQ==
X-Gm-Message-State: AOJu0Yytn/FmPyNILeHIDmlGU8nSZQGkpqXKonzWp3N+31XCdTns3/ik
	3mzTAoxQw+rqVeUwg4u8gA==
X-Google-Smtp-Source: AGHT+IHA7v1ulJzaKFeMR6eraq3R1cvHVp0vITLPnmA4eQUScOFCp8FpxEiaB/KLNBmQMGs6sL2urQ==
X-Received: by 2002:a05:6830:84e:b0:6d9:dac7:8703 with SMTP id g14-20020a056830084e00b006d9dac78703mr4444660ott.26.1702507339248;
        Wed, 13 Dec 2023 14:42:19 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m19-20020a0568301e7300b006b9cc67386fsm2958534otr.66.2023.12.13.14.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:42:18 -0800 (PST)
Received: (nullmailer pid 2191688 invoked by uid 1000);
	Wed, 13 Dec 2023 22:42:17 -0000
From: Rob Herring <robh@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: samsung,exynos-mixer: Fix 'regs' typo
Date: Wed, 13 Dec 2023 16:42:01 -0600
Message-ID: <20231213224201.2191358-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The correct property name is 'reg' not 'regs'.

Fixes: 68e89bb36d58 ("dt-bindings: display: samsung,exynos-mixer: convert to dtschema")
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/samsung/samsung,exynos-mixer.yaml      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
index 25d53fde92e1..597c9cc6a312 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
@@ -85,7 +85,7 @@ allOf:
         clocks:
           minItems: 6
           maxItems: 6
-        regs:
+        reg:
           minItems: 2
           maxItems: 2
 
@@ -99,7 +99,7 @@ allOf:
         clocks:
           minItems: 4
           maxItems: 4
-        regs:
+        reg:
           minItems: 2
           maxItems: 2
 
@@ -116,7 +116,7 @@ allOf:
         clocks:
           minItems: 3
           maxItems: 3
-        regs:
+        reg:
           minItems: 1
           maxItems: 1
 
-- 
2.43.0

