Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795878021;
	b=31V0Z5hKb79ONoqdZuEKJHAlAwhxe6f4nrW9+Et8nNOx5NfIJTEW/mOxKfEZO93NEbac
	 lBoHpBlzHWOqCVN3zKk0gfjoQc2HCpxe4OtmUkQ8NvA/mGgJAjBX4mEJQRlq25Llcfda6
	 wVuiLkJAASAsbYTDwP7xTgzvTnQ2amXXv11me6Vg3137z0L/zyX/LnfGCU16LLAMfKiw1
	 00uxv/8k7Qw2hHX+h9L4OgH/foBnX1RVUYwnqhFs0jHgU+J92ejARUCwXRlK3ZVkar+l4
	 64bMQy48zjTR9b/h7XKlv/aNF5EzBLGOSFzUazNvuWIJleq+rQbqkmwMjDZyTo8YeGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795878021;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=iwJ2iNowiHeIyJMDUz4HB42+qE+NikCxYbeX04mfSWo=;
	b=vKxH0JWHxXjIxxLqHBAasp80nEZ5/9SuSqKYreIIQtrX3fpdRRq83BS3CUnuNezvWNHO
	 EH53vn2cPesZwkt2oe67ueYPXgwQlV43P+XUTggcr/G8KZmiAnHfjX1YqzHqynnEnOrqU
	 yqoWmiGDRaxVrqiivmN/Bw5zw9KEM1V38XNVcnQi51W2D+oxG7QzfeluiMQ6TPk66xFac
	 gD8W5cP1zIC8rU4iRgNQuxs6a1ljBfivTMstBTDD4tujtRass6AZxqcyCbkLas1a6cT0P
	 FH0gMhWEoB+U3RvOAqcAxeRGr4N8lFaJbSkp029viooPF9PE0WpThTVnALqkis6mPOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=Okqn4bo2;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76B606A31F;
	Sat, 28 Nov 2026 15:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC76B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=Okqn4bo2
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jcD3k44LVzMm1N;
	Sat, 28 Nov 2026 16:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795878018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iwJ2iNowiHeIyJMDUz4HB42+qE+NikCxYbeX04mfSWo=;
	b=Okqn4bo2RBpL0XXjCxFI/doT/Kp7sfr0KRlqBrv2ayiC+rO3p80NiATL3Y8ftuZZMHk9KL
	lh1/RDxZc3FRhkkrZH/07wPcp7cXmR6YdZBjuyl9sqjBnDcLShDMXRlgrEVLZNLQ0T7oH4
	TCgUbE+giBcEH86YIpNL/42Hob7Ajwu6V36F2/KYV7A4RIeFn6USBzt8KtMVd9HusjEpo7
	SrqV/uAXhr4KHUlo5sMjL6eAu4E2zNwq5mt7wzIrC4+hR8DU+ZfetEyTNewa33j+EFNLP9
	y3D0IQljOijGUQUMGignZflJQDVWaNNNZEaZbc5+BDmn73RbMEHZrdbM5aGZ7Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 16:00:14 +0100
Subject: [PATCH] clk: samsung: exynos5250: Ignore trustzone clocks
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
Message-Id: <20261128-exynos5250-clk-tzpc-fix-v1-1-fb0d9ba7b2fa@timmermann.space>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwrCQBCE4auEXtuQaRkjXkVcJJNSW2USphPJg
 9zdUZdfQf0rGZLC6FSslPBW0y5muF1B4V7HG1jbbJJSDs7JkTHNsTMvvuTwevKw9IGvOnHjfVt
 XsgdQUX73CXn+lc+Xv21sHgjDN0fb9gFORFcgewAAAA==
X-Change-ID: 20261128-exynos5250-clk-tzpc-fix-b55da723eee7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <foss@timmermann.space>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcD3k44LVzMm1N

Add flags to keep the trustzone related clocks enabled on exynos5250
devices during suspend. This fixes a crash for manta boards when trying
to suspend to ram.

This fix is based on the exynos5433 clock driver.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 drivers/clk/samsung/clk-exynos5250.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 802300c945a9..3bf0876bbb2d 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -614,16 +614,26 @@ static const struct samsung_gate_clock exynos5250_gate_clks[] __initconst = {
 			GATE_IP_PERIS, 4, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_CMU_MEM, "cmu_mem", "div_aclk66",
 			GATE_IP_PERIS, 5, CLK_IGNORE_UNUSED, 0),
-	GATE(CLK_TZPC0, "tzpc0", "div_aclk66", GATE_IP_PERIS, 6, 0, 0),
-	GATE(CLK_TZPC1, "tzpc1", "div_aclk66", GATE_IP_PERIS, 7, 0, 0),
-	GATE(CLK_TZPC2, "tzpc2", "div_aclk66", GATE_IP_PERIS, 8, 0, 0),
-	GATE(CLK_TZPC3, "tzpc3", "div_aclk66", GATE_IP_PERIS, 9, 0, 0),
-	GATE(CLK_TZPC4, "tzpc4", "div_aclk66", GATE_IP_PERIS, 10, 0, 0),
-	GATE(CLK_TZPC5, "tzpc5", "div_aclk66", GATE_IP_PERIS, 11, 0, 0),
-	GATE(CLK_TZPC6, "tzpc6", "div_aclk66", GATE_IP_PERIS, 12, 0, 0),
-	GATE(CLK_TZPC7, "tzpc7", "div_aclk66", GATE_IP_PERIS, 13, 0, 0),
-	GATE(CLK_TZPC8, "tzpc8", "div_aclk66", GATE_IP_PERIS, 14, 0, 0),
-	GATE(CLK_TZPC9, "tzpc9", "div_aclk66", GATE_IP_PERIS, 15, 0, 0),
+	GATE(CLK_TZPC0, "tzpc0", "div_aclk66", GATE_IP_PERIS, 6,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC1, "tzpc1", "div_aclk66", GATE_IP_PERIS, 7,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC2, "tzpc2", "div_aclk66", GATE_IP_PERIS, 8,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC3, "tzpc3", "div_aclk66", GATE_IP_PERIS, 9,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC4, "tzpc4", "div_aclk66", GATE_IP_PERIS, 10,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC5, "tzpc5", "div_aclk66", GATE_IP_PERIS, 11,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC6, "tzpc6", "div_aclk66", GATE_IP_PERIS, 12,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC7, "tzpc7", "div_aclk66", GATE_IP_PERIS, 13,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC8, "tzpc8", "div_aclk66", GATE_IP_PERIS, 14,
+			CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_TZPC9, "tzpc9", "div_aclk66", GATE_IP_PERIS, 15,
+			CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_HDMI_CEC, "hdmi_cec", "div_aclk66", GATE_IP_PERIS, 16, 0, 0),
 	GATE(CLK_MCT, "mct", "div_aclk66", GATE_IP_PERIS, 18, 0, 0),
 	GATE(CLK_WDT, "wdt", "div_aclk66", GATE_IP_PERIS, 19, 0, 0),

---
base-commit: 7cd8495c0f16275c4f9abe1cef09a7b5fcd6d046
change-id: 20261128-exynos5250-clk-tzpc-fix-b55da723eee7

Best regards,
--  
Lukas Timmermann <foss@timmermann.space>

