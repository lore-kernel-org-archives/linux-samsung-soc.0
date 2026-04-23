Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE117368957
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957785; cv=none; b=AB3yCbF9VgDbBqZ/UxXtkhyauCnS98VIt7cKfpZjhy6soJJoE1xH+/++Q55i7tGMVixPwQL2onNstvNxDkJ+u/LEL8zTudRWHz/MkGo+F3F1zKuLag6R75agb8c9IeE1guTaXWdlcN1N2bSbgO+z6u5JY+3kmCBN6xj0RalqetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957785; c=relaxed/simple;
	bh=WSYPY9iqE8C0uGE7CEj3pZ+0q6CdfpIesN0FucLaxbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuV7eLPKPi3gw7jey90cMelXiItVWzbEuh0gQ8/ro2YmN409K3zaZVAhmLEyDhwN/q+WS5N6riMGQlun5/lb1MOIlaT7vtYXgXz+617uVkslCoIZQpcAXsTITJPegOmtHbEYUtUMFfVpiP7/jHYNaRx7gW3TU2tzovi3YeoIr8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJRwfmCl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJRwfmCl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso68998665e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957780; x=1777562580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpUZgWWTaSsaq1LDjiiiQmFNF42FiKaOIWpuF73h/84=;
        b=CJRwfmClkVou+iN61eap84Bk4iQksZeNBr4g8HGFsZoQlOICETzdqRA65g5rsbAp9J
         SXWFOIPV+gaWkbjTugC842f7zzOA+rumIZDIQ6reuA304iCp3Q8DDJFVbkugrhleBfZp
         u8SExG+1gp9dCVQ3dSQB9Sr6kN907JJs/fV5cWpSV9dTmjAmVfHsIfwJLDRia54Hf15+
         pIyLJX5V6kOtKUEGPMVuZjbsKTLUujymMhZpX+fjcZZwqQtMUWIFjwdHJ8QWTKb1+tYZ
         1xujO9hbgv0yQ97H9JqD/pzlLHgu4JyifuG26r2plVm+x7OXDqgRzHGPoEFDRaBWeoGg
         4UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957780; x=1777562580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QpUZgWWTaSsaq1LDjiiiQmFNF42FiKaOIWpuF73h/84=;
        b=nB5L8ufmqU+p6/8B5dDreYJWdhjpgNg+VuugurlWu5F3Uw+N3a/IFTV/bf85vT0hWu
         nCknKC/3yAr8lXM2ksZsClew6k5CDnV4SwCuO3AxOhueDAXViWtF5viU0fi027ykCeIt
         bCPOm5jjQZ212lVQbxtem3PHbTQM1lf2ufjiyJRShKR+TpE7TgoGt/sRl4zQvfZ0DyN7
         Eyooxzyx88Se4UNgFi3WQfQs1XlSsFzkw/HJk3Ybvd8AYc7VWdnH8Sc3dJIdoyiXJr3E
         5OPup23+I9UNm6Uy6usMy+DCWe++g9Avbs5ziOOfA5yX0fGOGvxB3qhLY2OAdkyVwBib
         vyNw==
X-Forwarded-Encrypted: i=1; AFNElJ9IPhz5tZ0MfVL2jmLgsNX/6ULQgBdSgkWqIrcySP3Kd5fOuhOq3v1dZ5qygUxysX9yS5wXQtjNM62Un616ZuPldg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHDchyvOGn9ujj5z15erYBh1HyE2TraREgSsPZj5udXt7fQ6P
	K2wbHb2X2kXVva4m0DkXAb6Ag5EzO7CFZPp75+ImxYZhbDDmkIVSZRk357mH6baXpeQ=
X-Gm-Gg: AeBDiesLrV/tA7giKfofaM+gCD4t6uK1fL8umkkVpovS3wnQ+XqBofBnMTG7Fqrj0Q+
	nHToBYu0n5iTrknO0NFG399QyCIUzAtmpcp7cTx6S5AQllG99vIOhrWJWNLaVozza1eQGJMv0Vt
	lG4Onk660lzedlLenwBbqSxyWmRri8EValz02a/sLsh6c9o5IDAlf7dLUSdYHXsytllGm5F0F9T
	x60W3y8CsWVq2pbC1lVg4tzv/iV4gckIB7aPLLspJvz+2SHn/oe7aNrR34Lcyl6X6Ag3ot+a3m1
	FASGY6ITXLJ3VrmGgHNj/USlEPrKp63kf+SZJB7K+w7LXxSpoZ6Wyx6mMA4cIPiHrSaOHxokb5r
	g2g7K6DAddid70XGyhotnZmo8WCWGyah2DKxPlP+gj1d+jckK5l59DIndxndMCWEnl7VvcisG9V
	ZLhTItoFfXQJAAqpQOWtE7XlHSWS9Jo9sCb7KOPXRR37Dx+99WRXGQq9lXpYNx2cyqvsi0jjJXF
	aatGghprPsq21serw==
X-Received: by 2002:a05:600c:19d3:b0:48a:55ec:c007 with SMTP id 5b1f17b1804b1-48a55ecc113mr154907315e9.15.1776957780309;
        Thu, 23 Apr 2026 08:23:00 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:00 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:50 +0000
Subject: [PATCH v4 02/11] firmware: samsung: acpm: Consolidate transfer
 initialization helper
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-2-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=6750;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=WSYPY9iqE8C0uGE7CEj3pZ+0q6CdfpIesN0FucLaxbs=;
 b=7YhVrYTYppr/evYne8g7qkOgpDwx34xpUSaTTqSDFBzt4lFPktjNyWA2+EUcMTV5g3RxkXQJ4
 nPs/BdLeqbdD1F05RWvKaogUsG4uavx2s/80A9eAke9FL0aQsWP04bx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Both the DVFS and PMIC ACPM sub-drivers implement their own identical
local helper functions (acpm_dvfs_set_xfer and acpm_pmic_set_xfer) to
initialize the acpm_xfer structure before sending an IPC message.

Move this logic into a single centralized helper, acpm_set_xfer(),
in the core ACPM driver to reduce boilerplate and code duplication.
In addition to cleaning up the DVFS and PMIC implementations, this
centralized method will also be utilized by the upcoming Exynos ACPM
Thermal Management Unit (TMU) driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
index 896fbdc2700e..c4aca61a63e4 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -470,6 +470,32 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
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
+static void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
+			  unsigned int acpm_chan_id, bool response)
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
2.54.0.545.g6539524ca2-goog

