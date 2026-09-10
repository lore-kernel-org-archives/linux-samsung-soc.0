Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E9C35E1BC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 01:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003991; cv=none; b=PkUuLa0VGPBQ8Apw5RX2GJ8E6p3ag3aiDvDW0l6fMIV4aG305GjrTXKh2zhyWpQkJtKqNU81xq9WJP0896cV4c6zDzkc1971YKunXr+9aodFukubt7yWvXTFxwItzmJfoqfRVGVs71c5+YPJMyX9fqhzoq1KeSN3xGW1jbX9qks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003991; c=relaxed/simple;
	bh=qYH6DW3OX6UAw4/JqAXW8T1nZ5UkGcJ820hwItfbiXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ALjiZ9c/5pwBSBuY0IqfP560g/lCO6fR0rgvO0pp6JYlKzuwMSgapj45k1RKUvKSIIOYGQR3lUplh3hmBPVdpbvXm+CeaTQc1phBrL0LvOUa6aLRVg7CW2Mhj/XV1yzU7VfstUsb9d+Hz2M0kbWZfB7v1v0wKN/rTvH8DrTD70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHGsoflG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHGsoflG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso64158815e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003985; x=1789608785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=;
        b=VHGsoflGoH1EMEKYJ8WhYHFs2hx5YMvsRMtvZFqrxZi4gkkOTIlcRiLxqiKZ89PTpi
         pPJg2JioLNUf8/KeChzI/4Jg6CPTtZddUBlXpkgLJF/VEjiFoMJ36ZNrDBRdJLNljXa2
         KkBgTiMG2f5CkluzgDlEM0njkRz0k4vG/QnS9a6Na8V10UEYtJi2WacXbzkveN3eZC4I
         M2WXHAaWSJD5oLXngZ0Flv6g91kXWJdwiZdX4ygCGSwfEnQeTE0em0Z5N6IAAOG1U2xx
         LWCnckAWNuInTAQJ1HB4kmcbcn9x0P2m8QYpTl88z9zf+tpd3Ur/ngcSu6QeFKvibUJF
         +Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003985; x=1789608785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=;
        b=lQfMiJujPxTpRcwWLjzg73P/Z8Dk+AkKhnPU4Di3etP8kP0mIhu7/PmBjD4eGPEY+s
         CzFUTXpYCe7R3m/MwdOzyAnw11+mf/bm86icjHJl1TYdJlqCXwFabjpdL+26pSgLe1//
         zijFksp2UA1JHTe7LuCD2VS5/ZqZY9bhPpRBsmEF9dQYB1fp77EmdnRma1n7kZYvDPh7
         z0c4qFxhRzYYdDdgs8+Vjt2xhTgM8YatXbpxRYojCBoEoCVN+n0wSW8VcHyrvcS1vKVD
         7L2erpe3NqL+n/+drxdapCFyT4P+BXzTykgfMCJj81kZ8cBIb1Tes8R70g5Q940eNKcn
         iT7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxG70dj7boyz2k/EV5wEtCUMemP7zcBq3yNJtWhY82rytqtyT7XAekd0gqnAROUwvw124vm+UvfZPUiDkmylGy3yA==@vger.kernel.org
X-Gm-Message-State: AFuF++mMFuMtTH30akynOccYVGZPmYDo/YdtmKzSqwpDcG1Vvuy6Z6w4
	76uEINvKqQBBT1zALSh3ShIFR0RbvC9eaCZIDIoOnLSRMFPxCLq9tG+3
X-Gm-Gg: AYBFou0L64wVZe+e+oAuszfFcGf3wOiM666oIFYld36pqItBiAipC4Paqr0f7RNf8Jd
	KuGqdvvO1a239G3Or00qpD9+YOG8Lw981GiChTCD5iBvv68LRr/wSC/9K/OMy6lrC4kDweEXd+k
	x3mSw+k9RH1N+RWbTdIJyegyFLOQcYA7Z+0lAeOZJKMHmP1mXNdWzcTF5Ay17aCXdui5ZhsanbS
	BB30qITtiOyaV9zx8+qKPvgqyBTMyYgS00rzbtd41J1XIBRHXHup4vpWPJosnytWGrRQE/u2op0
	YUfs2chC9Jq91Lig4IpHmvgmDhYsRqIqQ9Oxj3Bq0mjhfzg6eMg08z0hZNEDNDAqkTUXZ4WkkRI
	cSVxUeUC4Xr74vSMITrv5YDZyYDJTuZmqg3wy/9NHfe2tfYFO+fvA+bMxnhIjI8fxteeqHnA9fh
	fuBxFFq6qnIMDw00Yh/0IfT65OieXegZwUCmUwiV32obu4EpFdBCrTFmrNHsrVsgoIS0+gvGRpG
	o4PpeEHHsrOIvl14EByZsbBhjJdr+xEjQmJBlB57IwU/PnLI8PUqcmXx1UQ/cgvEag7g75LyKxE
	dYwmlbow92uCbTWUCAK8fkyVX1TsMlWYBZUvjrde28gNcTMUBI1ms5GdbC2zj6z4y1WOsdMuUM/
	Y4Q==
X-Received: by 2002:a05:600c:628b:b0:49d:2856:fcf6 with SMTP id 5b1f17b1804b1-49d2856fe91mr11506445e9.15.1789003985034;
        Wed, 09 Sep 2026 18:33:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:03 -0700 (PDT)
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
Subject: [PATCH v3 6/8] docs: kernel-parameters: Drop the nomfgpt entry
Date: Thu, 10 Sep 2026 03:32:43 +0200
Message-Id: <20260910013245.8619-7-kmehltretter@gmail.com>
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

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
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
