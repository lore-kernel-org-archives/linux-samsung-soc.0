Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA1DF71
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855699; cv=none; b=nN8MwxY0a3K2aU6tWXO4gx20DEcvp2en5chrlFhC1gXueFlmSmuvdRsh4anCyRQascL0YVRFJK0vzq0/Kfy5+NXk0RkXHTvp5+ZSJCBteHw9b8D9etUbwFSaI0LfoG0UdjMzi+zShjYAnrtFDOYoSDvOanaUo1vAOyp/QlyQHn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855699; c=relaxed/simple;
	bh=6ED/cZ+NqfhdaXzUt23lLQtv0SpOGvwArTrjdy4sL1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5U3OMu70X2DTg+zSzIIq4EEXvAZTq5Nt1hk0F9ZKSPFI2uMu4Q9zqU0JiJC5MGidGQL+ODhgQexJKSfASJsVmIUFOjx3lwSTtl8hxlMYBXk2XcLLdZHmAbR3eepikw0ruqzvsulakfO6FC8HmQVD8iLYcRP0piKyR4u193n8FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b75pKvRR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b75pKvRR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso2246299f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757855696; x=1758460496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trovOubMvRidAW+mhU2Jgw87jFAcVgjTEKFsXv7vGoI=;
        b=b75pKvRRVQZ1ZKtn4UrMu/rPiopYbcozPANCpqvVUeKK69F4pJgVzHdCv4c2t2O2w9
         4dkuUQv3yINY9FVzlfzrkeCczFvsJesLgVV69u7If2oRlfo1/g0keAPchvTtBhE9Tkyi
         dCGuEhlg6uiIzKrn+v+CXoVdzTAql0LsXX1Yuzz/e3mK6Tm2c6w0iL4WmJ1VN43R6tfV
         LLZMpd9vDgNZU0a1t3FLLd/Z2cswt71Cp2FdsGx2dLiXDfAqit42jTA+wMtvSlVqanoV
         q83odSVBeZ3s+L8YXQRloqEK4PvIn26EkL5dP+3y6CGT14ocEgq48TSj8RMub3cj71lt
         Vg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757855696; x=1758460496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trovOubMvRidAW+mhU2Jgw87jFAcVgjTEKFsXv7vGoI=;
        b=M1/mVNvW1gfQxllkQeTyvktyasDG76wzJCAi/XxmeHO6Q388uOeLkvC0F5kbeEeSK3
         V6aIWN8pxnhoi4LQQAinaBkfmpQYuK+1tW9nJUbaKzAQEFpUEU+uuZWXF3RQh4Lc7Wgu
         1pnUdaHaSUDNLRl9/vIYqVKR7cwApcOVe/9TGU+bJtSb3PxA82kMkJe4CnO8ToT9LWBA
         mnRusnznDCTMpWEs21357oVya/Xv80ARnlWDrVj7gX8m7yWlbugLSgxaV/9gTqq6mqHY
         p/HcR8joypsu9zqlqf4QxD6kgiKrafXc8VQ971/TW7cXHCWA+u5bcQcI9Xs6mnbrrY5H
         TDHg==
X-Gm-Message-State: AOJu0YynVeBFkvpN6zPlSZT/5JjsqrupgzXoOxSLOJwHcojM5DFHLjpZ
	H+7G9hKTQmj54WZ885febIE2NyuHu2PVU0nZ4m+dow9rpgiGc6h/jfmM
X-Gm-Gg: ASbGncsXNJYMaR+S89Wf7op7XglZPuMh3zYMffAFA/mBj78TMD5l/yL8J6a15DeGXaX
	BB7btXUfJw/dhTChV9C7QF8GOGZmmHFfLQnR16MQ6fqXD56S1+EwTQnElJugHkyHxCvAo0LEcS6
	7glTEyz0m60NG+uTh7r9oBi0YrQdvtuAx8Kdfds0vFA09o2o9GmjGuJ3hCBC14s+56uzPiBbSbe
	+wkv4pZTDMJMhoNI8X3nHu/X4ERq3PWnJ7rytpQjfcecpblfSzTS/t1XuBMv1larUlgBiQ1XsrN
	qPKsLAcIg7enFB2m/tbZK7tlnZmNOYA4LBR7fJ0lAAqfrTJa8kImwDYKWpYMB8XpPWR/kX8vjU4
	WHCdw5kIpqKjwVSYsNCtkc8M97jomxvR1kQ5vdy71wXwA8t2fodrxg7sGjXNfB8GEsZaYUK9jmA
	==
X-Google-Smtp-Source: AGHT+IHRcpNwEriTVL0pqLCUolaMHN3iy4aeYsC4oOedhjGnfClQkxnzDxvjJY0nYW7MccwibGt9RA==
X-Received: by 2002:a5d:5887:0:b0:3e7:44c7:4bad with SMTP id ffacd0b85a97d-3e765a36ea1mr8604552f8f.31.1757855695771;
        Sun, 14 Sep 2025 06:14:55 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e80da7f335sm7255453f8f.8.2025.09.14.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:14:55 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: gpu: arm,mali-midgard: add exynos8890-mali compatible
Date: Sun, 14 Sep 2025 16:14:52 +0300
Message-ID: <20250914131452.2622609-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exynos8890 uses the ARM Mali T880 GPU, document its compatible
string with the appropriate fallback.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 48daba21a..a7192622e 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -53,8 +53,10 @@ properties:
           - enum:
               - rockchip,rk3399-mali
           - const: arm,mali-t860
-
-          # "arm,mali-t880"
+      - items:
+          - enum:
+              - samsung,exynos8890-mali
+          - const: arm,mali-t880
 
   reg:
     maxItems: 1
-- 
2.43.0

