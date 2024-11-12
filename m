Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B18218D7C;
	Tue, 12 Nov 2024 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731439941; cv=none; b=XxCxMH2YcjcYFa5WP07idHiy1jfyVDMWEV+TtQvYNYA350XUyLwl0n7SYqXHUpF5Fn6iDCHa4SKYHFEcSKxO0ezPWigvxWzL17vfk9XMsou4otv8fNfq1z3FGwVEi0o/GZvA9BZUVzRmD9Fsbje//i9ceodX6OtdKiZHH3WgiuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731439941; c=relaxed/simple;
	bh=epgbS9RtzrCVBFjCyJlrkHDQBSeDAigP9kv3ZSBAFXM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PwNmPRaGyT5dYxHJXBwi1mGH8WYpt03bDixfMuQfhEpoX5F/nQnNc5KykahwGLFN5Jc/7MQ85i2J6pkI7osDjahuh1TU2BiQ8Y+cw6c/9O4narF/UaxT1TXyBQmtuKqaDkjlDpxom4arJONRLdjnnm7fFS4rEywjGflc856v7TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxntRLdD; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxntRLdD"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e9b4a4182dso7946a91.0;
        Tue, 12 Nov 2024 11:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731439939; x=1732044739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/xfqtm3x7QWKepSmfwDgHi7bBcwjVkW2hTBncGzpNI=;
        b=kxntRLdD5MP6QOiZyZ+6QD9/1bcb4CWw7GldRkALHmFYNw4XQ/HfE+hoyjuWdAuAZV
         z3qaLoKrcufxexYAWBSfFvUc373F+9ljdjWiJa1NLkpGjWMs8yYFccoO6qylGPT222y3
         QISr8YY0HR2xGXfzimMwjB2ascIj1MBMYLckj2wguTnsOltfJk737iV9TBqPEVF4s7KM
         S9SnVh1mI9cEPYHCc3Bj3HtCxnCTE/bTXQbCgC8ieBrC5YkrN4Z0qI8qRYYvnJZ23KS3
         +z8r4XP9kWLbIpF/FxAtCeMO8sIPBJPX4dMs2ckBXr9YuDlIvK7wXBftXXDmZrow21s9
         hEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439939; x=1732044739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/xfqtm3x7QWKepSmfwDgHi7bBcwjVkW2hTBncGzpNI=;
        b=bhOkxxxBWTz5DZnbsdpd1Nxd1fTqfxetCm8lMF6OFKGTo3ZH6hGdVwsUkqbpjtbVVp
         iQPW6Se+q16ISXD9tZYA+i5RkSZ0v/H4GZZ6psmeFCukqY4KjX7zLFaox9xt0CPy8fEa
         FgNPZ9vZgcKm9bUsWyzsjHdrlsJyXbORo4gz+RcJT/OsBXBI7Jn6U8j8+8LAF3yiq7ek
         hjvVaFtrsnrD96LkJbgt4k5e4DF+66TV4b/gcavY7OPZxUJu10lmD9BLULWtl0ZelreV
         OMtyef6LuYANoVYJYcHcmUD0fn7SsW8RILzNzHnyFJGL0nVmXQoiRFfcTcUmoMNkXmaU
         QUBw==
X-Forwarded-Encrypted: i=1; AJvYcCVG6k6Jz6B2myMJBtaKSNEeGLaOItn9ZXacUMvaRh+t9k4lAgkQCYYBKxUS+2ul+7Ji113KezSIFCEAinXiFFn5MqE=@vger.kernel.org, AJvYcCVplvQeidvSLoXFuoCc/CShCVjKFu1YuWE27SW1LxY729pQQxGO1xhTXjMfzQHo6KQYcfPMlOR4hkKBI4nc@vger.kernel.org, AJvYcCW+C99lejbuTSfdvLWibVibAMLfb2uKo0dtkRfIUqQlOydKWABtcD90s5DbX9llZOTuhgRj1kIcK2+O@vger.kernel.org
X-Gm-Message-State: AOJu0YwXBImL0h/80IpW2W9MhrB6BEwoCOo7bVpmlmoZXkepIpCZz4xI
	6jpx/vwuRZ+Po8utpntlXDTfJzn1fqiXnnqTBCgvgAWv40dgu7x+wYE5d6KQc/U=
X-Google-Smtp-Source: AGHT+IGrqEyJ1d4NsV9KxFv5AMzPEJx8k6S+eQ2baPGh52LTBwbe4AJ9JiDd7LT5bb2AsJe5Y/M1/w==
X-Received: by 2002:a17:90b:2647:b0:2e2:b719:d582 with SMTP id 98e67ed59e1d1-2e9b1f64ebbmr26275292a91.14.1731439938703;
        Tue, 12 Nov 2024 11:32:18 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd17d8sm10988958a91.41.2024.11.12.11.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 11:32:18 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for Samsung Galaxy S20 FE (SM-G780F/r8s) [SoC Exynos990]
Date: Tue, 12 Nov 2024 19:31:47 +0000
Message-Id: <20241112193149.1262-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello :),

I'm a newbie and I started getting interested 1 year ago.
Well, that's the beginning,
until I learn more about kernels and the C language,
which is important in that.

Well, bluntly, here it is:

That Samsung Galaxy S20 FE device is part of the Exynos990 SoC family,
I saw that Igor supported that processor,
I took advantage of it.

It has the same functions of:

* CPU
* pintrl
* gpio-keys
* simple-framebuffer

Just enough to reach a shell in an initramfs.

The preferred way to boot the upstream kernel is by using a
shim bootloader, called uniLoader.
Changes: - Simply add dts from S20 FE device

Special thanks to Igor for helping me with that :)

Changes in v2:
- Change author name

Denzeel Oliva (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE
    (SM-G780F)
  arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts  | 115 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts

-- 
2.34.1

