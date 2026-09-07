Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EF36C5B2
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Sep 2026 04:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756652; cv=none; b=UEtZiwaiA9uHCAr2+08X9Wuu4CETMW6oVHzV4fwRw7xnN5SAgB7xrG/cu1evhLnI8axAfFpNw6f7kR/Utav0fPdcGw5qgyElZ6wV1gfz8ustP1VG38OGfmqB88AUYrdAUSomFS1W8Rh/nwEoSBd6Tf/kSAHg03KOSGwpeTuW8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756652; c=relaxed/simple;
	bh=d6voXfkReNieZ5RO4Md1uf83GEaMBdM3n8EfD4jIzMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NU8pacIMgG6/4u/InxBkeIqz7+Sc8irUtgEffhBBLGlciUiMbtZS8gWeVOp9MHFEPo++pmNbyNUEAvUv2IuBMjvgfFxkkzmiEZGuLECfOoeAVIa8Sq+g/esOc9ESr3/C4VACSj9xLxKNvPKfpCurljXZ/Gtbo/HOa1bhwq5BuCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+sbWzcc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+sbWzcc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3381067a91.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Sep 2026 21:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756650; x=1789361450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hoyWDJUoJ3kKVWIGux2t8uyL9CpN0JY1+2dUPzxvqy8=;
        b=A+sbWzccYftrqK1uY7tuubi5DnK5+r2lLmxhLdEYHQsAhhO5KdZIW/SwZ3W58fZ9NU
         3ExBkUgjZw57FGulcRHA6/IyOi3EuIjaFV97h2HUIhBwpz4EzFvBR4I50iUqAuNDVlyc
         CF3/fhJz2IjwZ1hIc5g5TqiDF9CfEpYlOM/beXByjKFJLF0Y1VCSXuL4wdRCNnoJUdcg
         XolJewUTsQEaN9qqpVcek45XoGfxjCCSiVs8CGq1+yOl13S6W41cC3+3vp4iExcPj0LV
         KM9NUSpLpKLbIsexyH3Anp/+qtMqBPbDM8joBRYuL5+V7x/RoH//Kpu325mXc3Hglu9z
         LpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756650; x=1789361450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoyWDJUoJ3kKVWIGux2t8uyL9CpN0JY1+2dUPzxvqy8=;
        b=rIMVI8ogRBniMy3dhbQeqdP1O1xbhpZADbj7TcRQ05P0clG+32WOimWcg4T5d99inw
         4GII490JMnzckTN/UPOKW6tecves9b3AAYMLCVGLHfEdmelBSGFvpy1+hKvp3tWhhZSw
         fWZUUPRMM7eMinPIa6og+2RJGPldp8rxCz1SuR/4pM5OBPnVvbDVAIQPUkPI1e/ID6TI
         8nFWfhpVVegeIsUg8Q1zuO1FDTJQWWztBkFFItiW+bJNRNqLtb2NF/WOoStZLnf4jHZ4
         2D7Yopbq60rLfxt/mWcbjNnMB6zs2X1hRGhrmkwF7zu45pqAGT513JpRJVZ/NdhROdmG
         vGIw==
X-Forwarded-Encrypted: i=1; AKwUvBx0oft0jE//AveZ+gMzEwtbTYj50/DMsg7zVm+VQSyztSgEE8aOKDHRPbZZBPlsc/yd9VcEjkeDfN2sRhg9zzn2jA==@vger.kernel.org
X-Gm-Message-State: AFuF++mwr4NqKCpY0Xz86BCy9tHwxb6mPHAulJd8k0OqbyiYmXnXN0Y+
	5AG5rM4g5aL/xVOdqrKyi5nEZz3knspib4jnyUIE3WAiYDEf5bGN6er2
X-Gm-Gg: AYBFou1CeJ63ZHcvsHjQCd4zy1nEUtCsoNjKL+66aJD1KDKtHgjPYdNN6NVwmwHREBZ
	tgSxdMU9D7MolRKBFXvqdzcOAhwfdZd2inLD/8tN4TVmCkSbnd+f5ZqJfYBDkkMzo8C9HH21XVk
	Oe+h5JkCnRVRjiQerR6/m49kudVf+wOXQJhKn/Q7RkwgCxQhMMxawsGZzXWGaIG+mqn1QSahHh/
	CAH9WVRB8GZKZSiiHaJ9P8Frd8PdJ7tkf7NRFc9U3VRpDikxrQ4Bn3YflZnliS29cYqe/RygHzO
	5SIWIfutmqUCTDr2XL8cLfrHJnWPKdyqJuVukyFXBk90PMmDGxKE1nJzX/7cA2zq5+VOHTcQNRw
	aklBWV9p7dWuG5PiICtT3sYkoDM5Inn2z7Q8yru54Hk2k7FkBue2KJ50NwdHFyPh7IP9CGyS7HC
	B97yoX46RofMN1pfsypP2axwF4rPy1EoGyPAddqjt3ArjPIgUdJBS3r04vJ88hrRfcZRTJerZpF
	x9KxOiRv9btng==
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr30428508a91.18.1788756649706;
        Sun, 06 Sep 2026 21:50:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm20361684c88.6.2026.09.06.21.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:50:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] mfd: Fix typos in comments
Date: Mon,  7 Sep 2026 10:20:44 +0530
Message-ID: <20260907045044.12457-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings in comments across the MFD drivers and headers, found
with scripts/checkpatch.pl using the list in scripts/spelling.txt.

Since v1 this also corrects "wainting" and "comapletion" in
include/linux/mfd/si476x-core.h, which checkpatch did not flag; Matti
Vaittinen asked for "wainting" and "comapletion" is on the same line.
The subject is also capitalised to match the MFD convention.

Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/88pm800.c                |  2 +-
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
 14 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index e9941da58b18..aac630322b3c 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -275,7 +275,7 @@ static int device_gpadc_init(struct pm80x_chip *chip,
 		goto out;
 
 	/*
-	 * the defult of PM800 is GPADC operates at 100Ks/s rate
+	 * the default of PM800 is GPADC operates at 100Ks/s rate
 	 * and Number of GPADC slots with active current bias prior
 	 * to GPADC sampling = 1 slot for all GPADCs set for
 	 * Temprature mesurmants
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
