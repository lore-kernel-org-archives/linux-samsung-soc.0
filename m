Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051127;
	b=V6Ygg8PHNgBqVai8Jck8TDNLQUa++lOWG2BLroU8rP5xydmWsRLJoGYVk8vGqcoaQFoz
	 4VEhi1exo9dvkP4RBp0sy69qE6FZwHOm7n3lUtaNu6ox4/uWyaLFzTqhCn8IicJSBv3pT
	 NTDQKy0Vd1G/tQng1PavZ7R/k4TWyDzteExp0Ia4kcKZFKFJ1WmXQaonTsptUTwxtW2jP
	 RXIUw/7tAwUQun+p5PLnh4HfWYwZNsmyMq+B0pkN9IL6DCdFrf0krUFnGIPFrFlWSPYkT
	 MukR35oTPrKOeOWEzn9DTrEFmxILF9tS0adZNPvTA51sBLbRGDaBY57/v28areNECmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=;
	b=VoRL7Uxra97f3fQQyx0XFT7Pva5iatZqzlIrqa53uEs5JRzBuyoh7VyLDnhk/fL6gPHg
	 n5mA1qO7lPmRZR0M5cSDNSehCmJ669P/ko4F04xrjeIXLMbYXrPc8fyyHEufzJLJYy60k
	 zhxwlVAjP5+BpYrPdUeMGC9dYTURUsI9Xe1/cJ5OjukTU/Syf2RG4IcyRslM7F4n2wLga
	 obEt7hVhoOEZH63YW8L6zFjHbySLp8DMxWlSRRsyIlmPAsJ3o/wDjC6DEbbuvPv12huVP
	 N8/DVuoQ+RpnIfCM075FxC5O5oqk98n9NCOyzNQh81j6FFmhmTheecvMXFDS9tzggCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WcLnrBjF;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C5460A263A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 21:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C5460A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WcLnrBjF
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso5551269eec.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 14:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051126; x=1793655926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=;
        b=WcLnrBjFahP4hj117P1H8KOoO7McgOsldZ7VnLKpBz14+p8egeKZglizlEryKv+lFi
         8ETonFbWRyuNR223HvqZyNsz87YT+Jfc5DLfseqwwn+QOI6EHCOsS5VXdhpO/oBlWf12
         tndMKrs8kvUKVhYnBi+E1amNaUwFFI1lUQ/R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051126; x=1793655926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=;
        b=R1RZPgFC0v6dgxuItdn6YV2mqIV1BorP5qfR4PNBM+OHI9n+JqkSiPNksojqi/qHJ6
         vpSk8m3ltWrCtuqlcVsJsbj72zko3Uyh0xXc4MjVOpKtY00VdUBeHGFhf2Yy4FGnBFz9
         6zhMkNC4w3Ty3Qbnoiqf9s9HlzeAZsho0A8fMQBJ1TxG+oIHsCuRdFMOosqeZYHR1MiP
         0Yi+dyo0cDtbmuUZMjDktxnwg3VtSAWpG7uKLW7Cal9/jswH1Ci17AYA8h3eAEKx/L2I
         aq9VTVcWYsr/lndQjg4fSahg6hUqgxmQbXrFiGdseu/9DU+3O24T/AMAVhbNAFEwgTZl
         8fNA==
X-Forwarded-Encrypted: i=1; AKwUvBxFUaNEoxAr+BdMEI54fxelDM0VUn9ddPkxleaczFWWlBUtyklKE1jzPp7mPCMvR3aaooBCi3Jk9cGwNouOvPMP9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIe4QqM/FqEAmVIcFCmSijpfu5eQd4Qq8NuOL7Pj0prOI5v9Zaa
	ynZRUgCWvPraLmqdHpz+WLMCKCWiaT1MgXaPjtwdZLxzf6zBX2Figvle4Ny2UMTmaA==
X-Gm-Gg: AYBFou3Z+nO+YM3XV88fKEyOdy89jH5GwFDdde0QdAM89VMrm8m5+UY72UiQnSYvx7e
	0l5TqVtDCkWysnYXWxvSK5yCcD8FLicM6uLaWHhrkSh3/CbcurRK9NiU1/hLBTnfvvxTjiRFqVY
	Wz9G1/Ae74E0u9PoDjMUOW3Ft2pS0VXFN1djFXwN3SywGEsty3R4A0ZCKxLK1Vmd4EWAQ66P6y1
	wuhtO3KsqEfVETE03qFWiV5uOk/Qp+ELLtQJ6xXiUreWOOfpOSUkRz3OlrKQNJKQYlMtKrflF42
	RsDoqhjhM0Z9bgZFBo3jsukdyp720UVHJC9YbDDTCH3T7MQVeLw1aQH39CnkcEUq0JbZ5Z5J7/B
	mP/ff6rnVA9Hyp30VfNqtFmQrhgBmDAw66l2E1xAGoz38Ush6RPeCe4fO8Dqh2BjLwBvc3I7PjF
	f9345L+7i478m+bhEt9C4U/Nk07QkXgN5Riwje3bnQEHiPxJeetRRnWUUBJnaFvaZKEC3+NpF7l
	8pK6vNg9QhlDF7SMbUI24mH84FRZdNzMMB/r3wuIseHpC5q2e4CCfzVAvsDGqukD/50AltQnXyI
	yGAjOacpjmtt1OgZsAhp
X-Received: by 2002:a05:701b:290b:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1993505e004mr10316882c88.11.1793051126391;
        Mon, 26 Oct 2026 14:45:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a002a486csm13039391eec.22.2026.10.26.14.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:25 -0700 (PDT)
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
Subject: [PATCH 8/9] arm64: dts: google: Add Laguna CPM node
Date: Mon, 26 Oct 2026 14:43:46 -0700
Message-ID: <20261026144346.8.I4778aeffbdc796147efa8114431efcb201063b59@changeid>
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
Content-Transfer-Encoding: 8bit

The Central Power Manager (CPM) is a co-processor on the Google Tensor
SoCs, as used on Pixel phones. CPM supports power-management and a
number of other features.

The Application Processor communicates with CPM over a pair of mailbox
channels. CPM provides clock, power-domain, reset, and interrupt
services, so we include the appropriate cell-definitions for those.

Because this also adds clock, reset, and power-domain support, we add
them to the UART node at the same time.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/google/lga.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 6ceb9ea6a100..83b2361c5f00 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -7,8 +7,13 @@
 
 /dts-v1/;
 
+#include <dt-bindings/clock/google,lga-cpm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq-cpm-google.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/google,lga-cpm.h>
+#include <dt-bindings/reset/google,lga-cpm-reset.h>
+#include <dt-bindings/soc/google,lga-lpcm.h>
 
 / {
 	#address-cells = <2>;
@@ -356,6 +361,16 @@ abl@be000000 {
 		};
 	};
 
+	cpm: cpm {
+		compatible = "google,lga-cpm";
+		#clock-cells = <2>;
+		#power-domain-cells = <1>;
+		#reset-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		mboxes = <&cpm_ap_ns_req_mba>, <&cpm_ap_ns_resp_mba>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
@@ -423,9 +438,14 @@ lsion_cli16_uart: serial@db62000 {
 			reg = <0x0 0x0db62000 0x0 0x100>;
 
 			clock-frequency = <200000000>;
+			clocks = <&cpm LGA_LPCM_LSIO_N LSION_CLI16_UART_CLK>,
+				 <&cpm LGA_LPCM_LSIO_N LSION_CLI16_CFG_CLK>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&cpm LGA_PD_LSIO_N_CLI_GPIO>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			resets = <&cpm LGA_LPCM_LSIO_N LSION_CLI16_UART_IC_CFG_RST>;
 
 			status = "disabled";
 		};
-- 
2.56.0.307.g5fe7bd680c-goog

