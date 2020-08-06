Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A942DC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E552C22CAF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738958;
	bh=FhhYFVLgJraMVZW0kc7OuXR1kGXOMlH78bXD3yAep0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gR3l8L8x++lJbCdShNWufruilESVvVGB0ZR3VNT3LUGCbENWIJWLeQb9anh6rsZVX
	 qI34vcQYh/DyDylQB4IvjmAasZebaCQe5TTszhtqDYdIc+Wax//icHVdLyn00+NONR
	 fcVqdIj5B2kt9gf0nENh88tpbN6AbUHTk4/0RC7Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgHFSfz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgHFSex (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:53 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BC6C0617B1
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:48 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 184so10630808wmb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=sFS/aiLRv/bhQNkvBpURrlM8wpJw9I+uHLlJRaJ6dh0=;
        b=hK0y6mdISsi8RsPMWBBzIErkExxxxBlAr+hZ74WudlDuiacXlh48DuJ+g/OScAlOvZ
         99PysWFzMhHwUg35GALpWZ432CLsTwFsQQ4Fj6ppctboL9sSk8vmouVQhRHG7wibW7a3
         nPtuuGGWqpmntZx4TUqtxPQPyCrBrx8u3lpADdOTDtuB9owzcQoso6+Mu0ZPqw2P3szG
         zjodTBMC2iRvfbq55e3qLerYEXTMY90LSaYjK9FzG9HHxf2QuuRjZUu2QVSuk1pY+k+9
         jpcuhVtoXcD0LKmuZtpNp6TYWect+pvh1ovoZtD/ITJrZYoHNR/w3ZQidJ8/xzrbd8Nh
         itxg==
X-Gm-Message-State: AOAM533LFYbiF+44JEM2LvLL0tlhcZCUuNiKb5FgFxde1UA9eDUz5KEd
        /f9kgwljF6iQBJ/lbCFbKbiZzf/rmzw=
X-Google-Smtp-Source: ABdhPJxQp49Ig8sQyR4kVfHWCAoB/3Ely9drm+P6ehd1ZkB16ELhqtTwIwG6Kl9+xu+I8DoyoQf5MQ==
X-Received: by 2002:a1c:c913:: with SMTP id f19mr8796834wmb.173.1596738886607;
        Thu, 06 Aug 2020 11:34:46 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id k126sm7870297wme.17.2020.08.06.11.34.46
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:46 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1540784lta;
        Thu, 6 Aug 2020 11:22:09 -0700 (PDT)
X-Received: by 2002:a17:90a:2309:: with SMTP id f9mr9337793pje.235.1596738129244;
        Thu, 06 Aug 2020 11:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738129; cv=none;
        d=google.com; s=arc-20160816;
        b=ioSaGAwuS05fBvHFjVq18qbYfUZAjNhkBwaI26vO1Sc9AJcUbgOF8rcauIzpcsWLHb
         +Yk5ReFNGgCsund4GYl7qeph9DGgb/WNWC4rs3cndef5tEuejQsrXu/MoFwFQHlRaXXf
         SxC2yHSKo+xScmAjFqu9AzhrRfCvaZTLyu/x6nE72tno76ass210XBC+Yxq5GwGULZKv
         7m07Skha2c6OblVDmOaedbqVWMcEavxjDd997w+BolEAxcUJHAxspB5up4Vt4oYZpss1
         6dJQf5GHhJ78qZh4fqBmS7MXtqrJWgTzd8sDfGRDcnhMtP2/IrzgSpHyIDV2nY51xgZh
         3GDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=sFS/aiLRv/bhQNkvBpURrlM8wpJw9I+uHLlJRaJ6dh0=;
        b=iVL3WXHSMPpzUxVTterlqgeXuzd/AT6/2kkeDawfkwUPtEuBzft4OuqdNA7nO/0194
         JRZYHme8pYPUfPym8OMBYiRA4JbMyQGKlsnLMrS35cSLy7TTUW/REB5aOtQ03jNBsel8
         O0TMuNM6iwipCjxbGEG5RXRV3Ma4r/06QVr/coz+69nydirf2rZeYbThbACcmxaRcefV
         WNOagpuYfkQVAbC02IMag/Vhg6GDxJpkZc47+pvJ8a/ZubHneARCsIUtHQa+Aorq/4hH
         QxC8XQtYrn5yIM3t0/w+tNXBIT1rxzo99+29m7GiSP+5JIMRESbkv99ptPMCOIC5s2xp
         sh3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=mi5Qr2ze;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id nm8si3923202pjb.127.2020.08.06.11.22.08
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 3E41F22D04; Thu,  6 Aug 2020 18:22:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A940F22D03;
        Thu,  6 Aug 2020 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738129;
        bh=FhhYFVLgJraMVZW0kc7OuXR1kGXOMlH78bXD3yAep0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mi5Qr2ze5eH90CPPUVDJV4zfkus51+4VVYxmnUSPF5gMES/SSZqJNQnw+9yFRXCWw
         DxA6Lp0OY6BCABBbFuU7pLGU7NBUIzruCm5WA5mgnPR8+SnBmSHuPnsZbIj3diDivo
         +FZEF8SMJLqsZ8eY5aNGkNOQ0sjIxnI0YPCfCdZs=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/41] ARM: s3c24xx: simplify mach/io.h
Date:   Thu,  6 Aug 2020 20:20:24 +0200
Message-Id: <20200806182059.2431-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: QZEDq402v1U9
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

s3c24xx has a custom implementation of the inb/outb family of I/O
accessors, implementing both general register access and ISA I/O port
through a multiplexer.

As far as I can tell, the first case has never been needed, and certainly
is not used now, as drivers only use inb/outb to actually driver ISA or
PCI port I/O.

Similarly, the special ISA support is limited to a single machine, the
Simtec Electronics BAST (EB2410ITX) with its PC/104 expansion connector,
all other machines could simply use the generic implementation from
asm/io.h that expects a single memory-mapped address range for byte,
word and dword access. As no other machines besides BAST actually selects
CONFIG_ISA, this is likely not even necessary.

As a cleanup, remove support for the non-ISA access from the helpers,
and make the ISA access use the virtual address window that we use
elsewhere for PCI I/O ports. In configurations without the BAST machine,
this now falls back on the generic implementation from asm/io.h, but
the mach/io.h header is still relied on to include a number of other
header files implicitly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/include/mach/io.h      | 209 +++----------------
 arch/arm/plat-samsung/include/plat/map-s3c.h |  10 +-
 2 files changed, 26 insertions(+), 193 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/io.h b/arch/arm/mach-s3c24xx/include/mach/io.h
index f960e6d10114..3e8bff26cdd5 100644
--- a/arch/arm/mach-s3c24xx/include/mach/io.h
+++ b/arch/arm/mach-s3c24xx/include/mach/io.h
@@ -12,201 +12,40 @@
 
 #include <mach/hardware.h>
 
-#define IO_SPACE_LIMIT 0xffffffff
 
 /*
- * We use two different types of addressing - PC style addresses, and ARM
- * addresses.  PC style accesses the PC hardware with the normal PC IO
- * addresses, eg 0x3f8 for serial#1.  ARM addresses are above A28
- * and are translated to the start of IO.  Note that all addresses are
- * not shifted left!
+ * ISA style IO, for each machine to sort out mappings for,
+ * if it implements it. We reserve two 16M regions for ISA,
+ * so the PC/104 can use separate addresses for 8-bit and
+ * 16-bit port I/O.
  */
+#define PCIO_BASE		S3C_ADDR(0x02000000)
+#define IO_SPACE_LIMIT		0x00ffffff
+#define S3C24XX_VA_ISA_WORD	(PCIO_BASE)
+#define S3C24XX_VA_ISA_BYTE	(PCIO_BASE + 0x01000000)
 
-#define __PORT_PCIO(x)	((x) < (1<<28))
+#ifdef CONFIG_ISA
 
-#define PCIO_BASE	 (S3C24XX_VA_ISA_WORD)
-#define PCIO_BASE_b	 (S3C24XX_VA_ISA_BYTE)
-#define PCIO_BASE_w	 (S3C24XX_VA_ISA_WORD)
-#define PCIO_BASE_l	 (S3C24XX_VA_ISA_WORD)
-/*
- * Dynamic IO functions - let the compiler
- * optimize the expressions
- */
-
-#define DECLARE_DYN_OUT(sz,fnsuffix,instr) \
-static inline void __out##fnsuffix (unsigned int val, unsigned int port) \
-{ \
-	unsigned long temp;				      \
-	__asm__ __volatile__(				      \
-	"cmp	%2, #(1<<28)\n\t"			      \
-	"mov	%0, %2\n\t"				      \
-	"addcc	%0, %0, %3\n\t"				      \
-	"str" instr " %1, [%0, #0 ]	@ out" #fnsuffix      \
-	: "=&r" (temp)					      \
-	: "r" (val), "r" (port), "Ir" (PCIO_BASE_##fnsuffix)  \
-	: "cc");					      \
-}
-
-
-#define DECLARE_DYN_IN(sz,fnsuffix,instr)				\
-static inline unsigned sz __in##fnsuffix (unsigned int port)		\
-{									\
-	unsigned long temp, value;					\
-	__asm__ __volatile__(						\
-	"cmp	%2, #(1<<28)\n\t"					\
-	"mov	%0, %2\n\t"						\
-	"addcc	%0, %0, %3\n\t"						\
-	"ldr" instr "	%1, [%0, #0 ]	@ in" #fnsuffix		\
-	: "=&r" (temp), "=r" (value)					\
-	: "r" (port), "Ir" (PCIO_BASE_##fnsuffix)	\
-	: "cc");							\
-	return (unsigned sz)value;					\
-}
+#define inb(p)		readb(S3C24XX_VA_ISA_BYTE + (p))
+#define inw(p)		readw(S3C24XX_VA_ISA_WORD + (p))
+#define inl(p)		readl(S3C24XX_VA_ISA_WORD + (p))
 
-static inline void __iomem *__ioaddr (unsigned long port)
-{
-	return __PORT_PCIO(port) ? (PCIO_BASE + port) : (void __iomem *)port;
-}
+#define outb(v,p)	writeb((v), S3C24XX_VA_ISA_BYTE + (p))
+#define outw(v,p)	writew((v), S3C24XX_VA_ISA_WORD + (p))
+#define outl(v,p)	writel((v), S3C24XX_VA_ISA_WORD + (p))
 
-#define DECLARE_IO(sz,fnsuffix,instr)	\
-	DECLARE_DYN_IN(sz,fnsuffix,instr) \
-	DECLARE_DYN_OUT(sz,fnsuffix,instr)
+#define insb(p,d,l)	readsb(S3C24XX_VA_ISA_BYTE + (p),d,l)
+#define insw(p,d,l)	readsw(S3C24XX_VA_ISA_WORD + (p),d,l)
+#define insl(p,d,l)	readsl(S3C24XX_VA_ISA_WORD + (p),d,l)
 
-DECLARE_IO(char,b,"b")
-DECLARE_IO(short,w,"h")
-DECLARE_IO(int,l,"")
+#define outsb(p,d,l)	writesb(S3C24XX_VA_ISA_BYTE + (p),d,l)
+#define outsw(p,d,l)	writesw(S3C24XX_VA_ISA_WORD + (p),d,l)
+#define outsl(p,d,l)	writesl(S3C24XX_VA_ISA_WORD + (p),d,l)
 
-#undef DECLARE_IO
-#undef DECLARE_DYN_IN
-
-/*
- * Constant address IO functions
- *
- * These have to be macros for the 'J' constraint to work -
- * +/-4096 immediate operand.
- */
-#define __outbc(value,port)						\
-({									\
-	if (__PORT_PCIO((port)))					\
-		__asm__ __volatile__(					\
-		"strb	%0, [%1, %2]	@ outbc"			\
-		: : "r" (value), "r" (PCIO_BASE), "Jr" ((port)));	\
-	else								\
-		__asm__ __volatile__(					\
-		"strb	%0, [%1, #0]	@ outbc"			\
-		: : "r" (value), "r" ((port)));				\
-})
+#else
 
-#define __inbc(port)							\
-({									\
-	unsigned char result;						\
-	if (__PORT_PCIO((port)))					\
-		__asm__ __volatile__(					\
-		"ldrb	%0, [%1, %2]	@ inbc"				\
-		: "=r" (result) : "r" (PCIO_BASE), "Jr" ((port)));	\
-	else								\
-		__asm__ __volatile__(					\
-		"ldrb	%0, [%1, #0]	@ inbc"				\
-		: "=r" (result) : "r" ((port)));			\
-	result;								\
-})
+#define __io(x) (PCIO_BASE + (x))
 
-#define __outwc(value,port)						\
-({									\
-	unsigned long v = value;					\
-	if (__PORT_PCIO((port))) {					\
-		if ((port) < 256 && (port) > -256)			\
-			__asm__ __volatile__(				\
-			"strh	%0, [%1, %2]	@ outwc"		\
-			: : "r" (v), "r" (PCIO_BASE), "Jr" ((port)));	\
-		else if ((port) > 0)					\
-			__asm__ __volatile__(				\
-			"strh	%0, [%1, %2]	@ outwc"		\
-			: : "r" (v),					\
-			    "r" (PCIO_BASE + ((port) & ~0xff)),		\
-			     "Jr" (((port) & 0xff)));			\
-		else							\
-			__asm__ __volatile__(				\
-			"strh	%0, [%1, #0]	@ outwc"		\
-			: : "r" (v),					\
-			    "r" (PCIO_BASE + (port)));			\
-	} else								\
-		__asm__ __volatile__(					\
-		"strh	%0, [%1, #0]	@ outwc"			\
-		: : "r" (v), "r" ((port)));				\
-})
-
-#define __inwc(port)							\
-({									\
-	unsigned short result;						\
-	if (__PORT_PCIO((port))) {					\
-		if ((port) < 256 && (port) > -256 )			\
-			__asm__ __volatile__(				\
-			"ldrh	%0, [%1, %2]	@ inwc"			\
-			: "=r" (result)					\
-			: "r" (PCIO_BASE),				\
-			  "Jr" ((port)));				\
-		else if ((port) > 0)					\
-			__asm__ __volatile__(				\
-			"ldrh	%0, [%1, %2]	@ inwc"			\
-			: "=r" (result)					\
-			: "r" (PCIO_BASE + ((port) & ~0xff)),		\
-			  "Jr" (((port) & 0xff)));			\
-		else							\
-			__asm__ __volatile__(				\
-			"ldrh	%0, [%1, #0]	@ inwc"			\
-			: "=r" (result)					\
-			: "r" (PCIO_BASE + ((port))));			\
-	} else								\
-		__asm__ __volatile__(					\
-		"ldrh	%0, [%1, #0]	@ inwc"				\
-		: "=r" (result) : "r" ((port)));			\
-	result;								\
-})
-
-#define __outlc(value,port)						\
-({									\
-	unsigned long v = value;					\
-	if (__PORT_PCIO((port)))					\
-		__asm__ __volatile__(					\
-		"str	%0, [%1, %2]	@ outlc"			\
-		: : "r" (v), "r" (PCIO_BASE), "Jr" ((port)));	\
-	else								\
-		__asm__ __volatile__(					\
-		"str	%0, [%1, #0]	@ outlc"			\
-		: : "r" (v), "r" ((port)));		\
-})
-
-#define __inlc(port)							\
-({									\
-	unsigned long result;						\
-	if (__PORT_PCIO((port)))					\
-		__asm__ __volatile__(					\
-		"ldr	%0, [%1, %2]	@ inlc"				\
-		: "=r" (result) : "r" (PCIO_BASE), "Jr" ((port)));	\
-	else								\
-		__asm__ __volatile__(					\
-		"ldr	%0, [%1, #0]	@ inlc"				\
-		: "=r" (result) : "r" ((port)));		\
-	result;								\
-})
-
-#define __ioaddrc(port)	((__PORT_PCIO(port) ? PCIO_BASE + (port) : (void __iomem *)0 + (port)))
-
-#define inb(p)		(__builtin_constant_p((p)) ? __inbc(p)	   : __inb(p))
-#define inw(p)		(__builtin_constant_p((p)) ? __inwc(p)	   : __inw(p))
-#define inl(p)		(__builtin_constant_p((p)) ? __inlc(p)	   : __inl(p))
-#define outb(v,p)	(__builtin_constant_p((p)) ? __outbc(v,p) : __outb(v,p))
-#define outw(v,p)	(__builtin_constant_p((p)) ? __outwc(v,p) : __outw(v,p))
-#define outl(v,p)	(__builtin_constant_p((p)) ? __outlc(v,p) : __outl(v,p))
-#define __ioaddr(p)	(__builtin_constant_p((p)) ? __ioaddr(p)  : __ioaddrc(p))
-
-#define insb(p,d,l)	__raw_readsb(__ioaddr(p),d,l)
-#define insw(p,d,l)	__raw_readsw(__ioaddr(p),d,l)
-#define insl(p,d,l)	__raw_readsl(__ioaddr(p),d,l)
-
-#define outsb(p,d,l)	__raw_writesb(__ioaddr(p),d,l)
-#define outsw(p,d,l)	__raw_writesw(__ioaddr(p),d,l)
-#define outsl(p,d,l)	__raw_writesl(__ioaddr(p),d,l)
+#endif
 
 #endif
diff --git a/arch/arm/plat-samsung/include/plat/map-s3c.h b/arch/arm/plat-samsung/include/plat/map-s3c.h
index 4244acbf4b65..bf247d836684 100644
--- a/arch/arm/plat-samsung/include/plat/map-s3c.h
+++ b/arch/arm/plat-samsung/include/plat/map-s3c.h
@@ -9,6 +9,8 @@
 #ifndef __ASM_PLAT_MAP_S3C_H
 #define __ASM_PLAT_MAP_S3C_H __FILE__
 
+#include <mach/map.h>
+
 #define S3C24XX_VA_IRQ		S3C_VA_IRQ
 #define S3C24XX_VA_MEMCTRL	S3C_VA_MEM
 #define S3C24XX_VA_UART		S3C_VA_UART
@@ -45,16 +47,8 @@
 
 #define S3C_VA_USB_HSPHY	S3C64XX_VA_USB_HSPHY
 
-/*
- * ISA style IO, for each machine to sort out mappings for,
- * if it implements it. We reserve two 16M regions for ISA.
- */
-
 #define S3C2410_ADDR(x)		S3C_ADDR(x)
 
-#define S3C24XX_VA_ISA_WORD	S3C2410_ADDR(0x02000000)
-#define S3C24XX_VA_ISA_BYTE	S3C2410_ADDR(0x03000000)
-
 /* deal with the registers that move under the 2412/2413 */
 
 #if defined(CONFIG_CPU_S3C2412)
-- 
2.17.1

