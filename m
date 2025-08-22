Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774632FB639
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864879; cv=none; b=EZ6igjVuHeoNIGPiadL2JRC8rp1G5J2UU+S87vkeyonj9ch9AEc6wUWn7zIer/o9gt58+WTZUcjFZBAQdaDyU3PfGHVBlN0ORFuJUX/40HQUTDgkAoJUV6qNwKphRxAF2lbUhHY8u7b8aqd+zvNifnFJhb9YQAVJi5AJ50setYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864879; c=relaxed/simple;
	bh=Xg8fbeULkVAunNHSuMSzm27A8P/HmltLuUUNMaXdfUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVhTwvuynkb66tVe0d5c6qanyAhwwEJ+4qp6py5mOVdvFov8JXkKWR1hg521KT7woigszAMTqJxz8AvkHDltyD9z/ksdK8yn3jsP9Hvwz62CPwJvS7ENlnLKavzGaC8k3B0UZUP4eekwdC+7ho4e7zVsGH/vf1RyWMb3+d6LiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpZ586V4; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpZ586V4"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-618adbeff22so236449a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864876; x=1756469676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS3pk4A3vwWotpGEwKef8o97dm0WRz75Dj7bwTZ/WIk=;
        b=FpZ586V4jzS9Sag5EmwpsZGuE9eFD1gXm3TwlB9woUbDVQrgdAa3OfL8Itp2EPK11Q
         Hjb+YzeOSM6GfG0HDUDWfrM6/SRnfixuvS2/R49U63+NdrL201P4re6QPlB4kYCP7EQl
         fzf4TMp82/2aP+rerfygIyaenkG4AmA8xsuAFspyn9ydHg0lCP8/q1g4ohBHREDBvysa
         Zfq/vgsYrjHMCNmIOmBjrNdVHOuwVA1EplYiEsal3wpPt+F+7jhvphCR4xJzcDelsnv+
         bF3cTkj4SbIiVPr6Xu1ggM6tn1zgbyla2BktMKQ8juTANULfQQ0IZS+/LuLMzhotbBoA
         N2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864876; x=1756469676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bS3pk4A3vwWotpGEwKef8o97dm0WRz75Dj7bwTZ/WIk=;
        b=a2KTgR2lT6n7gtT7dR6M/HR8kqw5ZZK7BnKEdYFhJXCABDcsNCtJYJOZBpnJAbUJa3
         M2NB4vLONsF8jy8sWb/g1Vo7XrA176AKz5choMgszVyv1Bi4BH9rWvsh78XSeeYq+Ykn
         c6SXRckiF4quReSUUNgp+t4IqCktFADCXByH+E55Vrpwg0+dU409hbTV5okLj6C1yaVK
         gAU2mIxFO2FbRT9c4xrEiF0R4gMHEQiCOH3x4o4SKnAXXu6zfzIhFj/00yNoRcl/8uuv
         zUPF5qcogeh//qA7EOtNXYXX3wDFRd2riiNlcepfIhtyl26v1r2ax5eaxvhfVs40NAJ1
         XFoA==
X-Forwarded-Encrypted: i=1; AJvYcCUFdsf+EEcvo6UH5xyDQTCgQCpWBR/mq5l48WdgdjDeWeel1b1KyDp5U8X41iMLmmk+gOjVwAXex1/tUJJcH7PkEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza4NevsGedcFgIl+mYl7jsJTElIq7nehWgyEsNWmQbodbgBJCg
	ZSmt7yiGcEl9vjJU7nFn5zfYXvFzzqGLXcsDjiH8fPxooXg9RwhdBcf76y+kRku4IrI=
X-Gm-Gg: ASbGnctkS60bey2+aNXrbgyqiS/4u0/wCVQgnu4+Ih3q8fvRgehwh1aOudmvOH8zWAo
	O2Y/YmpeH1uTbx6uljlCqwsFor1gUfcU2T0qJzKUWHZGRGQ6qU+J3udakOJI4Cm18qm0wLlBNwV
	OkKs0Lfy8wPfSTjzJlmzWFnFdotMtD4fMj1J4FVCN5kTB0eILId6PkwMImxEXmwQ2xivawGECC+
	LEAvOJZlqbC8Q/x4HmUEF6AVqi9x0E16jwUi8C97VlORGS7bI8K4iy7AJKddoqY7yEegoqPctdH
	8mbHJXfoy1rTdRsxF079ejOazNAntzO9gohTnyHWa+ZGJgm0pw9tMyjPrrBuDPOHe98jcbBvxE6
	ze02eoNt6gdiRlqigRUZgZUorV3DwOR/egeLPsWcL01wx
X-Google-Smtp-Source: AGHT+IEs5KmocG/KlG2h0mSlEdpjChfOeNLb5C+4lvVluwFDeR16CG9SFzVcRYZbx4Bk+B/miczFYA==
X-Received: by 2002:a05:6402:34c3:b0:61b:cadd:d84 with SMTP id 4fb4d7f45d1cf-61c1b2193c5mr1231624a12.0.1755864875727;
        Fri, 22 Aug 2025 05:14:35 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778c5dsm6842065a12.31.2025.08.22.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:14:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: dts: exynos2200: Add default GIC address cells
Date: Fri, 22 Aug 2025 14:14:27 +0200
Message-ID: <20250822121423.228500-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Xg8fbeULkVAunNHSuMSzm27A8P/HmltLuUUNMaXdfUY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqF8iqytdsSKdAQp7OV0wh+MN7sQXLAODPAJWe
 RxyvnA72wKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhfIgAKCRDBN2bmhouD
 1/FrD/9T8gtPfLYVVMoSMObYA+o3SUHEGhUwlrr6NN6OsRErI+9TnP2Q60WHSUBrmH1Vch3Us/B
 egXQwdy5DAy94htJnu9b1V/jPaM6OfVsOOPCW+2hJZR0bBo3a8DRn2Wsh/KJRLhswIO9cA3EOUX
 zhz1blWRGOpRavXkXC32Q2zE+73l/OVNrKzOdAlt2t2Pzwyc4pmkptaEm4UKR3CIqAdBK8lkPAw
 5WXFs1090LyabpZhqMwaLKxg+l97LUfrico+E/8eez/UP0dIzbgPF4wz3dj/LOWohZVCR4TDHvT
 77VPH/BA/3UsW3pUVSKsgl4/TRDQG6rZHfHOzGtmxMNfJYIfc0JwhYdJqig/nyNGOQiFtNdgF5N
 YO0A7jVXw/Ut721AguDqg3J4/7kZEprvgjXIna38iX6WCi82RupWRtIFu/IdrFGcfmPv4iCICDr
 ew0O3vZr3wdD311zj77Os6N+Gm5hHnr52YyKqm1QNo2uny5P4oq5QPRo0GYt1T2K3cweGPn+8Tx
 6mHu6xRaGKidjX98H5ACEwF11d4vZvRZQhaDPDJtG5R/YRheG1N7XNTZ8RVH8vss71G+TFpxr3D
 Nhedh15zAS1ym05PrHCcBiXqDhMyBXDF81XmMRaMomjHbmUyK3r5Sq6xPOKqBwL7tIkeIOqg9Mm Dl45IID/LarMebQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
because GIC interrupt controller does not have children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 6b5ac02d010f..b1fe315b40fd 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -273,6 +273,7 @@ gic: interrupt-controller@10200000 {
 			reg = <0x0 0x10200000 0x0 0x10000>,     /* GICD */
 			      <0x0 0x10240000 0x0 0x200000>;    /* GICR * 8 */
 
+			#address-cells = <0>;
 			#interrupt-cells = <4>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
-- 
2.48.1

