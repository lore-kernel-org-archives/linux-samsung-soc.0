Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136F048B368
	for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Sep 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524636; cv=none; b=lbQyTzBJ26cbNMSpTUTZb5SDyjr0ONH5WVTQXRl9Qg9bJSpKA0CqZgkskY5NBSoTtOJk7U7+X4iHWt+rrBhzpXeC9f10KJuDqtXDcLYgwPEsHl0Ny3Ak6pLGH8KQh8ckTESOvHArsKV0w0SthGpSB6lU/oltLU9CyYCYOQH+Vi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524636; c=relaxed/simple;
	bh=UYk+eG9tawnyS2l3xIJppBTd3bJFUYBsc/HBPa38tPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/xZZ/heQXVUhChFHbCd1fRDsWXp9q37tS4bm2r8mSezOspKqOC4pNuuC99Q20z8DuHqVuwdReRnG8YR5Zc1g05wTfuCdFq4dIjsTd57PtzpgRXTi46mxmbBBz/m2nwOQAGR1Cob0j8BRGRUwi1fZnIm42+MHu8wv1U7HoESnpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEQfIARB; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEQfIARB"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-451a49abd8aso782305fac.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Sep 2026 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524633; x=1789129433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC9+Z8O8/eDUGiGPsOZTghyv70tTHYewS6bn0ofwswE=;
        b=DEQfIARB3pQFGq13VhVWdpnY+KAMwFg1wxrAL7hEoit/0jCWHg1+TtIyg78+3qp+As
         X+0ZFiNJiqxCjjbESjRydnUAtvL/DWcCC4HkTtXmwSFxSeOySeSwd6KY+L7QqC+6G98Y
         fm7J0qqJxcZfKvBn2jVbLigUQ8Pe/QkByYFqLCn2ei+Gr4MXCCN9y7HAilULkyMfkkaQ
         YdwDAMSh7nPttF6E72zQH0+UJk9BWcb6oNaQwkmdopRzje5JO/PHkDwxoj65gnPVxKlw
         ds2O0EhpsvaHdgo1nk4XjHu+ZtZnDidgl+VskElmX0lkoztKCYplmj2/x6izufOTTKD2
         6/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524633; x=1789129433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC9+Z8O8/eDUGiGPsOZTghyv70tTHYewS6bn0ofwswE=;
        b=Fum0RHs05UDT6GB0VmtJvSYAUfraQcSnbMzMbM3DNNY8J1vuRZmhFwl59U+rVwVDHK
         Gh7ikOeA5gBupglG1xW315bU/PC61AeTOgAfaVpycw5TpFBEzDBRuP59Kt00ZThrWUuy
         D/BChj5yBkEcgppdJN1w+GXW0SJVKR1nQtwyF4+xUEfbuGO3t3F4sKxjLJojj3yN9IU4
         uHEWo+36vLli+H8isWwzpZULBnL/YtcGpuGkW1IiRBCHayJB7aottXyLiDhvDDL34JHi
         +iCIdsNFkIYxUZaMehCfZp/wXvyj7sYvD5TtfJFZAWvrFdndvq1rx3sKjgiutTq521Nb
         Towg==
X-Forwarded-Encrypted: i=1; AKwUvByrMAZkosLaH9wYPXCZheh8KRWi10fc+WdCh4ZiB8cukBS1TBofbyMBmxzHJldQBc2HGPAU1aBuLvpi4yWq0YOoyA==@vger.kernel.org
X-Gm-Message-State: AFuF++l+YPz2Wv/DFEuh7XN20XD8tfoHRWlkoa2AyKlKVYO7X1rT43OQ
	7F1TAdQ4jX8d+6d1n7PRwyWkvK+P+W/+u+BHc8OiSHA0knHXTfjzIvjO
X-Gm-Gg: AYBFou108oWvMGZjbJG3dkXvsBPq7UG3Umt1J6yeZtpILg+lb8cvhr8GidDsAOH+BJY
	ACeUyilv4Erq+FAiAGorTfkl/aStYHFwTTzkHU5omf/NxndeeJ9jguAniQ0mvAko73ureEOst5F
	t7nWz7LAcvom3ORKx/pVIhKMxBSFlejCuVyIEMPYb0MC99Lq/yHjknJdL8SDD9fBLAcKdG2+ShY
	5/W17JlUmzC/FR6I8zAayBWz25w4YNYZ/B74798YHXEtTK9feJIKgdpFa8QvciIoI8YMaOGTxG8
	qGrcEtAFtljh4N3xsamxiz62rwrmKJhcW3tIHPx0VT+5Pjw1zZwVahZlCsw+XCMxa4lwH2kD2EX
	LXAHZVASQjGBYnWAZPu+bZW/wWMHu8a58QdOuaGJIuHKDEarDH8mm/UPPJV8oABTpRovtDaaaQ1
	Spo9rgjNlE9kpATgC7C/VZgttCnFH398OPd+T3qojXYxEQxmAGjDUDsxsWsCr0yp/k/FeDIvDJm
	sR6G7QrC23SbBQ=
X-Received: by 2002:a05:6820:f023:b0:6b3:8240:b2e9 with SMTP id 006d021491bc7-6b6fbcd088amr4336612eaf.21.1788524633505;
        Fri, 04 Sep 2026 05:23:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm6209359c88.0.2026.09.04.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:23:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] ARM: mach-s3c: fix typo "capabilites" in comment
Date: Fri,  4 Sep 2026 17:53:40 +0530
Message-ID: <20260904122342.30456-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122342.30456-1-hemanth.selam@gmail.com>
References: <20260904122342.30456-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "capabilites" to "capabilities", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/mach-s3c/gpio-cfg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-cfg.h b/arch/arm/mach-s3c/gpio-cfg.h
index 2dfb0561001e..778103412cd1 100644
--- a/arch/arm/mach-s3c/gpio-cfg.h
+++ b/arch/arm/mach-s3c/gpio-cfg.h
@@ -36,7 +36,7 @@ struct samsung_gpio_chip;
  * @get_config: Read the current configuration for the GPIO
  *
  * Each chip can have more than one type of GPIO bank available and some
- * have different capabilites even when they have the same control register
+ * have different capabilities even when they have the same control register
  * layouts. Provide an point to vector control routine and provide any
  * per-bank configuration information that other systems such as the
  * external interrupt code will need.
-- 
2.48.1

