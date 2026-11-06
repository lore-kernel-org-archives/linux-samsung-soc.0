Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793928587;
	b=fby74QqFp9A+1iOxTZ3Xz7nHsl6sjDFR07REbIx2qly+iCR9K0g9gGke8LDMvH3C5NaE
	 8v7vSY+K1eXSeEprOmy7uw7v/BNKyR2CH8DcNriRz1+M4OmxMuy9Zn7PoEoC7Jp7Y6Ycw
	 T1ZPGIYKWAIlhjoLNYg/jbgz9h2yytrOHqEgDHp1Iq1h8G0OryZmMRY9Wu87Lwj8pDrCR
	 4D4YNUmF44P09zoVQ/Q9jHTvwThdKL1/+kf/6N4ULjho4XZovYuOob63E92tp29P5bp2Y
	 KpoCJXJtVzIF5Hhgh0t4IvNjFuZaE831J4bUHLJQvlVle14iF7OmKSKz2w/klBWN0fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928587;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
	b=1InTsXIY5yenbYrKv5sNCP008NGAbNeu6pqr1S7I4Ts+IqUIM5ePiD8rzIRWNw4davVX
	 2MvGDXOqoCQ/0ljgQnIXKpAfYGMJrPe0QdKyYhDhBQ5qWQBxxfkwqMyxrTWEbSJ7Pmznq
	 NaXB1uJdpfPa8uZJMBVokvzlkA82sYxC8s0dD4AduE1diJehupICPmj0vLwD/4cD8R7rb
	 rB1v3E9+jPXWnX6wXbu+pl7R5hZsRouhvgTI9mu0NzC6ltEcZtHSSCARbOI4NCRNR5o9b
	 drGKLXl8aMPIdRzveO+oFhcAsNk8RzWkf9aDXzGX9TcrwoCA8BZMaXWdqdjM6tbo5lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hoPrTfof;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QwD0Vx9h;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C8E606A328
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 01:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C8E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hoPrTfof;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QwD0Vx9h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793928586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
	b=hoPrTfofoMsSl7OeMsycpnEnzDm8UuZ6O+VLNIr1lzc5Ho07GhZX07cZpoUnZNMJRwjDe+
	//10HURb7DJP4lvLQzabDPTngZHf+HnpazDIbhmsbpxaz1YAdnbB5hNB3M1xmCCSPo6ZZe
	xtw+CM+CQmVoMcbQM87lHXXaMrORivU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-bK8U5NC_PnO3L1sLZFMSNw-1; Thu, 05 Nov 2026 20:29:45 -0500
X-MC-Unique: bK8U5NC_PnO3L1sLZFMSNw-1
X-Mimecast-MFC-AGG-ID: bK8U5NC_PnO3L1sLZFMSNw_1793928585
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53661e036a2so2184031cf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Nov 2026 17:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793928585; x=1794533385; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
        b=QwD0Vx9heJ8ZA0a+BD5thbuly7isyqRUk3YlLrnVWd9shSxHYeVSBFmMScFu57BwX4
         gNj4q5fMGOHMVk1zkWJ2MCP4K3ZdVZB6az9KbaJgVr+ucq93gQv1QepMA1OQPFLOhoda
         vCOKm+YbEwiblATk7lKUoZff9IjvFiO+iy0gx8wHBikXeLU3lqniVrwPWWNjvKntYbbS
         kw39OZegONbCrCUfJdijJo2g0X0jnPeCarRli24FjJhbp5qt2VYb5M6BA7UAWvTyG/hz
         gy9ND2jqg1OHHThoKrjMTQejjh26LbWOLBeGuj9Ia2Ee9pmV0qVGVDl9j9EqOIHB2Yxr
         EQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928585; x=1794533385;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
        b=viEIsG1yor/ksSwzV04PXYYdsu5vdezAnGKFFJqcA+uO4LCHcTJLU/80ixgCNMW4Yz
         7vxKYlde5uHj1Sz1ymfRZ5we1LmzotGZ36qCo0UEGNIm/VFNftk8A6dNTBdTyLcX7iGU
         Wn+OPtcnkOxVaGJ3DqSsQQKy+Lf5ulLuLnmV0ro5nQQERS5NkiCmP5L/cp9ZUpPfzU2k
         KkXzy84BsZ2w/M5UQgzwUrNFmnaRisHid9Vq+HYhah6AsrCjBou2SxhBLELt3DJb5OcT
         0KiGk1ot0wPly2s3om8BeQ3XcnpoIOnAIK1yjMlpBvbyte32zTx7F8IoY11j7wia2zW4
         +F8Q==
X-Gm-Message-State: APuU4Z96MHOncQMiKr9LHA7JJ6LrudUjCXmS+L+Yzy+H1pS62LKr8bCk
	90kmanQdtzKDE1YGDL5St/XcVeIbZ1cNaSrSL5Dxf0k+Da0c3jZeolSFb8CH7df6yAh/Ijw6dW8
	ves+tnE3WDOHP+9Gj0rfyYo0CnRNymnJZFo3VJvJRwLbOL/OQjMNsAckhVxF0yOXai4BSXFgo
X-Gm-Gg: AYBFou3Rn3Le6hNZh9LAzYPYW7WXZIieBGHHcWDYU38vPgwZuwqJ4Vxr7mjIEfKSUWQ
	U4z7jgjOhH8ljidRZfBoM0HKI86IHlFAuVkAUIThfv3Nq103gA6laSaabTBROmmCRK/65SbuRpq
	GcIrrpSVA1YwqepY/v2dqg+/GAnMUy4gH+azAqQ1HRn1YUKBLUiBpav7M3pm1zwM+NP8/G3Q6MW
	tx6Wzhgz5MkRuaERQ6FXKCSMNegUOulbMh/IbiPzA7aqsLtfLtz8oX7hmaunhi1KTd/JgUt+qEv
	C47cqfwKOSU1tQiPNG+b961vyQbknwTGA7cc5Vm2SYdRXcPPwds03auUeZhakytWQG/xqf/xy+H
	lHeZw04hxI+Sw7qVR8I2N48JQ8Ffqcn35sZuAk8Da40sgU4pdEltj1ffGqC+4FciFp8nPGQ5HUP
	2VD1bkI+gzkkBzZzVu
X-Received: by 2002:a05:622a:353:b0:536:65fb:fff5 with SMTP id d75a77b69052e-54e1596c231mr17839171cf.60.1793928584514;
        Thu, 05 Nov 2026 17:29:44 -0800 (PST)
X-Received: by 2002:a05:622a:353:b0:536:65fb:fff5 with SMTP id d75a77b69052e-54e1596c231mr17838791cf.60.1793928583742;
        Thu, 05 Nov 2026 17:29:43 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e26f1bd64sm7404091cf.23.2026.11.05.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:29:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 05 Nov 2026 20:29:27 -0500
Subject: [PATCH] clk: samsung: exynos3250: convert to
 subsys_platform_driver_probe()
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-clk-subsys-v1-1-993c474e7860@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDXRCsFVxKLawSBIByHi7orll
 7z3X8DoCBmK4AKHOzHNk4cMAzCdnloUZL1BRSqVMkqEGQfBW80nC6tsbrM4zoxW4A+Lw4aOL1Z
 Wv/2yR7O+BbjvB+zBcuhuAAAA
X-Change-ID: 20261105-clk-subsys-d2d9d8338ca2
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7ycUhYaTHTijLETgf34xYgBmPS7y03e26r0FoL8ptEI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe6jZ+3Syw76dB9vH8aLXHwRdfqzR/tl6m6Wv57V/1l
 RJ3E63fHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEbhLD/8o5AYtijIRnM2W+
 PCXU0K3huJuJv/u/k9WpNfMleSa9lWD4X3E+quGxUEJjlMKOTBshycnPN5t21InbX/0a7XMrtPY
 aHwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/samsung/clk-exynos3250.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 32d12658e1a9..bf36d2f2a3f8 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -1093,10 +1093,6 @@ static struct platform_driver exynos3250_cmu_isp_driver __initdata = {
 	},
 };
 
-static int __init exynos3250_cmu_platform_init(void)
-{
-	return platform_driver_probe(&exynos3250_cmu_isp_driver,
-					exynos3250_cmu_isp_probe);
-}
-subsys_initcall(exynos3250_cmu_platform_init);
+subsys_platform_driver_probe(exynos3250_cmu_isp_driver,
+			     exynos3250_cmu_isp_probe);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-clk-subsys-d2d9d8338ca2

Best regards,
--  
Brian Masney <bmasney@redhat.com>

