Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwSzxSYg"
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0EF2D54
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Nov 2023 12:06:08 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c8880f14eeso2179561fa.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Nov 2023 12:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683567; x=1701288367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yVlYf01Klh91OZh9eHsXRPSKeeV6vlK2OWkU1On07Y=;
        b=xwSzxSYgj0kC/Fh3tGw6cokWndlU9j9dNbompQTc+Rrp/GoXINa2bNm2BGPiXv3Git
         3BlywD5Mpbu/6KpebD3A1x9FhhY+XezKH/ktTRu4hP39qJ/5DYKgMl6wNhroV9aEdj34
         ypBDL2yIShM2nB1kespAYEMgb5j+K26VDpmiAIC5IlDEYESXAzBcDRJGqVHS9/xFrYmg
         MT3NQQ6z+A//3U9adIVe4gHh4JndKl52WvqBW1/k5FXd5AUpjTXWZQi2ZBzTErATmi+A
         NaGm6M7nr5d6ah0fCh1Np6Fi+8js5akAxY1ZtmSEGqVvyDH3nN9gvvsyAkEgOIrARj5v
         NDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683567; x=1701288367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yVlYf01Klh91OZh9eHsXRPSKeeV6vlK2OWkU1On07Y=;
        b=be7DyG8/h12koGkeWxviai2v2EMjLRSGpPnkChBDBZfMuHtUx+5nvA/os9kMDDIgIq
         rNINZGCTn0qQVyuHuZBI7Q5P8/+iPLJujsrzQMqtaFCgfB5Krqw/pkU1yFuh+7I7j2P2
         gGvj+oKNx9UMB1TBPytg2wnTAS+KvsIQW67S0sWRq5xC3KRytefw2dbj6yz8iFUe6AO1
         z4LyTDE6VMhC4qKXaVXHRo8pJ9wUvriADKIkM0hYcUTLuALFPWv+FM2QKk5IbF6HOoUG
         wBFSOPNO80lbMhdFXLs0IiW73JqhF91US39zXLi9F0SVLcYMkx59rLSW0Ylj64Scc20P
         koFQ==
X-Gm-Message-State: AOJu0YyKcgiCZkHMmxY3F0RLckL23aIk1SfHXB+Ni/G45yeBdYPWGdMN
	DPzqtlJLjvkpS2K3TAdn6ghuQw==
X-Google-Smtp-Source: AGHT+IHLz9iUbLSFP6oa6QMg4jsxTZ3/jvsp6/GOCMQs3KTkInUCjWZvzthjzrHbsC7dCh84psI5bw==
X-Received: by 2002:a2e:8210:0:b0:2c5:582:fd8e with SMTP id w16-20020a2e8210000000b002c50582fd8emr2461231ljg.21.1700683567177;
        Wed, 22 Nov 2023 12:06:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c4f1100b004063c9f68f2sm394665wmq.26.2023.11.22.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 12:06:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Peter Griffin <peter.griffin@linaro.org>,
	semen.protsenko@linaro.org,
	Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 2/3] arm64: dts: exynos850: use Exynos7 fallbacks for pin wake-up controllers
Date: Wed, 22 Nov 2023 21:04:06 +0100
Message-Id: <20231122200407.423264-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
References: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos850 pin controller capable of wake-ups is still compatible with
Exynos7, however it does not mux interrupts. Add Exynos7 compatible
fallback to annotate that compatibility and match the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: semen.protsenko@linaro.org
Cc: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index df5ea43ebcad..da3f4a791e68 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -359,7 +359,8 @@ pinctrl_alive: pinctrl@11850000 {
 			reg = <0x11850000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos850-wakeup-eint";
+				compatible = "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 			};
 		};
 
@@ -368,7 +369,8 @@ pinctrl_cmgp: pinctrl@11c30000 {
 			reg = <0x11c30000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos850-wakeup-eint";
+				compatible = "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 			};
 		};
 
-- 
2.34.1

