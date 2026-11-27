Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776029;
	b=HLPfixh9+9npP73Z0sCfTeH1Hn3+DcIGxbukOcHWDSzbJyWu+S8+ZwJfx8+3D3OSNHKy
	 P8UKA3YInCOE4iyHlRlusVW/vEJ2c7YmIxnnZpSJleMVXiskwNqub4IvET7NWDkFnXpy4
	 jrc+HycrtytiIcb3WeaqXEYFhUzr34rH3+TN9aCqjwd36P64s9W3b19CyGDdlM/YjtxHG
	 yuYJkAvjTq8Ya7ag9UMFPn8BnJaKTZp8G5M2Uw+ii0LBBpdmm9Oyf0sHmtWAD6eQCgVL7
	 RzdmWi9cqeKe4vRRvZqqeC8h8u9NB+dQxOLE88XwABHB3mJmpx6/lnwmZ7mDIrv+1Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oWu8s9h9LuPC9clk7WKJLqVo8oT93YKUyB6/kSE4xF4=;
	b=OUvynhHUsjyS6Z6YEJTl5YL4hltOV4rWrmU49QYGRYo86jc1Rmlh6EI9gJjOjRUfzYv2
	 q+TqyPNDlvaQV7QRstnETfjguzCtpxb75dqonZvKoQPP8APRoIbm7qUvtWichIinckTrl
	 j24W1qCFPGmRoFLGOZszrqXJjJh5HjCYOyIehDTxJjneL02PO95zOwHAgEo6K4QcJJlKB
	 mzghMxprWMl+g/9ejwMomcpEWeWXTXM6i8rnu1zPUIWgFshyKaJgoWBUk0B3khDoVOOg1
	 Cp+whc9s142DFxRS6vfRx4gikpt8kMZ61jKO4Tu/+/OYWtIN6eQh7slsTjkrGxAboSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jTn7+pYI;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CA606A333
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2026 10:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51CA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jTn7+pYI
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso6863045a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2026 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776027; x=1796380827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWu8s9h9LuPC9clk7WKJLqVo8oT93YKUyB6/kSE4xF4=;
        b=jTn7+pYIWxPVmo6OJw+IDKEbKPVpq7c40YVp0Mlh2cGcAuXS8ql3ff3Frk21qg/39V
         1wCcSJF2ghb8LKW475lHWi2evFkpd2L7087r/FWi96kKGqUwlBuGDqAI2ALU3vMFIkuw
         zKBX1E4+GzRJl0xxArJTpjDfj//yF/EFfQVHbpPY4fT12RClg8V6r6/wj0uqdLqTBeTX
         uPu5Iz356RsLT+ccFZCM50rn1ueTjVZVH0iAQZ+Cne/23CH566e3PHarnVy4z7cVEjvD
         vwIrkVtDaXkER7/L4WBQGe4nfJyelfsLooMMN0Ey0wZOoNaLdL0IvWe2t+4QI2YihCSC
         Zw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776027; x=1796380827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWu8s9h9LuPC9clk7WKJLqVo8oT93YKUyB6/kSE4xF4=;
        b=gzQyMyQQM1eW9kaBYWNYWk+vHQAzVjpEXvG2INjvy9seJQAh1qTn6ZK9Dzsiej4QM0
         sA22xZsv+JnyFM4kcpY7pbzaXfE9W8A0MVjYHhinxWgSovh/Zfs/C/o9gWeMGwcbf2RA
         QLQ79CBVEc0VmkiCoVPwuBMHpWOmbSuP7ov0Pk6Db3HrjIytmHk7r9elPzcDXgSsEfn9
         WCkWA5Tiu9YdFkClknIvzdDQYDpFuOLLyVs1jObXfnMLQ870gQBIdoTjfPStXpZOPiYi
         KANZe2HSw4ny3yV8h+8SaikA5kTEH65Ob1nTPSp50ugJ9+hIjF0K2LVrFiTfUOEhGYUa
         HVSw==
X-Forwarded-Encrypted: i=1; AL+hErEaqgfw1kExWcEDeQ0afEBLDxx1UXuk4C6qvL1EV+bNc05yVsKdwiClnNplzM97wcCBb5z0+PJb1m2hRqWHjUbaoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+C4LfqZgoyVUZd+ZYA29nr7r6GQhAxetAaR7fkltYb6YMP8JNe
	3JXqWi5ykQq+cQj5DsirrkDWGQJE2/lVjIgkRS11bYfMMBquIG1ARXHHJoN1YfK1GEk=
X-Gm-Gg: AZFdTZdeddP0u8oXjUant8mLhSH6R5iubKP2RV19Pz5FKi8d0svyqHeQxiaCDkwAOD1
	49BNqfVPFUOhcSV5Tb25+JxSZE81nWpboMi5kmJF3bwikkFpOt6NKaMcMZ3cfe9oS5FEHBvtZio
	Hi6pKb+e7nan6C+TNGc9Me/wzfugxZ0U7nokRyNRQGtMgZ0bV2KJtsB6+PeN4a7bHkwcyWGsBdl
	TxALboJxlmYTIGlInhUiKK2bj+QJBch5D8uXClAf1OLYSfQ0I9byE+7/axrSEnFWqo9cn47nBcz
	J2rvenZXREN/RePgxzQLlVg6sBh8gTLp7nmWPbikvr6viZWi9/HijEyQWACsaGgw+NhbplyJy+q
	bDugwmePd5z6zZ/6BiNzlhRLqGKiOKNM9K8sRiDh8/zoeeEEAJY5sVrkxoqRUF7RIWjAIUM1vMM
	OPcbA0mUV2UClq3wrWEajlVz9dxrZFvwfFrk7hV3B4rEyV/1peknF5eAVcTygOcLKkv6Be+FM7G
	LfIQzaGKf+nUnPHBP37KwzQSvA3UHuCDIiMdtje1q2NCGFr95egj64V62TBacK6zWFYfHwcVqIy
	gwp8FNl3hVhqtcnvh5/V5rycrOAWtpq2EGLPKpw7zsRozuFWFrYN+KA3sOHDXvZzrLf4qEo0rjm
	3vIT4s2udahtiyaWRxGiYodEsnL+7YKuhnlIUVP4=
X-Received: by 2002:a05:6402:51d2:b0:6ba:6667:a330 with SMTP id 4fb4d7f45d1cf-6ba6667a5d4mr12150430a12.30.1795776027174;
        Fri, 27 Nov 2026 02:40:27 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3919199a12.2.2026.11.27.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 10:40:23 +0000
Subject: [PATCH 3/3] phy: samsung-ufs: use counted config tables
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-gs101-ufs-phy-oob-v1-3-144b0e04c3a8@linaro.org>
References: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
In-Reply-To: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-hardening@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

samsung_ufs_phy_calibrate() and samsung_ufs_phy_notify_state() walk a
table of register writes until they find an entry whose id is 0, so
each table has to end with END_UFS_PHY_CFG.

Nothing checks that this sentinel exists. Without it, the loop reads
past the end of the table and writes adjacent memory to the PHY until
it happens to hit an id of 0. The compiler can't detect this, because
a table is just a pointer without a length.

To address this, this patch describes each table using a new struct
samsung_ufs_phy_cfg_table which annotates entries with
__counted_by_ptr(), and replaces for_each_phy_cfg() and the duplicated
calibrate/notify loops with an index-based samsung_ufs_phy_write_cfgs()
helper.

Compilers that support __counted_by_ptr() (GCC >= 16, Clang >= 22) can
now enforce UBSAN_BOUNDS and FORTIFY_SOURCE checks on accesses to the
entries against their count.

While at it:
- drop the unused sentinel from the non-iterated cfg[] array in
  exynosautov920_ufs_phy_wait_cdr_lock() and make cfg[] static const to
  avoid a 48-byte stack copy per call
- fix the "atfer" comment typo in exynos7 and fsd.

On arm64 (non-debug build), switching to counted tables shrinks
phy-exynos-ufs.o by 96 bytes overall (.text -128, .rodata +32).

No functional change intended.

Note 1:
To avoid copy-paste mismatches due to open-coding, add a new macro
SAMSUNG_UFS_PHY_CFG_TABLE() to combine entries with their count in one
place.
While it triggers checkpatch --strict's argument reuse check, that's
preferable to risking copy-paste mismatches.

Note 2:
samsung_ufs_phy_calibrate() only waits for calibration and CDR lock if
the table for the current state exists, even if the table has no entries.
ExynosAuto v920 and FSD have such an empty table for CFG_POST_PWR_HS and
therefore wait for CDR lock, whereas ExynosAuto v9 has no table and
doesn't wait. To keep this behaviour, turn the tables which only contain
the sentinel into empty arrays to keeps wait_for_cdr() behaviour.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos7-ufs.c        | 11 +++-----
 drivers/phy/samsung/phy-exynosautov9-ufs.c   |  8 ++----
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 19 ++++++-------
 drivers/phy/samsung/phy-fsd-ufs.c            | 17 +++++++-----
 drivers/phy/samsung/phy-gs101-ufs.c          | 15 ++++------
 drivers/phy/samsung/phy-samsung-ufs.c        | 41 +++++++++++++++-------------
 drivers/phy/samsung/phy-samsung-ufs.h        | 23 ++++++++++++++--
 7 files changed, 72 insertions(+), 62 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos7-ufs.c b/drivers/phy/samsung/phy-exynos7-ufs.c
index ea3951ca1331..44e8f71240e0 100644
--- a/drivers/phy/samsung/phy-exynos7-ufs.c
+++ b/drivers/phy/samsung/phy-exynos7-ufs.c
@@ -29,7 +29,6 @@ static const struct samsung_ufs_phy_cfg exynos7_pre_init_cfg[] = {
 	PHY_TRSV_REG_CFG(0x04c, 0x5b, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG(0x04d, 0x83, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG(0x05c, 0x14, PWR_MODE_ANY),
-	END_UFS_PHY_CFG
 };
 
 /* Calibration for HS mode series A/B */
@@ -52,14 +51,12 @@ static const struct samsung_ufs_phy_cfg exynos7_pre_pwr_hs_cfg[] = {
 	PHY_TRSV_REG_CFG(0x034, 0x36, PWR_MODE_HS_G2_SER_B),
 	PHY_TRSV_REG_CFG(0x035, 0x5b, PWR_MODE_HS_G2_SER_A),
 	PHY_TRSV_REG_CFG(0x035, 0x5c, PWR_MODE_HS_G2_SER_B),
-	END_UFS_PHY_CFG
 };
 
-/* Calibration for HS mode series A/B atfer PMC */
+/* Calibration for HS mode series A/B after PMC */
 static const struct samsung_ufs_phy_cfg exynos7_post_pwr_hs_cfg[] = {
 	PHY_COMN_REG_CFG(0x015, 0x00, PWR_MODE_HS_ANY),
 	PHY_TRSV_REG_CFG(0x04d, 0x83, PWR_MODE_HS_ANY),
-	END_UFS_PHY_CFG
 };
 
 static const char * const exynos7_ufs_phy_clks[] = {
@@ -68,9 +65,9 @@ static const char * const exynos7_ufs_phy_clks[] = {
 
 const struct samsung_ufs_phy_drvdata exynos7_ufs_phy = {
 	.cfgs = {
-		[CFG_PRE_INIT]		= exynos7_pre_init_cfg,
-		[CFG_PRE_PWR_HS]	= exynos7_pre_pwr_hs_cfg,
-		[CFG_POST_PWR_HS]	= exynos7_post_pwr_hs_cfg,
+		[CFG_PRE_INIT] = SAMSUNG_UFS_PHY_CFG_TABLE(exynos7_pre_init_cfg),
+		[CFG_PRE_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(exynos7_pre_pwr_hs_cfg),
+		[CFG_POST_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(exynos7_post_pwr_hs_cfg),
 	},
 	.isol = {
 		.offset = EXYNOS7_EMBEDDED_COMBO_PHY_CTRL,
diff --git a/drivers/phy/samsung/phy-exynosautov9-ufs.c b/drivers/phy/samsung/phy-exynosautov9-ufs.c
index 00b8eabd3cf2..1a3c77a16cdf 100644
--- a/drivers/phy/samsung/phy-exynosautov9-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov9-ufs.c
@@ -34,8 +34,6 @@ static const struct samsung_ufs_phy_cfg exynosautov9_pre_init_cfg[] = {
 
 	PHY_TRSV_REG_CFG_AUTOV9(0x042, 0x5d, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV9(0x043, 0x80, PWR_MODE_ANY),
-
-	END_UFS_PHY_CFG,
 };
 
 /* Calibration for HS mode series A/B */
@@ -48,8 +46,6 @@ static const struct samsung_ufs_phy_cfg exynosautov9_pre_pwr_hs_cfg[] = {
 	PHY_TRSV_REG_CFG_AUTOV9(0x04b, 0x10, PWR_MODE_HS_G1_SER_B |
 				PWR_MODE_HS_G3_SER_B),
 	PHY_TRSV_REG_CFG_AUTOV9(0x04d, 0x63, PWR_MODE_HS_G3_SER_B),
-
-	END_UFS_PHY_CFG,
 };
 
 static const char * const exynosautov9_ufs_phy_clks[] = {
@@ -58,8 +54,8 @@ static const char * const exynosautov9_ufs_phy_clks[] = {
 
 const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy = {
 	.cfgs = {
-		[CFG_PRE_INIT]		= exynosautov9_pre_init_cfg,
-		[CFG_PRE_PWR_HS]	= exynosautov9_pre_pwr_hs_cfg,
+		[CFG_PRE_INIT] = SAMSUNG_UFS_PHY_CFG_TABLE(exynosautov9_pre_init_cfg),
+		[CFG_PRE_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(exynosautov9_pre_pwr_hs_cfg),
 	},
 	.isol = {
 		.offset = EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL,
diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c b/drivers/phy/samsung/phy-exynosautov920-ufs.c
index 7cf229b2b261..268d72b4763b 100644
--- a/drivers/phy/samsung/phy-exynosautov920-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
@@ -89,20 +89,20 @@ static const struct samsung_ufs_phy_cfg exynosautov920_pre_init_cfg[] = {
 
 	PHY_COMN_REG_CFG(0x43, 0x18, PWR_MODE_ANY),
 	PHY_COMN_REG_CFG(0x43, 0x00, PWR_MODE_ANY),
-
-	END_UFS_PHY_CFG,
 };
 
 /* Calibration for HS mode series A/B */
 static const struct samsung_ufs_phy_cfg exynosautov920_pre_pwr_hs_cfg[] = {
 	PHY_TRSV_REG_CFG_AUTOV920(0x369, 0x11, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x03, PWR_MODE_ANY),
-
-	END_UFS_PHY_CFG,
 };
 
+/*
+ * Intentionally empty: samsung_ufs_phy_calibrate() only waits for CDR lock
+ * after the power mode change if the table for CFG_POST_PWR_HS exists, even
+ * if that table has no entries.
+ */
 static const struct samsung_ufs_phy_cfg exynosautov920_post_pwr_hs_cfg[] = {
-	END_UFS_PHY_CFG,
 };
 
 #define DELAY_IN_US	40
@@ -114,11 +114,10 @@ int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane)
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
 	u32 reg, i;
 
-	struct samsung_ufs_phy_cfg cfg[4] = {
+	static const struct samsung_ufs_phy_cfg cfg[] = {
 		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x10, PWR_MODE_ANY),
 		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x18, PWR_MODE_ANY),
 		PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x01, PWR_MODE_ANY),
-		END_UFS_PHY_CFG,
 	};
 
 	for (i = 0; i < RETRY_CNT; i++) {
@@ -150,9 +149,9 @@ static const char * const exynosautov920_ufs_phy_clks[] = {
 
 const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy = {
 	.cfgs = {
-		[CFG_PRE_INIT]		= exynosautov920_pre_init_cfg,
-		[CFG_PRE_PWR_HS]	= exynosautov920_pre_pwr_hs_cfg,
-		[CFG_POST_PWR_HS]	= exynosautov920_post_pwr_hs_cfg,
+		[CFG_PRE_INIT] = SAMSUNG_UFS_PHY_CFG_TABLE(exynosautov920_pre_init_cfg),
+		[CFG_PRE_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(exynosautov920_pre_pwr_hs_cfg),
+		[CFG_POST_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(exynosautov920_post_pwr_hs_cfg),
 	},
 	.isol = {
 		.offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL,
diff --git a/drivers/phy/samsung/phy-fsd-ufs.c b/drivers/phy/samsung/phy-fsd-ufs.c
index d02742289654..316bab2c9ca0 100644
--- a/drivers/phy/samsung/phy-fsd-ufs.c
+++ b/drivers/phy/samsung/phy-fsd-ufs.c
@@ -27,17 +27,20 @@ static const struct samsung_ufs_phy_cfg fsd_pre_init_cfg[] = {
 	PHY_TRSV_REG_CFG(0x04c, 0x5b, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG(0x04d, 0x83, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG(0x05c, 0x14, PWR_MODE_ANY),
-	END_UFS_PHY_CFG
 };
 
 /* Calibration for HS mode series A/B */
 static const struct samsung_ufs_phy_cfg fsd_pre_pwr_hs_cfg[] = {
-	END_UFS_PHY_CFG
 };
 
-/* Calibration for HS mode series A/B atfer PMC */
+/*
+ * Calibration for HS mode series A/B after PMC
+ *
+ * Intentionally empty: samsung_ufs_phy_calibrate() only waits for CDR lock
+ * after the power mode change if the table for CFG_POST_PWR_HS exists, even
+ * if that table has no entries.
+ */
 static const struct samsung_ufs_phy_cfg fsd_post_pwr_hs_cfg[] = {
-	END_UFS_PHY_CFG
 };
 
 static const char * const fsd_ufs_phy_clks[] = {
@@ -46,9 +49,9 @@ static const char * const fsd_ufs_phy_clks[] = {
 
 const struct samsung_ufs_phy_drvdata fsd_ufs_phy = {
 	.cfgs = {
-		[CFG_PRE_INIT]		= fsd_pre_init_cfg,
-		[CFG_PRE_PWR_HS]	= fsd_pre_pwr_hs_cfg,
-		[CFG_POST_PWR_HS]	= fsd_post_pwr_hs_cfg,
+		[CFG_PRE_INIT] = SAMSUNG_UFS_PHY_CFG_TABLE(fsd_pre_init_cfg),
+		[CFG_PRE_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(fsd_pre_pwr_hs_cfg),
+		[CFG_POST_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(fsd_post_pwr_hs_cfg),
 	},
 	.isol = {
 		.offset = FSD_EMBEDDED_COMBO_PHY_CTRL,
diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
index 5b6dca37b5a3..7b0c0afd16a4 100644
--- a/drivers/phy/samsung/phy-gs101-ufs.c
+++ b/drivers/phy/samsung/phy-gs101-ufs.c
@@ -92,13 +92,11 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_pre_init_cfg[] = {
 	PHY_TRSV_REG_CFG_GS101(0x354, 0x01, PWR_MODE_ANY),
 	PHY_COMN_REG_CFG(0x43, 0x18, PWR_MODE_ANY),
 	PHY_COMN_REG_CFG(0x43, 0x00, PWR_MODE_ANY),
-	END_UFS_PHY_CFG,
 };
 
 static const struct samsung_ufs_phy_cfg tensor_gs101_pre_pwr_hs_config[] = {
 	PHY_TRSV_REG_CFG_GS101(0x369, 0x11, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_ANY),
-	END_UFS_PHY_CFG,
 };
 
 /* Calibration for HS mode series A/B */
@@ -106,7 +104,6 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_post_pwr_hs_config[] = {
 	PHY_COMN_REG_CFG(0x8, 0x60, PWR_MODE_PWM_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x222, 0x08, PWR_MODE_PWM_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x246, 0x01, PWR_MODE_ANY),
-	END_UFS_PHY_CFG,
 };
 
 static const struct samsung_ufs_phy_cfg tensor_gs101_post_h8_enter[] = {
@@ -117,7 +114,6 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_post_h8_enter[] = {
 	PHY_COMN_REG_CFG(0x8, 0x60,  PWR_MODE_HS_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x222, 0x08, PWR_MODE_HS_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x246, 0x01, PWR_MODE_HS_ANY),
-	END_UFS_PHY_CFG,
 };
 
 static const struct samsung_ufs_phy_cfg tensor_gs101_pre_h8_exit[] = {
@@ -128,7 +124,6 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_pre_h8_exit[] = {
 	PHY_COMN_REG_CFG(0x8, 0xE0,  PWR_MODE_HS_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_HS_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x222, 0x18, PWR_MODE_HS_ANY),
-	END_UFS_PHY_CFG,
 };
 
 static const char * const tensor_gs101_ufs_phy_clks[] = {
@@ -187,13 +182,13 @@ static int gs101_phy_wait_for_cdr_lock(struct phy *phy, u8 lane)
 
 const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy = {
 	.cfgs = {
-		[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
-		[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
-		[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
+		[CFG_PRE_INIT] = SAMSUNG_UFS_PHY_CFG_TABLE(tensor_gs101_pre_init_cfg),
+		[CFG_PRE_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(tensor_gs101_pre_pwr_hs_config),
+		[CFG_POST_PWR_HS] = SAMSUNG_UFS_PHY_CFG_TABLE(tensor_gs101_post_pwr_hs_config),
 	},
 	.cfgs_hibern8 = {
-		[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
-		[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
+		[CFG_POST_HIBERN8_ENTER] = SAMSUNG_UFS_PHY_CFG_TABLE(tensor_gs101_post_h8_enter),
+		[CFG_PRE_HIBERN8_EXIT] = SAMSUNG_UFS_PHY_CFG_TABLE(tensor_gs101_pre_h8_exit),
 	},
 	.isol = {
 		.offset = TENSOR_GS101_PHY_CTRL,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 4f2db2ca83c0..49c69855f7ee 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -23,8 +23,6 @@
 
 #define for_each_phy_lane(phy, i) \
 	for (i = 0; i < (phy)->lane_cnt; i++)
-#define for_each_phy_cfg(cfg) \
-	for (; (cfg)->id; (cfg)++)
 
 #define PHY_DEF_LANE_CNT	1
 
@@ -45,6 +43,19 @@ void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
 	}
 }
 
+static void samsung_ufs_phy_write_cfgs(struct samsung_ufs_phy *phy,
+				       const struct samsung_ufs_phy_cfg_table *tbl)
+{
+	unsigned int n;
+	int i;
+
+	for (n = 0; n < tbl->num_entries; n++) {
+		for_each_phy_lane(phy, i) {
+			samsung_ufs_phy_config(phy, &tbl->entries[n], i);
+		}
+	}
+}
+
 int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
@@ -76,7 +87,7 @@ int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane)
 static int samsung_ufs_phy_calibrate(struct phy *phy)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
-	const struct samsung_ufs_phy_cfg *cfg;
+	const struct samsung_ufs_phy_cfg_table *tbl;
 	int err = 0;
 	int i;
 
@@ -86,15 +97,11 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 		return -EINVAL;
 	}
 
-	cfg = ufs_phy->drvdata->cfgs[ufs_phy->ufs_phy_state];
-	if (!cfg)
+	tbl = &ufs_phy->drvdata->cfgs[ufs_phy->ufs_phy_state];
+	if (!tbl->entries)
 		goto out;
 
-	for_each_phy_cfg(cfg) {
-		for_each_phy_lane(ufs_phy, i) {
-			samsung_ufs_phy_config(ufs_phy, cfg, i);
-		}
-	}
+	samsung_ufs_phy_write_cfgs(ufs_phy, tbl);
 
 	for_each_phy_lane(ufs_phy, i) {
 		if (ufs_phy->ufs_phy_state == CFG_PRE_INIT &&
@@ -219,24 +226,20 @@ static int samsung_ufs_phy_notify_state(struct phy *phy,
 					union phy_notify state)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
-	const struct samsung_ufs_phy_cfg *cfg;
+	const struct samsung_ufs_phy_cfg_table *tbl;
 	int i, err = -EINVAL;
 
 	if (state.ufs_state == PHY_UFS_HIBERN8_ENTER)
-		cfg = ufs_phy->drvdata->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
+		tbl = &ufs_phy->drvdata->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
 	else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
-		cfg = ufs_phy->drvdata->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
+		tbl = &ufs_phy->drvdata->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
 	else
 		goto err_out;
 
-	if (!cfg)
+	if (!tbl->entries)
 		return 0;
 
-	for_each_phy_cfg(cfg) {
-		for_each_phy_lane(ufs_phy, i) {
-			samsung_ufs_phy_config(ufs_phy, cfg, i);
-		}
-	}
+	samsung_ufs_phy_write_cfgs(ufs_phy, tbl);
 
 	if (state.ufs_state == PHY_UFS_HIBERN8_EXIT) {
 		for_each_phy_lane(ufs_phy, i) {
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index f9680915545a..fd2dd9e19bcc 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -10,12 +10,12 @@
 #ifndef _PHY_SAMSUNG_UFS_
 #define _PHY_SAMSUNG_UFS_
 
+#include <linux/array_size.h>
 #include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
 #define PHY_COMN_BLK	1
 #define PHY_TRSV_BLK	2
-#define END_UFS_PHY_CFG { 0 }
 #define PHY_TRSV_CH_OFFSET	0x30
 #define PHY_APB_ADDR(off)	((off) << 2)
 
@@ -106,6 +106,23 @@ struct samsung_ufs_phy_cfg {
 	u8 id;
 };
 
+/**
+ * struct samsung_ufs_phy_cfg_table - register writes for one calibration point
+ * @entries: the register writes, applied in array order. NULL if the SoC has
+ *	     no table for this calibration point.
+ * @num_entries: number of elements in @entries. Can be 0 for a table that
+ *		 exists, but doesn't write any register.
+ */
+struct samsung_ufs_phy_cfg_table {
+	const struct samsung_ufs_phy_cfg *entries __counted_by_ptr(num_entries);
+	unsigned int num_entries;
+};
+
+#define SAMSUNG_UFS_PHY_CFG_TABLE(arr) {	\
+	.entries = (arr),			\
+	.num_entries = ARRAY_SIZE(arr),		\
+}
+
 struct samsung_ufs_phy_pmu_isol {
 	u32 offset;
 	u32 mask;
@@ -113,8 +130,8 @@ struct samsung_ufs_phy_pmu_isol {
 };
 
 struct samsung_ufs_phy_drvdata {
-	const struct samsung_ufs_phy_cfg *cfgs[CFG_TAG_MAX];
-	const struct samsung_ufs_phy_cfg *cfgs_hibern8[CFG_HIBERN8_MAX];
+	struct samsung_ufs_phy_cfg_table cfgs[CFG_TAG_MAX];
+	struct samsung_ufs_phy_cfg_table cfgs_hibern8[CFG_HIBERN8_MAX];
 	struct samsung_ufs_phy_pmu_isol isol;
 	const char * const *clk_list;
 	int num_clks;

-- 
2.56.1.839.g22a8290db9-goog

