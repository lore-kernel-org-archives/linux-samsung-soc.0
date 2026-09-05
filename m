Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1793F482C
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601644; cv=none; b=AZjwSRvJj1E/5e3CUXbBb4pQ53AJ50NSMrWijPFaeaILnBWHUSj531wHDN2f1IaB8XR7ujmhsezqzwjb3WLOA8R3YT+A5w+/dgwTkI3HYECMfmBrNmLgabVoeQM2r5fG9vi/mNbaff5dOZ1e1+9f23zNUkg6y+k4t25bHE8d43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601644; c=relaxed/simple;
	bh=iIEWAYVGI2FzX5iZTyH81lDATptMQacAG0wTPy+abXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MTQ1vaOSm0SlLJxdpbkJPX+SWn1D5vzG1NPY+P10ogzuK2YO71Gu407nRzj+3P7s3CdtcbfDZyHwQuPZL1arFFOp4beEDITHAf5CTh0N6g1JdsCMT2B/iOrj5xb5uFdB9p1/CB58uWTFsG1jHImdKwYBurR+/gU+cB+EKV2yrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyvrpKrH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyvrpKrH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843e397f74so2283225f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601635; x=1789206435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=WyvrpKrHJwVM/8ZcX1GSWFju4g14O4oDahiOI0OS+wcnypQuvsomCZxxoNsngGdcpS
         iMNMMyLbpjtmvW/EWl4iZ53rr0WuVL50Je9Pi/ewScX5oXjVlbyTy66vsM00pKJDHekp
         zbXJPoTpg2PVAHDnNeCDSEqB6+IXMYfMRVEYlxkySrV1FIftT3xdeKrCHXTmz2dCvBqi
         G7Nx24hz/S/2cGB8bDg0xlI/4JzXD2cIxs27X9WE+cEHW97xbSD60x2O4TuuUiiEtmMN
         gLz7tKdUexx74iuFiJ5OWz548lW326b3vnw9JZ0uUDJlkfikeabOhE0wjsV0JZs8aZoF
         EjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601635; x=1789206435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=hW7LItJFHBMuhvXpbvG6K4nadjFdUC5GE4/Z/sDEPD3OzOVQBgo3bRu/tOutYjUYdJ
         6jC7YvoVhYmbDZREGii8+eeD/gHFLXQBZzdswO5tgRn0oRpOQQO4WJvdzMDzWKjXrgJf
         8uyTmjdkYQgtsmRMheVtYkdJLDFYJ2qp6+NLF0y1YyytBBMKrO6bQGUAq/cDerBDlhMg
         xmijkq6+WwroWlJlBOBEvuu9P6cl6y9SwM1Gc/jm1uuVZU9C8zERUCs1wXwNpxjx52Iw
         fDxdxclzSHUvB7H9TfGU3vq3NH5X/zpNy2g84C5TM5lcOQ/JoQLvILLaQbGQxGFkKm6Y
         P5SA==
X-Forwarded-Encrypted: i=1; AKwUvBw/8SumAThab5Op5aX4LbmHhn7Qcf/9KaI18J4n4qqabyX/WGnns+RYwSBHdLTElKp2YnYTP6Qv4yxxnpx6GvUvQw==@vger.kernel.org
X-Gm-Message-State: AFuF++mB99AEd52QphU94GN4iFHvcfT2IHjvchmpNlhk/fGRe/vS82Q6
	Mr40NRCcBasLItozLPncFtCInQKSWrQcdET64x3Ma+B/YoAu8EMGztxx
X-Gm-Gg: AYBFou08nwfiDZgfcqLw7LEYCX5COY5dc44pZvffI2ADxGdpgkuqHN7oynZc9npDukX
	yIn8NxJGvVRVqEdlrne48TTnmzaWmTMnY2S+Kfo6XrfLvUehnh1zHqat8aJAQAMMtH849gYvcJa
	IZGgwKhkpCVFhvB4ByBNzHtktkqkCu/Srpr8IwOcy3nRFE+D9CfjwOlKGyGo4jWHF3HwIZ4JT+H
	i9JDTd9MeN2/z2xfZzO7RuCpngppWcgxL3qyy9LI6NhJxfi0k/dWEsLwSeOrNhNEVdcMm/dEOGL
	jh8YFhuvJ1C7L2StsFTZJXOUdBv2ohPV0lHBmjO5VCX8bSgSiwWTFxbvD3K/bYshoYntHhSceTW
	XLbF7wh1hexRBsl3nftxarOXCQAKSZt8UPskyrvFFDrvlzDZtz7lnXqQXvTWH8k9Qj52dcoGDYB
	QF2YXGNgiwKitTOcCTyatSxLS6iIgeColWDoi8gsCLkwCZRGi96foeCBpld0XAYWsMFI7qjUvD7
	+7SSrfChFHf8iAKx0ABxWhdUDQsNBro2jm9QDsDDs0qqIrW0mbuzdJ0ZC7fIJwcyXlp5i0Mez99
	53TIedsChDsZcOYtEtMKGptBPv9vrzDAr1YW2xqlee2O6ee0u4x+M1oqFcaLlNKYdU4=
X-Received: by 2002:adf:ecc6:0:b0:484:49f8:b56a with SMTP id ffacd0b85a97d-4857e4f4adamr18253955f8f.8.1788601634554;
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
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
Subject: [PATCH v2 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 11:46:48 +0200
Message-Id: <20260905094649.41996-9-kmehltretter@gmail.com>
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0

