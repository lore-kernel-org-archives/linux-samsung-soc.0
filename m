Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158C36F062
	for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Apr 2024 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714322005; cv=none; b=A8kXAgAtW0NB3uAt9Tu39OiN4H+C99YyKaz/cjYeRNUagclbe9oBKi77vN/2lglaHStaqUjopYBj+d7V74QudgP0ayM8XOhpDNr6ZzWghgRjRmmoTR1izWKQFBiruJxGuMfrvvFFUCBO+WlU0REG9Zk0r5sJX4+c2kqMFoPR178=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714322005; c=relaxed/simple;
	bh=88rTqj5+Fqw2jJzBssNoetZI6xLcmbWmkGRmH4jzlMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxLRW1JW2/1R2hEgQbRabG52u5+5I7nYAvz2/+M53Y1zjYmvnRC6STTccY1RVx7YdXTq4EUPftql+3XebZ4L5km7N/rcFxhfUQW7L3+GtI6AFf9D/FgaLgh8E75UmD7n6vCxEhPH+XCIAZW2DLvcMwXBFg9E1UaUzCdLW7fj7HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h28YFcoo; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h28YFcoo"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51b526f0fc4so4600860e87.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Apr 2024 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714322002; x=1714926802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIvwFd+6dBRNz3tx998sp/xJQSPWwbglBJ/Us19tEPs=;
        b=h28YFcooJeJDAXydQOSmLVqUc6QUqo4PTYT6dBXceXm4NQYO9EquQ0SRYkrwPfz1Iz
         LQW8Jf12/7LYNHBr5cFyabhPNTMSWuMKpdWmrcGgEd5FQRh6euhJ6UyOAPWUOgE903sB
         1RuWKsaf6pk4YJEHmxPhyH9cumfA6N69mK73ZVGhJmjq+gdihIqveB5A6rxLg67dDYyS
         LODRXBw+sxstpJxCoUe89BLX3osMFoIZ6V/yLPdESaBTu9/z3iSZAfME/ebS8AEljW23
         BVSzRRtNVlxiF3CTlNGbO7GYer0i+cmyPH0SpkJkoqogjRNFcYle69MtvnSuNyA+HygU
         DqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714322002; x=1714926802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIvwFd+6dBRNz3tx998sp/xJQSPWwbglBJ/Us19tEPs=;
        b=ZMfvK9UqtCRZnCoPgHVXm8rzIYH1Ph/CBJnZH0eWOHfyHAQ/rnzre0p6HgCm5m7ecq
         Puskt7TgCJ7DKTgezgchY3Y6xkrIOETtYVIM/ie5X3KkBcbkDRzDoPcD8NFtS18xNYQh
         7n9V+li9kFtZLcJG4pcfrGsV31DVq+YjHlbMaYlH7Q1nkQYVr6PcQmw+QR3bkhTYXtYo
         ONcl2vV8BRjS1vv9IgNElp24t7m+v4ebJec9jei4aBjLbPpUer0Wvls36yORJnQ6t4No
         AVTi3krmGT8xlZWpx/he7KdAiGOqdUW1mLiHYtHhXAe07OVKoUVfNRDBZY7aUB8pJ74F
         bp3g==
X-Forwarded-Encrypted: i=1; AJvYcCW9SW+r+4g2RwNd+9XvXMeyOaSMoPmN8x+sJd81xJNSPCwdff/4lKFVWQJOie465jV4gbkRugxa+9bvjl3nW9Mt4jsRkVbmvexg0FP6LDY7wcM=
X-Gm-Message-State: AOJu0YwD28mLSxzLA2TLBz2s+0uO1QyA2+L0h0/qDl2TloaU8U0Tzqzn
	bNPteJxhNFOwSzwYwjpLOWIODvgP7N8bVCM5EfzDn9B7HHy0dy0JQ4zeNjm1QQQ=
X-Google-Smtp-Source: AGHT+IGj/4CvRzNe03RJhSdckWN1v7eKR6DFdwXQ54NmI3ZsptGolRM+QbPy2Y04B05+jtOGJKazTw==
X-Received: by 2002:ac2:5b8d:0:b0:51d:3c79:547 with SMTP id o13-20020ac25b8d000000b0051d3c790547mr2031285lfn.27.1714322002207;
        Sun, 28 Apr 2024 09:33:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id lb2-20020a170906adc200b00a58f4b3661asm1173623ejb.0.2024.04.28.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 09:33:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: cleanup for v6.10
Date: Sun, 28 Apr 2024 18:33:14 +0200
Message-ID: <20240428163316.28955-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240428163316.28955-1-krzysztof.kozlowski@linaro.org>
References: <20240428163316.28955-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.10

for you to fetch changes up to 5e0705a74f8075dbefcb0ad18d6bbf909c72ebf3:

  ARM: dts: aspeed: Add vendor prefixes to lm25066 compat strings (2024-04-24 09:25:22 +0200)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.10

1. TI: add missing white-spaces for code readability.
2. Aspeed: add vendor prefix to compatibles, to properly describe
   hardware, even though Linux drivers match by device name.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: ti: omap: minor whitespace cleanup

Zev Weiss (1):
      ARM: dts: aspeed: Add vendor prefixes to lm25066 compat strings

 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts | 4 ++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts    | 2 +-
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                    | 8 ++++----
 arch/arm/boot/dts/ti/omap/am4372.dtsi                    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
