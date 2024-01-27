Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9273481A
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 00:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314788; cv=none; b=TrPceazIcVi8fu1yyMuIrp/oe2trNAu+rP7HfZGOEiGoNGl0jtDz56iOnz0YeMr1Iv/Pm3TBRJ1LgJ7LitbyK0Sm3RkX835uYdNCBZyZG9cqlDwtTf9CAB2EbWONyEORDT4NPLGhOJh/BjaBEiWQrfT4MQbPqp+5Z2E0g6b5LNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314788; c=relaxed/simple;
	bh=oHe1P3OQNz5Kyak0RXMz0P0blzBvlld7fBoMdalKmm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2gHLVl0t8AC1T8Mk5j7ZaUIN+m0akIJxLJwCOQotVtn/HdY4E2Lk+r9T29GCtbaBZTOp6qYGex63pUvTdmXnKxgxZpOOC4XnW9gtzILzgWfKgor6iUcjy4vcTQM5AHPnsgfLTEVV0P47FA/ERqwa11eblX9BuRFXVHo7z0TVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QlwdHLJu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QlwdHLJu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3122b70439so131595266b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 16:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314781; x=1706919581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgztKy6IjfIdLYQOLtbP0Yalc6UauVSOPo0zIgakd70=;
        b=QlwdHLJu57ij5Ei5g0HPNEMXO26V+5RvEpZEl/jTr3gKtsg8Ik1egW7C+a5VdpIJ+v
         54aY9T4ATXfyFWQiXw9vApWstiB05RJGhvm6GrEAmcvuOsA6tZoIeBI5HXFb57J2Bu9H
         FyEXm9BVLU7YisOP8bH/2mg0MpTr7x/evtD7Qs24pklrzBK+73eCxcGH6wqOswO4MpQT
         tDqr7Sv/c/v/w/wuGbofOfom7P7q/+8J4c6tr7+X4veYxgvlIi+HvOgy1adBaP2LLy1M
         s8H89tKL4UE/O5BvbxIkGr1M71bT+vkqHEIf/h5WJ/hziIuvgT90T6l3hr9OcdUp9+6e
         pKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314781; x=1706919581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgztKy6IjfIdLYQOLtbP0Yalc6UauVSOPo0zIgakd70=;
        b=ZWZDzoowfNss45hF53sknrZEmLHtwtFyeZlts2hCcwEp+QY6IsyzXAhLnLKKMJxVOn
         TkoqqNqwBe4TgdovNT/OUIdbp5Q4lXdkLWqOKadtXLbOtv6SaShUuCnvsdbJIYyk31dz
         AZS+eNgMIjDLYWzj/JGQZ6TFesvbW2FM/W9yhpAwndFSPlLgc5i6diQcZ4UvpY7UioZ/
         e6JA/2voIL3GyzLOy9BzeHMOWt4WM4W63PiDv5hg+jMXwy0S9rTMUcgF1HP0XM1n5bDQ
         OVJX4ZQORdfPAVvvAwLqqvA9aXnyn2S1P7EqI3vCsrB8tNmGeQ5bWjcqiv/MOQvb5f5S
         jfOw==
X-Gm-Message-State: AOJu0Yxd0ggyxFl/H8XCw2FaabkDhmW73LZnPJD65IorBDeM2C9Dn+ga
	eDRI9rx4Lk3RZCTTbTIoqrdTXT30YEYrR56u/FUZPcMu35G8eRV8gvIFuOGxK0c=
X-Google-Smtp-Source: AGHT+IFb1j6MKOZ4vLQycT441SftALLz5tOLgiqWIOZFebrye4gBKKmrHvrbkPOptuEpa1l5/etD2w==
X-Received: by 2002:a17:906:dfe3:b0:a34:aa8b:6cb2 with SMTP id lc3-20020a170906dfe300b00a34aa8b6cb2mr533145ejc.18.1706314781676;
        Fri, 26 Jan 2024 16:19:41 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b00a339d705a10sm1141359ejb.80.2024.01.26.16.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:19:41 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: exynos: gs101: enable cmu-peric1 clock controller
Date: Sat, 27 Jan 2024 00:19:08 +0000
Message-ID: <20240127001926.495769-5-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240127001926.495769-1-andre.draszik@linaro.org>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the cmu-peric1 clock controller. It feeds additional USI, I3C
and PWM interfaces / busses.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index aaac04df5e65..5088c81fd6aa 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -429,6 +429,16 @@ serial_0: serial@10a00000 {
 			};
 		};
 
+		cmu_peric1: clock-controller@10c00000 {
+			compatible = "google,gs101-cmu-peric1";
+			reg = <0x10c00000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		sysreg_peric1: syscon@10c20000 {
 			compatible = "google,gs101-peric1-sysreg", "syscon";
 			reg = <0x10c20000 0x10000>;
-- 
2.43.0.429.g432eaa2c6b-goog

