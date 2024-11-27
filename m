Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587311EBFFD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705305; cv=none; b=T8/BUUYcB1GYF0MLHCh8DXNDDshMaRsCQFREWz2Ds/042j3iTkouBmcQS7QbSAdhlL5Hs/J0L9iG9+WlCygYRUmkIOLEyNU3lR2eJ6Vk55d/gkAqwvJ2jtBS4nynR7fDc9m+D4LqN27juI6o0/4QSj9Nfp+u+y6Ut/3Yw6oLwBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705305; c=relaxed/simple;
	bh=hOCe6cJ0obVm8UjxsiUQNLMPtCy8NJeg3v7RzQ3z6+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKb97LJM8DIIQO28d9utFDTi/3GhxFGU+CsTctQBOr/Fy55x3CKbpQA0mleQjev+LbdOqnRc09hc6BLE9ziElH22M77omTGOzFU6+R2GAVRoiR9szpvL7VLIw0p+767bsRr4xbgQ5bCaKqOOSqQUwx/Rv97oFt2DIRCdzpIaYKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xNx8a5+B; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNx8a5+B"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso8890145a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 03:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705301; x=1733310101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwFISXzC5YdjT7nYyo3FK0ynEMcXmWD+620yv0Db3ss=;
        b=xNx8a5+B8CdcMO3gctLMUXALIZb4dMFTo/pN/AH0HMm+ge4EWsvZApqW26HOrfX8V4
         AlIQKQECgGIdyQhHNNAIBQ17GB4rvpEhktqearre1KAa4nWgXwc+ZaLA9YyfOk+Qu7uP
         QwmIbk1TcosBLoxPS2j12an5rqeCcz9iX9G/uJw/Ho8Kv252a6Eynjaa6echUkV1EIQH
         OP8CJvNOVHDaiiQ28DxgX/zV0YFoMECK2LHo9MJ7gquqKmnfALH6Pg4/oDYVNVSW9Nmy
         duu4Kg/Prl1oVOnxzHAgeNnlXfsUwD4PYcZG/bMPhrDgfncdSm6VQQA7IYQIjhT7M2f1
         tqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705301; x=1733310101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwFISXzC5YdjT7nYyo3FK0ynEMcXmWD+620yv0Db3ss=;
        b=S3QCzyE1VXk1RvROzhSZ/k0p9kzI5zWoU6clxGfUUtlNmjBdBERpJYSR/v3bRKv9hZ
         N3nczNjNOs5a6YcNv8LtPkCar89SwAjCyMuetKPfpTE0/qreCzrbYpwxrwG8KKQUrpmT
         CcG0uP+7cjE62+N2bzxd/lpwkz0uqT3dargVhP6tm1d1mOrLyjuy1HkP2DdH2V/eXBXU
         4JHT/JtJ2AHCwve62UL66Tlr3iLsAzKzEBDATrhI9ewMLW8FWhCKR3rFbNzojSiXpGa1
         PX3oN7wCwrmFOT74GvmnpyhQdVxaMneEa4+A8aQl4Xv/YsfnQC+SeGPlbXQQPsnUOhfJ
         sKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy0R6zzIOWTrUDLxVqwNQ/i8BqO3AEFMrrb5iCRWCOiL47FRnZQL6raBwLKgdMIUx8ylCwvsDuJRrLErYE0DgcVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt887/Dsd40fMDNx1jfHgjDehXl56tKA6gj/fwKMinybeTLEd5
	rYxSoKyCHFhX048HeXuR3m/CrKqI7u8iYzwyhiH4MKB0IrOkTnLJDuuCyWvHXNg=
X-Gm-Gg: ASbGncskDwO0m/Hfi9e0XG4b921SPS+8XoFkWLtcbHlfR1K58AD3HmoFUmkDFjJd/Tt
	5WVVPlWi2PqXbSyg4RAcZyvrFCiEyknbqY/mbfwfz70attmPU4HesSbNewt9yTydVCmMssE262F
	5HJDbihlNHNJsg6gIJXFLIKhiawnGIOGi3UImmZwkQwKD0xDNdDxXLOTCKW7k2Sb1u1BHmtNJF2
	nd/VpqHU2MOBD1E1lvIeOW2m1+mLD1NPa0ehxS5/tynOC/fboGhOybCth1LwuhjvFidsy/WEvRe
	wj9VQf+nCssGcnNtV/vWvaSR546kXujpqQ==
X-Google-Smtp-Source: AGHT+IE4cyy/cDmo8WquVmKFdo7zSy462eB6By+Kdq+zP9Q+Ss+y6AajJ7PIBc5sONgo2uDxTZPy4A==
X-Received: by 2002:a17:906:2922:b0:aa5:639d:7cdb with SMTP id a640c23a62f3a-aa580f0ddfcmr151648066b.22.1732705301452;
        Wed, 27 Nov 2024 03:01:41 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:40 +0000
Subject: [PATCH 2/6] dt-bindings: usb: max33359: add max77759 flavor
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

On the surface, Maxim's max77759 appears identical to max33359. It
should still have a dedicated compatible, though, as it is a different
IC. This will allow for handling differences in case they are
discovered in the future.

max77759 is used on Google Pixel 6 and Pixel 6 Pro.

Add a dedicated compatible to allow for potential differences in the
future.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 20b62228371b..e11ede3684d4 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -13,8 +13,12 @@ description: Maxim TCPCI Type-C PD controller
 
 properties:
   compatible:
-    enum:
-      - maxim,max33359
+    oneOf:
+      - enum:
+          - maxim,max33359
+      - items:
+          - const: maxim,max77759
+          - const: maxim,max33359
 
   reg:
     maxItems: 1

-- 
2.47.0.338.g60cca15819-goog

