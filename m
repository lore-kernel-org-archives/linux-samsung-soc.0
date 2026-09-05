Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358C3E3178
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601630; cv=none; b=L5gkbG7EKutTyEj24RJPfCx8V87CrpyBFbTNAz7pyjaBvdnyl0pWHmXgKo2MEm6he1siFZVfZSymkt18me0k4pjHdA6gXlUMblXNkgof/8ipnQUN+iwPt8ESxMUU2ZaU0Mk2rp3Gd1qqdWSXP5n7DhtVjuzcgUX47eikDCy/2nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601630; c=relaxed/simple;
	bh=wms6AZfW1NQQQYXunQIXu+RBL1p7oQW8OzJU4DE4KcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fCGt/FpAA0iD6kD4ejXUkvXsscOBKkJ2qsbxqBOaqTcy2AGg2huiQ0UeOLUxtODhf58NnrW+rKtf5a2x6pAwcIdD63bKAcbPaX1rVsBskhujGtjKFrVP3v2UR3DNGZlPktBfpyDqAKUVBw4D/3By/EtXFUJOmgWxZj1cPb/+mwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcyV/pf4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcyV/pf4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso20983075e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601622; x=1789206422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=;
        b=ZcyV/pf43STgwXAI/5E1vUviU9OzxPvlwZ9xBkSHuk8z8faphK803rSxpq/eJC8OKl
         6LvecwFRpi4fzbknFvlRyv7soBl8C171GooHBbDQJHk+hJ6aBRBz2mQOp7vz6r6hUGmM
         CEZSPjrBqyXMffgVVdqz3gL1JyPqc+yVX0PFj/3xnvq49w/rU0FgzPBKydB6TGq2d0zp
         FNs9+jT0+bzbJl4t7pUuRj18OIsTXOpNz49VTcK/VhwWq/Z2e98q+kp2hTLk2LsI+tO3
         VMknB1r+bRs1RJ0nhe6PSE7/XgwcXoe9+9W9Z2IeStVLcGtTMByOCuV0uPw2R3pFduR9
         5QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601622; x=1789206422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=;
        b=Nutw6jvkAUjkYM6EHQsNZ8OUtxmRoW1o2CClS30TjPqNvT7ne96QQF3lSXCfuCPmOw
         sw0Hl4qNQZPoHSz73v91N+FCGYC/bfEhHXF+xvRBdgSIQcxLnYKOHmD+KKcJJ623ha2y
         eFTfNj1oOaf7YgBFWl7NmlwxoV3NKXK6g2DBZYk3KoCBNPB3MmErXlK7ru5PhygMey2+
         JNGHsCwqQKpgj9f+BbRJgZNfXSkNmJj/gSstRPgzE19D0nWTM6TXT3v+K+v5lnx0pqNH
         J1ogwepEOJah/Rr/PUvIKIDkap31eMhWWrWBnBGKzy3JQ/CbFYsdgNhXP948ohacl/6u
         7ReQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpHBClV+4r7+2idC79FmTTcSoChMEz+Qf+fpVnh4KaX9uAFhJQwtlap67udWDw23hwFmTdHTGQKds2EJgPJWaR0g==@vger.kernel.org
X-Gm-Message-State: AFuF++lYlpMbrbkU+wsZuKYEyuXgr4tyICU1AFzCH1u9b7jIFaOwZJuZ
	v8B9EeUDu4jOgLQffbcoxiiXRksdK39naOnmcW/0q8GLSuXLgOWxxUJM
X-Gm-Gg: AYBFou1OLrodDLNQIPaaq+GcXgy6OcKzGnXGB2umV/J4iwCE0x/RoV3268j60eruAdx
	to8LJO7bfMb8VkJx2sZQI5/9ErSD/ADzK+oUnxr1NtUZ2MJQBd8OCqPh2PyOdzi57VXo2brP1qZ
	NOdQO13NWltn8NcuE4/c4ZCa8m1d0xjpiyHLwqMsgXTJR+8wBr/jZylQpv0XTqiyEA/kiEMgx17
	qeg4D/Q6/tO1xTL6QwLOOLMUT41rClqvS67b73itq4FD88s9zMwYFkZoC7kzeXq+rfB8E2TCQ0z
	YCA50and09SMJEfPRjZlH/rxy9UbPetQIqrdSq98L7b+EAb/U3tJJz0AxnR7KHlZM976QONdI65
	e+VMySB212hzRUygnMLYmKXzrAIULvgiUSL+xtoMJnPNqmKBBCnUkRU1GWGOGegh174fI/DTpBz
	XMH45rVzOXwWtauE8ylH4dqhIElVqfA5zAkzL2D2/buQrLtNOfRax6kq74P4nIrm898m1//wzvw
	V+BGPReJeInBjwYhfwjmy0gQfNNBRjv7dK4HE589HmCTO6m1VkyQNj0v58temzAKmLuRpAYlUsi
	P04YE0dCXe/oCmzKRNMeJzSot68yvBMKMSpzySTYYNOVBtAC9Zm+1mCcAne1sX+Qrn0=
X-Received: by 2002:a05:600c:138a:b0:49c:fc6e:8cba with SMTP id 5b1f17b1804b1-49cfc6e8e34mr84919655e9.30.1788601621962;
        Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
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
Subject: [PATCH v2 1/9] docs: kernel-parameters: Drop the atarimouse= entry
Date: Sat,  5 Sep 2026 11:46:41 +0200
Message-Id: <20260905094649.41996-2-kmehltretter@gmail.com>
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

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0

