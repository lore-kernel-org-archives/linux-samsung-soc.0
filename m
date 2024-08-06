Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6261803A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Aug 2024 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722958199; cv=none; b=rrXoRZfif1Hhmm+URDngINrLOEkGR4pFFTVxc9iIewbgiog9vn1M4a6PW3DnpCHzlGGgzOkWqDwfIG6eXgg1AY0KZJUtB6bzAsFKKTSX+qPP9WJXsQiGS3unXC9bunLfO6uCHXKoblDlvhYChrT/vU5s7RCrz8u5Igj/XDmFPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722958199; c=relaxed/simple;
	bh=fv3k8stKYzTS9UIEU0lpQcQQUZi9Zykq6iQUOmCKotg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q33457f3dpFlulniMoyCrJ/DLv3Uc4KRafYstrfL57gKva9Z2nLfFY1r/14ckmHAEaCNLVRXZVjaHk0yiBfWHU9cJl1N1A26Ic+nRMO6SvPb8+rxVrAEk9x60jV9bwPB5XoQyxjXuGuAuJDPODOZJ7S0m4gs1+jM22k82kPaGR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOENyDJQ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOENyDJQ"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso12908401fa.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2024 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722958196; x=1723562996; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tprBLK1iiveUCYg/AarvtiLLOVA4FPbpWQNyejze9a8=;
        b=AOENyDJQT9RsnmqkYhSmNjqbmoIPl2GreifPvxDRVZqWItvYwuvAFg5azGunEwqyva
         FozNoYBlhoQYmPVKOq/eVmqP0fzqbmV++lcjBCu6kbU14P5yFNK1jwfF+w8AGJ8QG6DW
         cKkbJjbe4WNrFFps3peFbI8L3B2zfGlN5kKfTB7Q8Z0WLvDo0m0AEasN5Nkl3DgooB+4
         m9sOolWq21P/FeT61GBme75ZmvQ58+w5hRGSvPrZUrlbVavVecO88uYujGZTeJJCJPzJ
         sF1fj9a3PRaUVmOQRMJxU0ji08IKvpOMbMP9mEhvqjLpJd9RW4EeRJmw0GKZeI7vbj1f
         vXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722958196; x=1723562996;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tprBLK1iiveUCYg/AarvtiLLOVA4FPbpWQNyejze9a8=;
        b=SLUmiEIeGaedfbk+M5TIQZ4jyRW481W9P2vp/fMfimZ8sZNf/Br2zgXlBsPfc36wPG
         LTQOjPe5FxRLvyRuHpTc2zWEdbWwi+m6rAU8+UsknvJx2YA1gUEfBl/osFDb0INu0TS7
         3aNa8EIUznv4IUPMpnDV+Y+OIkM7Dy8+yZmkQB6HFTrXz6oUWEPWCUtl4wL1EnfwgoNK
         Gd5VFOK5VP6bg3H3VgtP8nsJXMDRg7ywn+51t3lNuyxk18OLI9Kj+hewcs4Q8WzrQfrh
         sZDj5LIUYtz/y/39fZJzoHFEZ6zp5WjN3UWBKR2mMlW7nep70hbFYaLgARQ5n713Fziq
         tzMw==
X-Forwarded-Encrypted: i=1; AJvYcCWdNdgnhsTq+rugx2k/vocDaAd1TAyi34NVpLicghgC+7DjispLRsl5U9U/Przi1/70PjlXX4SXQYwI2ok32uZzFbJztfQQwEf81Pgp9rFjDJs=
X-Gm-Message-State: AOJu0YwwUd3y+3IswfrPe7x7eYp8IzEFJpuSRisJ+R7bI0P6cOju44FP
	f3vg6Fj5JtMo91DPxgKl+/gWf7kRxEDffOFaBg+G0IYrEQmOl9eFFGzCAF8wQ+0=
X-Google-Smtp-Source: AGHT+IHRZmLaStmO8UYKkVKFqiPyc0B8sPefyyWX408Vg/RWnhXs/VBIaM9S0t9/2UoAAbzROa8OcA==
X-Received: by 2002:a2e:9cc9:0:b0:2ef:1c0f:a0f3 with SMTP id 38308e7fff4ca-2f15aa88b76mr125008231fa.6.1722958195923;
        Tue, 06 Aug 2024 08:29:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d4294fsm555274266b.103.2024.08.06.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 08:29:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] tty: serial: samsung_tty: simple cleanups
Date: Tue, 06 Aug 2024 16:29:44 +0100
Message-Id: <20240806-samsung-tty-cleanup-v1-0-a68d3abf31fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGlBsmYC/x3MwQpAQBCA4VfRnE3tbkheRQ4Ts0yxtINI3t3m+
 B3+/wHlKKzQZA9EPkVlDQk2z6CfKIyMMiSDM64wtalQadEjjLjvN/YzUzg29J7YlrYkVxeQyi2
 yl+u/tt37fnhqy7ZlAAAA
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

While looking through the samsung tty driver, I've spotted a few things that
can be simplified by removing unused function arguments and by avoiding some
duplicated variables and casting.

There are no functional changes here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      tty: serial: samsung_tty: drop unused argument to irq handlers
      tty: serial: samsung_tty: cast the interrupt's void *id just once

 drivers/tty/serial/samsung_tty.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)
---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240806-samsung-tty-cleanup-ffae1515a284

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

