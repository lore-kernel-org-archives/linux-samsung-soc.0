Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA001D9A6F;
	Wed, 11 Dec 2024 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934589; cv=none; b=W6d5f/h12rR9ARmL1RomQ0CMYuevDNV1UItKVwiqAiTKEpWSqOhhUPo6S8Y49q4IEof33hHnaILogKloJ31coTbeyI+bI4+vV77Y5tc9iBYi/tb4bakPD8K+uJYAYdyk0S+EHKvPieBI+ddmGlQb7TlR0D6cTb2PvyRnlJQGww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934589; c=relaxed/simple;
	bh=CUofCpkNjwrv0bPeK8QaWr94vXw0Tzx1X6oY+8Gvpqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PizOSg0q0fRMjRDQ/NYv89gskk4kZo7pkDXBvJQpMpFcDZugDi45+TbgstbpzUwTfhTIbq4vbvbLPRh7rC0o1R6ZzZ5egtvCmBauJ+wQHLz0EvUBUuCdsi9OZGRnS0wbwPye8O4gpFe+V5HVj+GHfcpcZYwE1lbMp8jbB8oIQdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZnSbINX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZnSbINX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa692211331so176263866b.1;
        Wed, 11 Dec 2024 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733934586; x=1734539386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=405Zc2ogFoII5Y01YYxw+4oVDyF8t9rieF12fX6F/10=;
        b=aZnSbINXg+4EsmMv/uHQ4mTIAKXx2kdZ1anEJ1u9VEpB2PqkXdo337OUuv2C84xOvV
         KtGTryPeO4wJUN8Rwg6gEylh36oghvuDtp9s1bLQ8vzpscZnfqi/u8UhMrLyTLGtXrV+
         T7NQfKC91/caAEda83l5xFjYYrUlCPluq5/Ag+5rH3Z5OFLtOOnm7NDqmv1rpsIeIjJY
         6p+hnVW0Nf94nECT4wWDC5K7cTe6zbBV8yBqpL1ODpEMiNudEUB7YPT3hf2a+6Ui1Ykz
         /FhH2rv5CP0UVKuJQ1TLcgSpjfyOKwOEiMRTA2dvbHDLzyUFJuzc/B6FL9SSrQLeU6jP
         zQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733934586; x=1734539386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=405Zc2ogFoII5Y01YYxw+4oVDyF8t9rieF12fX6F/10=;
        b=Msyj5jxsK7Kqw6MyCRpro8WKpi/IFWmCxHiSF9yHMI7ZrBkTrDarad/7kt5aPJOEgQ
         MxC4WT5hxpn5j19ZZws5i/BqiBSNAUL135Ga0Cu5dobB8hcy/7Ypic2DFgkrbcbn1WXT
         eudosC6/f7JDKk6CsnjByxuEUOf9HXcsN2ccBOqI1uFKBxbK1FJ/DNghv68fEnke2oXY
         vR7cKLZ9QnV1RqmIWKYewqkMRQr5578elmt0bWpL8O/ipZ/teZIGfnq4U1ODKY/vTAce
         bxeH6J5iARTxtI/TNsNm3kmoVUTkja19kOUquEpcrBTxh9maAYCbGh5OZJaY94lpbtYD
         SKxA==
X-Forwarded-Encrypted: i=1; AJvYcCV6VsCTBr0UHujFrPP5D1zzWs4F5NjaolDxqmrB7yZXhrG8nv1DIVYVp/Dq1cMkoXitaUjgnPV4T6YDp/g7@vger.kernel.org, AJvYcCVGVx7SfWCYfvOWACapc+WsjWHC7MBZInFpgNJXMPWHaNIPJJTFjmuQjEa/Jney8Ktpbzmse+xPcif7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4FEGPA3UMmHxSnZyCi8XvmQizyam6NCHpzo6Hy+wFSGVbNsRz
	r4q9UusSEYFZ7urYxSZJgVq+CVAb07w2a0IuDBboutbuwXhdyp7C
X-Gm-Gg: ASbGnctyTTKcfckSFfWTGvs4VU1HcJzStelu2ZXnSPRgnCapYvkF7qZnf9RRTH++P3z
	CeYaJqNHFX47yinDWaNGIrlVq47dgrM/1zFjDOuS28MSaYQmV7dG8EidMVWQLkZUATqk3KaC7L0
	tiObJbwXkdfQWSSlZ8W5pWVFQNea+JoFZRxp/ZmJrbA+G59UOntV9B9ELzbKgpu/RUZTMQsGB/T
	uH3B5BGgYpcCuxbH1M7yegAaKk1fkWUoUKXVklCaFHVUTxOGGcIxg7D+OV3w9QPHUTQFJq8grR6
	/2QmQN3QeI5qCXz6fQydNN4vhFWjZQ==
X-Google-Smtp-Source: AGHT+IG8EM4U9gXsydrmKtBKna4oLCf4D8jj5BSeT0g27VN2a1zcPacXb4mK43JDxCcRqpqcGwZUuQ==
X-Received: by 2002:a17:907:268e:b0:aa6:ad4c:7d55 with SMTP id a640c23a62f3a-aa6b15cc7ccmr349512066b.14.1733934585452;
        Wed, 11 Dec 2024 08:29:45 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa663334906sm678451866b.72.2024.12.11.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:29:45 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: dts: exynos8895: Add m2-pmu, poweroff and reboot
Date: Wed, 11 Dec 2024 18:29:41 +0200
Message-ID: <20241211162942.450525-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This series adds support for the mongoose cluster PMU in DT hence
a compatible for that was recently added.

After this patchset, I'm planning to submit patches for more hardware
support.

Kind regards,
Ivo.

Changes since v2:
 - Dropped the poweroff and reboot patch, since it works as-is with the
   included dtsi.

Ivaylo Ivanov (1):
  arm64: dts: exynos8895: Add a PMU node for the second cluster

 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.43.0

