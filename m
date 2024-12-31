Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623E944E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651873; cv=none; b=hGIzjRGVCUv863aw2o7+hzgi5wBPTSHUdZ7zQmrWxQvg6uQF9gj7AyOHwdgF++dlcpfMCNWt4hOhiWJw/dauR5NCZCT6xFRZ9d+62QLwW8Zy5pXThQ70e9WxaI1XXw6kq1i7wvSl5sEanS8zg/btaXb7EZRtu8vxpcbhNal/rEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651873; c=relaxed/simple;
	bh=GWaUmjUBLoV7gRAqe9HG2nbEnwr2ZKSAXA9FTUCz2jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pm0SnBHb6MujjmvW1dIdOnspVuV2Hf6YuaTJBDjlYBOfYmcE888iXfcIgvf2cwvFjvVqTXbKoXhXgt8kU4AaRRVqrIhn0HRjqF6+p+sp2tQweL75ukPZOa2eCZt25SU36MYkAntlRWmw3mShWfJXfVLkIOzPdyN6zFF55NYOLog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eivZJbKo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eivZJbKo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436203f1203so14903225e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Dec 2024 05:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651870; x=1736256670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztH4Cp+TWuFNo+T9DDOJEU6MuEj49P+cJhTlURsWNmM=;
        b=eivZJbKoCngpjwewZCKJqCz1G/HfGQxiFWW7QsTCnWNntin6qJax2i5w8Crgb6FSi1
         WZCheAk1hco9REQ+BFzC2fyK9dNp+hczZFsiOhPY41Jdj5plvgAe7AfEWamjLONRXHib
         kyHM1GS1+DlXP7UZwzSwxWI1g7RrJYwfZjdC35ht9mKPYpCnFXWzfZ4LzTXznZLS0H/N
         Swfvn0CWUKQATek8vLuxARKsjs32Lg4EbvWhB1hFp5kJQGLDzwfJNiUsDd/WfA7yu3f2
         h5b6crOQDFSy/V5gZy3sHXEiPBBmVRgd3YrJTkRzTVCCddG7CyONAsshCsWaz2dJ5QF3
         PzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651870; x=1736256670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztH4Cp+TWuFNo+T9DDOJEU6MuEj49P+cJhTlURsWNmM=;
        b=p1n6HBSwHkREvNthkemvq9n7o+jDzpaAhHGMcyGaYSw48qF04zu9nBsJg5jd0sglfC
         Ao9xp7rrISCdjQhyxDHhs605F3ZO8lMpCVy9Esim7pn1MxTAA3iuwDPTggpaSeJWIEhl
         ygYt2b/P70f50k5ingwJct+wvuCw1JcXdotekuqPtw+Kx1BtZzYGS7DvhN0iC0T0y5wq
         kQoyaGbE7SvOrIILYJ6b63Nv+o/+ILJ5WsbagCzSkWz4OZJ5Gy1lXU6pRjSqaEl9a5Fp
         PSk229SK5Hj79kykMeRpxDjvZ1Fp/fMSpX7DZ/LXWlzRsJzeAWFADF+Ak0pR7GXf2XVc
         5OxA==
X-Forwarded-Encrypted: i=1; AJvYcCXAlSf8AZo08d1czqfAd+4hpg44wEs1pEq/X3KdrTkF5DW9VqE+QNJ2C46v9GYYyzX8Rqr1AyPV0q35vb8TNqxCPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlacWja8rQwX+0lJ60O87QZHdgP0Wbp0rKkp2ZyX8iCscb23hu
	66+pOjjG4RBC+iyhhGl9lQCLD5ZxMzuCYpewuAmfMvM9UpDftPgnTGLx4dkYgv4=
X-Gm-Gg: ASbGncvl5dAAvaf9phEcvJuwzvM2exms0aGykhSe4wrA89dv2yYse1XP452VrE/SA+A
	FvQkoYxP0zHLKF/n3IGV1mEBE2lcGAeFStRZ6N8sGz9AWTnN5JI7u8WGxoMUkjw7elCFfBJVxd7
	uWwUtRq4fVhmrMsQZJ+tyoytFkm0tKRVyL6b1Tu++YyzUjWs3o9FY/cX2W8Cnm+W0iP0cRj8QWG
	Msdks+OxCh1WsNSSB0tpEI6C/CladS/2jKMRZuB+qUxkjetHnPoRqtj4VgE7ctnUSmZy5E=
X-Google-Smtp-Source: AGHT+IHi7+HrBv4JJTi9gtZfiRBlA81Co2JS3S9Apnra+hVXLLciWPy9sGqyudamix3ncbI9k0mZwA==
X-Received: by 2002:a05:600c:1d1f:b0:42c:c0d8:bf49 with SMTP id 5b1f17b1804b1-43667921f0fmr138879685e9.0.1735651870488;
        Tue, 31 Dec 2024 05:31:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c515sm390740305e9.30.2024.12.31.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:31:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.14
Date: Tue, 31 Dec 2024 14:31:05 +0100
Message-ID: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Fixes for old issues, not critical, so not worth current RC.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.14

for you to fetch changes up to 0ebb1e9e1b12ddcb86105a14b59ccbed76b6ce00:

  pinctrl: samsung: update child reference drop comment (2024-12-02 15:11:54 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.14

Two fixes for very old issues around error handling and also one
cleanup.

----------------------------------------------------------------
Christophe JAILLET (1):
      pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()

Javier Carrasco (2):
      pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
      pinctrl: samsung: update child reference drop comment

 drivers/pinctrl/samsung/pinctrl-exynos.c  | 3 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)
