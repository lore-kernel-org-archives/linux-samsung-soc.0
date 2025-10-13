Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53C02D3EC7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 20:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388711; cv=none; b=BZ2Nc2deOOEgx3LhZ9YkX3SEd3cXoupZVmKU3haR/84qvXiI2mQCzSBixvVnKQyFq/VR2fft0Ih5x81H33Vlfi71Ditqlx/kMA0A+wfMEW00Pi1Xq4dY4l+oEe4JtcWTPUz7bPwlvEx24M8EedkFfgiXZhBtKlggPZN8zemqxVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388711; c=relaxed/simple;
	bh=HHhcCaMHTmvzw7CLfISLI4i5MO1lY0C65c6w0STPYPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfCjjLPbXAU5OT7zJsbU8yvlgVi+0y/J8Nlcj3c5S/1Q38Z/tuQJeg1xlQxD3H/YRJkcdPE98n8xkd+ujq2fYHvJLYKTw+QRdzbhxGeMytcM59xAk1xWQf4BtpSdQwwl3na5WcDBvX6RocuJ+BmVvBbF7RozS/F9rH/W4Eec8PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Esyqn8mv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Esyqn8mv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46f53f88e0bso25857845e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388708; x=1760993508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DDgLAiuTXzY8R6BOnFwxchMXmp9+zPBlIoePYb2/ig=;
        b=Esyqn8mvrJIzXaioxfdj/rnne4vBTj/TGlW+91WzSqnyCINqhAkSr3SSdLf8gIO8wg
         LHAbbgeplB0FnZ8c5hQ8hYoJSz7u0VkOwQ/OOIXxVjmgH89j8vtsOSq22MPO0lpZFbkq
         5lE2p7LgjKmKi1AYdfnpQQpQAIyFlEDIWa8/mHP0+Fzekbyb9XHxIugCRcsXhD1OMfT5
         AppE6xUxlcpZW4JwBWdEMj463T9Y63Qoi1To+W5zmMcLyCd9PkDAQG+OOQ/tPy5be+qG
         NU0+1V1A1ek8eropf0KRoAKt83M1r4PdeUYxZDVCOde0mY8k9F6+KO21/CvpX168zDzE
         SXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388708; x=1760993508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DDgLAiuTXzY8R6BOnFwxchMXmp9+zPBlIoePYb2/ig=;
        b=ds2U5JaATILgfiMCK25Ftz9PU3rqXVTizv32uv4MjuUhFvbc8Jxddva93sSpzbrb8R
         +iM/glOGl1YBbL5TVO4jQvVjwpvyOcukZYWO+CqWOibES57KEm9bO3t7f0IjtiFVs5Rs
         IHUeIgnXgmAF+CGR6EgNVAhTahr3MLSJUxFjDZIudw210NdNe9EuFZAy78nM0yrf3/AX
         DQJibNQZs9X1CCeQKGt9crxaR2ijVCnO6ljbINT762bwnO1Ul5PhPFWsYid7BKbcZkyr
         JlqePydi8CUWbokOjPjuUp35Fp/Xie3Zf2idXiusINNOR1vPViV8N+FcGtJIgZDQKiqJ
         wWAw==
X-Forwarded-Encrypted: i=1; AJvYcCWAAoiFty56XRLBBpnStObJbAI2P9Z6H97rLZwwyAyB1P+Arp0b/r9WLngOd43WHFgBNGGK6Uwx36h/NFb1St37EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+H2IPP9zUQN06A8ys77kpCavR6vPWEXvmQJfiZEaTOMOmZFD6
	XUMkJ8zNEgZAjcUKVbuSmFxYlbouMR3NqAsQBPu6Ahx6TVuUArGiQQ0DFmwjvIXXUbs=
X-Gm-Gg: ASbGncvfQ0qE4hWkhRMrSe4J7DR2cl4xDtn35Hpv1Dpqipu3488GZf+he68vhmIOA5b
	iZ6bUCmWoiQi/3dbcu9AkIRbQZ5Rz96+4tDBmrPRg68Nn44UHyK5oa1ufxEnqvmyXn7A3b8B8hn
	L/vcbPlVasCROKmvLdCArDwM6hnGLvkZYtfXh8D48dQDN9iOKOylTpxHdfKfy1GvhJGDB6j3y8/
	hjEY8UyfIS8XwjzBilKVce/uZj5s7A8Tb9RFGYabm1QvCkEGywY7BWuZpG9I50SCeEOi1gM0WnD
	5NJmb41NgXyok6+D4jhcN6rpeOGn3TXT2ebrGKhHEq7/8rIKx6vjisUlGWLMTJbCRRNE8EErM1h
	BtEjALuBvA+52sHAfIFsJnmUE5eWPhq2TM9E+VX51Y6Q9twk8DerVy+O+1iX1hy9LeIEz2gaKzE
	YYMhkTV4moQg==
X-Google-Smtp-Source: AGHT+IELN9yhf47V0yQ/Ag6le4K4Ap2z1yQxwUo/woxIruFIJKIX9OJVJMb+D4gfvG/a7yKD5FReRA==
X-Received: by 2002:a05:600c:540d:b0:46e:32f5:2d4b with SMTP id 5b1f17b1804b1-46fa9b19f3emr157010075e9.37.1760388708141;
        Mon, 13 Oct 2025 13:51:48 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:47 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:32 +0100
Subject: [PATCH 3/9] arm64: dts: exynos: gs101: add sysreg_misc and
 sysreg_hsi0 nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=HHhcCaMHTmvzw7CLfISLI4i5MO1lY0C65c6w0STPYPU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZYm77RM/chRNqrctG1CL2KsrX4TP79II7qR
 R3dx+knfF6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWAAKCRDO6LjWAjRy
 utatEACGzMI7+hTvOKj04raOT4wlY2U+PRycjfuwd+1VMl0oIAbw3TC/BR0ikypgLW9GWBz524R
 fqNhVFX0FvtX9bZYy/DT1/jWQgFweq1++m4ei9OGJUvw0F2svuRkzavreEkhwJTHPI8Mh6Bvq7a
 +scuI9cEB93BBxm3d2NwGUYjKiw6ORSFWd01j53P+H38XTql0mL0Gfy/wbTQv3hrlFU0KdFUmxl
 g1f/e64ZDx+yle2K/p8cpPUpLMjjSetpeMsrVGOaCW38m3VnMADs2fux6kkClx8JJAaEORkocki
 ECM++yXPexJ8pNSa8PemcY1TD4VHEnEkudMjMBRChWc4sjduGoW5Lkq7ZzRT3Q3yFNp59J3MXBu
 MaWJGJDvC1X5qhcr2BTwUGWCB3TAs6+LY2YDibxlQqHyLofpeMibhSER0Gmc48n3jyTZBdY9TpZ
 25wvMBJKP2kCKSg6KhS1YqLRfiHSnLoroU8chpZKolUjsFHyOcFsxM01eu46ybegt0EWuQeJ5vO
 NjlmWPuuxTroAFCqnNbaxaZqbSjvGoDm7pmxCBaFViSDrL0h/4h2pb1N8pbLIoBBUoiu7lydBqk
 A0ZgWq5uP88ZVFSXZzjqlb1/i/tk78rYlVf/dZS9rzz2mcKxavpOFtS2+PgzNJplMYRp78pF3hd
 mUu54unij+I1hjw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add syscon DT node for the hsi0 and misc sysreg controllers. These will be
referenced by their respective CMU nodes in future patchs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 31c99526470d0bb946d498f7546e70c84ed4845b..d1e3226da6472bb9db766926100a6b9855d7a30c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -295,6 +295,12 @@ cmu_misc: clock-controller@10010000 {
 			clock-names = "bus", "sss";
 		};
 
+		sysreg_misc: syscon@10030000 {
+			compatible = "google,gs101-misc-sysreg", "syscon";
+			reg = <0x10030000 0x10000>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_SYSREG_MISC_PCLK>;
+		};
+
 		timer@10050000 {
 			compatible = "google,gs101-mct",
 				     "samsung,exynos4210-mct";
@@ -1277,6 +1283,12 @@ cmu_hsi0: clock-controller@11000000 {
 				      "usbdpdbg";
 		};
 
+		sysreg_hsi0: syscon@11020000 {
+			compatible = "google,gs101-hsi0-sysreg", "syscon";
+			reg = <0x11020000 0x10000>;
+			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_SYSREG_HSI0_PCLK>;
+		};
+
 		usbdrd31_phy: phy@11100000 {
 			compatible = "google,gs101-usb31drd-phy";
 			reg = <0x11100000 0x0200>,

-- 
2.51.0.760.g7b8bcc2412-goog

