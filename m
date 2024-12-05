Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEC7225763
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 18:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421728; cv=none; b=l4A/AAHrjbsLghvHBwDpgmYSAZpPCQ8u0TiEcVIa4ijrv1DPgTrymDcZIYcn/aR0dM1dIs4PeT9ycfRknh57MxI5FypBfhFdG26SGNrr+RVheeKvatDYwjgE4nZ5MmQokEGCsfhwDdIe+VIX8ltuZ62SOpe4JOHnSOxZHw6d1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421728; c=relaxed/simple;
	bh=PvO3ukRF0tA8B0YAj53vIl+BCuzzRx3eAS51sP0o+H0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7HDhEMCX+S1G63IQgqNSSLmyPRDDNwc5FyoHMOqUP2Jfi+KRqPlMpdu47F+9AjbICOsb93fdb+BV8nxnGhRhULI8lCPWadhUD4fyHN6sxGGorhZz8BA778QSEtnMn9dhEi8SERUdDzCzYqT2oI9gU0hBT7PjC9i9hb4qFFahhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aiJJMm9G; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aiJJMm9G"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e06af753so573528f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 10:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421724; x=1734026524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MEBaxrhXtuUNeerBIkR47JpXV/0Yl7e6aP4Ai3bVM5c=;
        b=aiJJMm9GPN1PzhnnVENAY2qH55ZAPk8TjnIT5fn8O5BUsDgj20YzvYzKB7VzcJbZSq
         CYnHfAUtH7IjXTLqoxH8jp6geLdn7PnMpNYegnSMeP2LTHPcCpLg9ZaSsn9vWoZiVS8h
         X/D23H38PRec+cpNQmkvxpozbvv7OT6GxU06d27tVvUqIzumNGR6H4E1hTjA43k6XJQZ
         JApA3Y1nrfjFcXR1TdNWHSm3thQCMRkwXwBH941ZfxXnKHhBVZuK06ZihHLPvejlUl7D
         cx9lV6EQPwifT+Tdhb2mcmCPuZgS2IBOvBTv/p+w7Z3oA13IUfq6Hjtp6pj78YSm5aGm
         byow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421724; x=1734026524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEBaxrhXtuUNeerBIkR47JpXV/0Yl7e6aP4Ai3bVM5c=;
        b=WeejSbszvP5ai8IHNUEyWa4Y2xBTTq5hZ2+ogco1iIOT0u1bQFfeagIRS6XzT6UACE
         QEVtogIuwFXzayeoIlwJjWkTbXkMtJkBfhP0ZwrglgLHHZDvuqW2AcJ91Q8/UYM6AItB
         gYQ1TwofGU7+5kyLve0t+wlESk/boBqdAGuALMxdtOjOXAFAZ//W7zDdwe3H5gdKbweI
         MhUxCbDvDJMTOr9p9NIdvvfD1KvZlyMzrEWZcY2YodEf4W3FoOLv58ugBxxcRF/ITNVy
         VKP+wQSVtkywHWlizcShFeuLS5y4WZ4R4ybQgYjR65wWn0/BpF/UVtjsMrU711xvBcuv
         DQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCUH4ovisXmouUlescxB5IBSG/6rscf8fHJ0+5jjdueWzl1I9jI42rYKmDWGcc3zcw1AGKzsEGUQdaSP7kt+dEj/nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMp6/p74z98L7XR2GcZS2VOBQvY4UizSAT1/rQ4s/EDFhm1/8
	u06Clnp92gRI6uMSj6K571e+YhRZCRnksV6QlTp7/+ndLHKiurhCf0uzurOoecM=
X-Gm-Gg: ASbGncuSvz36HUb4EvYoWQHEXWhbbHzrj22lRUX7ZlR4JkeaKK7RivdtIy30FXgPkkX
	JfeUkxYQm0efXJ22G3JtoI4Ne6zUCIw/djOkW+dP881rUGRTx2+F2JidqZR2PTZMnMwXajfH5dX
	ulAxApD8eJhS86FgEkM1UKm2VAL0tveU8tfisHzlEPc/8F+ppdaWWAaK5DhrEkh/zfmuahCelqs
	HKUUn9Llzy3VSxeoSwSDog3Jcbqz/afe+VekXXYV+187o3UCKCKD185XA9u16LhILNy3lu00TAB
	gpECiT46CYviSVHqpTE80XkXNA1FqQD7
X-Google-Smtp-Source: AGHT+IEaRSOep3o6BlOGmjw5C8xn/tsj4Vy2kgRYv+HBcuFUUH34fZUaz5fJUMup+GJE2Tx+FT0gbw==
X-Received: by 2002:a5d:588b:0:b0:382:6f2:df7a with SMTP id ffacd0b85a97d-3862b37afa8mr16766f8f.34.1733421723607;
        Thu, 05 Dec 2024 10:02:03 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:03 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] arm64: exynos: gs101: add ACPM related nodes 
Date: Thu,  5 Dec 2024 18:01:56 +0000
Message-ID: <20241205180200.203146-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Tudor Ambarus (4):
  arm64: dts: exynos: gs101: add SRAM node
  arm64: dts: exynos: gs101: add AP to APM mailbox node
  arm64: dts: exynos: gs101: add ACPM protocol node
  arm64: defconfig: enable ACPM protocol and exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 40 ++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 +
 2 files changed, 42 insertions(+)

-- 
2.47.0.338.g60cca15819-goog

