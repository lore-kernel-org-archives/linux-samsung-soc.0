Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC71E5B9E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850305; cv=none; b=U8LZY37lJ+F/vobcmiAeohKruOoqMogjBFGA4j8TB1ECd4MpfAoKclgrXZzarjIvZsO6pxZDaSnmM5NH3eL6hb1Eg9rI7xIkHc06fjqSMVcaqPU8UEhegqLKvpO44Wb6zdPCVbJHx6fchJ/6nUXi5LCquCV2J9QVJJdAtwBgKzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850305; c=relaxed/simple;
	bh=fIdw23kCtB7mdE2ObsS2whaNsMI65r/FonqsAsCDIf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gB1pCPPHVcidZYEGoRatr2QuEjoQWy25uH4dHSP3jt01RaTmmfuH0Mqs0Qwx0K1NzdiStaGup5pfjw6RxXR0iHS0yGyjJG24kMwe/gXEwuCCbuAu20NqhdOvfY/dZYU6HWmrGIzoFSWwdT/lzQOfnBk9iyNsTLPChYTeGMMsx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgvYWpGq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgvYWpGq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3d118d8fa91so1052963f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850301; x=1758455101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl9epDnVBDf5FGwQnol7WPxPj6t42uf2hUNcw7PBwX4=;
        b=SgvYWpGq43cB7t/JShNl/aLM3QH5u9bIB3pCoTaxzCbWGihOg5NeWk1sx5jlRRN2W/
         1hcEmxw8cjnqyQ82uXR5AJj8YkTgD4ASMagzuhe5BUsfgdxrIp9X15PGxBrGJnp5hfwU
         SJhad+5ot1AcgqYquRMtS/calSmiXLIiPxqxk8BCc1i1jBgXLO41azrxm3zhNLHGgt+f
         +m6snHE/CLDPCd7WBnG3bK/3Ur/bq3uLuXOnV6YxFHaQE3xuMTCkMFwcl571r5vYcTED
         8MwRQncNaxYJgNWro+1TzaoKmEQ1fVXgu8RMh9gmxp65xC4XpvaCN6gLrj91v3DPdxAI
         rhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850301; x=1758455101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zl9epDnVBDf5FGwQnol7WPxPj6t42uf2hUNcw7PBwX4=;
        b=g0Y/ZF09Owci73hCKoYBbR79Nzc0t4WyHULrymf+KsNtwieVo4zB0mvYIFEoiOi6ua
         W6Gg6BmR6sq+ERosQdeloy/SNEYtH9LxSuxUQJ0U9Ldz5WGQNUsFGnEV0XWR6KF212GP
         qX1QKEDUqUCY5icvnwC2cS6ECbnWMZnTcpXQp+8zMnb+9H3Lg+E2GTO2DIAHzCVCl7L1
         ewmya+etSsPu6Pq1iK2ZPaaQJxQ3pjX3etAW6tcjIBsi2j0oL/tPKj3ENe7ensjSkPa3
         Mk/3PCSZPXiHqks6TTSSiXken7VykNzwOrw1c/Sty6+bZpS6TmpnmNF7Wxd4rJP426sN
         yySg==
X-Gm-Message-State: AOJu0YxTtbgHXw8kOJYR7y9Bkjp6epNh9IHZMb848+vrP5S5Ul2G1cNR
	mftyfaGlI9Pj7W0Zf9THr0iADG1SiZezGKG7dkNkxXDQwxO6A/b+z8j9
X-Gm-Gg: ASbGnctpTiFbTnzPxT/m3k9b3we4NbtYFomsGP8wZFMa7Jtb976Cp/zZouda1tuBrHd
	nf+i3b6d47meyAXQvoDE7JdIZ7ei62+VuR2jB98jVI8nOPGs0m9EtNqK+yxcsApsM7DEJau5ZzZ
	dDVAcjj+x6ZHRAyBehP/IYnYmHRVOLiY3zSxZ9gQC8vumGmE6EYTOaawQFuOIUY9LV5sOxNV50o
	M+FvZJQTTxNTh4SuXML9IYtQ1r3/4CLaXd1/yTcIDuSOJvNqLlczLjsVhNyCg0JOQRAnCwtjtS6
	++6fSh5xNI+ssBZepDkMk56FCB14n/rva9OambQ2sBz90mSPOXyEQr8EZ5JvXSt2UkKWpU1eZW6
	o7vPR0XZ7xUvKAiBk4C/JvAmkNjUkTskwORmTP8z9l6aSHCZ9BuW+vb9ZU9KE1HNUZtMCfkoqIE
	BJXJIyXPqM
X-Google-Smtp-Source: AGHT+IEKZoR43PuG4u0ovxcf8LSqoSkXytpnNXieBus8x9zq/gDUlem4pul2S/1lpLAukbDJ5yAyag==
X-Received: by 2002:a5d:5f53:0:b0:3e2:a287:2cf2 with SMTP id ffacd0b85a97d-3e765a0915amr6836384f8f.23.1757850301352;
        Sun, 14 Sep 2025 04:45:01 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] pinctrl: samsung: add exynos8890 SoC pinctrl
Date: Sun, 14 Sep 2025 14:44:54 +0300
Message-ID: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds pinctrl support for the exynos8890 SoC.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: pinctrl: samsung: add exynos8890 compatible
  dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
  pinctrl: samsung: add exynos8890 SoC pinctrl configuration

 .../samsung,pinctrl-wakeup-interrupt.yaml     |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   5 +-
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 157 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 165 insertions(+), 1 deletion(-)

-- 
2.43.0

