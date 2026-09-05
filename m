Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CBE3DE430
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591856; cv=none; b=r5UXSYNSNRd3Cxfm1lg0KGs2OGprAb8vSXjixP2u4sbNvULeMLe6DHdCx1ekFqv9RKJkDz7WytTM9Cleylk4JWQLGPsPLU82MkTA31LNfdAqEclUkyVUAC57BpsF1S/96jhyhud8G0RJLjPUXyo+xxMlgyJZJomfbU/vS95R/pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591856; c=relaxed/simple;
	bh=snUd49mCf7brp4BBjf0T9QYSF39uzje6kt3MIufRgeg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YVmJTgwLtu4mSF9rqtZ3w6in4boVFLnKCgz99MJ9567evi0RYuguF1Vegd6vLGBHIFWploMgyPDSaWSxJJKkZhp600WE2qaMey+eJdxhMoJcxsbMRmmROYy/J7ukYU/lUWjXB1StozSQspF6GV44NhrPNmV2/0QOt6siKPSjPUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APjuR2bm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APjuR2bm"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48436216a98so1173894f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591844; x=1789196644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5lgSAOpNjAXzpb467QfOiibQnaDkCl6BQceKsplpJE=;
        b=APjuR2bm2EoJb+WyneRnBa4v+b+0gb7YJpOkRd6NJwnZfsB5vS28r8J4Eu9t63azgL
         eq1CmU4amK7XdRzOAQlxkAuAZTSC27/A4oLk0uA6XvH6OpHGBkiqfyDmlBSyMDg7pFzz
         Ps2j2ajeoziQtI9nOrzA6jMUTzw4gkc3gRvl0XAP6u1m7tyoB07kFREGWR2H1636O1s0
         KvzsfVr8h4dOwetmGw9Uw4DbByCFxt6VHHAZCt+ff1H5vEEta/f4wz0ji2+cuE5X4kiG
         CGZpsXGGxqk8/FCEZEPeDQgj9tFcHWk3YpxuyyIviRghmT/2GkWgIisDHXQWhRNvwB3p
         F2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591844; x=1789196644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5lgSAOpNjAXzpb467QfOiibQnaDkCl6BQceKsplpJE=;
        b=bkCluTSq1nMgR/pyT+nmMcvrvFDIOs6Zyb2J7H9zq8uLyUCf9kV4YGPYDcnYDmJ3i9
         ivlCdswUe6ve3aFy1zCvRC2HMuXPUtX417AHyqC5LbSxLSNVrEGZMOM790UaQ9Cr+B6t
         m4+shzxf6kVsdsuTe4pSjEn09mGBsjmZCNpbDCC096GBz+UIWhV2YN9ncPureLWvIbIS
         5T37U0Wk0IYJK1cDw1CPFH5gIkKi+vONB8IZXf1SvNl3geaUuJmENjU5YKsIiQcKZ9XT
         7ggF+5Nr0PG4M58GWhkJqvGnq7pBU5QYK2k/Q8s6yU7bNtqRevIW5sB8V0ou8A9ZqhLa
         sueg==
X-Forwarded-Encrypted: i=1; AKwUvBynGwB7/foNI0X4r6LUN/aMlR4eb+HWAJw9pRE9xE3SJqc2UEo4ExHUN7KBl5ardR+rd+23EHws6BopaJn9PKe/Og==@vger.kernel.org
X-Gm-Message-State: AFuF++npVwyOBvMV+H5s7PLvyrEX0Rz1dPhRCGbyZtUxQE/sK2aLqHX0
	hyXv/MtQJU2sEePowyAweLvmAnV966W0LSUO/3V7NBCW3PmZEE3bWeMF
X-Gm-Gg: AYBFou0uHrBcCDP8cUXXUFAe5YYZDnyo4n6qS/U9pKpDZlo6jdUKHxwYpjrZG0T2IfZ
	2Vjmt2JBxPusO4+BvqMpLmJZJ7xq0oWe/oRER4QTRyALMPMib4Nts1cK9kwJAkrJGOOOMExo1rR
	mA7wFULaqW2bhQSy9sKk/KAFVl0+HY4xLN2VI4L2AIK0s+W0+VTyW1c25E/yUmPmDOXHf/1fw0m
	sdgVhjiB2zn80h3u0ve7baUevFm4BXD9f/0zuXsfCzybO8xKbSwNkuFpHILNbm2EnhJjYuOS5X1
	4KZ7P498TV+SQTBVvXqvLL6LhdZICb+IhsPsSHPmzIr/3Mxu+NEi7JWgzrhog+O0ORL9HR5/oxr
	uS4uP7gbxckE1VfKHuyQz2E7qN0W2jZ2I+iXwE3a8F9la/261EnJs4r2KC20cdCYV6+h4fzMo3k
	kR/VkHTnFT1VcsvAxGa1uMI95fUN3012uzEpWRswhKt1+7hLcAqHTLZyz5DBUb2XeexQvNygCfS
	5+IHri04C/uKreyYJTh/HMchhDxnSlCwSKUXoqczABW5tpI5PKYWW2uUCfEcdPZr4jBjlbko77y
	U3BhVxuFrWBw+pzLZjUbJuB3O7XhJC28nOhhTmuj37At1P/Qmm2YgjSGvazKvFlWr72NWUh1
X-Received: by 2002:a05:6000:1843:b0:485:8c17:9767 with SMTP id ffacd0b85a97d-4858c179a7emr8752866f8f.41.1788591844264;
        Sat, 05 Sep 2026 00:04:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:03 -0700 (PDT)
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
Subject: [PATCH 5/9] docs: kernel-parameters: Drop the mini2440= entry
Date: Sat,  5 Sep 2026 09:03:43 +0200
Message-Id: <20260905070347.25902-6-kmehltretter@gmail.com>
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

mini2440= went away with commit 61b7f8920b17 ("ARM: s3c: remove all
s3c24xx support"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f4314492953d..2ed1e2c03c61 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4052,27 +4052,6 @@ Kernel parameters
 			Enable or disable the microcode minimal revision
 			enforcement for the runtime microcode loader.
 
-	mini2440=	[ARM,HW,KNL]
-			Format:[0..2][b][c][t]
-			Default: "0tb"
-			MINI2440 configuration specification:
-			0 - The attached screen is the 3.5" TFT
-			1 - The attached screen is the 7" TFT
-			2 - The VGA Shield is attached (1024x768)
-			Leaving out the screen size parameter will not load
-			the TFT driver, and the framebuffer will be left
-			unconfigured.
-			b - Enable backlight. The TFT backlight pin will be
-			linked to the kernel VESA blanking code and a GPIO
-			LED. This parameter is not necessary when using the
-			VGA shield.
-			c - Enable the s3c camera interface.
-			t - Reserved for enabling touchscreen support. The
-			touchscreen support is not enabled in the mainstream
-			kernel as of 2.6.30, a preliminary port can be found
-			in the "bleeding edge" mini2440 support kernel at
-			https://repo.or.cz/w/linux-2.6/mini2440.git
-
 	mitigations=
 			[X86,PPC,S390,ARM64,EARLY] Control optional mitigations for
 			CPU vulnerabilities.  This is a set of curated,
-- 
2.53.0

