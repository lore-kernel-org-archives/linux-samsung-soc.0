Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE11F3DD87F
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591858; cv=none; b=SM2/qZ3FR+myz0dsdpddmO5+eMnRsZ5qD4r+LX8s4k7zu2TJAnhpaU5MRMABdl0cZUix7wkulNBUF3+4CVgUngwPhtNdytrG7XjOl2SNjokxqU2926m2UU3PlsxfhrspSpcBw3ug8U8euKKljAxnd1MCgIQURxh7qHt+LsB8w/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591858; c=relaxed/simple;
	bh=iIEWAYVGI2FzX5iZTyH81lDATptMQacAG0wTPy+abXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fTKrvSzLuvvV/0jIjpISEnJZabJiGFRkhZrsQG1inaiJHHTdUkTepWMp+GFS7xLxwj0ModirOp0P8j0vaGXN0U2zgqdCggrY8GxlbUztYJRm/wfGzTaSJfb5k6HpT3hX+LsnnjJ8YsZb+O+m3IpBCro7POAKytSaLJKVkOUg6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/VnKgEw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/VnKgEw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1114511f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591849; x=1789196649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=n/VnKgEwCzZzuUfJUOeRE+oKzjhVOyufVIm6bkaulaLPTDQm2Udno1JesGrfw+QtXz
         rtm2HC9oekj6emqCHGdjmj8Tg7GtyOqUaLYn/RB0+FVYHZ+4xb5I8BszVLSoWQKWnUOz
         ykiTBqE6hq7UgsTha8RD7CuhFhhy5kDjFQBiQCgcgB3RGwGNRMX3Pg7/TRuIJqfw2a9F
         EpjIsiNmxO6bXgxOyi0EgzQ+9+XnRBpbp+/MkKVQI+xT0XzSfP9iUXr4eIb3HBe1Orv8
         BHqNJmEGTo7OOeFNbie58dyBfFSSmVSCeP0DGssZQo3HSLtGpMSaveVk3WFXlSZhC0II
         gtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591849; x=1789196649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=qX+YuVDKmjDgfdRQ96U6csYuLALI/dn4/auCz1B1lB40Jdv8+hk3f7ktlHFEQqy3Tg
         5CuUxe+7HE8d6pgqA4pLSCQaLLSoFTbylqnoS0bmxXfl+1o6Bd+h79cLFvZbZVKPUaYe
         KJEHYc3U80UDSLWVRABr9JGZN48ZdAReibQgJUhPrwAcJ+EjJNCu0u+JifzI+a3kbcTx
         wM+XasgrWdFU8v3Uy85Iux3/q1D9OJ2qzh3RaY+kWh1Wz8/aE2b/DqBRylUEmUrFwlEH
         2igAiQdr6mzdtOenNjlEI/098y0UPHmnfUywubYYtzJoSaN9LnVkIxPqqGgGzIYbTVUx
         6Adw==
X-Forwarded-Encrypted: i=1; AKwUvBzpsQmueow6bqiEQlaxQUrTN8VNTPHVNpe72tmTY7KAZFUCJsIt18/uYDJwYsh08v3MfWFFTipN5MdnovxgvqgWcQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k/A/BOoXP0BjtKGlhFLmG8O6ZZyWXVIONMETdmb8l4xNDGkwOw
	7fBFIYhTDmRmS0yvGDrNCRBMFgzgEG8bY18U9NMerxNwhVajq9makg5M
X-Gm-Gg: AYBFou0z9tkXSRE8wO5gUxS/AofGPv9NUzDVavvvQzrF53J0d9A/+jbU16j4KiMjrix
	b5TDfJkd9Gc5RVOQpDGmPfNz1uu6FnDS3ANbaWtpmXmWnOgdVdlMKbtiED3t02EMCXA5kVDlh97
	6qlEE93X37tQb/vZ4bctzw9cJz96/gUq1OgM7HbzO5LhmvkYJOlZEVlfSmV9oJDC8ETsWrGjy6z
	uIk80QrGQJX5sITamNQ8ju8yxxrDFWOKMjvjaSdYkEB9XS80DGMo1DqmOyUVJIcaRd0iiAbesCV
	gIoveMdm4e9EAoUd3FnLMZAzQQPGyJ0khv92qbZaOTNhJUcKRcRege6YnzGmtkKSqpEOGEZ8XEj
	GnIpKy0vMMIAZG0kHPoTVCNHd2pYPGU9wPvMXjLtWTKwRnF/8XY0P2CCW2eMYZfK1OPpldlrl+G
	sbu9702kJCzXUrYvhuDWP+8ZWYe33dk/rlh3wKo/XwEYPpHPl1FV186H/FlW+Bv0XaI/O9Gq//p
	9q8w/c4WBJ5Cp/GW9RjpM404sTDon52zMhVmvcxa3F4C3KwBdBOT77wi1wkHZylHQWK0jAEMfGk
	OKfPLw+ydN3Ican4E7/Dfk3rUFHcL/4mHo4ScTpXELp3l6FsqsIfey96UPOeaaS46qrIDPvX
X-Received: by 2002:a05:6000:46c8:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-485872a6622mr9310761f8f.20.1788591849363;
        Sat, 05 Sep 2026 00:04:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:08 -0700 (PDT)
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
Subject: [PATCH 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 09:03:46 +0200
Message-Id: <20260905070347.25902-9-kmehltretter@gmail.com>
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

