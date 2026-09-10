Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746B8364EBF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 01:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003977; cv=none; b=JJzPz50crcmZpicqhAQZWKDdrS/Tw7c/P5umfKvQtpKggkTfUZUG9KVgpSjppKmCUjV/r3/JoaHQagNWYopbnq20wmCCwZTkMxLYHB2bJ72grix7Tds9WTm4T6vHiq2QqcghyEGiA8yRjw8dRah2KVlEZZmVmGnnimpDxJw9uIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003977; c=relaxed/simple;
	bh=Wrt5BREBuyuGcYt2aWXWslgff0dcwvsUynDfCbIh+Rc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BK685IaVkK84bOpXKT1fswZmxmYbrDsXXxqtADhLANoEycQrmBFUNHIRzWCoddb0QcWY0PYp72CUybTlp5Ujl/yV33+/8epSflVSqBC25CFXc2AaixkOvCvva++Pf06JYkYZxm/fK41zoyIeq7ECKsjsGmMW7uT9L05udTXxOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLT3dHgC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLT3dHgC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso53320405e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 18:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003972; x=1789608772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0noSNcNvP/+I+rxnaf4LKhy/qChedg87Os3I3Fnbpw=;
        b=eLT3dHgC7yMLi6m1347n09ROs3vSYpE3Z6WyNi9WBErck4EuuWeauqwJmkKbS8Jddu
         6qK0q4ehhAXZKenmNiYf3ob//zR50xGqFTgEmT8ONXJOlw/Lo2ocn3k++4zHV48AiTUj
         zs3emWmobC0Nv0/m0/k9qfYexRAOQH24/D2N3zHF70mRogXpH6FKD0b1FbZe1Ll6DjVt
         iUiQNxWlTM/gP2irbowpAQbvFc1RkJA0QvT5Z3UZkO/ZS6zNg16tBZkjiPZycW7x6HhJ
         LrLhvd2zvkAFqoHchCXt3xQxta+aUSvlvUUD9pvOdMVGc7zQ/9br7uZ9d+6fQZNIUcwh
         E4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003972; x=1789608772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0noSNcNvP/+I+rxnaf4LKhy/qChedg87Os3I3Fnbpw=;
        b=j9pYw56Px5sCDEGhkd8a8Tbp9dvHU1aBQMeUFe2jFHpKwMfmFdlWsv29zTE3mZn6eu
         StOrpo4JyV9QUxhbu0YrF8QSTczNE4+v396dX8HWUC/mnlZAHv1iGVklE3Gj4o1I6xAE
         mT/oczd3fYVRUySKEP5v8pjamKF3vdgrGp7+MGsCbJiXwEGAYc0FCH8FtCWMjV2nQaax
         W6b9v7Eb1oVkt+P3uIdWkTO/ocM/9NBjWUCf1Wx+fUwRyI2xK4ELjMcudd4NrV8uzFyS
         6RdwMBnlgC8fzCzNwp6VS2OdeAERjPO4i3ohYyoVcc8ukr7NhI6B88mFRi+qc5apbsLv
         i0Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzyZOkhOTcXCUaoJd8dvS2TVWKS5hUuxxY5EIH4f2VOQFwv6JYrO6tFE07+I2bR70lHe9dGt35h0gyUlGGqXTf2MA==@vger.kernel.org
X-Gm-Message-State: AFuF++lwIjHNC6Yfz9NaVvaYI4J0DcjWT/kZcaBlCE9OXzm2CARFScKF
	vTlVTpRJay1oDm4ZeKroHEOXF4a3f6nTlsEM5TppaDEfdLaovsO78/sD
X-Gm-Gg: AYBFou2os0G1bjUXTrRnu04ty4Pc2SVLxDnHw199o1tkhLIJm38JLk/7KuTw+qcEvZa
	rxcafl+ilN+UKU4KFbYh2a9csopSZqDr3Tqc7W0vMynLn2Pb3ceqtvUxIDtPzgyjuUomXmoT4pY
	zF14vrSVvNtd8kw/11bGYGTVNIarMRFsMHVRdqcbzxEhIIKlQfPmRfNdnUAPgk1Iy1IHGHyYUVY
	2HyXFo8GOf/Zno1icEzV03wbuOMtZFXbctwnqrEhbPaxqhF5Jtb2iOzXmVHWd2xHPYGznvaQ85I
	zpwJYtmTGLNw+uYGk9h3J0qTV1D+t0MQnMifH7YkgVSttacuMpnRwOxPo1AwE+nSA/MdJlqFbVr
	5+wWMYlpmrUN5te1/x5ODWDCGgaMUvbqt/BcPrUmmmW95Di9nOXX/TcVCOq7PIoBnZCLtRzhRVJ
	q+a4neWWxPWxfrjsg202r8pAr7bBi7UlF9wQCi+/U/MX+VRqLBzGCELLnJKqFJ/E0bvXjCKmeuH
	G39qLhDLN6DmZ+Z7neHxIhnKmfCC12yedIuatrThP2jfZbQMj/Ni05qdpwF4JYb1H0F8Xm1Y/Ns
	KwhRcI9dCPzMdqcr3XL2Ll8ExRcN5mdjwXBue0PKmuvLG/sQgqfEH6zqefd7tVD2QfWNEpimHnn
	Z5w==
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id 5b1f17b1804b1-49d0e79635amr237510065e9.26.1789003972418;
        Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:52 -0700 (PDT)
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
Subject: [PATCH v3 1/8] docs: kernel-parameters: Drop the atarimouse= entry
Date: Thu, 10 Sep 2026 03:32:38 +0200
Message-Id: <20260910013245.8619-2-kmehltretter@gmail.com>
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

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
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
