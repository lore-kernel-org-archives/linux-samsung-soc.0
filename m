Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852AE20E310
	for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Mar 2025 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080073; cv=none; b=HHv7ZDfPbcDCw40H7FC4YP9rtnFB8BXAAQG3FmQEfOvQZSE1vqX2aqO9+JYkG+yaKSOdHpP5Ditm1zeMkQRR9eJZMS5CzoJjEnBIojWgyiSLKj+AKAXQZuW7jwBAyd/yAug97wE4q4zz/+pPqOPVuxXwVvf0XAsFWH5t/quVcXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080073; c=relaxed/simple;
	bh=Q/5u5XDcHF4BLyFYlsm+A+d8gAmcv4kixLqtMrXfRJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O68U9qkEvQxuw2kt4UPw07WnwW0AR7RQsyNM7mJKfpQHyicgR9ZnA4TcSSkxm32WxGcfUWCijN2Dad/+KVRN4AkHFFZ/InyobNUIFdPZ1MZhm7FvHjoTZneXUy30qsnA5zvIeRNu7fWeCX92NEI4ySusJ3DTfQAeoS9bQaJPHsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ip2J9jAs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ip2J9jAs"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso192028366b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Mar 2025 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743080070; x=1743684870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qo/hHt79rE3VZLJ7TZ98QyZq8pgpS3gSu0z1hicTW8=;
        b=Ip2J9jAsdTkbogEbPhYL3B4pqvlYDxer8hLMnUFidQSEYf5s+VIv0wpR5JCO7+C6QD
         QS7Veuv99iEmy7p5PYNNnRM4tx0IuwHoAEEKvBeIdlPyqQsZEcoLHzZmjG44c7V/D74h
         7rH3yPZB8hG1XZtpIwaOvr2Wp6nT6f2HktqVzImFAHCgEJVL5bEOhLIUKze91I6gByFm
         g2SGwfowgIBuVFFIrs7NuqgFkkakBTQCCOPAE69OT7J4EeAGQoFGZBVSIU2fjmKZe5qm
         Kz6UpKK7jccXiPp1cwHu1WvrxrAIQ1MWRgR+VovFrChNOgx5+QpZKoElIA8BWUPzh/8Q
         P1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080070; x=1743684870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qo/hHt79rE3VZLJ7TZ98QyZq8pgpS3gSu0z1hicTW8=;
        b=QZTeljG70S8n8KOrJGQom3QIIAECfWNZ/pUFz4Dtie9se59DG9QROAR7LBvj2YjCJH
         rYoRAsezcgGsZy1/5g/VhGussQ/GHPtJiU7XdOOmOC94rfHkDpJWKb9Bm2sSBNbwAd6+
         oleOC4Qw93VKU0IeCUkktq67guBRk1gqDc97/rK4kR9PDaEq183Bmp17U3det5g22WMP
         Z9QhcIGsgN4oZbEmPs5YLyqTTgLOiXdnI6oBSBi+7Yn+5g9vENkCmJBGLti1vxfMkOE2
         i4qKfQ5TydRUaA5SWsco6OP4n0+rwbDOrptXUWHkdZwDB+HkIzRqO0SnB7HI685A19Sk
         5C7g==
X-Forwarded-Encrypted: i=1; AJvYcCWdnDnuYhDkNRbRcvBHlUwzJ7IkovdFBvRaA7CGAkl59aGVupgu06DzlDzCOCJMLVFw1AnBaRqIVEbB72JefgR/zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVjR+bgvU94i05cnFY662R0QoVlHZtJwlNOjsUOjXdpIA2qLAX
	YIGI4dX/6mlhJj0+UQdDENHCO3f4LL6swkIZDp2BheWMkIu7n/199UiK5d0zRbY=
X-Gm-Gg: ASbGncvcMv4VAYtq5tdOeffhDDZdMetDx0SGdHO8QmgdQzDtkOMPds0QOgaYFSQhi16
	wUjn7Z6mYebKhTdLt+K0nYhyLJMp6+5oqPauhabf2sxjSWChSYy9lo9UIz0F07AbgG/1hw7QsGh
	KXWsURMClkO5uqoYyq8l+80WWwhIEdkSz1tzkZ4L1SbjzKdwTZho5ogO7hD8lZ38LTYvS8jejAD
	KV+0t6eqiEW1sIUCITwX1Zk1h51ETtipWsBCWqByynicdqePGG7sh5oe09Yk+aloVYnR4wDevMS
	/5svZMMllgUQa5Wi21vUQ0C6m1L+xM+hwTSz4HTkAorvSFsRrCqRxQYIYc7fRqf5z2FNAuadnJq
	PaQemLyUW6l5SZHCPRzNc0VUlGPEw
X-Google-Smtp-Source: AGHT+IG8jc0XBjcqIGUvrW/gcmDgiKrcGkSXoJocsWny8eep3O/qi28YUXPgBj4BwkE0yMd/1FYIUA==
X-Received: by 2002:a17:907:2d10:b0:ac2:49de:45c1 with SMTP id a640c23a62f3a-ac6fb173f7amr271477766b.50.1743080069724;
        Thu, 27 Mar 2025 05:54:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47e9dsm1205410266b.167.2025.03.27.05.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:54:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 27 Mar 2025 12:54:28 +0000
Subject: [PATCH 2/2] firmware: exynos-acpm: introduce
 devm_acpm_get_by_node()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-acpm-children-v1-2-0afe15ee2ff7@linaro.org>
References: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
In-Reply-To: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

To allow ACPM clients to simply be children of the ACPM node in DT,
they need to be able to get the ACPM handle based on that ACPM node
directly.

Add an API to allow them to do so, devm_acpm_get_by_node().

At the same time, the previous approach of acquiring the ACPM handle
via a DT phandle is now obsolete and we can remove
devm_acpm_get_by_phandle(), which was there to facilitate that. There
are no existing or anticipated upcoming users of that API, because all
clients should be children of the ACPM node going forward.

Note that no DTs have been merged that use the old approach, so doing
this API change in this driver now will not affect any existing DTs or
client drivers.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
devm_acpm_get_by_node it is being exported to modules in this commit,
because there will be an immediate user of this API as of v2 of
https://lore.kernel.org/all/20250323-s2mpg10-v1-0-d08943702707@linaro.org/
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 +++++++++-------------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++--
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 7873cdda127e4f1b6b2febccd054ba27aeaf9b28..74f0ed9b5c0f73393932c46ab6341716745a0df4 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -667,20 +667,14 @@ static void devm_acpm_release(struct device *dev, void *res)
  *
  * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
  */
-static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
-						     const char *property)
+static const struct acpm_handle *acpm_get_by_node(struct device *dev,
+						  struct device_node *acpm_np)
 {
 	struct platform_device *pdev;
-	struct device_node *acpm_np;
 	struct device_link *link;
 	struct acpm_info *acpm;
 
-	acpm_np = of_parse_phandle(dev->of_node, property, 0);
-	if (!acpm_np)
-		return ERR_PTR(-ENODEV);
-
 	pdev = of_find_device_by_node(acpm_np);
-	of_node_put(acpm_np);
 	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
@@ -709,14 +703,14 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
 }
 
 /**
- * devm_acpm_get_by_phandle() - managed get handle using phandle.
- * @dev:        device pointer requesting ACPM handle.
- * @property:   property name containing phandle on ACPM node.
+ * devm_acpm_get_by_node() - managed get handle using node pointer.
+ * @dev: device pointer requesting ACPM handle.
+ * @np:  ACPM device tree node.
  *
  * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
  */
-const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
-						   const char *property)
+const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+						struct device_node *np)
 {
 	const struct acpm_handle **ptr, *handle;
 
@@ -724,7 +718,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	handle = acpm_get_by_phandle(dev, property);
+	handle = acpm_get_by_node(dev, np);
 	if (!IS_ERR(handle)) {
 		*ptr = handle;
 		devres_add(dev, ptr);
@@ -734,6 +728,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 
 	return handle;
 }
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 76255b5d06b1228bb8579d32aaa478036a5c344e..f628bf1862c25fa018a2fe5e7e123bf05c5254b9 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 
 struct acpm_handle;
+struct device_node;
 
 struct acpm_pmic_ops {
 	int (*read_reg)(const struct acpm_handle *handle,
@@ -44,6 +45,7 @@ struct acpm_handle {
 
 struct device;
 
-const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
-						   const char *property);
+const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
+						struct device_node *np);
+
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.49.0.472.ge94155a9ec-goog

