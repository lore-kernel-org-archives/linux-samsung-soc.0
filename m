Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42663E44F0
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591863; cv=none; b=OPtWsoCjMExDDR9N9w2M+nJNdY1E6U/SoM2O8SfssDnw69J2zCpslfk25ngwOvCVS/OstRMXMrxYUhzmRAqdkcL0MJVYtE5RyAly7hf4KEbw7yIc5OlJiCqdxJD1A7L7kqLpcW4ecqeLQvlLk6E5tuKm+QirlA0aPPQrqCNwzp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591863; c=relaxed/simple;
	bh=pPxPTNpM/nAKvWxY9H5AEsCMADngEkeEEOle128cyr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pz4fcniDFCys21hcxKlBSPHItcrBwpGPduJSAT/Z0u5x5Jao7yEkww60APIOf8Vq0TESn3CBqG5FFrXdFYU/x2s8rOg2EJJaETFS7jTD6aceHLxHaKnWwwIMyH+kRfIm5ebvPRr387vTDqIyiI+G4RyyZL4amhziIEiRLmuexzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ufys3Hf4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ufys3Hf4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48589798dbbso1378210f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591851; x=1789196651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=;
        b=Ufys3Hf40M0EzhImnoudR3WSMUwBOrbN7Taboome5GjqVtxwI5tiMndrMjUZtrzb0u
         tK6f+gTpLgllMJq0uTRIdVUM2ba7tKqF+hT6HsioTq1CslyQk1sgjTW7fogCc0Aavtrn
         B28WJP153FbCtnjpSgK4GIYtwAAKNOI8b3qfrR8lBeoGtsPx2WrNMM+iS21NEvcrdJ+Y
         koxzHGYZxc+KDRfoCxwoW3zmi7MOUoLxcLyZNLQR5L8Q4I+VMXuUOVbI5gKB2VgJyFXw
         0+LanghEEKkSJWdgoQB2B4+HX5qgLUjnIKBD8aqa7MWY8nQgLLnNj5vzsTFRCVEtpd2r
         C7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591851; x=1789196651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=;
        b=pezN6Tbhhi3IObcXRQr3XIjW+O002g6QUA6q3ca/T9Smifd7VdcL1iMqJH5PUAXs9u
         CIb+CLs17qxak1IVwp5dJr8zQ6BCyEEiWXExg1lIMaA2uUHdLvGlKSAUofrnJT1hM/7s
         oQlro+Zfsl16yRnavC3Enuwf/8+SOvU1jJYXuuUt0W/F+4tpACtyT3XAkklR+ScNzvAB
         mkTYNgqN8o1Jw/hvJaIJYsvI5aNQW9d1ykUPXAC2iXRtfzcXCvrmdyPxHOqBzQ8fFR/v
         TDGT/hxsHXaEA3ZSAq9sYs1a9cfRXy32uQ0h4x1LFu/W/0l3ykZ1IuczbChLm+Q/xoOJ
         UXYA==
X-Forwarded-Encrypted: i=1; AKwUvBxH//L/xGVuSZy+l/nP3zpdWbcF5+loVk8SIj1GqRsyO++ld2hSXZcfd2GwFfuasqXrDhtj3wuGjaA5oQSRXaLmOw==@vger.kernel.org
X-Gm-Message-State: AFuF++nlTnGdig0RYpULzZ+kew388G+Z9CxrdJoQoumWIIqCsuUVeSs1
	x/u1EHHkknfKQGl8QylIAxl+P0dCDw+ghygI8Ko3kt1CUw7Hd58peESV
X-Gm-Gg: AYBFou3CGLzuY9/8KuuxNnBM8sM4ySLPe6vvvflNtNelD26bNcy3JC4lk/9MhV7ctRV
	5a8b2pz56jPlj90tbtdxVp5vgr6TjAsBV4aLeBRKRVcqZJVtZx/X7KJRTpUWovT9zjKgu3bHlf3
	Q+Fndyjw4S1JzuWAKhix5man5BghQ2S0HklWhgIvTf2+B1cWpiEBcPsU7mBz9fZ2LoFL8cur3eB
	k/RvPWrNSyXcjowJR6WzOXLMJtCr6/BgX3ypv5Q97X05MqJb3ob/B8VGQcllO0/paVlPwAqjTHr
	C1E3TpzmTh4uPYLWC8H8b6fk5kVT9oqU95RgIbMtQjWSVRpGErQCwRictg+/LZH8DiY+kezDJ5j
	gsRiQfTvQU5ffwjQasvLodZA3oYIDPRAXgdD4owLj+kUIzpZZrnln6vAQah/l2gQHpjWWyS1eaW
	Jw/EiPXbMaq3FZScFqud1Jn4pTfB8/pFy5XSY19JRZiTycfZnnD4IVa+A1ygJanvvTHQUJ96n41
	z8i1D19X3A1RSNBdrt0gULoz6BWtNYn9wou35M9FoQsd6w4ScYOB2f2B8D0SP2LFWSb42KeWMrw
	A+4rc+JNRewtRhm+ajxvEe+pofi1v+ASUhLawy2hQWEkSlBLilt9eFOdAKp3w2wil0aGBnGw
X-Received: by 2002:a05:6000:24c4:b0:485:8a46:7053 with SMTP id ffacd0b85a97d-4858a467176mr9452131f8f.37.1788591850939;
        Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
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
Subject: [PATCH 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and pata_legacy.winbond entries
Date: Sat,  5 Sep 2026 09:03:47 +0200
Message-Id: <20260905070347.25902-10-kmehltretter@gmail.com>
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

pata_legacy no longer has qdi or winbond module parameters. The QDI
support went away with commit 0dcd0a76370a ("libata: remove no longer
needed pata_qdi driver") and the Winbond VLB support with commit
3c4d783f6922 ("ata: pata_legacy: remove VLB support"). The entries also
refer to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE,
which do not exist either.

Drop both entries.

Fixes: 0dcd0a76370a ("libata: remove no longer needed pata_qdi driver")
Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4864e37005be..33298da28b55 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4994,19 +4994,6 @@ Kernel parameters
 			the first port in the list above (0x1f0), and so on.
 			By default all supported ports are probed.
 
-	pata_legacy.qdi=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe QDI controllers.  By default
-			set to 1 if CONFIG_PATA_QDI_MODULE, 0 otherwise.
-
-	pata_legacy.winbond=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe Winbond controllers.  Use
-			the standard I/O port (0x130) if 1, otherwise the
-			value given is the I/O port to use (typically 0x1b0).
-			By default set to 1 if CONFIG_PATA_WINBOND_VLB_MODULE,
-			0 otherwise.
-
 	pata_platform.pio_mask=	[HW,LIBATA]
 			Format: <int>
 			Supported PIO mode mask.  Set individual bits to allow
-- 
2.53.0

