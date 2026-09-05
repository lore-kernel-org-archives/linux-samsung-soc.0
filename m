Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D453DB658
	for <linux-samsung-soc@vger.kernel.org>; Sat,  5 Sep 2026 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591848; cv=none; b=Jdqd6v2B0zF4cr8pQrNiPy0oKzwEzN/7miuTFTUt277SGjQ9TVyDon3wJt5dD1lIRmchq/oLalGIwRwB9Ns/pBQhf2BA4zMSLqIN39ifFZtKzFSxjBr7MTvFqZ7mGAkjR2vMlRukcxn7dXlqflfctZCpXXBW/xq+AWhRJww+kPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591848; c=relaxed/simple;
	bh=zqIZgn7Zgj5WSQepFgJtQ9GMMyKpvR8InLxOiqTa/8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EmLOL0ShHpFXHwqUoti4jI3lRKRJyJ9ZmEkRHlYrJylJhbmT21pCCP+ctgU5AoZYmvWTa14HkMRMyBSazBTqcR93BB7fGr5d+aPg6/f/lZ9y2/cF4Lomx3wX70pXowS82RTqInKb2k3edIzWUgXQdko1iuf70ZSrSfZHYgrvwzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsSYwLwK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsSYwLwK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2672340a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Sep 2026 00:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591841; x=1789196641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=XsSYwLwKu7HA+M9qQDLAv4qyhXqLO3Y3B2nrMauWYL5U/x9gMoPFVblanGk8nChIvd
         le6ND8o0ZGm4oLALDhgc8N7ll0NDm2ZuPPkg3BJ06DJiogDlzQZ7zgsVhbbx8LbTWTMz
         mJUu/Jy2EurM5VuMdsk3Uh3EF78ZdYkgcASPo4/iFhmVEz3GAbWH7dHmqsvIEDnJUq5t
         lb/gNVUNWETamXJAzcASXkot7DuMJvhXDEsA1GTzHxHbB2VyBuB5mB8CDW0siMQqovX/
         k/fP1XF6rKWc+9P18y9oJQoOw4mcO+2An2bQ56vnNdwBBSq7VrcBgCOkAHtz/ZsR5Mq9
         3s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591841; x=1789196641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=PeYeWJgS9EB6HzcUWQYRVaPmBXMSkCTvFeEcOYHMC07Z3/ATpg1uEqegqNmYWcwD/f
         vEoZePl5eDZU9+mJfzZ+P5hN6OHKdXo9+8UEb5F/51dq3kpY9nr6Mr5FWDTkdAGgeLZG
         5E7MPKyauVnV8K8Ha74eGHn2Gh5jgNi8M9cPZ94Jd0Ta18tywyWd4JzXsCEL29vSttl5
         esjB/d58CZT2bNz7QuqKrh8otrqkdzsoQ/JtVJzpSCt4I4NPYvENcffTBzjNYfQznq0H
         Q2w6nJVfZtEJMq6rJ8b0iIO6lOSDsPgfkQvAJT9Ujfu2H7fE6MVO2+JiB3slyxw5gjIF
         3ATg==
X-Forwarded-Encrypted: i=1; AKwUvBy3bB9sqFTKDw9HLrb++ixVcbqa2wkL+LCsU9qf8o0n1wAfB6dIlZan7mOyPpIML3zlp8BHRSIQ0E8OnBGhWhDioA==@vger.kernel.org
X-Gm-Message-State: AFuF++mOofGtIC+eDmRvMmAf+DytpQNYQ8gMUp3W7cLapBUckr4VXn/0
	vct+DKKV+kskfjIJCVyoGWfeZPilCSwcGG0YOVxFMBJIdKrmnfdSzppr
X-Gm-Gg: AYBFou2kL0IH1yBTntXNRVHv+zk3B/9QTADRKL75le2ptAZ+8vxHfn48OTRxyy79Rqu
	hLHczdJN2fvQxbAYCz4fMGTGO1z1oQoW20sd7ShwTzXpf4SitGEallQ7jF66khURtBxy2QNO9De
	CQsWtEqh1o8ni5BKlbWZ2iBeAJ4FO5RWQOHI56DMdDvhm5IPsnCyqWhKI+OStCzYtJ81kFKWpRz
	ITyQnWuomdma1hFAzWIP300VDLfNW2yHYWLy2kvQluLHT0wZX/Dshfqv5t9+ka81MmH/pPzPOlR
	Kc7hJp1YFTuyV9iwyUhMAFO3+23VDeLKQTU8tG4I4iS1Dzmt0oBoUODJ0MVVtHyrbxNl7u7N+y1
	/dX67ME7/hBeLGUGCA8H9c2u4l9KMSDBfzEXl6L2oVqke+7OVpLVJLLZUOloKcvAEOPZzekBMqd
	eIyXyYsds1aSk5b5XjTFHEJCgd2z7a+hCE5ZJrez9KNxxYJhwDjvzFP+r/5OqEs6GAG6yhWdJL7
	RHGcjfiIaiLWiLzWzRlHMvVIKJ/IBJnKPwQBfUVRxAPVib0hA673gizjftGOz5fmacCEBCEKxRX
	MaBlFT1161PT/eZIv+x2v67D3AkWTz8kLlwlGS5Wz9PZ4i1t1DZbyIQGTBJHqB89+8ONU2TF
X-Received: by 2002:a17:907:1c9f:b0:c26:1691:b374 with SMTP id a640c23a62f3a-c261691ba04mr359894966b.45.1788591840842;
        Sat, 05 Sep 2026 00:04:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:59 -0700 (PDT)
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
Subject: [PATCH 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 09:03:41 +0200
Message-Id: <20260905070347.25902-4-kmehltretter@gmail.com>
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

