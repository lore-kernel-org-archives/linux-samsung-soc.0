Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857C4D5B0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661141; cv=none; b=R8vsdQb0EJ0ZWCtJzPv/vYgZ8IU3FsY3RIb9y9tcEXjE+MA8uAuZo2/qNrNg/oKEs5xvKQKreU+bNho5nRTINE3Sh8RQiwKOmvBEsRFAF8I82gR7mmKWhLL4TR9NXdNuWjRgR15g+JOKPR9flHqMOt74JH9/7IuPcsscwJEG9t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661141; c=relaxed/simple;
	bh=9bJVEIeoTaJjZ61pXNxm06VhyRFtHsguVO+YA5dDTxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVuaTgjBcXwUohaph/xmtSh5Kv4vDVXeB4D5N0je04SmqcqRwiXMAqe0zTvvVbBq2xEPQFT6DfV2drJinviKnQ2V0evB75rMEG8tvxHsgTK7DAm2tPE2FiU5ZiVdz0M5cWVWjHa0k6+QdolqqTxowQ8jqF5MGJj3b0WB3x+AyJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UcswlJwa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UcswlJwa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e9ef9853bso1969005e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 02:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705661138; x=1706265938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ40aSkF8Aok0dVvTVGIVu4hOfQge6DrOyhL11J8cEA=;
        b=UcswlJwaiFT3zrykl1Bu9Lwuas2/c9fMlRJaid0u9KnPLpMflbyR+YeEe9Up9d2+qY
         BbbZl2msg6jDCjMjd58e6Ef8Kdyt3bEVFEqkvdIHn268s9hGyFxfNTmpDZqrtlOADHU9
         8tWWvBGQSyFNGjGqpTdzEuuYVv8al/EIGJXQZa+rEIrbHY28UYIOl7rWTogaI8cM2ogT
         TUiydUQtVyRXbUMXy4HvyxdPF6il4m+xpsVdYENap9g6KH/KqARQYC9pJ4CD7rSEQUBZ
         jN7MvtiqcCxPzpMqZcy5iXOADdj4lJTDWijHD4QBFZxzTsnXlfJpJH5ntvAiM/AE5Ld4
         4iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661138; x=1706265938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQ40aSkF8Aok0dVvTVGIVu4hOfQge6DrOyhL11J8cEA=;
        b=kcQ9oYLs8GoBairvHJjbDpKJH3S8qo+W4bINWTqdOVw9dLSPqmQMHrrdFwsmmelsFl
         PLUN/FkKfrV/IvqVPi4Qvw8ycmweJF+P3aRBDZRnPTMtldE5QZHYX69WPL8xzApFmAfQ
         CbuOJBR82QbIBs5nXHH1WNbEnhnbl2sAtWgz7cMNtZ4IoyCCecT+V3bqRSGHC3Z6Ck29
         VgDR83c/AiUAb/L5PVcwOzyVvBjeHH4QVPPrt8ALgJLWSdmb4ubkSXwURzw/MPHw43iV
         O8M8MfS0/7iv3eA3G03F2/wrgwRnt+jtRWfZ+uH9J+PQXw3Vh9OA5IriJWYL7JSB/hFl
         gD6A==
X-Gm-Message-State: AOJu0Yw0eEc/fKR3MaAXTXvuPD/V6b22D8gtXGoXQflqtSknnD0fzqL+
	ovT/TAb2fWLigA0R8VltAgP9hk1EeFiYIlGcNRExWoAn0dg2bYkUkpG+oKo84d8=
X-Google-Smtp-Source: AGHT+IFB56z75wwv61vkNgNKZ52ys1BI0PMljalI5CjTRNffvDMu2NmbxLRBYtutQlkZKDjxtS4Jcg==
X-Received: by 2002:a7b:c8d3:0:b0:40e:873b:cf73 with SMTP id f19-20020a7bc8d3000000b0040e873bcf73mr452698wml.54.1705661138275;
        Fri, 19 Jan 2024 02:45:38 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b0040ea10178f3sm77470wmb.21.2024.01.19.02.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:45:37 -0800 (PST)
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
Subject: [PATCH v2 09/19] tty: serial: samsung: remove braces on single statement block
Date: Fri, 19 Jan 2024 10:45:16 +0000
Message-ID: <20240119104526.1221243-10-tudor.ambarus@linaro.org>
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

Braces {} are not necessary for single statement blocks.
Remove braces on single statement block.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 8b396c950933..303b67498c65 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2061,9 +2061,8 @@ static void s3c24xx_serial_remove(struct platform_device *dev)
 {
 	struct uart_port *port = s3c24xx_dev_to_port(&dev->dev);
 
-	if (port) {
+	if (port)
 		uart_remove_one_port(&s3c24xx_uart_drv, port);
-	}
 
 	uart_unregister_driver(&s3c24xx_uart_drv);
 }
-- 
2.43.0.429.g432eaa2c6b-goog

