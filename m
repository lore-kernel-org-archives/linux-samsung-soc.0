Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030493;
	b=GUWFGYcQskq2ZFgvXvro76fKnM8+ZtWLBGAVJzOqEwHcCq9A2Hr2RtVXyLQN1MBV6YfQ
	 bYzL0peFJxrxyrmF4qk558EUiFsbhjlFfGnQLvuGaOdvVbTgdbYP3XYkrHzMdERAUmmSt
	 mMRgasBRTwvL0BDVxXC0Sjj3QfNgI7QDHCwGYllOMYsevF/zacxFmr/f1GBeaxJXz7jAq
	 0ODmTSsysjzTh7HCP+K+HlbpKOcqt6dczfB+eDGjnEnHZG82T/9FtFydVl2nds/LxTDMg
	 AXfy+4QHuSCuvfmmnfsIRibi7pZrsSEHdWQFg7WnJdbPNNI5OtptJZTonyihTCt0GJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=;
	b=dGO/rIn1n1fYqc+lrDeZzSfXbldA3EyKsRYe5jBcJ3IkKu5p34ediYAapboUS6UfEH3X
	 jr9HcUUuBM7rfSVclWtOpiBehBX4APdncG0ViIkzmIdK+MPpWUUfW+u+PsYqRdqrmsQn2
	 53KNRE0+FOxdtpfi1da9I6bAnkWAdrOwKxN+PoLHefC+TFTTWgOdNpIQyg95itZUgyufD
	 qCxqaxDtEg3z9Gowv4MeOFp2JCNcE+ZMdNL/sIUymtXUhthjfjDY0VuuJqkDXmczsp1Rt
	 hYFmmGWkVE2OGcM3AnEo4OQGZztHg8ykGUeuLG0cJhOQz8ANCj1Mx/ZKW0cii0Sz3QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LzUTrD53;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152B606A32F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4152B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LzUTrD53
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c411e139259so245401266b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030487; x=1793635287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=;
        b=LzUTrD53xTmjNOWgnHcvaJygR+KjF2DItZ3p93sMEXBPCZIaIvsJ1Dy2Qig2X12JfJ
         kpCZXk7E6oeCVmoePU1KGKvdhaZhzUhfdHQTGi3bFvLxFgsPf0F33TRPBXJFv72o7qU2
         MiuF8kShMypFcIyC7BKusD/6sD5JrWUm3NMpC8ifYvxeJ6whuGzQlSsY/mGDwuXCykAw
         NtaiWn2LuE8HTJEeE4V3wZLPk+IVzgs47/y4TLrc8/sVjhoUa4S5kxpntZf30SKxNcmC
         7Qhs1sohKlAXLouh7eMlUZ3FrhgpOX7FnxtyLm48vtKJOi6WdUWTk1BQzez0iaHDQ/vm
         hkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030487; x=1793635287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULiAXlDs6uzz6Xg5tVgN5dURBE6+891+t2MegFSZRrM=;
        b=PD3kEBec4mM5k7vPMhA39HB867ASKA1Lm2lZVEXTA0nBotNCU6xNzTnbA4sZhgVo/t
         /BtDxw6QI0dWi7GIYSVZO3bpsidH1k0ekpWgLZojNnNCoKSjn0w2baPDVxGjDCFLsjDW
         szPA+VYhWmal6WNoxPPqhX0bTUJvOAPXO0sW5w2xr+FUyB0Q8G5Ls9V5mcJ8cCiMdqQO
         D1+az93Skx+WJQgc3WhvKiOcyur77ht2r4rGrgmnl1SpZcJ9U5WjElMx0Wedgo89yyUV
         q9mSFlWIIj3vC62vvf61auwU2XN+4hjepI8uvu8CzsrRC36Ma41I2b9bKGS0PYJoKbCH
         icsg==
X-Forwarded-Encrypted: i=1; AKwUvBznbLo+kyTUykmqdrtYDG72j7muXyRkuSRMQVpBoLvmdsmLbG83DkLeZZh3Fe2el409loxp5GY7lgg86nqh0yO/mA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKQrQU4dvEJagZoWcC6rnfuFwBNFE+XgOKUkYdthLYcu+lWVEv8
	8YFJVuinWFmgdwJ5B0R4NS/HeuOBNAwD9cqaEDK8UWLTcNjt3XijWsBl/TPJgfim7uA=
X-Gm-Gg: AYBFou0ybJTih28ZuyPIgv/V+n8lQLrxDb2JPGb2cbHZK6tDaPD0ZuOJxNs4d8YXmcp
	DP3EWldp4TtjkgjmuaAExqotDVjvPdnAsvqVJ85pbLopLyy9YBjXFxEpjh0fXAog5OSMBT6Z7Ml
	12D9VT2tPv4x+un9f3w8xh/439hrRzs4biuXu0UdUZjJTrT+fk2J7tfaHojdSYcqcUHfIGqJ8L3
	HMHi/Z+5nLtHCmIzR0HF/CZZtG7whgChhzzWqXUbhXnsUePZsyHuejXYuqIq60mFLg23hHCOCQt
	PTsZeyRUway+GnNHxUBKJtzY9Ant2539cgLwx622NQjYmPqxtMCUzxA5myH2kr6SgHlmbrNlg4q
	+kPHoxRUov/DHEOmsOXGKJoJztb/sklYLFIDVKPZuxoSq3QzOWlDCyIO0HRK7R/JLScp1GqCy5W
	MJ+K4xkj3hnPi7hK+ACPHofRAewGqvtJGKlU5XfrsWDfDrVH+Pdpv6lghzNdF8W2SNHLO2PH4cn
	EB3EwiP3dEXH9qR3yoNO/rErFcVFUA3WxAalrKgFqRSuiOWV5zuIG3LlTJDNpx0mZAqaAVE9Obe
	mlqnmOt+NAiEnbjxzvMgXIhqPCZ3NTHHtw/sDt7qmmlUk61KSsf4P5xmSdu3haCwmp2yZL8fBuo
	or7oUIysyIA==
X-Received: by 2002:a17:907:3e06:b0:c46:8b9a:39ae with SMTP id a640c23a62f3a-c46bde4eb8bmr821391266b.28.1793030486440;
        Mon, 26 Oct 2026 09:01:26 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:25 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:20 +0000
Subject: [PATCH 03/15] thermal/drivers/samsung: acpm-tmu: Fix
 acpm_tmu_resume() error handling
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
Message-Id: <20261026-acpm-tmu-fixes-v1-3-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=5298;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qCVVqc6x/0s6bvl7rY2mwBkC7vhwwi3YsCjDNoVX0oI=;
 b=OXFKufosU6U5StLfJ2EhbNkIwQkfSSKgKLDfOeJRGJ4ZNoF2KUu4DMwUDH5vRQ4Mq598C/Kqq
 CY0W11kdtKqCDlgRvj8x/U86cthK9v74EmXyy00w+8tt0Y7/tsqWzeK
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Unlike .suspend(), system resume cannot be aborted: device_resume()
clears dev->power.is_suspended before invoking .resume(), and on error
merely logs the failure and continues into normal system operation
without re-enabling runtime PM on the driver's behalf.

acpm_tmu_resume() treats errors by rolling back into a suspended state,
causing three problems:
1. acpm_tmu_suspend() disables runtime PM via pm_runtime_force_suspend().
   If ops->resume() fails before pm_runtime_force_resume() runs, or if
   acpm_tmu_control() fails and the rollback path calls
   pm_runtime_force_suspend(), dev->power.disable_depth remains at 1
   with the device runtime-suspended. Every subsequent
   pm_runtime_resume_and_get() then fails with -EACCES, breaking thermal
   zone operations and causing future system suspends to abort in
   acpm_tmu_suspend().
2. Calling ops->suspend() on error leaves the ACPM TMU firmware in the
   suspended state while Linux considers the device awake, so subsequent
   thermal zone operations run against suspended firmware and the next
   acpm_tmu_suspend() issues an unbalanced ops->suspend() call.
3. Rolling back sensors via acpm_tmu_control_rollback() when a single
   sensor fails to re-enable disables sensors that already resumed and
   skips remaining sensors, leaving active CPU clusters without thermal
   monitoring.

Mirror acpm_tmu_suspend() in reverse order by calling
pm_runtime_force_resume() at the start of acpm_tmu_resume(), and drop
the pm_runtime_force_suspend() and ops->suspend() error rollback paths.
Re-enable sensors on a best-effort basis so any sensor that fails
remains marked !sensor->enabled for the thermal core's post-resume
update, and drop the now-unused rollback parameter from
acpm_tmu_control().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 48 ++++++++++----------------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index f9802080acd7..f490551de69a 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -172,7 +172,7 @@ static void acpm_tmu_control_rollback(struct acpm_tmu_priv *priv, int start_idx)
 	}
 }
 
-static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on, bool rollback)
+static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 {
 	struct device *dev = priv->dev;
 	int i, ret, err = 0;
@@ -191,16 +191,8 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on, bool rollback)
 		mutex_lock(&sensor->lock);
 		ret = acpm_tmu_op_tz_control(sensor, on);
 		mutex_unlock(&sensor->lock);
-		if (ret) {
-			if (!err)
-				err = ret;
-
-			/* On enable, stop on first error if rollback is requested */
-			if (on && rollback) {
-				acpm_tmu_control_rollback(priv, i - 1);
-				break;
-			}
-		}
+		if (ret && !err)
+			err = ret;
 	}
 
 	pm_runtime_put_sync(dev);
@@ -539,7 +531,7 @@ static void acpm_tmu_remove(struct platform_device *pdev)
 	 * immediately, preventing clock leaks when the driver is removed.
 	 */
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	acpm_tmu_control(priv, false, false);
+	acpm_tmu_control(priv, false);
 }
 
 static int acpm_tmu_suspend(struct device *dev)
@@ -549,7 +541,7 @@ static int acpm_tmu_suspend(struct device *dev)
 	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	int ret, restore_ret;
 
-	ret = acpm_tmu_control(priv, false, false);
+	ret = acpm_tmu_control(priv, false);
 	if (ret)
 		goto err_restore_sensors;
 
@@ -571,7 +563,7 @@ static int acpm_tmu_suspend(struct device *dev)
 			restore_ret);
 
 err_restore_sensors:
-	restore_ret = acpm_tmu_control(priv, true, false);
+	restore_ret = acpm_tmu_control(priv, true);
 	if (restore_ret)
 		dev_err(dev, "Failed to re-enable TMU after suspend failure: %d\n",
 			restore_ret);
@@ -584,34 +576,18 @@ static int acpm_tmu_resume(struct device *dev)
 	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
 	struct acpm_handle *handle = priv->handle;
 	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
-	int ret, restore_ret;
-
-	/* APB clock not required for this specific msg */
-	ret = ops->resume(handle, priv->mbox_chan_id);
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		goto err_suspend_acpm;
+		return ret;
 
-	ret = acpm_tmu_control(priv, true, true);
+	/* APB clock not required for this specific msg */
+	ret = ops->resume(handle, priv->mbox_chan_id);
 	if (ret)
-		goto err_suspend_pm;
-
-	return 0;
+		return ret;
 
-err_suspend_pm:
-	restore_ret = pm_runtime_force_suspend(dev);
-	if (restore_ret)
-		dev_err(dev, "Failed to force suspend during resume rollback: %d\n",
-			restore_ret);
-err_suspend_acpm:
-	restore_ret = ops->suspend(handle, priv->mbox_chan_id);
-	if (restore_ret)
-		dev_err(dev, "Failed to suspend ACPM during resume rollback: %d\n",
-			restore_ret);
-	return ret;
+	return acpm_tmu_control(priv, true);
 }
 
 static int acpm_tmu_runtime_suspend(struct device *dev)

-- 
2.56.0.257.gf7497c7d27-goog

