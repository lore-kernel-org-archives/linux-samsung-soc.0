Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vq+WAAV6"
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244A7188
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 02:52:57 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so51298365e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 02:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551175; x=1703155975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mhn42nkbYNSYbqkCzR8s0q7mu4Kn3hIP/r9MxesLeo=;
        b=vq+WAAV608iv8HAZrFaxnvrAdTtcbtsPv2IwdjqVJDQvKZBKql6afIRPZ6DtVAkSPK
         LKUai0WaESB2APfw8jtmxLJcJyJ0LaPQ40mlsNzFPEsOiODOfJEihG6IBgr7XsHB83fL
         FqOzDIzui+lKvj/QwtydVQsSPhK/vz8KRpllEWTXVeUALx50QFCU11OpEYIozJc34DnH
         TEI7pHUdzJipJENCVWfLEvz0Oz20HCSn0iNiAkvy7seAMIK2yD3j4MRjEhg620k7cVxk
         S9gCHWoB9dh9kkeXg9eNIsniDLUBqoK7MTlsuP4gYBRWEr6GhIuUAb4X8D/AmHFYHvp6
         +GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551175; x=1703155975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mhn42nkbYNSYbqkCzR8s0q7mu4Kn3hIP/r9MxesLeo=;
        b=nP6ILWRomjcYJoymBtCt26N1M+WaXoR/fFd4Lxo8T+37nh0NdWto4Xb08pqI7rBm6M
         q/15ijpW37LktOYyK/DqnbkOUhMzWtfkamCYyx6SoXPN7xN80mvLxW5kZN2RHfh7WJ4I
         AVhrl8hQrf2gM1PM+Ks1p3e+eACv4jvZjBHQxktP15SORmBdjBKMFLMvWVyfDFCOuOFk
         jS8eeGM+8mXL5odBoQMFONScOhCcqnTLRKejDoORjJX8rcgoa9ve6fXGEg0T0hdcY+7h
         f63JPDS4hVZSOmSaFyV6iVrAIsafiHqN850oQtxA95ZGGdI9UyVPomct5vyq2YQAM7Ep
         CJQQ==
X-Gm-Message-State: AOJu0YzGca4pLT5kPQSoMBRMcHuoa8hsOTQsPJf/zZ7PoyThAavdSqPo
	TIiV0ReAP+38FQlPh9dm4jSkhg==
X-Google-Smtp-Source: AGHT+IFSACgeuqXfGtcq1HirR8WdhU+ZvxZq6/QpHoFhVCpG7A91zn3qv3cTxTqAwHCfaUc78R5niQ==
X-Received: by 2002:a1c:4b0b:0:b0:40b:5e21:ec37 with SMTP id y11-20020a1c4b0b000000b0040b5e21ec37mr4222759wma.105.1702551175514;
        Thu, 14 Dec 2023 02:52:55 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:52:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 04/13] dt-bindings: serial: samsung: gs101: make reg-io-width required property
Date: Thu, 14 Dec 2023 10:52:34 +0000
Message-ID: <20231214105243.3707730-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 only allows 32-bit register accesses. When using 8-bit reg
accesses on gs101, a SError Interrupt is raised causing the system
unusable.

Make reg-io-width a required property and expect for it a value of 4.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 133259ed3a34..cc896d7e2a3d 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -143,6 +143,10 @@ allOf:
     then:
       required:
         - samsung,uart-fifosize
+        - reg-io-width
+      properties:
+        reg-io-width:
+          const: 4
 
 unevaluatedProperties: false
 
-- 
2.43.0.472.g3155946c3a-goog

