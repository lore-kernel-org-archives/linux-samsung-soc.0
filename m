Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206893DDDDA
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591856; cv=none; b=NSgEv3xJdVaY8KEE4T2R3S8R2arlalwNejIcqNuO2BSQwAgZ0V6qO6SpfYibHWfpDS84fVx/LTvwIUxRG4qDev6ialjLiqtHH5QyTugB+xx1cYBNHP3cF+7kJSQ3YrzCfmiNxShKNBlXu6K4lF+NW5pwwj1RG6g17N3XsJ5ADGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591856; c=relaxed/simple;
	bh=8GOJ1bBhkXnXFQ/xtc+4fZdZejRnue5u+K5BgJsvQus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6cU2L+soM4IRjxENvFrJRMw/GzlhQHqADaC5DdONdUVnA/6WbaPskvRKQNiryFiABvxbBp+bN0rgotBKBAnTrkI8hVp81g3HIQ8k6RlcLLmlMO6u0LsCRHq1jXvfSEE+WiAyzcfisDOz4mWuO9T+72+i81rAfBXNMigjkDG6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RncqAtK4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RncqAtK4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so16747895e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591846; x=1789196646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=RncqAtK4nFcBPPTgUs8AMiwXa2wMoBlgCSap1WCpkog2HtcMl2dY0x6D3q6dmaNRdv
         dICsimEaPz30ld1lTg0ZiKxsLwFIftpMqaKvhdk05060EGt0E/TH9wY1NjnUxgLHrxpl
         xv5k835yE02E708d8v5CHjGi4xQDLYi0grCez+M8lkOCwlFNTWgxrabpNifw0coZTVKl
         3M94khTCkWfOlr56gra/i6mPDGQC/HAyeu9sioXVfRX5a2izI+B9jI0HqjvLPJSJ2uKQ
         o9xkwaqBSsK6NIKcOiZXcWQmBYJ8fkAy8Nv9UPXWxOtAtXNA6WCvCEdNkipGdHKIoSXo
         6zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591846; x=1789196646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=c1fr+pOOmwf2+rkYkkuHn1AheAWuprwLhttJ/oyKQo1fT0GOG8F1xIJPuX65LwP1RI
         OGYzdL6SBhPy7Jpfc+B9/3Cu9Vp3Wfc0yvVRnj2xKbXU2Owu/viFx1koalaIKkaHw8r8
         j4/mQyORgO/43phtcBoYVLhbYkBOBcgtfGkzdf/DzA+YqF+CyuHhawBOZ/ss4SmMmEXo
         yLPeknovOTsmfZkWIAQxiw6NnErHxz01uRzDv0KuRFIzcFf9UAoUTkdQ5JiEjVGl3iv6
         hJMtxHhRoco3RTxJA9W71t7r1qOkJz56oE3i8f4EVSt3kA0yosLyqqQVvicfoaEfjogD
         PQWA==
X-Forwarded-Encrypted: i=1; AKwUvBwl8cgnaNaPAmFFrbxcH5xZl64nw94s+f40M5ZQXOL9Lmk2/8b62A/mJxQBoesai1Da4W1osc5toPz8P/JHWwgyVg==@vger.kernel.org
X-Gm-Message-State: AFuF++k9reUGFU6aEKlfA2fEPCX0a6IiYATdOE4hjGvPq2+u3memlBho
	TyCq44RU4IMfjW+DRpQ+/XDoG8SX5EsLOb0wMmgO5dz2l7HqVj23eRXz
X-Gm-Gg: AYBFou2CvpEfU8vySZA3VayJ6aL4q/EyHbfTx8yk/PbUqU8Xw2El01UmBVQyUYoOtth
	dYIbru7STfzC9J+yYoo5Ut+HOmUjkJKnrqwsc2uaJGWwbAUDE/sr8UdFpJInSQ2YuSlIrFbIrG3
	gtvLlyE5FaB5wOSS4oMbH8uz6r0DOqxY6axAvLdquuCGNwzBvk9vIoy3RbilUdjfOb/eiRUdrDZ
	Ceh6S+hAbXj2mgSOjLBwF7zLko+27f+0DCUKxYbG1r5P6WB+fsGlYiNZu/VvvJ/oQfgP7+MLGQR
	g/DGiyim0j9M5HZUv7M0zX6h3bPeltniAP6dJt1Vy1iVfO9iUZWsGxKPP3a/QcBqYDDZhZPDoOo
	bFzBQlqttD7ArKioltLrGHddCPFbdiyrag4Cey57bTq2JiRXrHnj04+/k7ctjD1DQmghlXxs3pb
	2isgrw325mt9QH2oPYcDRBFsF4zYx3KxqwSU55U455kOJF6bF1T09nZJpasRlDwool5J/JDMYnN
	cM2IzCcRkkSqIpB2ZBQLbHdJUXkXMu0wCpti+oeWSmW2nq/VyUMBVlEd53ZAxZ1APAaXLZOQIKu
	0rrS/Ny/vrQxTa4kTnDaGG7ob+Dqs0lLZlyD+FkFUJahKnfEf1BN9zAGz/edhGtmuHedm0Ia
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr76992175e9.29.1788591845868;
        Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 6/9] docs: kernel-parameters: Drop the nomfgpt entry
Date: Sat,  5 Sep 2026 09:03:44 +0200
Message-Id: <20260905070347.25902-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2ed1e2c03c61..d44728a45506 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4553,9 +4553,6 @@ Kernel parameters
 
 	nomce		[X86-32] Disable Machine Check Exception
 
-	nomfgpt		[X86-32] Disable Multi-Function General Purpose
-			Timer usage (for AMD Geode machines).
-
 	nomodeset	Disable kernel modesetting. Most systems' firmware
 			sets up a display mode and provides framebuffer memory
 			for output. With nomodeset, DRM and fbdev drivers will
-- 
2.53.0

