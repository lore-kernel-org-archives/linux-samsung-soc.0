Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E82FC038
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 12:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864877; cv=none; b=oRyyPP4om8Tmxdgc88XPlmC7hdPmRyJzHo8jFU5MWHBWRkz4DTNFmWu7Sx3h3gppCuyDyM4xMR520GeD/hE+tq/xgtimUQN/swJFruHsUssrF+/k+h2mfeKs1n6rqLSgWCwc0bQ1korNExhfTtayokyusurqLXwhd56WHQuUuh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864877; c=relaxed/simple;
	bh=u4Q49fzz16cztRN4bhMz4zWhFIJDuK0fi+nL3nK66Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIQ6IwNdfBi8Gq2kX3TjTR3yqfwo/mUHDAenAMJNwBdMbQxeUidXP/RoyWgUX0i4j0vFCI9jG/qsGUqOITAbDBNidqZFZsjmK4Yc9PInRk3fZIMJy/Rq7NpOGhbmPM382lZl9MToJLAsZLkdjG5niB+myhyjPp6Iz0Y1Nepxidc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rpZvoWKc; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpZvoWKc"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78d5e13so26333966b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 05:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864874; x=1756469674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpQFNfP1MuP2zGJDIekphY6+xfLWcndjUj7V6Qo/mqs=;
        b=rpZvoWKcDUDn+mcxEVjkRANTTjUgcU021D0xmTfskRKVhiKz5ZPzbHQ4gv4kG7baa1
         l6yr1H2NysZ6Kg7PlrZJ1tZbSdgLHm8ZDaRFOIgWKspwNrqmrjlgoXaNBkRSwuwci0og
         QCUgB4BO2tSa9ViQ6/DatO0kLc97sLWabkyN91qKgfXimASIlND4no2wP+Qc2fVfku4z
         s2iRor+GpaaQKFYL2lLY9YHHdnIgH4QWIdFpiVF8xc6wTN7zSea1XZTyDHqIab/7ESxY
         QRiVgr2aWLCy6+czwpOdID6CXJkDXH3L5xrojgTjYvqWbvM0lauy+61xhjpr0RbJNWo/
         CxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864874; x=1756469674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpQFNfP1MuP2zGJDIekphY6+xfLWcndjUj7V6Qo/mqs=;
        b=vRrDMUDjV26igf2/M0Soy/3n5rQqf4Zl/5nrf3dY5vVXS9l4a3abi2h5xVT09i0hTV
         tt9yvV6w7pxaymcoxVlGSNqE86oxk2rzaMFAlpalS3SBdauI+Ux6Ny/4UVjK8p1L9QkW
         iuDQVJr/Hj6wHwNKQmlPKnO01dj6yaGKgJMz1xhoNIiiXBTgb4mqge3gqPNyQts0DY/t
         c51GBSOmN8CX3zHxn59Z417EUNxblgePkz+F+tHh6ZvYSxgKB0HxFXsTEpw8Qty3n+V3
         gANDsfjngAOXlPi7a+sHtxutymTCM5eut0alFZyysYLtPpbiYqdmqa8W+tdm+z9c9a/2
         ++4g==
X-Forwarded-Encrypted: i=1; AJvYcCWAk3Hiw4eUyEohaBSYY0ruM5jLVL9s+mqxz8zob+bNqE5GmVIOHpL7TFgHQxIETWSvQA1h7wB1+BG21IFEcyjApg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5rwfQl3y/9FAgZ8e6kR+pHmlTof5w0M3mCNm5w0Hpd/3unRD
	yw4Fu5ClZypeAgzSqRsg73zYiD+UUpVaL5P5MK5nInIjJru3a23ow4YI3S9jbYZ6enQ=
X-Gm-Gg: ASbGnctMEIMX4JEwBdjbyKySZtcVbTNfTZ7HSqf3xHs1ekeed6oWqSt/VEiUFE9JO8T
	WHnUKZvloqqNeAOS/h9/1QIeAK1cGnUsi3S4VdRdFU4x3fEkMjf1PkmMDEMYLZcv5auzEJcbmy1
	iFf0f5EYT87vFsrlX1g8Ov/muIdYDErAa8+YmJRI/wj3ds2wB+Gx+9b4/LgKG92HnUXnmKShQrS
	SIeiajbWbPgI0u7fnvzfuMo9UuT4iy/0DtLAyHo1ffCKvz2KFmDBhfLZ0kjh9YtBC2LZ6KrRNqy
	s0KCJ0m+pDtc+XPJtvC3ul5H7PqyRnqF2RAvjvq/YJzxX051addNazU1+YXa/kN3kczBwAfs8TK
	eQxOxdi9FIikjtqykLdShY9qqbwqV4X4QznP29LcIBjL5
X-Google-Smtp-Source: AGHT+IFvZy/hVC+pkJt13msp2gYUwDT8avyVy0YPiKQmu27rm2o1448VI3vZXw0It6rSB4Aa5n3zgA==
X-Received: by 2002:a17:907:94c9:b0:ad8:8c0c:bb3d with SMTP id a640c23a62f3a-afe28f08b6cmr124114866b.3.1755864874131;
        Fri, 22 Aug 2025 05:14:34 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778c5dsm6842065a12.31.2025.08.22.05.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:14:33 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: fsd: Add default GIC address cells
Date: Fri, 22 Aug 2025 14:14:26 +0200
Message-ID: <20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=u4Q49fzz16cztRN4bhMz4zWhFIJDuK0fi+nL3nK66Ik=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqF8hYv6B+iYK7dUhyfFddjuhtdNLQmUTGiyKM
 PUtycqDXfiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhfIQAKCRDBN2bmhouD
 1xdjEACKbhNaHa/2goI1CLeFIEuXCJeefaB9pYRprjRWzmncfcymr67jhqPtF5Sr6L2FhZxr86P
 zpPOaAVvF9wd0O2Z7Jjn0I9DUcv2+YQghQyyO6RitaMZQdJaRRcyRDEOhOT7gHcvxhEAR8lludm
 H4pZ8B1BA9VJCUH2Prh9rjCHI0TzaSIgPX2q9bXH8vnMNoC3MmaWRhBD7ANy9/Sf7Wi3wUMULdt
 O5I7auGPCSmnJEv2b6bWeuu36vMv7mH58aLOvUqMNtNnNJKOlRxXoQKcuVTATreoNDNe4BDEz9X
 XVsimYLxCTqdcD1+G+tX1f1fbY/fWWzhGDmKmjFqrWFCGPyUk9UvNJKwVOTJiDqZelt7YjBvJY0
 Ck4Gm2931W75VpSR0MrUjpTWGgJo/BQLnlU3Dj9vR/FilsmKfCiHup/Uz4s4jJRr5nQYpslNvHz
 NTZYXFILqvvwvBx+n8P/7oVlfzLA4SFF1OC0rlc9K9uHqgECCU33jO+G8lWJ4tI48yjA/x3dmsZ
 gLfiT44win6D5tvDyoGompMy/Iix0Ug5YbAsbM/2QOH2g7zQBbDWRQ5wm7CUCcBVxSw8jVGUuSZ
 Ey36mb/ppTOJ71RoKC7o2icrUIYH4qSEhJaczgLn0de/ncDXJhLUfjmupYuEXkNN2aleq8Sbq50 OPSDtptU+XCRleA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
because GIC interrupt controller does not have children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index a5ebb3f9b18f..5b06e2667b89 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -363,6 +363,7 @@ soc: soc@0 {
 
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
-- 
2.48.1

