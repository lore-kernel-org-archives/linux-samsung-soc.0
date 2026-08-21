Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306E3A4F51
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Aug 2026 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301191; cv=none; b=b4eAhCF9TWM5YrmdnLTN/I/7Nd51X2thfumR/B1RrGL8JKEzhOOAj/guk7BWJrQSBf/ESA8G3tXdcgDrWlh6YTKG/PNd6aBqOsrdFPYC/z4BTujPpPRKDgzryR2iyVPGhxw+e/snPNEu/lKk6OpoXOdpWWKDxEgA+n9TNTvaTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301191; c=relaxed/simple;
	bh=W/UJr+wBul7le596hgFokhp27LDaIo+FXFiWPzXo+7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WIBvzRS7ho4H4gRaCBi4tk9umfbc7r6Tm5mhJWHxtghPo29AJCnFYKbqBwhnbsjXoqrD9wXyPTIBK4QH2pN7kzs/aCzGe3cbTY+Obja3am+ipkLctzGp/F7By65gbinrKbzlcP9hXoPxAACau4pUsmEeWXnYokV+JFmpuN1dh2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B0IWHAFu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B0IWHAFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787301189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dO/fbXCwwsDTpCj7W4vUaIfdwS/oE05+bHk2g2QXOMc=;
	b=B0IWHAFurUSShN9l0e33PUJ4kSEN12Zk8i/kux/Z2hstMqkyN5J8vZ3VsjJ/uxwyyKkah6
	z6nW/1weVA41ODik6v6Lj+70UKfhQ2UiUR4D3wv66HpVZCYYtbUaJK2o0XEHJf+DMkECx3
	Ojv0qJ/5lbCgGcBgvTO/qPNugCxiyx4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-kAJrx1l8PjGlKUUMQMLN_Q-1; Fri,
 21 Aug 2026 04:33:00 -0400
X-MC-Unique: kAJrx1l8PjGlKUUMQMLN_Q-1
X-Mimecast-MFC-AGG-ID: kAJrx1l8PjGlKUUMQMLN_Q_1787301179
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C82818005B2;
	Fri, 21 Aug 2026 08:32:59 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.129])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8E6B43002D26;
	Fri, 21 Aug 2026 08:32:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 21 Aug 2026 10:32:51 +0200
Message-ID: <20260821083251.194341-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This has been split from an earlier bigger patch of mine into
       a separate patch to ease reviewing

 arch/arm/mach-exynos/smc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/smc.h b/arch/arm/mach-exynos/smc.h
index 5c30feb8f07d9..5c7730f6259fc 100644
--- a/arch/arm/mach-exynos/smc.h
+++ b/arch/arm/mach-exynos/smc.h
@@ -32,11 +32,11 @@
 #define SMC_REG_CLASS_SFR_W	(0x1 << 30)
 #define SMC_REG_ID_SFR_W(addr)	(SMC_REG_CLASS_SFR_W | ((addr) >> 2))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern void exynos_smc(u32 cmd, u32 arg1, u32 arg2, u32 arg3);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 /* op type for SMC_CMD_SAVE and SMC_CMD_SHUTDOWN */
 #define OP_TYPE_CORE		0x0
-- 
2.55.0

