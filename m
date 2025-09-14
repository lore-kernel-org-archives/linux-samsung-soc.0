Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20991D5CC9
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757857525; cv=none; b=WqY4kHM1seG2vN1VOtm3LxghaECNVc9LksndA+ZMMF1G6vFU51mg8uv8mMcZUcOEg1y63C5yW6QmhrkOPAxqsHYXRg9MQW3/qWeNAZHCu4qIlZdATT2CL1ydP1cXuAUV4n4X9K9EHngQwZ/d7sCLmR7N9MuQmdYHY+PwTd17YpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757857525; c=relaxed/simple;
	bh=FV8p+SLdKIFqO/3EWnCpzCmMf+GNL0Rh41XOQVklt44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3+OAiOadvdDoauJ0yWlQ7CVRGOAaKGfix2kBw9guLA2js2qFt4tcZXhA3pkQWaguzPDpyp3HXb9+Nfjwd1kpPhBLCtnZI8jf6rY4uzXQHCvBNIsVRIvWAIwItLyhNrcAzY54LKcf+XypsK++bwPZ0Yd2MCDzlhCALr77JQWpnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ND6q329a; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND6q329a"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e4aeaa57b9so2897178f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757857522; x=1758462322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SKUqexZEitT6bzSaew+b19nnDz+WShkm3n1xJnkdMJs=;
        b=ND6q329a1EGIWzr9X2KIU+52m34E5prmFatdZ+tX0K33TUQMiGGV4gk7iSJsD9ytIG
         w+yipH6/RROp+7xDLkUpb8OHQtuey3YeTfp0roesklnuepHQXhZ6fRxgLOueVdtF7o61
         v9qmMqyUNP/Wy0NilM4L53w2oyPR8Iar3uoLYfN83Oq3YVyTT+vXFZZqUMmXQow2WFGj
         6IczwMeT41IFdRwKYke/p7TAtwoJCmbeaAwhqS7H4BWfxdjcbyT5eDJfrKnYgiilIjDK
         RoCYhWRAMqVJOb2mFnX1FRH5FU1t3r7lzQyG8llMrzOFjG2a+iShmgtUtNUyPQv/s6pg
         akAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857522; x=1758462322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKUqexZEitT6bzSaew+b19nnDz+WShkm3n1xJnkdMJs=;
        b=FZ+FBZrElbz2gH92YASHLQrlW5emAg9PnSBseEphq/k+plXykZ/kH0+1H3IhQqY4PO
         aWId9hlPxqjmzBF0RXwPy+UYC/4Wcvt9kty22KnhjikEwHyjHF4uMaWJTncd1U/qChd7
         xWiC8SnSe2WHiLnUq807a40SzXZzJhEHN+lwGqzeTEfGxpj/Ty7L0pcz9lTo2Ksnshii
         GCs4sA0Bc67nRUmvJCdQUAdBpDbpOmbqmQARmViY/cieI/YtYCvnnSKKL+Y8FffbXAst
         mC7rbnPYYaW5CBnnzdKPR5Fejm8iBhKX7SeYUyXPND86JhUZhNStyHBLnyu9+bftb7/1
         C/LA==
X-Gm-Message-State: AOJu0Yyf2rU/T9E1UAxqO3aPn4yJZ5/EmL0tXGPFkfRk7Sn11N1px3Re
	21ZjLIc2MrLmbcQh7Ij8zp4KRQKI+l8dcOnVt00bducTEbUCJ6XQLNIt
X-Gm-Gg: ASbGncuvYolYuLd7bBijhERtI1jdDiPjXGNhphTbJBvjwWh4MEY6iQaxBwaBqjO0FeZ
	iKllWlswg1Atfs6W+/Ivn3/0XrEbJSc2eqKbZ1RIcxaRcaovGh/06uKhvdtLIFkQxdRZCz0HW5A
	i+6UTZdxTF+iFO/GEFJNXcdeQ5zR4DSAKXxBktA2LkoQ+1qPsR9PSJGK9wpTB/Xh2V9uPFYEUqr
	5Kx7tkE9F0OfvkWVDpZRyE4JgyFIBEQrJ9TSMcacIyFjqLS2hD99Wd/QGlhxYaXZeNxIayLFCt5
	3g+E7PSdTS3QN7oPB0u73KKX1tYCy7af60CE8wgk1KpVij44LEw+vRu329CggEyAmjvQn++oxV5
	n3xb0NHc3HtQzZ7u0QIsfsapcWtYCikzAeNuABic05vJdX6FMBCACaY0HIkdmaS5xzDAfkH9XIl
	OvjFlDbu8r
X-Google-Smtp-Source: AGHT+IHBvWsNWGPacN8UTX5YfRqDAFI5tNEvxSQah7xL7TEoK8EoMA73bDud3VP/tlRdpm4BfsNPjw==
X-Received: by 2002:a5d:5f53:0:b0:3e5:6297:dd21 with SMTP id ffacd0b85a97d-3e765782ab3mr7606735f8f.12.1757857522073;
        Sun, 14 Sep 2025 06:45:22 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea4b52b7fcsm1467591f8f.33.2025.09.14.06.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:45:21 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Input: s6sa552 - add a driver for the Samsung A552
Date: Sun, 14 Sep 2025 16:44:55 +0300
Message-ID: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds support for the Samsung A552 touchscreen controller.
Naming is based on the current s6s* convention, used for Y761. The
IC is similar in functionality to 761, but has enough differences in
registers, bits and functionality to deserve its own driver.

Best regards,
Ivaylo

Ivaylo Ivanov (2):
  dt-bindings: input: document Samsung A552 touchscreen controller
  Input: s6sa552 - add a driver for the Samsung A552 touchscreen
    controller

 .../input/touchscreen/samsung,s6sa552.yaml    |  54 +++
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/s6sa552.c           | 439 ++++++++++++++++++
 4 files changed, 505 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
 create mode 100644 drivers/input/touchscreen/s6sa552.c

-- 
2.43.0

