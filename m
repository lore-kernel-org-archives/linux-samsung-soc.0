Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051131;
	b=OsOCcXRuuJD3feqPM7429r0toC2wUslPDqAINilypvD8XbKEldeimSU/ODeRjNBhemJF
	 +a4xyIfINconoYPfpFfDG7ebUBI6GDE+LE+ZQcqCd7XWopDrbazcM4caPvjo7TJlHi0WY
	 NX3ApMiVpC19mWRZXITImvlJiOGJT0CAxOpMEqXu4wi/rLnS4ezD+Icy91tNuUadjtazl
	 xT5KwmItiycAXUogZAxSwd2O/5r9Udjw9IjF1Q15jU8GBAY7PCI5bJzbzHjlxObCjZ1lK
	 nPG2hjG7eQ+vQWBsmNTxrOBHzPHYjnd4FDoYt/Ygc0HqzJyFel+aIvrFsXugI/N4nNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
	b=CL8GWBR+aNuymxXOH4qpOfNjjCU+aryZjOGGbu61XVZ1Qv+a3HQucf7tsb9awZxJWHn7
	 tGIQRkqhU5J16O/c7SS4VYh7BFPDcBf75m7+HuKyydEXmKbtqvcRJ7mEULl2HSJtthxUP
	 6pRdUUXzZT6ZHBENamByukaHAF+wexk5PbQj5JFA9Mve2Mlaz1L4HhnCQKCmQjiDfvvXl
	 An7M0ROAxZPkdqTqFHmbSGPQ4twNThinNYRY90l6bfghX4DLC+iBQj3aBEPwSE2mbb9JX
	 uZscyUBv1utQ4h125Bnsc1SwGmavnCdvTCsfDnRUL/2Gq8kF8qdT4MinjydggyotyCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3BEGRGA;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A5A60A2600
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 21:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A5A60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3BEGRGA
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5692552eec.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051130; x=1793655930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
        b=M3BEGRGAH/Vn2SxAJ2DzND9XWJaEthgW/2MXtbTOVBhxXeA9DgmqzFakwsDvTIr4Nm
         7cB3fF0bUrpubPo+WWG22t5+1qoyUQRWDdijeDyKfjB/xcFfTQSWEy42gLuAnCIwTIE0
         PBlq477/agmjQqRSYYXMAKswTErSit3gwmpSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051130; x=1793655930;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxRxbLBQ5S84nbJ2Z24j8qYmciKanlUFlKBok3xXqSM=;
        b=sn5iZ2Mn7dXI1Fziuw6NxynpcsOc1XAbM3F5ZXrJVMlNlGNZ7sIWoKlteEW43dPhEI
         1+WaqV2Z9+SFbNHUMUsfkJp7STlVHvK5bNGt1NCpQiQSNN+hktIYl4nDRgl8JYO06A+e
         I5w+oit5GFQBk+FjeJzCrZABe3cxgyi915m44X8PYxJ/lIgdbhww+wX+vVA3QdbIN9TR
         3UrVbNnCzXAG0G3k1HndPV+GY/QAj6IjVn0X4qpxvGdnbUCjhvw7F8KGoBbf8r+HUGoI
         /jQgssisz6eAVyDgR+CW1GmPgZmUJBE4ScgHAZmIGLEv7C3sg7QviluiYkPaMZctub8r
         +1mg==
X-Forwarded-Encrypted: i=1; AKwUvBxnmo/cBGWAWFM9lJSfro7VMd46srUOgmsfEsEl3BV1p5gkB3W2Srfzo9OiEcXHa84zrqJ6dn0G5wz8/xzpod4N5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQW4wA8XF011OX4/O1P1QC9bjW+vPvvMMReVkdU5dvlmeK9U6t
	v6pIi4hx80qhJQ8FPu5VNGcT0F2R8Xa4JUqUEjWiy955E562VbZASAyUqfQko6VzAw==
X-Gm-Gg: AYBFou3XzC+P1WDhWhZ13PpN1aqlib0LvVz35IY+vqxd4J3foOYdIhxj+cZEUhjnPBB
	rQBz19wF2n1JqRTkBpsZ+EnzN7DxbfKMze1N5fKf0df8MELuXyzKDCC+lIKkk/4faO1myv+ctdl
	9HaZGqVMC4G5URRukOA/FQecz0jBN4LOHxrCUSKDdH/Z1QAKSpTQLuOsPX54iV1a+5VSVf4j1Lx
	ZgHrKQnk7hCHEFMzPIN+fnlrj7EmMyCeV/NnSrdBF+cvtw3PkemBThC/iRPnm/r1SbD/SlKL5sD
	pfqGPN7jOtJFaarcbYb0YkjuzlV34vc4bcNamlGWK8VRPiBRnYK3m3+EGFxt/RYPP/5aUy1Svk2
	aBvU5Hkja3650OzxjI51+mr8W1fugxSGvGNFiLlYanIkvdS+FKkkl2Npuq9fUMJs62y9L/Jfb6E
	geq93s7i8bCjLa/opqsWGb6+HTcWcM/hmOiLiv5f2m0Is2tBAwQwUKTbQ9hIA5n4CKjIyTvBzwY
	8y4b/sT117s4vDYnOJt/ouP+SSPFDTP25rMhjIsLyocKu2HAUcNvFP7AJIMc31ohS0BW4YVboTA
	IVlB8qA9uvViuSWvsoA=
X-Received: by 2002:a05:7022:eb57:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-199377d8c73mr12569336c88.46.1793051129456;
        Mon, 26 Oct 2026 14:45:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-198a0f81ea9sm32064575c88.11.2026.10.26.14.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:28 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Mon, 26 Oct 2026 14:43:47 -0700
Message-ID: <20261026144346.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Tensor SoC known as Laguna introduces a variety of new
drivers, with Google-designed IP. Add entries to the GOOGLE TENSOR SoC
SUPPORT entry to cover the new drivers that interface with the Central
Power Manager (CPM).

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 MAINTAINERS | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20bd4e03bb54..c997d23e377d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11424,18 +11424,28 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+F:	Documentation/devicetree/bindings/soc/google/
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/irqchip/irq-google-*
 F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
+F:	drivers/pmdomain/google/
+F:	drivers/reset/google/
+F:	drivers/soc/google/
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
-F:	include/dt-bindings/clock/google,gs101*
+F:	include/dt-bindings/clock/google,*
+F:	include/dt-bindings/interrupt-controller/irq-cpm-google.h
+F:	include/dt-bindings/power/google,*
+F:	include/dt-bindings/reset/google,*
+F:	include/dt-bindings/soc/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.0.307.g5fe7bd680c-goog

