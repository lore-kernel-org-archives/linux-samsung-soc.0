Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FCB8F6A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718373869; cv=none; b=CizYx7YI/tmWpfkH/yqcIDV55HxEK0FDKKQkmtvxvRz4hzNHyMNTOnRBndODw2V06eCb1yoL/BWHFi1BHgARIHLZlqjU8FlFQSXRbOrgKT+izybbbHfENj2tzmVU/m5UGxx7X/qlBvGqYNfAsBwENUYo7gRqihdMjr6E8er/0xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718373869; c=relaxed/simple;
	bh=qMMrvU4twR7lNWCawzecUp5Ntk8orLtchbhEqufOAA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0//eN4QUERasq+jXE/7rG1xZozdfXY11l1+jsDnANXYQsY1vmn9PgfJnxrW2AJ58iCgzAKF1j6Z14VbcmApeQ7k70rozxOjON7rQ/H+MGYyFpppmDRELZlgOyHukWL3FxxmDB4L6ecwDKNe/h2uHM6AaSVWYhBf/TgZimAewCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fWAUQZ+I; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWAUQZ+I"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-421d32fda86so24790265e9.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2024 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718373866; x=1718978666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyKkZORkV69x1fE5+eUbWT8nvN2FmJI1dprK8SP21F4=;
        b=fWAUQZ+IvtPo2CswrmmQ+6dJJc/dY+ibmaFSSzuBkR2vZmsZaxfNcgafVztTrzA+Ym
         SzxnBlYOz/cV6/ZD0pSMQKEr5FHqnsu5Li5cheBd2ZlLsQWVIbWIGONOJTaYYIFmZW51
         LsJ3NVBnQT/c3XgT7EOlol/BY1wXtXGTvB+3lP9A2d1Q15CiFvRwq7qo6o+sb32h8tSO
         k6Jlkavt6GyyK7ODqbV+TkR6SCex/ULQXQKkyXHi207eK5LC35Bhy/qYwDJYDedIbV56
         PmocFTbJUe2cr/oMNPmAZHPHY9T5hUbPT8TpLGstuVWDlbjfuoHM+31S/m8ng2ZwpJv5
         doUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718373866; x=1718978666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyKkZORkV69x1fE5+eUbWT8nvN2FmJI1dprK8SP21F4=;
        b=JObbOWrWBuFQ1KUNel2mFR210e/QUR32iCOBovGyHV8H0cCOkt2hY36y0nXparIxut
         rnpDZgHp2Kp3n+viHPgSg2x4ndJVavQjz+BUF9RrPKPa+On3jrnA/mm/WOajhz6BLrJe
         SygKnH/YV/if7REzHg2OdxDuDb7eDrUXcOiVdaNLClVi/WRg4+szF1KhYg7aNElKxKJR
         yjGjqwFuxd++Z3dNLhfGG5vsLZv/tHrd6ZvxUQYBYknZs/1vbGifQiyR8ZIc1awosmMe
         AiUpjsq5fivXmml5btnH3HS86cyfvp3+o93Eg1gZkXl1V/YzKO6dUmRA4X8FDaVLFIjs
         jiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq++KKNTIEkuH2kpH5F1yMsxS3wZcUcbXxU6v1xJz5J5RRSYl2MdW4TJVaeGUODL6n7WHzMkJJHnBS9PiNigiuUqFDMmvHR0TJX5g7148XhYk=
X-Gm-Message-State: AOJu0YxHH7uOuXJn+m6AErRo8pXp8wFrt8in+t4jUKErW/DBrlWk7SlF
	VT718N04+r74AOtPB1SETNvXaAU2ub7y1dhxrk6kZpD36FKM9DWDlqGkk2VkG9Y=
X-Google-Smtp-Source: AGHT+IFzf6VHjgqhRiiyHY4k7GkfYK+2/io9UJpuZFnNRyOb0mR0N0Mlu1xntAskwHBVAR4ighQ1iQ==
X-Received: by 2002:a05:600c:3589:b0:423:6b7:55de with SMTP id 5b1f17b1804b1-42306b75a55mr18140005e9.6.1718373866025;
        Fri, 14 Jun 2024 07:04:26 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f5f33ccesm61310525e9.3.2024.06.14.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:04:25 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: lee@kernel.org,
	arnd@arndb.de,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 1/2] mfd: syscon: add of_syscon_register_regmap() API
Date: Fri, 14 Jun 2024 15:04:20 +0100
Message-ID: <20240614140421.3172674-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240614140421.3172674-1-peter.griffin@linaro.org>
References: <20240614140421.3172674-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The of_syscon_register_regmap() API allows an externally created regmap
to be registered with syscon. This regmap can then be returned to client
drivers using the syscon_regmap_lookup_by_phandle() APIs.

The API is used by platforms where mmio access to the syscon registers is
not possible, and a underlying soc driver like exynos-pmu provides a SoC
specific regmap that can issue a SMC or hypervisor call to write the
register.

This approach keeps the SoC complexities out of syscon, but allows common
drivers such as  syscon-poweroff, syscon-reboot and friends that are used
by many SoCs already to be re-used.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/mfd/syscon.c       | 48 ++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/syscon.h |  8 +++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 7d0e91164cba..44991da3ea23 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -192,6 +192,54 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
 	return syscon->regmap;
 }
 
+/**
+ * of_syscon_register_regmap() - Register regmap for specified device node
+ * @np: Device tree node
+ * @regmap: Pointer to regmap object
+ *
+ * Register an externally created regmap object with syscon for the specified
+ * device tree node. This regmap can then be returned to client drivers using
+ * the syscon_regmap_lookup_by_phandle() API.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
+{
+	struct syscon  *entry, *syscon = NULL;
+
+	if (!np || !regmap)
+		return -EINVAL;
+
+	/* check if syscon entry already exists */
+	spin_lock(&syscon_list_slock);
+
+	list_for_each_entry(entry, &syscon_list, list)
+		if (entry->np == np) {
+			syscon = entry;
+			break;
+		}
+
+	spin_unlock(&syscon_list_slock);
+
+	if (syscon)
+		return -EEXIST;
+
+	syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
+	if (!syscon)
+		return -ENOMEM;
+
+	syscon->regmap = regmap;
+	syscon->np = np;
+
+	/* register the regmap in syscon list */
+	spin_lock(&syscon_list_slock);
+	list_add_tail(&syscon->list, &syscon_list);
+	spin_unlock(&syscon_list_slock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
+
 struct regmap *device_node_to_regmap(struct device_node *np)
 {
 	return device_node_get_regmap(np, false);
diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
index c315903f6dab..aad9c6b50463 100644
--- a/include/linux/mfd/syscon.h
+++ b/include/linux/mfd/syscon.h
@@ -28,6 +28,8 @@ struct regmap *syscon_regmap_lookup_by_phandle_args(struct device_node *np,
 						    unsigned int *out_args);
 struct regmap *syscon_regmap_lookup_by_phandle_optional(struct device_node *np,
 							const char *property);
+int of_syscon_register_regmap(struct device_node *np,
+			      struct regmap *regmap);
 #else
 static inline struct regmap *device_node_to_regmap(struct device_node *np)
 {
@@ -67,6 +69,12 @@ static inline struct regmap *syscon_regmap_lookup_by_phandle_optional(
 	return NULL;
 }
 
+static inline int of_syscon_register_regmap(struct device_node *np,
+					struct regmap *regmap)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif
 
 #endif /* __LINUX_MFD_SYSCON_H__ */
-- 
2.45.2.627.g7a2c4fd464-goog

