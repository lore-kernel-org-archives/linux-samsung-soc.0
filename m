Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60F1341ADD;
	Wed, 20 Aug 2025 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701955; cv=none; b=nnq/9p45eZ1b6eo44ynczkGtEoWfkKFlI2MqCq+3icCbpcP8DagKUpZA/EKPnBOuw+DIIWJm6MshUFqdl0xVaZvunrDehy4SV+piy8q/MopjaNLtoll7pO7+2ZsmmvYoQlcVNEn7pIJ412r54FfCto/23PC5TyRgo1vGHYo+5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701955; c=relaxed/simple;
	bh=W68k0m74FKq6rT8PIZd3IxIAE0Dive0UITAv+zCe5+g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SQKzFzLmE7WRqqiuBBwyE4eG3FkApjCaG7dkWMyo8JJoeaZIsQKK8VF4JKLWsFbd+bwyLWbVUteVI9Jytn2JIP81wigFkIK9naDug+5ltmip/lO2UbI8+eXcZCRhebUFOgRcNV9P0CS4Y94xD1xJplGYCsByIIJlXM7s505fsNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQTWWkYO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQTWWkYO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445827be70so72560205ad.3;
        Wed, 20 Aug 2025 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701953; x=1756306753; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+gWtZEHKoGP7mw0rgmfais8XlelkoGry/mMQ7iZX7hc=;
        b=WQTWWkYOVUnTee114zPtqVzhwVAD5H9HdPS9Ley5oNiTQkze0HjE/flNVBF8Gmx8yz
         JX5s5JZS0xaBpFZDo2IvHJOy26pMMIxDvtNFH3QHpfuhvW83vo0opC8w7wk1s+dHgRKG
         kX1tfB2W+u6trHaxxUx+qLis9IFaSyzaWTaMX+n4lxeTuM1mdk6nzb00vm6aGrT79rXc
         EqxsERfiLwbqaLGuW1TYm8al/4vbI3jgTqTY6zjA3TCmdbyC0YmhpX/xbC/6dhJZKT5A
         oHvf05+urdj5kzN6oJSpQZHchd2BhhbRcyAqc0FkaiS0WBDvrMMFJaCfZ21L7mHwmK2A
         9TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701953; x=1756306753;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gWtZEHKoGP7mw0rgmfais8XlelkoGry/mMQ7iZX7hc=;
        b=AcEe63JTaahbO0zcxVtmCS8FZ1XSY9ryTgKJBASuW2hXUNk7ebXzVbhZOHOEH73O+i
         BFtz1E3Caig2/9GqGaTh1VlihmvCBP2pR2xBZlSFDe8XeSUa3T57t5Sjc3K0ZLKna1yv
         BcMyQdBipgoRV1AH9pS+pHx0tBCPwrRyUHKc6zBZUaa8Z68NMJtSBQTd4AYpg+j5/aVz
         lMeZqnW50/9Xx1WCbKoXsJBqShzZXOyGmroPewMZt6jQlG/teltvtPYT4jcQ2YeVa4lS
         BLGFfajQeXxQOpUw5sfsCHBtSvpobF0xWz6gsEnQJrTxnZFL3AhQn3BtL3oNHHENvGEP
         eAQw==
X-Forwarded-Encrypted: i=1; AJvYcCUp8Ue6XDxqgLtC+QBrNWAO7S4oLLTLsWC8m6cZQ2VRbWodhqA8xk4CHeeZsJ/ls8MsYTdgBjKuC5vP@vger.kernel.org, AJvYcCUsPw9rLGaY8lLDHMQ/8mpDa52aOWey3UhshmR+SHya01ziTbIq8fyHfw7N9e3RE71JM/Bevl4yT7mXToNA@vger.kernel.org, AJvYcCV/qGnTZZOuuiz4nDYmJ+3TbIb291Q9GHcVzLreWtxOjWgkhgGMis85BCJ80l1JNDckYaxuwWZZpEmT@vger.kernel.org
X-Gm-Message-State: AOJu0YztJ5WrllGfT4ZOiP/rpIk3+9PUW+j8DwpmabhaKVY4weEK7kP3
	CkDujzna4pT7As4U+u6/yZhmR/JuSQYvX2S9rVh9+BBnCB3A4kjtU6qF
X-Gm-Gg: ASbGnctrpW2KLC0LGZx+B90rJTWjDAL/YlXm4+OEdPaQ62B/qf74z+7Yh6a6bb0/sMV
	l7vjkiksWwkgQ/DShpv2kMKKwsAge8OndJ6OScJ17warNjC6qehS11H+BLY3+1qTXYxbqNnoDGT
	LmwBySfrIo1+fgTdVZJLDBu23BiAnGBlJYmHMhooeQVEaTW1gyybd1RkQml09tS69apopkLesbk
	TMJPtAnP6+3zdvqxz2vc14ld3V9tZdSuvJSbtAmL88Drl+NAQ54mONWBRpzlY154Z0NBrxemOLX
	uwYSd+Mo9J5d/0+lMLfz9U0b01x9c8RxccsuAOSUVRUpIxfYAW33m8QOfOBZl5Wq0DtN34UI/pH
	7aKRMSRwxIQ0xUkW34HwYXIkBQFWOiqBhh+vLKwSwFY7AXrQ=
X-Google-Smtp-Source: AGHT+IFuZGLvyxMcilBbJyU+WX5ieFDHPZ5qcPgTlkAoOpIPQGjsZxxRLuTraJW+LFjnoMiyYGMkLw==
X-Received: by 2002:a17:903:32c8:b0:234:d292:be95 with SMTP id d9443c01a7336-245ef237f3bmr39664895ad.42.1755701953108;
        Wed, 20 Aug 2025 07:59:13 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e257809esm2606455a91.24.2025.08.20.07.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:59:12 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/3] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Wed, 20 Aug 2025 09:57:21 -0500
Message-Id: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFLipWgC/02Myw6DIBBFf8XMujRAtGBX/Y/GBY9RJ6nSQEM0h
 n8vddXlubnnHJAwEia4NwdEzJQorBXkpQE3m3VCRr4ySC47rkXPJDP25rT1I1deQf29I460nY3
 nUHmm9AlxP5NZ/NZ/OwvGGerWtsrqrnf4mBZDr6sLCwyllC83XA3XkgAAAA==
X-Change-ID: 20250819-2-ab6c8bdf07d7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755701948; l=1078;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=W68k0m74FKq6rT8PIZd3IxIAE0Dive0UITAv+zCe5+g=;
 b=u9TvdLut9T/l2pJ/hsZbjYfVLj1dhqtUVvMITE8G9SK/eUYZGzp7h0OtJjP51LUJjTi8syUTb
 /JlJJyTwBsfCogQd8FAkonDyS60JQ0a7+mCVss5qZP2pgSvtW4nVz5E
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Hi,

Two small fixes for Exynos990 CMU_TOP:

Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
CMUREF mux/div, and update clock IDs.
Fix mux/div bit widths and replace a few bogus divs with fixed-factor
clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.

Changes in v2:

- In the first commit the divratio of 
  PLL_SHARED0_DIV3 should not be changed.

Please review.

Denzeel Oliva

---
Denzeel Oliva (3):
      clk: samsung: exynos990: Fix CMU TOP mux/div widths and add fixed-factors
      dt-bindings: clock: exynos990: Reorder IDs clocks and extend
      clk: samsung: exynos990: Fix PLL mux regs, add DPU/CMUREF

 drivers/clk/samsung/clk-exynos990.c           | 154 +++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h | 402 ++++++++++++++++++++++++++++++++--------------------------------
 2 files changed, 297 insertions(+), 259 deletions(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250819-2-ab6c8bdf07d7

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>

