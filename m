Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6598C07;
	Sat,  9 Nov 2024 23:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731193461; cv=none; b=eskOsWaH9WvBDGVYuN2zSh1z7/nVFsyn9d/+FXB4zfuL5H2ppvqtEJV77U99lb/dYvfxaoWJhf1ar7lOkoESdk9Y3+JESmeMEm6/F1rZC1SMSxgoriVI1AZD6ki4YBkGOruQBknNkgfVX+R41ydFnMyVohPYo9F2WcpO2uiogh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731193461; c=relaxed/simple;
	bh=YDc64g70KXmRUfUMR9OpmEHuYok64UWyLD7xaEiRKTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pJdhJq5XshBT+sMbbVoETLsKuP/SdGOIzcYXeHnrUGmGaaMJm1kL3sjRwmMX1SHisBTVCE0rDvt5aVywRNJYAITul1vjHthGDqVoXl7rNvkWVCZG8FsFLf8i6W1JgtEhkRs7jJqElersFE0Id4Xx6EYjmSirtG/JTi7Tc18tWwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLAPuVpA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLAPuVpA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-210e5369b7dso35697885ad.3;
        Sat, 09 Nov 2024 15:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731193458; x=1731798258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDnEol/sO6VqVywxS7JlKi6+yDV4PyqK7/lKBRL3LN4=;
        b=JLAPuVpADS01H4asYf/GKI6+DURAZ1u0xJjvQOOdHCfz2n1X2w3vAVBBDfZh7uHCof
         pkIUY00JVqlWQzNDh8wDZbZuJcqzewq1OdUkhxuVYcLxAvOD0KVkRFePtqmaU0iB0zLH
         JBxqr8pR91w5NHjdNhGPIWj0meu660kOFcXubfvy6aDSSxeA2DMobYTH41Ph9rFLI3Ef
         6pT2MaI9n6ukVOMd+HHkmu0fJKOpWHZlIbph/EFOO/0fDvwz6TCUowrMzKaeXBm5mgz/
         IOUVDIl9648Qa5f6WPx/kfTQlXEHCe1IXJP/8L+BBd3YK4766BHTOR3/y3R9M8dBFyBh
         EcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731193458; x=1731798258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDnEol/sO6VqVywxS7JlKi6+yDV4PyqK7/lKBRL3LN4=;
        b=KN57s9kVZArL6yue2+35USFKx9TMd2/MFNDMU9QA3PhyUYv/X94ULc7AJf/Z2cy5Sm
         nvuAbeDqTnF0951l0UNJl78hG7cFC5ZVJ/0VMH1MwmOEGzhLDR0127H2KClVk99YKyRx
         AoYR23L5HS/xAVmrSWqcqGbf2q1afalsdf2SXzNkoSraLk0mHGYZViKR5tzIzfiXKGsk
         hoWmAPr311L6U7B9+YWiomIYZMtMD1Tp6hnGoOj+lnbvfMNtre3HpY/rfcGq91XyJkYF
         o2gaO7ByM226MU1GhODNfrPYhStxBETRPyS7/DwLbie+kxppfqFLW+FULrcd6di2awaS
         deOg==
X-Forwarded-Encrypted: i=1; AJvYcCUbtoYLAgSnYBVRXzzxKkN91biFsKi3imYOLFi+/5XNFuF4vCcgy8myEjV8xLPQsnFl8yoYvhMPG7CklUOG@vger.kernel.org, AJvYcCWKZYQDKUYMZZ08sd/wg3VGfdotBoTEEP9iKg5HKrOdEWWv7gTxtrRBuLo3zx2rwgfCt2AKkYfaNIt3@vger.kernel.org, AJvYcCXtE9k5D/ecLpby6x/yoQnwa206kPx50qpDdpoPQaMaO68jiZ9N/aV3LO1K7nYCK087kGu8nsOFW92Z6x4BWkzSPZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzch3jwd5lVs6x0GptsLXQVKEMcC8fW4BRfgiXN9HnieBmdm1I5
	ANvOKSb/OvlArH/EKv5nyPxbAkNNtufA83nK0GyTIi1qMo3amXTo
X-Google-Smtp-Source: AGHT+IFe/igCtkT6IZ/6bhwjaaHJHxUvojfaLWGRCzpaPWVdfzmPczFY2/Rfp8J8r5utBgsFvW60Lg==
X-Received: by 2002:a17:902:ea12:b0:20c:c086:4998 with SMTP id d9443c01a7336-21183d7cd04mr86046655ad.55.1731193458233;
        Sat, 09 Nov 2024 15:04:18 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb50bsm5847991a91.53.2024.11.09.15.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 15:04:17 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add support for Samsung Galaxy S20 FE (SM-G780F/r8s) [SoC Exynos990]
Date: Sat,  9 Nov 2024 23:04:00 +0000
Message-Id: <20241109230402.831-1-wachiturroxd150@gmail.com>
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

Sota4Ever (2):
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

