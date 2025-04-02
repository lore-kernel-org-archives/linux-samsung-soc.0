Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725601F5844
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 23:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636883; cv=none; b=dVHr6j8rA87qnlFPVICK6GIkCUomE8J9P7SQMkv1tF5LR1FLekAMGW9XHEN0Q6G2mu4qV13+PiWjHVgIPGJTB1EUrStATvEj1f87PU3iR+B2nokJc4zG8Wis191Qbb0nQ2K3IAREZ4bxtXJSfQJSLXqQw4oKqQXUT4rIIU8XRNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636883; c=relaxed/simple;
	bh=JuJg3RWFLu45pm77OOaGXe9n2ejYZstIDW/7RArcbeY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tc++DlmWGnDgMcNkjR67ruNzC8QDspZnMiN5fN+B8Il216xhBpNgr6yMTaRpmhPpJNfTrGUdZmeNioQReAPLLzSJmazvccU42UAOGIaXGwHf72hwTOZzXVtkXSKyVpFre88y1mSGpIb0GBBvwICd4eOBS3Jtv/HR93Z2y/g5ZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oe7OE2Lv; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oe7OE2Lv"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736b5f9279cso275909b3a.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 16:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636882; x=1744241682; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5xi5mLFbZUHgD9CBrYI3yiaxvs0vxI4kX9JEPJJ2pFk=;
        b=Oe7OE2LvcWTeDfs3Imd8tDUrhPyqV23tYaIJQDpjZiw7YrBIb1Ra9w5+DgAYpUMVao
         m7ry4nrp8aBSVVfA1dmQyMIo8MF9b3mMa9qarOgJmlO6Hi4hkH/3LnyQxgTogV8BQmp4
         qaeJgcyK3hCn/AhmrjFRPKze0GQaCPBJMYyNcdYa6pTKZHHYQSOhWrdQlIqzsIEQu4Rb
         vJw48FLbHDe+eE7vxMJ3g8wEngLXHmh5nTyz7J0C719yfEjBfTOtinBYOYY+NzkOpIbP
         QI7x3kyobXmumBuM6bU8spy7jr2eVpZm/t+cfXDSK+6YvT6NkNnnPuISo0FW/T1IJeuS
         c9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636882; x=1744241682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xi5mLFbZUHgD9CBrYI3yiaxvs0vxI4kX9JEPJJ2pFk=;
        b=CAGQa5r+tmSgvthEOn7REIEgYTy3F2jwOAZwAH5w4vYIO5lQRRc63y6KjuG960kFYc
         4QycEofmLrISEtBuRtCxDsg0dlI84c+0YmG8nu6Mw1g4DHD1yTKEntd2Ru2/VSvHzMfz
         GdhEIDaEikMfe97oEJuYBk8ZrG9m+yvxpADHOIa9wh0j109R9Y3NlMxzunV9sdeJEZbh
         rMpFqaeKwBYWtVTyRs2H4/mam9U/Cp/E+5PKQrW6Wx/88KqeYmuPs9V1vLrD898rI4xd
         p0PlsRoRm0ZTDrnHfgM8y8rY5zGST1TcMbLIxzT0Tn0a5x3ULKVNX2XDAhc5mZvS0bHl
         BCtA==
X-Forwarded-Encrypted: i=1; AJvYcCXk3lTa6g0UobaIpj2rRhDbC4Pnu/Ube6CDRZIlYUzbTOkRMtfAbGZo8U7B20QA8dzXGdPJXteZDlL350gQQnQ/Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7kesVzaaOV9DmGvEuguPbGVYyYPGvzS3zs7yJpTkMM8/v/Th
	cesfmJ8bU6gzcfofoC8A2eww6Jxe4GAP/YPe5ECmukN2NZnnH1VW9Cmbir/oeDFVyxBR7nqOtWw
	S6T/igbBRoAhVRL6QkK42hnr4gA==
X-Google-Smtp-Source: AGHT+IGTNM1wxMMNBBsjkTvh/Xn764ju971ydcAgLFhQFJR70t7PGAxvgV/oZ/gvmmS2Z14LxOex+r7v9TwTloj7VDM=
X-Received: from pfbfa18.prod.google.com ([2002:a05:6a00:2d12:b0:736:aaee:120e])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a02:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-739d85573d8mr639945b3a.12.1743636881683;
 Wed, 02 Apr 2025 16:34:41 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:52 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-2-willmcvicker@google.com>
Subject: [PATCH v2 1/7] of/irq: Export of_irq_count for modules
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Need to export `of_irq_count` in preparation for modularizing the Exynos
MCT driver which uses this API for setting up the timer IRQs.

Signed-off-by: Will McVicker <willmcvicker@google.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..5adda1dac3cf 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -519,6 +519,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.49.0.472.ge94155a9ec-goog

