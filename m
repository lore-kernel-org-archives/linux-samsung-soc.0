Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDE94CE1E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661138; cv=none; b=hEKXPz7oM+dt+UF9fWq3ihC0TjmYUpuWKI96qxq/6hfz4SUJHq6p7xeSuxUPmdEykN3tmJE1rYgx6RwsHzrWS4ST636MSXW7BCL/87abYBnx2OzD9MoOj46yv0Spl7NC+PNt/Tm1hcx7whr8LhNtb2B/5chivX8hRHn9bBXOqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661138; c=relaxed/simple;
	bh=ehREIwN8Zk3qCp4noF1X7poNbyaZwIdmBpSJicE3XRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c53E15Z7nvMICjuAyXk7uNq/VcWhYSCtQcX2intPunpnhqgJDRJutGawrjTnYJcvpUET3YQAajXZ3zRBgyMKbfoB1r9d2a8VC4PBYA5g9NctTXpSKh9kDN5fvVLOqBt3hu16Ne2KM2Fssv38ndWVWOn9l2gqWQ5ZIN7u2iXtwYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wyoq+dIw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wyoq+dIw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso6970015e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 02:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705661135; x=1706265935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIbZuKCi3c1voBLaFczjMA5Q6as8L4OLAkz7Vvuwfes=;
        b=Wyoq+dIwqDKdVxlvfhOTeKqDLBiRFe+8u+xTNy7anI1LXB9tt+T9h19EpOtJ/EOlcZ
         otnHAsuMLUYi+ICpEwRkcu1qbJkRZHH8fH+y/e1LVbkuw6/y0MgqGOEImGIABD4j6BEq
         3+zDskCh1yTouCXPUqghsr8mfYN/gbWHD9MT0Zo+AfsUfqJsOnUI479rIHPdxH2NAtDw
         YXHVWwFNIYDKhqVB9vMABZPt5o/Xil6SNVrSS/PQY/gYVhaNm9cprWraWgXyMmv/zxHS
         /ZbBEN5B86aGCqAAOu+zptUT4XCAC3hKSFXWCFQVr80YvnHizzREH6GHGj6z9+JTqYNS
         ROHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661135; x=1706265935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIbZuKCi3c1voBLaFczjMA5Q6as8L4OLAkz7Vvuwfes=;
        b=gUR9NTLtOvbHb2gJXgmJgAL7qKFOM0WZD/ZFmh3VfJBj350l9A8uCLeOis+XHT5d5W
         Jgh8ipy0twlp81bGwcl8h03CI1m93SEImWg9JIelv4SwjtnF3OJZoxht78FTI1oVSsNx
         JdPaAhf6GP2JM+kQ08SW8VC+LxfwYyav4d3RTXgrhWBEn/btTT2li5xbc3iBlHJjSf2c
         lWjaVlrh8zVpz+EXg+xynPjhxzEUAzFYbeng1uctG+7eresZye7n7xUH7RLsVAZtq+bM
         WwjDXYwd/VRS3gwylKXDqOqGBYfn+HBHe3lVoXrwTrEfO6hvbND5kM9menWTlc8I6X4I
         +Tkw==
X-Gm-Message-State: AOJu0Yw/++A1Og1KxEI5yeq1P5WGP4JeaNLthUj9BeU62M+P8g9j8mYb
	pWaDGff2cRCqzXniZNpNO9RI2i7ntFFBaybnszl0zmd8pxsM9GHs+wCBPlArPIU=
X-Google-Smtp-Source: AGHT+IFLmA7d8ltm4h9XYmmFH/I/kevgVOWIIn/k6BbTcCgt0ohwTpBHM8yPPxHqUedz/2sHd4eFSg==
X-Received: by 2002:a05:600c:310f:b0:40e:76f4:8cf1 with SMTP id g15-20020a05600c310f00b0040e76f48cf1mr681769wmo.221.1705661135759;
        Fri, 19 Jan 2024 02:45:35 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b0040ea10178f3sm77470wmb.21.2024.01.19.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:45:35 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 07/19] tty: serial: samsung: explicitly include <linux/types.h>
Date: Fri, 19 Jan 2024 10:45:14 +0000
Message-ID: <20240119104526.1221243-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
References: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

samsung_tty.c uses u32 and relies on <linux/console.h> to include
<linux/types.h>. Explicitly include <linux/types.h>. We shall aim to
have the driver self contained.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index bd9064d4efe7..b9b91ff6a1d7 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -41,6 +41,7 @@
 #include <linux/sysrq.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
+#include <linux/types.h>
 
 #include <asm/irq.h>
 
-- 
2.43.0.429.g432eaa2c6b-goog

