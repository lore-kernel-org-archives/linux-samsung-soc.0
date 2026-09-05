Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6D41D647
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601637; cv=none; b=QV25YDjqz15p3xpp/AqP+dBoyM9C13MqmLuZ3fh/5LN7PC2Xcumm+NIv4hTVJXK9shUbBv1kIHZ9lH/F2N+unFFnfcPP/rd/PeFlBRlXVlEAMCQSDI9HP9/GtOsF/szkSEaPEAElqTCsA/CzvTpqgcqbL4oJ+v8KlMKWQL9kjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601637; c=relaxed/simple;
	bh=zqIZgn7Zgj5WSQepFgJtQ9GMMyKpvR8InLxOiqTa/8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R1c38H6kTxVByCTgJJ3NlbKr5H0/F4OPp6MP6yMxEH8L+O5Nem029Nel6SyYmUzhWjiFNsTYwgAoNW8mtcVs8euq5eYO9XiN9KB2KlIEe4rUwgFQ6mdHd0au8f8nNVKvB42aD8KgHk0nKAIPvsIRVg83P0MNQiG9xr1S2Aaeyo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS3GkGDt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS3GkGDt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so1129564f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601626; x=1789206426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=sS3GkGDtOZOrxGVH2ecp8Y9BijuvKIZGE9cRol9c394h++PWXXMUkrbfk4MaucH7Xb
         U6xnSpOgpPlCLgGRJgFJusDEMpGl6GoEPagk0EBRDekWebDNSJ9c2+7bDODP5t5sx6WO
         S7qWSKaOAWth8EWw5f4FyoVQksRMC12WKRbvoec5wN9+mVJAxfr0JzbGojpcXGDPLycy
         Wm8keJ8zf60yL0isTXgjllly0MsmA/q9Yly09xrEJx9E+b1vfnw2Do6nlXQGx7bqY2/W
         iT83xkaYf1IN7FJtaRTK97E2OxZs+3sKatwn2475v/Wkqn0YcgJ9E5z39H73lyE+5dXm
         3iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601626; x=1789206426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=lPaLU+2jUdF3NwB38CJdVXuXlw4JbB+9rdnaqGhtLuCfWgW8VESDbSlyyz0f8SLJlK
         zZbUtADXDu1h9wmaEmeNVNRgNyoeBOTwbAVvYcSJv4WB0F/8x4wLrW/qL8r77lz4ca3K
         /TERyAeFmUH7CC/qQ6UxSpaSY56nCJg4bLzLFvSS9dJy+kftOeKAc78z7HnXXIYLpFDu
         6f/kzbN8WAoFoDm97593rpZimaIEUpPutYqKIODrST1lXFzL51f/N6rD/9caGtATHVeB
         UDaPaDPDvazLzvZLWEFOhT7nkEj+NABFTnkCOi4OKcfMJp4x4gPKdKSxUlbDgVeZMUsO
         2dSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwohfm47DWAEvETu0MytFiqlFCbxW8XeJCMji0RrQxqy0zmwhsxmyH0XIsa3njnMmGpZvUz4fTPTFCfhxrs3LRi6w==@vger.kernel.org
X-Gm-Message-State: AFuF++npdkXZh3TzdPEC9ko1ii7FzLoz52fTCEDgtClUMOY8/KZIG18H
	0q517IKJ9zrHosWwgQv5YspGPuQMGz422MU4r0Fkdefr2K+pnroDMdfw
X-Gm-Gg: AYBFou2vhAw9BVn1SFcmMjgddsPIzNXTg70XvScjEfOr+via/DPJH2g2pDp6MetSet4
	mEhCton7mEiIcbPyR3JtnbXXs7ipDyBtNdIpwdXvIngFtyPzJDSKUG57ZCye57O2fRYErEa0a1Z
	L43xYeyv9DqcOjhzEEYfaNbaI2xybsyGz8PVzZ7o4QvSAuQfWLcReKxKG/WJHAZJLHbxDj/Hn3L
	FgezIswTbsT4K2SKWVvBi6Gi/AsTq8JprAm3vxuKjB8cOb+xT0Wg6VNTCLXPLsgxxCqgqk80JqU
	y131X/WAyW8f0yOfJwUABUuBEbrfyfNgW0cXDb8/5R0zc7w+rDc1aI0Nh9O5T8LGcBcB4a+TxIX
	cco15inCI/JpfSVIIH879XSh+Vc5xYH3rWkFOlH+abJqYbmfdkCxhwm5BHkRFtx/S5lgrZ6rXb+
	fIsPEtHlrJUV5iLX0UtDiehnu0bvMexdgVIJa5Qdyiv3v6AWrmCUr4xiiEeexSG6qVuk7+jycni
	ujC1u+RY6AMlJgNqFErlOZMKXbfM636cev2aLXxPViJn8avaVB4faVncVdIB8KXyHBvnEDYmVUt
	hGJrTpn4hfY/hhcdh76iPlJN2qAQQyo4kYK169tjNxzfZluQ0/TbfHfcClb0ctJPhWc=
X-Received: by 2002:a05:6000:178e:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4858708c88amr21220202f8f.13.1788601625675;
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
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
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 11:46:43 +0200
Message-Id: <20260905094649.41996-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
edac_stub.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: fee27d7d9788 ("EDAC: Delete edac_stub.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0

