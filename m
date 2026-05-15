Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA77E439019
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837553; cv=none; b=VMoKt9Wjja1+RI5aMFF1DguTXsWYqqta9TQjwM6/7/JbhWJRYVf5qDmHVR6Yc8F8ZEsCuBl0PPgtoaHm86sncfSFJuUR7qlo4T8jYHencQrWss47NN2OTjQ+zroFd44Au3Fk51R8qnWNeOs80AYZXcb7r2MdPg6bvp3A5tyZGhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837553; c=relaxed/simple;
	bh=jwYXw5BAfk6Wwc1RRtCbUDORFsnTrrPUfiaaNQ4rLTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMpX/3U1iGXlPH4PxBTdQ7lMOcFnqwCfGMvxUdduKn4q5/S8hhcBTo6JRK8Gf9gasaNORMfuPsRgSns4jJE3dKwjhflMS0pmmoV1fY3bEgEfH9mVx9kyiTtQsiYH07n7IwQ0ZCMfOqmP7/LF3yKbRyTku6SHo7/swwEFU2S2wgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xt83FyAP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xt83FyAP"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8891febd2so10856447e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837550; x=1779442350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iimSDWzY+fnbg7kLgqgMGtE7NPwiRHmQcfgUGJwUrmQ=;
        b=Xt83FyAPDf5TrPYJ/HKVG67Pb824ZNothXjeajPzelTIbPIU83bpOOY89Cd5Te7gWl
         6rx5qso0DN7nnh6NJTn1lStVBqbpT+jZ3AivoqFziG0iEgAIYou7AsAuGvgZ0HNn/mtj
         BT3cRPlOJ6mFkpU4StEuq43d/vmJQ83NKkXpW8EsxbBZ6hMSOMBNUu72Ia9pHGHpIz+M
         uDCfm2SVdWyfzX/Vy+DIB5UCqKAbd6EHL02GR8UErp6kHhfqt4KDlCi3m8Nu3HuU9b/r
         5prfTK7BUNFHWcCAs0cCA1dJqj0MGiFMIWjiQ60e0rHY+89r1DuAboWjrKh3F9a7JWWW
         kkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837550; x=1779442350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iimSDWzY+fnbg7kLgqgMGtE7NPwiRHmQcfgUGJwUrmQ=;
        b=H2bKoG1b1SG6cBvygEC5ay7iza2GVb3IHl1zcrZ75TobArKeFTPmbeukbwOvs0jKKE
         P6lU/3LPvw7EPvIEPY41KMCdtAl7lVFC0aW7eDFbNlEwdCksTzsWbhccsfXOjrExAfOm
         lxvduWX88DOdArbUZYHs9YesxXUb2h7aWcCzfHjyx/qM1wPDDV01jD28yrlIFTQdTpeY
         6jSenkuCWitALs2dflqE2pnLxC23F6jVdVDO24eaj7uUMld/B+8xPgOV9kIj/hf7BfT2
         LpxueriIKVQ5tI/zx4+gKm53hu/OCHfw2R8Kh5uUNilbjj7+uqm0DuBUUoNljQ69L3oC
         Ob9w==
X-Forwarded-Encrypted: i=1; AFNElJ/ZLGDIYwwNA/KQ8d/ktAALQnb0ixL+5kR0IYnxM/7eze4HjG1lQOUm+LMc9bXqQ5r6Gxay8yaUM7wYmeGSuvHvEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Pbn0eXtQqlZgL8Hrig2WS8ib0zTV1uuijaH4le/xZAfq1yWA
	wpLyEKsCVdc8qD7xZ+/QEwKG87pOuAflT25suCDghXnyJZn4PniLfDvJuC45GPL/zJo=
X-Gm-Gg: Acq92OHWWTevvHKAsjzu+OaoGm3yXCGOzQshe5HyEniUernkuZMQnZX9sS0wTVlanj+
	DD5iTXCGgpRdVYGX8zeWTHP2i8p1ADbPwFEXIvj2gt3L5NJFPVqFD6wsv+1n+8/vxIwuESzNFAO
	LAj0dCY8wM81ZqKiI3yPncARzEe8Bj46RAkQxQmwfCRSFRBduDxmTa/BB+Av6Uu8g0jqPAOKoWG
	IAbQWfLfnEVAqgAH0caop2CS+E6dfJpzpIazdt+nb7+xbInhnV+oaWq+qmvJIwfbJ3uc1Y+MTRl
	JTuc/wJTHCE4FpuA8X/Fc6Ms99hMaH6D/IWmZsuekPV+VLQMaWbzBbSxpZA6DgoYahXri8+VgS+
	uE/Rw5wU5PaBiZ2A2620vs/OnH1hNcSHEDF5NalydMzTbfQn/GY4CmOyvhu/smixgwgU1Z3PgnK
	n8Me48OSD37Hzb4gR9GK7xC3S/GsFocldX0oajDvn7/8t1pflb5V0iSiKI/pJbv/yeX9nlOzHlG
	uvvOtCY
X-Received: by 2002:a05:6512:3095:b0:5a8:d7d4:4948 with SMTP id 2adb3069b0e04-5aa0e7641e9mr929129e87.33.1778837550053;
        Fri, 15 May 2026 02:32:30 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:25 +0000
Subject: [PATCH v2 1/6] firmware: samsung: acpm: Consolidate transfer
 initialization helper
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-1-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=7169;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=jwYXw5BAfk6Wwc1RRtCbUDORFsnTrrPUfiaaNQ4rLTM=;
 b=SlE20QOBytwbp3of5WbmmWd+4J6dOEPga4fPKIXHKFGYRAzADXNBgjaKAL0nDVmeSDb1n4VD4
 62tQKwKN+zxBkKrwsfkML4jNh2/rMvlITenFe86NuddLacLH/IgKw+w
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Both the DVFS and PMIC ACPM sub-drivers implement similar local helper
functions (acpm_dvfs_set_xfer and acpm_pmic_set_xfer) to initialize the
acpm_xfer structure before sending an IPC message.

Move this logic into a single centralized helper, acpm_set_xfer(),
in the core ACPM driver to reduce boilerplate, eliminate code
duplication, and prepare for the upcoming ACPM TMU helper sub-driver
which will also utilize this method.

Note that there is no change in underlying functionality. While the old
acpm_pmic_set_xfer() unconditionally assigned the RX buffer parameters
(xfer->rxd and xfer->rxcnt), the new unified helper introduces a
'response' boolean. All updated PMIC call sites now explicitly pass
'true' for this argument. This ensures the unified helper takes the
'if (response)' branch, performing the exact same assignments and
preserving the original PMIC behavior.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c | 20 ++------------------
 drivers/firmware/samsung/exynos-acpm-pmic.c | 20 +++++---------------
 drivers/firmware/samsung/exynos-acpm.c      | 26 ++++++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h      |  2 ++
 4 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index fdea7aa24ca0..7266312ef5a6 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -21,22 +21,6 @@
 #define ACPM_DVFS_FREQ_REQ		0
 #define ACPM_DVFS_FREQ_GET		1
 
-static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
-			       unsigned int acpm_chan_id, bool response)
-{
-	xfer->acpm_chan_id = acpm_chan_id;
-	xfer->txcnt = cmdlen;
-	xfer->txd = cmd;
-
-	if (response) {
-		xfer->rxcnt = cmdlen;
-		xfer->rxd = cmd;
-	} else {
-		xfer->rxcnt = 0;
-		xfer->rxd = NULL;
-	}
-}
-
 static void acpm_dvfs_init_set_rate_cmd(u32 cmd[4], unsigned int clk_id,
 					unsigned long rate)
 {
@@ -54,7 +38,7 @@ int acpm_dvfs_set_rate(struct acpm_handle *handle,
 	u32 cmd[4];
 
 	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
-	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
 
 	return acpm_do_xfer(handle, &xfer);
 }
@@ -74,7 +58,7 @@ unsigned long acpm_dvfs_get_rate(struct acpm_handle *handle,
 	int ret;
 
 	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
-	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 0c50993cc9a8..f032f2c69685 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -58,16 +58,6 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
 	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
 }
 
-static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
-			       unsigned int acpm_chan_id)
-{
-	xfer->txd = cmd;
-	xfer->rxd = cmd;
-	xfer->txcnt = cmdlen;
-	xfer->rxcnt = cmdlen;
-	xfer->acpm_chan_id = acpm_chan_id;
-}
-
 static void acpm_pmic_init_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan)
 {
 	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
@@ -86,7 +76,7 @@ int acpm_pmic_read_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -119,7 +109,7 @@ int acpm_pmic_bulk_read(struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -159,7 +149,7 @@ int acpm_pmic_write_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -199,7 +189,7 @@ int acpm_pmic_bulk_write(struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -229,7 +219,7 @@ int acpm_pmic_update_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a2cac913b2bd..88a06842753d 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -517,6 +517,32 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 	return acpm_wait_for_message_response(achan, xfer);
 }
 
+/**
+ * acpm_set_xfer() - initialize an ACPM IPC transfer structure.
+ * @xfer:	pointer to the ACPM transfer structure that is being initialized.
+ * @cmd:	pointer to the buffer containing the command to be transmitted
+ *              to the ACPM firmware.
+ * @cmdcnt:	length of the command in 32-bit words.
+ * @acpm_chan_id: mailbox channel identifier.
+ * @response:	boolean flag indicating whether the kernel expects the ACPM
+ *              firmware to send a reply to this specific command.
+ */
+void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
+		   unsigned int acpm_chan_id, bool response)
+{
+	xfer->acpm_chan_id = acpm_chan_id;
+	xfer->txcnt = cmdcnt;
+	xfer->txd = cmd;
+
+	if (response) {
+		xfer->rxcnt = cmdcnt;
+		xfer->rxd = cmd;
+	} else {
+		xfer->rxcnt = 0;
+		xfer->rxd = NULL;
+	}
+}
+
 /**
  * acpm_chan_shmem_get_params() - get channel parameters and addresses of the
  * TX/RX queues.
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 5df8354dc96c..708f6b0102ac 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -17,6 +17,8 @@ struct acpm_xfer {
 
 struct acpm_handle;
 
+void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
+		   unsigned int acpm_chan_id, bool response);
 int acpm_do_xfer(struct acpm_handle *handle,
 		 const struct acpm_xfer *xfer);
 

-- 
2.54.0.563.g4f69b47b94-goog

