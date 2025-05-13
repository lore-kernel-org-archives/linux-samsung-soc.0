Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DF323C8DB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132949; cv=none; b=D47Uh6LyCzhBxRjojw7vjx6wAJaqbbDpacXgQZ/tCfcvxcB3RWhE3FYqgURhgxnGvYtsNaL90VaD9VTdH7Mh2RwkIagYXG5po/lmOss7I2fjMXO1PDrQhlkr5WB3aisb9aX4PSqAXKuzlx6WO56QX6mb+KV1qxF4OvuKPjFLPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132949; c=relaxed/simple;
	bh=D7BFaN6Gc6SPGnvwqk3SshdNgmJRuNAQWzUgSNJfDXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwwRJ9qtGMOmosS0hZ/NaS0+SUylWGXxsUQt2WCahQ4ydzfZLbiAKLP6UArv48TJKYfqgeybdVMU42Zh/C55szaVve8j4Zy5suj3abmrX47GtYaI5SvlvfNFODjf/Hh5odQW5WNC6s4Hgr/Mw8rjv8pokPpnuxwNg8WCtl3f8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PGaJa2YY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PGaJa2YY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442eb7edc80so379455e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747132946; x=1747737746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRAq4ALgPaeQIqebqipJbrANRQd/TsurkWOFmFAlemA=;
        b=PGaJa2YYWafd6oMk5MShkLHBwY0Mn6wuhVJPQnLznIhXU9xSYYSCZnz4tKBFLXQTjM
         QoglLlk/QnAYUFlYaCIsEsy84QH1uciE5pAtgs8zUeE6sGcS2V19UbFC8YAyvNYsv8rm
         JOZj9/hRiZW1DsooKzYVfoKvpgG5Ij1r0QgvBaXTokmO0VaniGs4szLjCB+gcUo/L+hZ
         GG4q5cKXJQumzfxsrnQ7A/ctWbyhDZn/FgQIu23DzMdmzEHwUfXu2jYVgJDElejOYHXM
         tjk42Qk94mTU5VSWiyFVsJzYVhcmSDht0hwHRerrUxUOjPB4P4BiE4Zc+u8agiGei46b
         KXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132946; x=1747737746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRAq4ALgPaeQIqebqipJbrANRQd/TsurkWOFmFAlemA=;
        b=K0I5XdU8RGl1iuZZ6ICtw0mN0ajIvLZc84vaM8yYoXaV4+VaPaYjPPIqkYOv+aKBcj
         e55HhE76GiPFy7X/2FHXeRAmmqECWN71yooQwyPvhRx2Rq3aii+tTz/syGymPfQlqPpZ
         F+Quhr/Nj10lL4NC5Wxsb7wcvRrnPwBo6HwsfiLiAbqSRLN9LHNs/aQBNwy8TGy6Ch6H
         PceQhYvlxhzucbpQ5KHLIFtPBrACR3lISDUSC5p12/JgS09O5mHWXld9bb7fRgv2g9Dx
         UlQemhbavsvNveVLkfz1hZchmaLWVAMTQm91WY86V+dUMqhabE6ljrRWqzmPAONMl2MN
         9r/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdrMoVK/7sJMIRR2xCsn5IlZg3hLYpJoutA5fx2tTDBiD7YetDGqYIbRjgDNDRhO+YyRo2d6NCJKLQIy499Rus/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXBUN62RD/Q8zEhrhZcrpT3ZfzE6EwvtUSe97El+s2428kdAfr
	nuob19cD53+SFeFO3XPHyYh8fnx0fWEJJBDGNzHXYB4Xc3VR24mlmiLuaU5zoqI=
X-Gm-Gg: ASbGnctKL3KOiifR0Oxp2gPXopbPbQSBscs7E49Ej8vT0cZuAP53e4tJN/4cw9i6zWq
	wkWgq26rqoubAv0n/BTUio2+hqBMU5E3w6BKbMiyh5euLKSLkIlXrzd8bpdmOsiV5MctfqXKA0z
	vuDznB20iulhPVkhJE6E8rRdhhtFN+fBHY/DOUOTZLcU2/jkd9mxSpL8t05zkApyRdDXUeYwUS7
	viPb0dt7+rSZIgKFkw9JrK/1BHe1mToWnYYASCu0O8BDCewucFgcaKM/73VwlFyNQ2DIkBDJ9p5
	8d29D09ZzSexc2+Tcip3yrDG3XOpq+4id5oj6eWwZn9VPtJZxIivRd009TmJ8vwHS5Kr0S6nqsk
	eVau3IgB+8ykVd1Of/CbQkxr1rg+sjSOpHXesvyw=
X-Google-Smtp-Source: AGHT+IHNVUCjFg7HrwuiKvG5+jPLvxkbHOntgjhYx8tbn11qUKDZNDS/EyFDT0F94zfQs0ixdCFIPQ==
X-Received: by 2002:a05:600c:3b95:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-442d6de96b1mr49643205e9.9.1747132945724;
        Tue, 13 May 2025 03:42:25 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm161002435e9.37.2025.05.13.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:42:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] ARM: dts: VT8500 for v6.16
Date: Tue, 13 May 2025 12:42:16 +0200
Message-ID: <20250513104216.25803-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
References: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=D7BFaN6Gc6SPGnvwqk3SshdNgmJRuNAQWzUgSNJfDXQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyIJbw7VpDum2ZoNWQ6N9G3/MtLdNmncQjeRC
 +5gwhHHQPOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMiCQAKCRDBN2bmhouD
 1/FRD/9SHJs9/n0riKbtCAfMiWIEwmA4nkcIEyt0wmgoXKAA4tj3QchnLVYdRKfIRiqOOGb1KIL
 Bwo97js2G9shOs4KPah8nLqeR1NipSDjYmU6UiC9+xtrAhYpXpbLl/+yt2sLQ6FupbUx9h2ZGI4
 fPX7h6IS1C7P/akWY8j+zRaQRdRQuzmK/6eJoyZ7ViR4lKVxfQo8TBC8dAt5wrRjIDcSqb5GTLy
 XikLvqMu34/Ixux7rewqwHbvfh5dTV2+vjr0Crv4GbgqUqPv9XxmzFDUufw9HCCSrPVonr/qunm
 eOHuNs4G69RPr12zqzOuUICTVKLCGKV5P07FqddQHB5L9emq+bnNyxBKWLuB+tuLBz+yGCVWLPC
 k65sr+ji9vaUzX4lKlpkberXue67j6q2VikoJRIExYwFd5OnMlF8/pGWfbvwQvTRWUzSZ3b5ueP
 5Ugu0kwY3kghbgAp4MW6zxxhRbGAyqjEJehnmX0VIff2lCx3HhVK8JoH/kow7qSWCMBpMzzDPZl
 K2lEXzOK6P4KI6UFpEzBYBxH6AA+GqY93xX2T0QyqSYG5IFv34UV8GeP/DSZJkZkMz56E5wlT8W
 zqIrU5u9wcEFgSb8p2JDP4FVY546IsNnP+P5uyiCTV7EVSsPkozLaepUZcBX32KbVRjnquZ/cgW W1BSJZOl6iMJ3xw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-vt8500-6.16

for you to fetch changes up to e58afb3e1f365badd69aad6f0d53a2c66a63f689:

  ARM: dts: vt8500: list all four timer interrupts (2025-05-12 08:35:24 +0200)

----------------------------------------------------------------
VT8500 DTS ARM changes for v6.16

1. New board: VIA APC Rock/Paper.
2. Add SCC ID register/socinfo node.
3. List all timer interrupts.

----------------------------------------------------------------
Alexey Charkov (4):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board
      ARM: dts: vt8500: add DT nodes for the system config ID register
      ARM: dts: vt8500: list all four timer interrupts

 Documentation/devicetree/bindings/arm/vt8500.yaml | 10 +++++++---
 arch/arm/boot/dts/vt8500/Makefile                 |  3 ++-
 arch/arm/boot/dts/vt8500/vt8500.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8505.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8650.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8750.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8850.dtsi              |  7 ++++++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts      | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi              | 11 +++++++++++
 9 files changed, 71 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
 create mode 100644 arch/arm/boot/dts/vt8500/wm8950.dtsi
