Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D81E531
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675020; cv=none; b=RonrPSlhsPhl1b0LxWZZ1/arw6wtK1HRkWLEAopP6bFtffwefzyqA7svAEtAyqlqtK/rZE+nUvQz4/wFaha/VBYMD7/Zr6Fpezs7vuWmNFnVWIzy1JmSOUFXgcp8v53kHCAbzYy3D5NisO0qfMUH4om+yIQFlSZDxBDf3lOdfos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675020; c=relaxed/simple;
	bh=M9kVaC+3Cr459HgO4DubNcbQRmLEGq9666e5ZHFrwxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tYkWVosq3ZWC1kPc+wSzopa9afr5xsebgeo9qMbVwovO1FEkwrTZj2hV6o0/FWA4DRHw8LnnnnrauLqnJD3oDHgimUHVtkDpyE2UUMXOYx8HBDI1uOE0vDx7LRLU1UwyELaz2yq8REWEmRTiFRBTTMZnpuulVT/sYXRSmzX6494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCIc0XVc; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCIc0XVc"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c73fbdd9b53so530923a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773675018; x=1774279818; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aiYHquvove0P0QSfsD4NZMy/bqp6mn9Ek+dpN0QYTm0=;
        b=QCIc0XVc+1oZg2q9p4QfOzbihvkbTIdA+Yyd6t38C1VxBP8R+sdyXo9wDbh6cXOSyQ
         yv3xgSkt3cGOPy21WR/TRI05wTE4Y+Q8k9c10CyCYgcyqD6fJeHSSaLVG0qtHfb6fEE1
         RGmfLHj310H7BkgyU2Q8j86JLOElgC4Sw62kGwXmiMcBbKDu6MeQPWqtJrOseTHZ3z8V
         ERWahGOMWG+PG51K5DLjmdStmEhIHMj3vAvakvqIbsBpPkG5r7d2jsTT09lL/amDhOI4
         w31z0XUYSCBKQyLzdjb0bRe+AMbgr2QMKHeYG48KpFdw+hd9BwOlrh12cKa21eNr/3Bn
         ZLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675018; x=1774279818;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiYHquvove0P0QSfsD4NZMy/bqp6mn9Ek+dpN0QYTm0=;
        b=L/+fJeZLRhXoE2oykFSf0ZIbAriLJ7jjlTLAZTsNGiIrqASTWcnWME0jaNPTs4sazk
         5gbZmGWVihxrpvwZt1PftXUzIRNf6o1nHc21Iz70pJGef3GM9Cqx2kDewDRAaUUcr1h1
         n3134VlfWKBt4um3TSr3RBpuLBcYg3l2g35Zd8mDjkH46F4o9ONI8B7vD6PBMn+Qilhn
         IRj9z1vy4RL6Bxv7gKytsnZrSZZjWPPKrY1X0Yw2vBMt2YXTeIm6teYPNFdHSapsLHLX
         UCDNZb+QMJuB44MQB1OROBwqMwXmmeEgq5s92rmvEo0WtsvhOcBVGX4+hVl/N8SWSMnr
         kDdg==
X-Forwarded-Encrypted: i=1; AJvYcCWbL93wtgw6NrmfTscaVV3+IeG3ze6fBt5IbATICQaPRrpfPo/TApt8pTA3d94m2uQ0bNXI+OlqpkYgPWk2Wh5TMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRxGvanzrsJB0n3iH86eU5QThRKFpY1Ph81Q26tFr8vOzeYaXq
	aFjaMG0ddnTL9seGPNVn5HT0KAqpHGNcgk9UN4Dsdax3AcNFiJJL8aHH
X-Gm-Gg: ATEYQzzO4j0m1wtzs++1DsN2URZnODtL0NxxUy4HNWfWGsosf2R5bTuGi7R7PXo66Jf
	mchRtC8riugFfbuj8qXiS0wpLYGS6Hwto7uXZPRjO8US4zl30Ph9lc6DhRsDQhgenWU/itsPoJV
	zpclca7wTzSZH3W1YqyIh56aJ2k8e4+8BLIJnls0HgFcvUdnYuaykcOQl6LENiWL5GOpLlBcD4w
	/OM8rQuYpPmnLgu70B3/LljSohgDf7XOguceoeOpXhfgDVXeftIyHoGm2GNRVPDAI7eZIVNbTFn
	bH/4sugKPZu4yCv+UAljwcrRXFUOw62DhyfHS1QXWR3BbgSpbGAWZb8gs561F4fNg7cao9vyc+V
	RJ5I0/c6rSd7k+LbLRMAVyWy9156hyqrwo8RfcfPm/aLldyWFOTGd9Iq88zDFo+nEZ1iEoINQKQ
	8yusdDdns2qLI2BzfBObQNZ+BEd1qhZu4el7qk
X-Received: by 2002:a05:6a21:7a97:b0:398:9379:d04d with SMTP id adf61e73a8af0-398ecadb5a2mr12165818637.24.1773675013707;
        Mon, 16 Mar 2026 08:30:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb996257sm9392478a12.9.2026.03.16.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:30:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 16 Mar 2026 23:30:06 +0800
Subject: [PATCH] dwc3: google: Fix PM domain leak in dwc3_google_probe()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-dwc3-google-v1-1-c9bde1b02f62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP4huGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3ZTyZGPd9Pz89JxU3bQUM0PzJOMUQ8s0UyWgjoKi1LTMCrBp0bG
 1tQARqXqVXQAAAA==
X-Change-ID: 20260316-dwc3-google-fd617b3d19f5
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Joy Chakraborty <joychakr@google.com>, Roy Luo <royluo@google.com>, 
 Naveen Kumar <mnkumar@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773675009; l=1291;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=M9kVaC+3Cr459HgO4DubNcbQRmLEGq9666e5ZHFrwxQ=;
 b=xHLSPpZk8SHQGjWfG7//LJvvpOEyszCJ6PrI6sz+mE35M4OL3AD0FVkQB0UX0IaWqxHIQQNTy
 1FneRQRqG+nCC6L0vSU1H/byaZtGy+/ZuQ8rHdQkf3v+SDoHlMMHEt2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When syscon_regmap_lookup_by_phandle_args() fails, the function was
returning directly without cleaning up the power domain initialized
earlier by dwc3_google_pm_domain_init().

Fix by jumping to err_deinit_pdom to properly clean up resources.

Fixes: 8995a37371bf4 ("usb: dwc3: Add Google Tensor SoC DWC3 glue driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/dwc3/dwc3-google.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
index 2105c72af753..4ca567ec01d0 100644
--- a/drivers/usb/dwc3/dwc3-google.c
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -385,8 +385,9 @@ static int dwc3_google_probe(struct platform_device *pdev)
 						     "google,usb-cfg-csr",
 						     ARRAY_SIZE(args), args);
 	if (IS_ERR(google->usb_cfg_regmap)) {
-		return dev_err_probe(dev, PTR_ERR(google->usb_cfg_regmap),
-				     "invalid usb cfg csr\n");
+		ret = dev_err_probe(dev, PTR_ERR(google->usb_cfg_regmap),
+				    "invalid usb cfg csr\n");
+		goto err_deinit_pdom;
 	}
 
 	google->host_cfg_offset = args[0];

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-dwc3-google-fd617b3d19f5

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

