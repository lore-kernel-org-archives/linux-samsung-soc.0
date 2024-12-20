Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77BB2156FD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702603; cv=none; b=s3GsYXBcKDghy9m+jEcFNiSyYkI4vMbtidP9KRbArTAutGk2ju89h1HvWbd+nRfrOiyESJ/BC/aQopxuCIS7ITUVg4X9FepRgInKb2AsXuy3rQi0+SADI7QGTpdGbWn0vdT/LVjtb06qaJS++a3GRVZEfdV5QZnI0jqActpy6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702603; c=relaxed/simple;
	bh=98UdmgNXZR4Odm8WAK3DNauL946xSKIV8vPYFoFzXtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EoBDcyhFFXjE/4m3MIVbWAkYaW9Ad76TCt6Kub1tI5KdIQ/t0l3EbHJt4E6MrQUrf9eAOatz+p7g9G3A2WTQltWWKGra9XF+z+QbYSz7nCSM762QnTMSavxMITDZ17F268i2LMKy3HDaU9eZyIDKhjNQLLmldqvOILiFm8QGmn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SI13F7aW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SI13F7aW"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385dece873cso850628f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 05:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702600; x=1735307400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYqkobOK+CGs+TgrhYtB4J6Yl7NbzklVF+5ziOlA9ss=;
        b=SI13F7aWZl3ze+TueJuL9j8JTC/efTOY+yljHQaEfuee6GFFAHPCCBkXwhCWOhJtIL
         W3SIv5QC2jH1CybtmnJxWj7it9TImIY3uY4eq5HhN30B91LcASl0uoKXsSbdA7bGOGSq
         yICR7nrilO3WtqeSG1X8dUY952nM7ZGCJK2Ny2bZqyBQPhP6iBHFf7TxAVFL+kut66zQ
         AXtdse/24bgOBzCyEHWXVktyeRRBbHuso6F5tP+iqZBuWtwXVuDcxVDAkCX3XwV4u9BD
         azOvY1EChZeol55huPOgRYE0jI+pLc3xhS/6S3ThsUfpan4Z6wtxRGo9EcGLqIvyWIIY
         vTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702600; x=1735307400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYqkobOK+CGs+TgrhYtB4J6Yl7NbzklVF+5ziOlA9ss=;
        b=khronuaJOYGz0KrT+ogVsLWCBpjJqKynsEQSl8LiFKLgVm219tP9LKlS/M+2vTlQ6m
         ZlsZkgtbE5t3RCsahoIA4OtmE63L+qojPn6+2lsoEY9V2OIjIq8m5u/vWVxn/aWM6W/c
         AvmwugosgghR3cg3kPWywyNj08UmY4K53+uq+az8IN7ygONWnVDAHmFPjujt+D7Lmdj7
         VtP9HLVZ8CY9qj1OaYd+84Yu2GU1lMRDtYNTls5on5HwzDOGrozyweQ4a2hBexU4bG1g
         Znh2SKmiJAeV4CfYlBiuVaY4N4IOLF6WDHYwTecZgOjiNSfEWi2qrDBRS3e0HL1upsYF
         6ykQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz+lrwYMgxzUgsPKZmWynWRcV4ZZRwjSQIXYttUfO9Fd5SZxVIz3KfdDd0sjPcHDMXArousQo1KUcDc7g9ejY3hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/hMRk+YZT1KfKHTl97LAnuWUwCtI3OvMck4KPJOx/k6nqXLv
	zKvpYjRygJdU0aZtSkMRnaGFAaYKfEENdedl/tMDPpy7WeUUO5p+YQT46+z3r54=
X-Gm-Gg: ASbGncsooNzh4Cj8SZA/+GRA1NEEJF1DCVCXCBICuKRNQJToJo9f702a27uE4d4erXV
	xbelzuWyYAVC9uxH7A1bsrYTYq0nLcq5DQYCO4RHuUY6eUF1dm8htplFRwD0j05lP1PsgO3cIK3
	E+TLDFX5R2dTzJAInDUnenSMPi05RC5NK/R7pu83qkF7L4o8+jfej0prjMFOTse1Qf71fgfob2A
	DRvHAqqumYk39VBfhqlF1sZA8nZF4sM0UTjcO1Uqp7iVkl+EUFgYE3pURmE6cVhcpyQw4WboGBd
	u6kMIQeG9UBibDRQyvKOcgICfEGLsgPIoSXW
X-Google-Smtp-Source: AGHT+IHmrkvtNC0bpXN3WfagnYqTmX3f/cgHqADtcvMIQyUNWR5Q5Jsopz545p5OgeVnpUJdIYXklg==
X-Received: by 2002:a05:6000:178c:b0:385:dfab:1643 with SMTP id ffacd0b85a97d-38a221ff705mr2979256f8f.27.1734702600234;
        Fri, 20 Dec 2024 05:50:00 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:49:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 13:49:56 +0000
Subject: [PATCH v6 1/5] dt-bindings: mailbox: allow #mbox-cells = <0>;
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-1-a6942806e52a@linaro.org>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=1213;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=98UdmgNXZR4Odm8WAK3DNauL946xSKIV8vPYFoFzXtc=;
 b=L27tekKbbbVcK6U5BoYlAcu5YGoP7VilFJa2kRv2a4piHaSjgl6c8pZq3lyr2xXRNPu1TQkQh
 AuzOHGFoQW1DsplvHHW5KhfrQXyL0uUAXa/BQ4Qcems105t6N1TPsWA
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

There are mailbox clients that can discover the mailbox channel
identifiers at runtime. For such cases passing the channel
identifiers via DT is redundant.

The framework API will be supplied with mbox_request_channel_by_args().
It will allow clients to request a mailbox channel using the runtime
discovered channel identifiers.

Add support for referencing controllers solely by phandle.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/mailbox.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
index af8ecee2ac68..fc31a4a3b637 100644
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
@@ -6,8 +6,7 @@ assign appropriate mailbox channel to client drivers.
 * Mailbox Controller
 
 Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
+- #mbox-cells: Must be at least 0. Number of cells in a mailbox specifier.
 
 Example:
 	mailbox: mailbox {

-- 
2.47.1.613.gc27f4b7a9f-goog

