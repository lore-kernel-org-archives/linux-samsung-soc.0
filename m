Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6719D8BB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651736; cv=none; b=Ed/8BV/QBsxlPsLo03EP3HrUSVdfwuSweJ6vJuudCHmARwrsTL+mi8GpinquXO4Sn3On10JePYA/i9Q0TOBO73fWXgjOIgK9CM1+qGRqgwd0oqkPKnC+QKq9sI7KmObP2VFQTZmzhQ6NByN6kxGZoQYxk2NLjq9ZZlRMN4zF7xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651736; c=relaxed/simple;
	bh=D2pRNKYsrKKdiNFDaa/QaCWwVRW42upleo2dsDGtluI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNHNxXGdUrw5z/hSCFtUEi1MLA7KQm4Q37Xiesp6yIqjFVA0O7ag8mlziZO1snq72zX1sBW/g/dUc8019kp+Zjshob1G0/qJea7zAQzdXE78XAIKdNffQ8UU+BOu/LO7as0vG7GJywXWOa2xImuXF8SS1AAqIiyRs09jfdKiGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E0udVusR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E0udVusR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436381876e2so14913385e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651733; x=1736256533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYNiZ0uM9L1Qo8OSCmn3VQhqRIp5B4k8bbGv0il9/gY=;
        b=E0udVusRgScp44pBSbVZnAcCYXUOCid+IE8+t7m+NHpr73cWwuXuf0EH+Re+B1VSOM
         3f6+QehXl4bCJHN2aZO/4ggA0EGrXu1DvwKgpZBpN//ukzbcGTHURRn4urnNEiMpnoX5
         qLSwsQKapZJJqjPqNQPLexIIHXf9G8W2Ydu+EvBHfH2qEY7T7euGfACqkp3hTek1VJUD
         Jk0xfuOHpZC1wjT3PVk81XO1nExy+llqaJR7uFB3qmp24Iiw1kW/BZw0AHzjHG70et9O
         mPrvqcj35+gstF3xuZdpEMVkHkHqje6MOYmQoOm6HRcdEHcH02eGTC6n9NhDxDdZKlNs
         7c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651733; x=1736256533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYNiZ0uM9L1Qo8OSCmn3VQhqRIp5B4k8bbGv0il9/gY=;
        b=NmKLNRekJCfMN4CSyubeGYxJdmoe3hdNRxWqYegvmjGq1n1J77yfYip7DzVbkT8o7U
         xNV5DzHC5a9WbL1Ub659aoJN4LIjcYokmXiuV840mcxpXH+ZvxHCi28RwLI/jNwqRz7P
         66BeDrRRoJO0NFWd51F69hbj9W2WiKvGlp//wHy/gc96Pjna41BhaosmjVK7c5EOELsO
         Sc4lQjYd9SBFZbFgHF/ZDbxzXaJ8tNChKQ1HRKCmswb826D3Fj297H5OMvsEiFq1sLBH
         4OP/AWB0YfQNl98yiA4E17cR0Ys3QTyrkNmqX8Ly9iDx7tqWmpCUBuaJjdQEUrCaR+dY
         IUgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJCr31HKVC3zYY+QuG+ol0aHTNnxxRvSYXBVcHnRjjkM3+dcciUI9/YsIiOdfNH83qxHVUihUj6DrqUr/ivb119Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKR5C2JWMBV5XJj6SG/CLoJpMXHuQbsIvvsC2Pa3F+Guryq6BY
	amBcBW4HYoBnfkkc2uoEH3pcC/YIZFn146tsrMQoNQkLP7QlL88JzS/CL35OZDs=
X-Gm-Gg: ASbGnctJn5RDvxZeZ02clawhn3BLxiVsib7mDGamky3y/gmSeSN7czRIPGKZKg2pOcV
	+QNzx36dlIyAso3vL7rDFADpqNXrSrSbPeRhr/rZNNogD7nI+E7s5PMg+bldCPHalSHgRd7JnkR
	XUfOdHFP3McAYgHBoEzxSbFNIX+X+d4/V4z5kBKWFAyAMLZFROsaDSORrk4Qeyb0muKzFYWUDch
	fhgtqzrsRuDBGNZXOsvdWefyxNhK8iF0Flxr+mAFZk6bev/OcXKTRe9YYOUFSUcmxY3nng=
X-Google-Smtp-Source: AGHT+IGxcLjjJ2Ts4fNwEdwg4O9n0E9Qk22ILcZAS8AdPDo1ohnP4lUp59rmKLtvInjoLjQjwTMaIQ==
X-Received: by 2002:a7b:c85a:0:b0:436:90d4:9db with SMTP id 5b1f17b1804b1-43690d40b0fmr73267585e9.2.1735651732938;
        Tue, 31 Dec 2024 05:28:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm32800220f8f.41.2024.12.31.05.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:28:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: various for v6.14
Date: Tue, 31 Dec 2024 14:28:46 +0100
Message-ID: <20241231132847.135814-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
References: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few cleanups for two platforms which were not picked up by maintainers.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.14

for you to fetch changes up to ba9dfa76ebb030df6b605e16239a8052c3c02171:

  ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit (2024-12-29 11:02:50 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.14

1. Marvell: Use un-deprecated hp-det-gpios (no ABI impact expected).
2. SoCFPGA: Drop spidev devices which are not properly described in DTS,
   but are using some other compatibles.  This was part of wider tree
   effort to fix such incorrect hardware descriptions.

   Important: Dropping this device node will have user-visible impact:
   spidev device will not register.

----------------------------------------------------------------
Conor Dooley (1):
      ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit

Geert Uytterhoeven (1):
      ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios

 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dts | 6 ------
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts            | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)
