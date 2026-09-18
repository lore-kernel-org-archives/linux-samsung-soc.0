Received: from mail-ej2-f25.google.com (mail-ej2-f25.google.com [74.125.228.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082224A7CA7
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752416; cv=none; b=BcceuUHZt6rYi+9G2FxXgIy72h2QDtyeQKE6ywr3YX1kB5OTyYCTAIFHN0MOgvSLF8jpUpNzA2Y4XZi7gXBycM9O8E5+YUz3il9O+5QMVTcmxwmk1lXIU2yLRbwygVKGsy7wAPz9XzYbe6JVp6TNQKwGRAvA3TwxPivgme9sU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752416; c=relaxed/simple;
	bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7Sv3nowPzD4UBQEg8O/cTr+LSD6dRq9ZuSa8pv1gqsUxBv8ZwST42vdPbjur5jV8d1GLiUGkApQrZZiXoT9CLnxuRuZnFwCbscUCKmIBcm98BbkOo2A25iZzjC7ajsRJBubPeh7hjF0yBKMboAurREfYXiIRZ8SDdOU+inXRZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKxceXKa; arc=none smtp.client-ip=74.125.228.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKxceXKa"
Received: by mail-ej2-f25.google.com with SMTP id a640c23a62f3a-c254fa4c24cso163803366b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752412; x=1790357212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=IKxceXKaCXYn4nfslqdwk14xEW16QMzqH7hYjebOU8O3jcoey3lREyk01rkmWda6jC
         Jy0eyqht9LTtJ8FEUE4sP39vCm5RBua3sBUIeJ1iadTkypQ91MEmH47gnB7UvqIkioRZ
         +SP2FE7eqUtO2BJ6PNb/ltss3UgP5aQgwk8y1oEPECC6t5TVJvIHL5I22XmQdPcylLcQ
         ANW6+ceiO7eNUGkvGZ5KNaDF1NLC4lKSP5AxZtul/mKp7PpkC1z0W/r1mF9Gc+4/hsCU
         x007SBqFLa1TgTys8Nq+2yxOP6HbtmzCUab3YrEtqyroUUK+PWHxyu1FzcNn0f43Ya+9
         o/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752412; x=1790357212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=BTvujMAoKq0i+fav9duZydkxj/3qt291pEMqsnmhd/qmlWvoRoSL99eqX9wkr8pbWH
         AD1p7yvOETkESGDXFIuMvAZHwxO37HyUxHt6XreNAhOdsDLKOUHkOhZddSxWiocQo1lT
         4oyfQPhCnRBmTjtZbkSNaaelQ0TGVguWlyJkPuGFBphr8lUrR/m2szNVGd0t7PFpSVna
         1FE/uxPN9vNfynbsrqv42xdt3AqmR31ws+1EtUzNOV38UYieBU4nXEZJ6llWRaRQy0gU
         AnhfL+0ueIvHrZPIe7Intd1LlBu6iAaOLJ7lYr/dOoAHQI3yfPTQ0talRzDpirHVzbmo
         fQAg==
X-Forwarded-Encrypted: i=1; AKwUvByDmRn5gJoyROfeJ+RK7qr8FkNvOQZltznY5DhN5AOPij7vS1ISlyxt17fn9/5yP30bzjA5+vw1/EwFJTEB4+xGJA==@vger.kernel.org
X-Gm-Message-State: AFuF++n3owMP9vkjwuuA9SKlG4FjebbBY+lIWQqz6q1nxq+Oy05+CW8I
	MkGCWRUdVD93Zoy7hlCnEVSzO+JhadwUkZoBt8Ve9aEKtGb9WmdFmfYGXCUQ08SbDak=
X-Gm-Gg: AYBFou3laOTh1dmILUuOvbPY6Zo4gx6OdDfjNKkolswI/wVZne5Nnv6sFnpdlAm/fOm
	QsUjGMufNckyfezbRmzesYtRqutbkH4tLvgAm9Bs87Zccu32TIWfL71dTZ6gGl4Mzm6Kjw3Np0G
	nb/270G9zy+Lr392ildGvHsiDSy0Xwvfui7uRgwWoM0H8nIUNEcWFhLWLTVGAS9/tWHPJatNlc9
	9zzNY5HtNXy7PR6UKJrDLIGLflWeFmognwbHN3zf7lL103d7VU8NiuIdwBFDZbN6bRC8IJwhXQ/
	uTrtA3QVGBBmMrEUmxs/lMwOon3DKDoei8CsIMwJcIXqZ1ESBt/QKquICobfMEHSpUApINXVBOE
	f+jxxw4aflJdw2cHlqgdg6oECNes2935akRM0SVzRkeq73KdPOH2gsjs5cF7JuqguXRDLvNsPot
	toDiPOBWpnerhHe0sybNCwCm+mWvikz/M6LQlU/aGcEgwQHe8s362KC/AfuWx8MhbICXiHQVeqX
	HEAN+/FpadSSCCBIhoLGNllQ7ssHhuzRL3iUoDQVWM3/EmsVmVARSTEdw+F8JS8bVE=
X-Received: by 2002:a17:907:1c91:b0:c29:386c:58f2 with SMTP id a640c23a62f3a-c2a15e1ff48mr321275466b.38.1789752412145;
        Fri, 18 Sep 2026 10:26:52 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:51 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:37 +0000
Subject: [PATCH v3 4/4] arm64: defconfig: enable Tensor G5 SoC family
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-4-c94e51140509@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRYGuQ5/L4khzKLHRvREUl1l+2lwJGoJSQiY
 SGyFcbuWBCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10WAAKCRDO6LjWAjRy
 utArD/9uj3S4/40eqQyAQNg2mrd8YRRLVD2a+iFnXlDd04AKI6CyH9Aw39xkFrcjJfJ4hkBGr+C
 bq8pFZNwJu3DH6NN/ZgNqnsiuxemOfw/aUIO1dpSTeW6BvQla9JT3YBduKlaAStNeV9HLWE0cdK
 FGDB8mVSVVJ0j/jYlX3BOmNAium/Ewfw9PI0ALpuXmOJ60HZabfOMYnun2JV43MuRmmJx+smUde
 15IsHXU6GQ15cwQFp56h5tCUisTYD31g39lmK7iD0Qpwd6BC7U3SEFO1LiorExYEECyq9C7h+Mm
 ATP1VxNycE8kVWDXVD5BlcWBgeQeyqFLUcp0wexvmyoxLICWQGWrCCnipjciOVlKfY4Tc6OyEbG
 vrlzf1SPtQJMDhH9y26QfsrMaVvnVHHdMrhtrFblU/rHj/mP0MkdHSSktmN0M2Zw/iXgUpfbzBb
 Sgiz3ymLwkb57NgSqWh4ZEmseH5HGA1gI/D7/tMq3a35ZQZsASN2N8vyisAjaCNPSih+SmS0mfT
 RnVnZKuvriyPYy0oGMaosjltQVaBzFjx9Ok1WALSvawKVkVkIzo6Du0GkfXaO6QcdiwsAHRhkz8
 8q31d2t0PWWn05xdNQ7eM6h+2MYYbGKpYmzkwJcNXA6ObhSV2vGM73rn7RO/wrqM0hT1uhF5d2E
 A+fovbmpX/pet2g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb66..75000c12ead03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y

-- 
2.55.0.1082.g2b9226bbc0-goog

