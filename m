Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C63366575
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003993; cv=none; b=MCb58vy3ZQ+YVF2onPKKszIy8LoR8bSMXwP3Js0nlteyo3wOw5BHJ5HZxGpOVjAEQKpRzm96ugfyJC1atv8+gO1z67/k2BwOUUYvm8fz7S8LOVxTY4acfKGxU7GDQjHnaVETHWJMSLs74XVe7aHsWpm+dmEK7W6LQCtwAAgMQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003993; c=relaxed/simple;
	bh=5mxh/fyf7zMbDCUOMNH4gIL5QaZHVPfDcaf33gQ9HIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=No8vHUzfrttU1ogxU3nKWfivcsIpt40omKZWjN12YstntGVD0zJVlpcoIvZ50fh1AU76lVTGzlgodjCqWKvT4iYFF2A/tOdzX3bn9n8m5Kkr0Q4wQ1vgeUCzs06NX16fpe+l7+iitKKP8vhCYYL3VAyENx94XHOZt4ZWfkv2X7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSeTwss+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSeTwss+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369ef6so6028015e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003987; x=1789608787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQdyP9lzK8puPxCmvP9p22b7bgDtVaxFnQRwYj/u0p8=;
        b=WSeTwss+d4gUDDaRD2rhGm/VIGL4TIzpAISoyprh6a+NCFi/z+6Taxtl+AsczGmnvR
         329V7ddqkx8W6q+vcrK5wYhUEdH5u5Y5jMk8RvCk1xN0vETqzuHv8S23Jq++YoPM/3av
         HNxa+zF02HjrDkaIo/HQmRIUNAiUTjuhjb3bzrAVEhh8yEeNJOZJs1IweqYuzCVna2NL
         qsw2PPL+N5S2wCfVd65+HvWrmbG3BJmAZsBFBVgykJcrP4x3EJMgh+rBGE2oA67PafqS
         hgBXPtYRQposYQ/zBmBy+T1wCu69P0gtYpM02ca0GDDMcHo5IBQIDe/e3N+6lWxJBrqa
         m6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003987; x=1789608787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQdyP9lzK8puPxCmvP9p22b7bgDtVaxFnQRwYj/u0p8=;
        b=VyIep5eGv+TLu2HoI2cmLqrurODvqG1B+8SzozuP/Rx7ECmOXWA+yxwaROVe1qxz5u
         TkuGckaqBtleYne7TadBfVn1jOgqw85nJRRFeu/F54NDZvfkwpVZm1t12gkRnAd1DLij
         iTxCRHZ9nVcSfRrdO12hd3V3pBsI7PK0+GxiKExlyPdrO0Ksf2s4Izq5jXlZrIB8BjvT
         BTOrUyFfgecM8T09IW/AbV1UXHOAEgJL/oqUDhB+E4av3AEUZy6SI5hudb8KxIWpixYF
         xZbu1Sevtzyj4HBF8n7YfBUVpy9OGqCmvN8UyeM34GxKb3cEJBF1S99Vu2ilNoYxAb2i
         LUOA==
X-Forwarded-Encrypted: i=1; AKwUvBwp7bhYTHFhesflXcqJgltSi2+cz445yGJZRfioOilANW3wlwMWHwF+0BiiE9++N4xvZ+PCXiSdCdNbJj8a9VTvBA==@vger.kernel.org
X-Gm-Message-State: AFuF++ktUKAYIwYMFt7HiEWnp2gzkjczWBpIO8Z51qw7N6xd3SEVUfRj
	u0QkjwngSKU4KWRWSTgIQor3dsvhzXG5ZCZUH21A/CUO9yrBTCrjmbee
X-Gm-Gg: AYBFou0VMewvcdTFlfpPqxbkImY7GZw2t5/jqzWEp62vDjxhj313pks77AzIdOfPpax
	6p30AsQqSNnzQT8qLyXMAdoC4QL80bXRWQrIhaV4LfTNCechAwuT5e9S8/0ivBn8GhbUK8OyyQI
	g59LIboIxGSHZvac3WO9DxoVAVPTnukKDiX012E/44Eriume81gKEltkgM5C1Erm/6/UQvGsPNS
	i4PbtxVWXT88YLELEfJ7yQWqeaY9gQMfFoMSJXXXFRItR4gj2HyBNZ3aFphFxw9kNPI54fOSrd4
	uPSxk2z+gPe8acWflpTUUnPU+cFX0Xt90UEekBu0C/SJG1Q+QqsWi4E5amRenq3U8UTkyBkXrCK
	/cOwgpva+qx/xzC2sL4ESBthEDcWNECvtm8iNl60bcjHgJ5X5QONEtfZC5ayLtbGciRWfEsDBdV
	V3zQusD6eT/2LdTKxus91bZ35hSfEtR9dYos+5ffjyxzwB89WsADWUoxxWdys7tNptglyaS/oW0
	/CttxoZtUXntHJtSGisGUelFddzJiC5MjWGXCijUzAVEY2THlpfxT9cX0vWLq3fmCFKU1gxJ5yN
	mgMDhvx2QnCsX4k3sTy4iRZWjsF7TKahOw2J4Pbo6pbZcmX9CorrfZbPnXT4pVE8xzQqcHjUWoC
	ZtA==
X-Received: by 2002:a05:600c:1e24:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49d259502f1mr79893755e9.16.1789003986665;
        Wed, 09 Sep 2026 18:33:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:06 -0700 (PDT)
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
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 7/8] docs: kernel-parameters: Drop the omap_mux= entry
Date: Thu, 10 Sep 2026 03:32:44 +0200
Message-Id: <20260910013245.8619-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d44728a45506..48dd273eaf6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,11 +4765,6 @@ Kernel parameters
 			waiting for the ACK, so if this is set too high
 			interrupts *may* be lost!
 
-	omap_mux=	[OMAP] Override bootloader pin multiplexing.
-			Format: <mux_mode0.mode_name=value>...
-			For example, to override I2C bus2:
-			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
-
 	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
 
 			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
-- 
2.53.0
