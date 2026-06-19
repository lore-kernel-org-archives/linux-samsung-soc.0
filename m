Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0B38F64E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jun 2026 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873929; cv=none; b=WNNHeTiu8jtH94XGWiRVNShKnVU50TKN/s2sOomSV9N/S/Y1dYLnUGBTenl+fSH3Ut+fIP2IawTMjWkwFWaJqY5qyrvpizB3XUXLXhr/ksIXdbkA4y7+ccwX2iHoJyqy9IPYU+bEVDlvltT1nb4eEwcyFSKbrEtKjWbkGjmPl64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873929; c=relaxed/simple;
	bh=wPqClq9pXqqGBZY4rPy3VqIImoui1DDY7yS3GmaYl8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9SvfGmaFYMu4rrIKyMvpWGGCCXrQq1iw3YNMW/1hzhyJOuE+VqVSCniO7kYz/GK70RVIXCRCPI7J22wOAXR3HJZSDt9IdKlErbDqnJBYbPNimCVCU4sPF7YHdydYKelrIQ93Qq8dykZ2tT8E88tVvNWyEp1z3rBXaW5JutKi90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FAWGML1l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FAWGML1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781873920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FDh4HHbjHZ2n8XaRDG5EEV15xMZvHpl5z1eZvSUxfbw=;
	b=FAWGML1lzkcb6nRmo3aIwBphPQdHPz8DkH0Y6qlKze+lTWJCIu2gAvZgwGo860tgISJBGF
	3LomWORMm7kghAPDKuaggJwqFuOd3cziHLEzimmKf4suUURBf4FroEumnDUJhaQPKcWZh3
	fPOMgTWK8/5qh0ylyBPka1AeaE3/Cb4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-uZUIwzWTMDqEiQWQ4I7aBg-1; Fri,
 19 Jun 2026 08:58:34 -0400
X-MC-Unique: uZUIwzWTMDqEiQWQ4I7aBg-1
X-Mimecast-MFC-AGG-ID: uZUIwzWTMDqEiQWQ4I7aBg_1781873913
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A26D195DBA4;
	Fri, 19 Jun 2026 12:58:32 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DBFED18005B6;
	Fri, 19 Jun 2026 12:58:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Fri, 19 Jun 2026 14:58:27 +0200
Message-ID: <20260619125827.215977-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch has been split from an earlier patch of mine
 to ease reviewing.

 arch/arm/mach-s3c/map-base.h | 2 +-
 include/linux/serial_s3c.h   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c/map-base.h b/arch/arm/mach-s3c/map-base.h
index 463a995b399bc..beb58e6f12e16 100644
--- a/arch/arm/mach-s3c/map-base.h
+++ b/arch/arm/mach-s3c/map-base.h
@@ -20,7 +20,7 @@
 
 #define S3C_ADDR_BASE	0xF6000000
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #define S3C_ADDR(x)	((void __iomem __force *)S3C_ADDR_BASE + (x))
 #else
 #define S3C_ADDR(x)	(S3C_ADDR_BASE + (x))
diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index 102aa33d956c4..f54cb6e23f85e 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -269,7 +269,7 @@
 #define APPLE_S5L_UTRSTAT_RXTO		BIT(9)
 #define APPLE_S5L_UTRSTAT_ALL_FLAGS	GENMASK(9, 3)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/serial_core.h>
 
@@ -294,7 +294,7 @@ struct s3c2410_uartcfg {
 	unsigned long	   ufcon;	 /* value of ufcon for port */
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_ARM_REGS_SERIAL_H */
 
-- 
2.54.0

