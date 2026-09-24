Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D013A9D94
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Sep 2026 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245855; cv=none; b=pb7V2RjipTXYaLIMdB6bEZQM136vBk3AF9Bn102I+a/Dd+sqy69oX3ihfCAbJ6WlwCtxzuijjcRwMhfXZtFRADkFP3WftU0stocnuF3bJ0mS7UupF2fYVxeHVWLZxa4Ie8wmABhR44mGGs59A8Xeg/c9zTPFaTTvf5sGcxbJgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245855; c=relaxed/simple;
	bh=X7+q633VBsOQWPfuyrYIU4KM3gkKmd4+z8AZDu05tlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I3AJvtO1sd/NOXKHEs2YSGiI6uNaI/SzxPhQQAk4Q+GKg6TS6I6BbRAkbmQDGgjwc1NSG1/8LQsxy1E6fWeITfom+3xkIAhjDWho2xaYZ5L5C3jooDCano1e2S/OPEFtoTDXI1IWU7bNk+KOchWwP2D2sM4a7704KCRjjYBGgPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PETSuA9R; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PETSuA9R"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3115c4451c8so551507eec.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Sep 2026 03:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790245853; x=1790850653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdzUGtWjlaSHGjfiY4nzNPdRN45L8PTOa5XPHowTwqk=;
        b=PETSuA9RWFiWy6z9JIlW1iB/pS/xscoZTY1OcqbqIzo2Pyz5Ru3KZMrdJh2RnteGyr
         FPdFh4N5BbPe6AEzwJc40Mb038pWLy4ImF+Kx2UG3919kX0lrNlJHKrvbPo/g30S33Sp
         c7OU2cypH3fmnz68mV6XAxTlLbEoTI8XQqpoGSpIk6aLkxbmZqe76uKSNObP8/quLjx0
         wc1IMIWecLxv8hNI6tX2I8mZlt+dmwRRTnpGoH6GYUaptBvRnEEKJpvyUm/8ZMZv3als
         iGp9V2NzV6cB6S2eOTGErKwEETgHXAdQkojMlqzYCArcA9HK1a/94FyvX3fNp+zjaZVZ
         XfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245853; x=1790850653;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FdzUGtWjlaSHGjfiY4nzNPdRN45L8PTOa5XPHowTwqk=;
        b=eOX7TYXli1lj3iK9OeKiDKkeKVINjcL07rwYEkEXGkHBznI7VHSoO5MxGgz7XG/c57
         XX4OKgQhX1OGrw7KGZjcs7lqTOsG6ZWRP20xVgJ19NOVoZ7RGF/B80vaPr281dLgeeHm
         CEMVeeJ0HAtgNDF1bIfw4NTcgdVVFO7dVXJEBYcG/PtZcocP82cgGjY8vNeZJZFEC8jo
         NxoqWhPamuoH3ZfzMBEO8n2dORuj2N1LRvg7YSU+g+UzzMn/togzjrCk+X20ieAQ+Qd3
         3LcpNhexJH4DJw+2faUTOvY+k8II3zz8vpbObtqdy74Zs+sBQi9TweRI22S6+Mg2jBE3
         oM7g==
X-Forwarded-Encrypted: i=1; AKwUvBz9NDwVqAug6XDMWJ151eFjg6BX4epiY8KEq1KcaYTPFAOQA6khfoK8U5q8B3GFdos+ZVkEskuovRiRYYwPKSd7Pw==@vger.kernel.org
X-Gm-Message-State: AFuF++lYGVq0G8W3cYWOWi1s3EDxsTvQl+Yv5VMIajfuEQ+EAllv1UhM
	6KSPkUUkdlGQdBIHCc0eAtLw5oD1PPBAfm54oWOvlSij/IC7CyUgiO9i
X-Gm-Gg: AYBFou2XAU8D2CqwwacwPsEUcnrtCfEm+TV68xqWGBv7MbRrYaAaDkQp6fE0YXtk1ac
	iunXG5XMMDuQ56l9od3kFBoDBnwH1MxolR8vllfo+W6xtOWrzAuQKJtDRguwebyS27pNj54Rse/
	smWtN3zLZHzOS9/3n7gp7x7FGES8FIApXyPKAF2ejzuSRJYgKW92ruy7IVil/dnbbtVAEiimso9
	7BD0mCW3H/ZKrWZyn3kabE6FXUOJeMH/C30eDP7himpXTr25OaHKnq9XuAhIDo320pZkaSI4idV
	walavBebdzUsDJq10EViuzplEkoOoudsn4pRepM+JuuBW8S2rMUbZ9ly6vHJjBZk2lAQ1tMdXQH
	QvAEUzegjzodmV2ewiTueQbRtSCp4LBtKtZMyGypghgd+LVYMgtdXP3EK/FI/mSXaR87d7lFk6I
	gyUYI93APAigfzaDDPO+Eeb5FaHyUy2oy4fJrskBcDX36gxR5kXLMBzps5CGb4HEU/Y1PaHzHhy
	z7LibV9NYiS5Dt+Y0pJVZHEyCyChn6DvUc=
X-Received: by 2002:a05:693c:62cd:b0:339:851c:4c1 with SMTP id 5a478bee46e88-340059652f1mr1488941eec.18.1790245852691;
        Thu, 24 Sep 2026 03:30:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e972395f9sm11553369eec.30.2026.09.24.03.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:30:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: lee@kernel.org,
	support.opensource@diasemi.com,
	mazziesaccount@gmail.com,
	andre.draszik@linaro.org
Cc: krzk@kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v6] mfd: Fix typos in comments
Date: Thu, 24 Sep 2026 16:00:46 +0530
Message-ID: <20260924103046.1709181-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix misspellings in comments across the MFD drivers and headers, found
with scripts/checkpatch.pl using the list in scripts/spelling.txt.

Only touches comments, no code changes.

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
v6: also fix "Temprature mesurmants" in drivers/mfd/88pm800.c, which Lee
    Jones asked for.  It sits in the same comment as the "defult" fix and
    is not in scripts/spelling.txt, which is why checkpatch did not flag
    it.  No other change; André Draszik's Reviewed-by from v5 carried
    over.

v5: no change to the diff; moved the version notes below the --- where
    they belong rather than leaving them in the commit log.

v4: dropped the two Acked-by tags that v3 added, keeping only Matti's
    Reviewed-by, and dropped the Assisted-by trailer.

v2: also corrects "wainting" and "comapletion" in
    include/linux/mfd/si476x-core.h, which checkpatch did not flag;
    "comapletion" sits on the same line as the "wainting" Matti asked
    about.  Subject capitalised to match the MFD convention.

 drivers/mfd/88pm800.c                |  4 ++--
 drivers/mfd/kempld-core.c            |  2 +-
 drivers/mfd/max8998.c                |  2 +-
 drivers/mfd/rave-sp.c                |  6 +++---
 drivers/mfd/si476x-i2c.c             |  2 +-
 include/linux/mfd/da9063/registers.h |  2 +-
 include/linux/mfd/db8500-prcmu.h     | 32 ++++++++++++++--------------
 include/linux/mfd/lp8788.h           |  2 +-
 include/linux/mfd/max8998.h          |  2 +-
 include/linux/mfd/palmas.h           |  2 +-
 include/linux/mfd/rohm-bd71828.h     |  2 +-
 include/linux/mfd/samsung/core.h     |  2 +-
 include/linux/mfd/si476x-core.h      |  4 ++--
 include/linux/mfd/twl.h              |  2 +-
 14 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index e9941da58b18..7f3e312b8f73 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -275,10 +275,10 @@ static int device_gpadc_init(struct pm80x_chip *chip,
 		goto out;
 
 	/*
-	 * the defult of PM800 is GPADC operates at 100Ks/s rate
+	 * the default of PM800 is GPADC operates at 100Ks/s rate
 	 * and Number of GPADC slots with active current bias prior
 	 * to GPADC sampling = 1 slot for all GPADCs set for
-	 * Temprature mesurmants
+	 * Temperature measurements
 	 */
 	mask = (PM800_GPADC_GP_BIAS_EN0 | PM800_GPADC_GP_BIAS_EN1 |
 		PM800_GPADC_GP_BIAS_EN2 | PM800_GPADC_GP_BIAS_EN3);
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index b64729918dfd..47062f876e5d 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -37,7 +37,7 @@ static void kempld_get_hardware_mutex(struct kempld_device_data *pld)
 
 static void kempld_release_hardware_mutex(struct kempld_device_data *pld)
 {
-	/* The harware mutex is released when 1 is written to the mutex bit. */
+	/* The hardware mutex is released when 1 is written to the mutex bit. */
 	iowrite8(KEMPLD_MUTEX_KEY, pld->io_index);
 }
 
diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index eb13bbaeda55..5032eab05bb4 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -146,7 +146,7 @@ static struct max8998_platform_data *max8998_i2c_parse_dt_pdata(
 
 	/*
 	 * ToDo: the 'wakeup' member in the platform data is more of a linux
-	 * specfic information. Hence, there is no binding for that yet and
+	 * specific information. Hence, there is no binding for that yet and
 	 * not parsed here.
 	 */
 	return pd;
diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
index 05d26d92df03..53c57bafea8f 100644
--- a/drivers/mfd/rave-sp.c
+++ b/drivers/mfd/rave-sp.c
@@ -331,7 +331,7 @@ static u8 rave_sp_reply_code(u8 command)
 		return command + 0x20;
 	case 0xE0 ... 0xEF:
 		/*
-		 * Events emitted by all versions of the firmare use
+		 * Events emitted by all versions of the firmware use
 		 * least significant bit to get an ACK code
 		 */
 		return command | 0x01;
@@ -544,7 +544,7 @@ static size_t rave_sp_receive_buf(struct serdev_device *serdev,
 				 * NOTE: The above means that only the
 				 * frame started by third SOF, sent
 				 * after this one will have a chance
-				 * to get throught.
+				 * to get through.
 				 */
 				goto reset_framer;
 			case RAVE_SP_DLE:
@@ -595,7 +595,7 @@ static size_t rave_sp_receive_buf(struct serdev_device *serdev,
 
 	/*
 	 * The only way to get out of the above loop and end up here
-	 * is throught consuming all of the supplied data, so here we
+	 * is through consuming all of the supplied data, so here we
 	 * report that we processed it all.
 	 */
 	return size;
diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 9bce720a0a08..6351aef2d3bb 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -222,7 +222,7 @@ int si476x_core_stop(struct si476x_core *core, bool soft)
 	atomic_set(&core->is_alive, 0);
 
 	if (soft) {
-		/* TODO: This probably shoud be a configurable option,
+		/* TODO: This probably should be a configurable option,
 		 * so it is possible to have the chips keep their
 		 * oscillators running
 		 */
diff --git a/include/linux/mfd/da9063/registers.h b/include/linux/mfd/da9063/registers.h
index 7b8364bd08a0..376c5d330599 100644
--- a/include/linux/mfd/da9063/registers.h
+++ b/include/linux/mfd/da9063/registers.h
@@ -14,7 +14,7 @@
 #define DA9063_I2C_PAGE_SEL_SHIFT	1
 #define	DA9063_EVENT_REG_NUM		4
 
-/* Page selection I2C or SPI always in the begining of any page. */
+/* Page selection I2C or SPI always in the beginning of any page. */
 /* Page 0 : I2C access 0x000 - 0x0FF	SPI access 0x000 - 0x07F */
 /* Page 1 :				SPI access 0x080 - 0x0FF */
 /* Page 2 : I2C access 0x100 - 0x1FF	SPI access 0x100 - 0x17F */
diff --git a/include/linux/mfd/db8500-prcmu.h b/include/linux/mfd/db8500-prcmu.h
index c939c9a1170a..87a28c4f1d81 100644
--- a/include/linux/mfd/db8500-prcmu.h
+++ b/include/linux/mfd/db8500-prcmu.h
@@ -337,31 +337,31 @@ enum sia_mmdsp_stat {
  * @SYSCLKOK_ERR: The SYSCLK is not available in the given time
  * @BOOT_ERR: Romcode has not validated the XP70 self reset in the given time
  * @ROMCODESAVECONTEXT: The Romcode didn.t correctly save it secure context
- * @VARMHIGHSPEEDVALTO_ERR: The ARM high speed supply value transfered
+ * @VARMHIGHSPEEDVALTO_ERR: The ARM high speed supply value transferred
  *          through I2C has not been correctly executed in the given time
- * @VARMHIGHSPEEDACCESS_ERR: The command value of VarmHighSpeedVal transfered
+ * @VARMHIGHSPEEDACCESS_ERR: The command value of VarmHighSpeedVal transferred
  *             through I2C has not been correctly executed in the given time
- * @VARMLOWSPEEDVALTO_ERR:The ARM low speed supply value transfered through
+ * @VARMLOWSPEEDVALTO_ERR:The ARM low speed supply value transferred through
  *                     I2C has not been correctly executed in the given time
- * @VARMLOWSPEEDACCESS_ERR: The command value of VarmLowSpeedVal transfered
+ * @VARMLOWSPEEDACCESS_ERR: The command value of VarmLowSpeedVal transferred
  *             through I2C has not been correctly executed in the given time
- * @VARMRETENTIONVALTO_ERR: The ARM retention supply value transfered through
+ * @VARMRETENTIONVALTO_ERR: The ARM retention supply value transferred through
  *                     I2C has not been correctly executed in the given time
- * @VARMRETENTIONACCESS_ERR: The command value of VarmRetentionVal transfered
+ * @VARMRETENTIONACCESS_ERR: The command value of VarmRetentionVal transferred
  *             through I2C has not been correctly executed in the given time
- * @VAPEHIGHSPEEDVALTO_ERR: The APE highspeed supply value transfered through
+ * @VAPEHIGHSPEEDVALTO_ERR: The APE highspeed supply value transferred through
  *                     I2C has not been correctly executed in the given time
- * @VSAFEHPVALTO_ERR: The SAFE high power supply value transfered through I2C
+ * @VSAFEHPVALTO_ERR: The SAFE high power supply value transferred through I2C
  *                         has not been correctly executed in the given time
- * @VMODSEL1VALTO_ERR: The MODEM sel1 supply value transfered through I2C has
+ * @VMODSEL1VALTO_ERR: The MODEM sel1 supply value transferred through I2C has
  *                             not been correctly executed in the given time
- * @VMODSEL2VALTO_ERR: The MODEM sel2 supply value transfered through I2C has
+ * @VMODSEL2VALTO_ERR: The MODEM sel2 supply value transferred through I2C has
  *                             not been correctly executed in the given time
- * @VARMOFFACCESS_ERR: The command value of Varm ON/OFF transfered through
+ * @VARMOFFACCESS_ERR: The command value of Varm ON/OFF transferred through
  *                     I2C has not been correctly executed in the given time
- * @VAPEOFFACCESS_ERR: The command value of Vape ON/OFF transfered through
+ * @VAPEOFFACCESS_ERR: The command value of Vape ON/OFF transferred through
  *                     I2C has not been correctly executed in the given time
- * @VARMRETACCES_ERR: The command value of Varm retention ON/OFF transfered
+ * @VARMRETACCES_ERR: The command value of Varm retention ON/OFF transferred
  *             through I2C has not been correctly executed in the given time
  * @CURAPPWRSTISNOTBOOT:Generated when Arm want to do power state transition
  *             ApBoot to ApExecute but the power current state is not Apboot
@@ -376,11 +376,11 @@ enum sia_mmdsp_stat {
  *                    been correctly executed in the given time
  * @ARMREGU2VALTO_ERR: The ArmRegu2 value transferred through I2C has not
  *                    been correctly executed in the given time
- * @VAPEREGUVALTO_ERR: The VApeRegu value transfered through I2C has not
+ * @VAPEREGUVALTO_ERR: The VApeRegu value transferred through I2C has not
  *                    been correctly executed in the given time
- * @VSMPS3REGUVALTO_ERR: The VSmps3Regu value transfered through I2C has not
+ * @VSMPS3REGUVALTO_ERR: The VSmps3Regu value transferred through I2C has not
  *                      been correctly executed in the given time
- * @VMODREGUVALTO_ERR: The VModemRegu value transfered through I2C has not
+ * @VMODREGUVALTO_ERR: The VModemRegu value transferred through I2C has not
  *                    been correctly executed in the given time
  */
 enum mbox_to_arm_err {
diff --git a/include/linux/mfd/lp8788.h b/include/linux/mfd/lp8788.h
index fd17bec2a33e..e8c50bd38a8a 100644
--- a/include/linux/mfd/lp8788.h
+++ b/include/linux/mfd/lp8788.h
@@ -34,7 +34,7 @@
 #define LP8788_ALM_IRQ		"ALARM_IRQ"
 
 enum lp8788_int_id {
-	/* interrup register 1 : Addr 00h */
+	/* interrupt register 1 : Addr 00h */
 	LP8788_INT_TSDL,
 	LP8788_INT_TSDH,
 	LP8788_INT_UVLO,
diff --git a/include/linux/mfd/max8998.h b/include/linux/mfd/max8998.h
index 5473f1983e31..ad2ad24412fb 100644
--- a/include/linux/mfd/max8998.h
+++ b/include/linux/mfd/max8998.h
@@ -45,7 +45,7 @@ enum {
 /**
  * max8998_regulator_data - regulator data
  * @id: regulator id
- * @initdata: regulator init data (contraints, supplies, ...)
+ * @initdata: regulator init data (constraints, supplies, ...)
  * @reg_node: DT node of regulator (unused on non-DT platforms)
  */
 struct max8998_regulator_data {
diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
index dabcc0dea802..1d872363820a 100644
--- a/include/linux/mfd/palmas.h
+++ b/include/linux/mfd/palmas.h
@@ -251,7 +251,7 @@ enum tps65917_regulators {
 	TPS65917_NUM_REGS,
 };
 
-/* External controll signal name */
+/* External control signal name */
 enum {
 	PALMAS_EXT_CONTROL_ENABLE1      = 0x1,
 	PALMAS_EXT_CONTROL_ENABLE2      = 0x2,
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index 39fe275a8117..ea9b1a8f495f 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -186,7 +186,7 @@ enum {
 #define BD71828_REG_RTC_ALM2		0x63
 #define BD71828_REG_RTC_START		BD71828_REG_RTC_SEC
 
-/* Charger/Battey */
+/* Charger/Battery */
 #define BD71828_REG_CHG_STATE		0x65
 #define BD71828_REG_CHG_FULL		0xd2
 #define BD71828_REG_CHG_EN		0x6F
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 6191f409de94..e489ca0d55ed 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -106,7 +106,7 @@ struct sec_platform_data {
 /**
  * sec_regulator_data - regulator data
  * @id: regulator id
- * @initdata: regulator init data (contraints, supplies, ...)
+ * @initdata: regulator init data (constraints, supplies, ...)
  */
 struct sec_regulator_data {
 	int				id;
diff --git a/include/linux/mfd/si476x-core.h b/include/linux/mfd/si476x-core.h
index d9e3a322134c..3e924ca4db00 100644
--- a/include/linux/mfd/si476x-core.h
+++ b/include/linux/mfd/si476x-core.h
@@ -94,10 +94,10 @@ enum si476x_power_state {
  * of the @rds_fifo_drainer.
  * @rds_drainer_status_lock: Lock used to guard access to the
  * @rds_drainer_is_working variable.
- * @command: Wait queue for wainting on the command comapletion.
+ * @command: Wait queue for waiting on the command completion.
  * @cts: Clear To Send flag set upon receiving first status with CTS
  * set.
- * @tuning: Wait queue used for wainting for tune/seek comand
+ * @tuning: Wait queue used for waiting for tune/seek command
  * completion.
  * @stc: Similar to @cts, but for the STC bit of the status value.
  * @power_up_parameters: Parameters used as argument for POWER_UP
diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
index b31e07fa4d51..238d9dcefc35 100644
--- a/include/linux/mfd/twl.h
+++ b/include/linux/mfd/twl.h
@@ -739,7 +739,7 @@ int twl4030_sih_setup(struct device *dev, int module, int irq_base);
 #define TWL4030_REG_VUSB3V1	19
 
 /* TWL6030 SMPS/LDO's */
-/* EXTERNAL dc-to-dc buck convertor controllable via SR */
+/* EXTERNAL dc-to-dc buck converter controllable via SR */
 #define TWL6030_REG_VDD1	30
 #define TWL6030_REG_VDD2	31
 #define TWL6030_REG_VDD3	32

base-commit: e3513583cdb959bbf1370edcbaf3c0b014077742
-- 
2.48.1

