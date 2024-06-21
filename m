Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F7172BCA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970953; cv=none; b=sywitFiRYRfiWe6JmIGGQBbBsw1TxNMxK++EetE3vpGpXxUuldzxlYz312Hvx9jEg9yGT2jZrNRmYde2kf4jZCnSIGDWrDIztj9xWk+oXMg7HH01G+CdzZZ6Mh8TC/XNJJIS11AJzIl/mfDGqb8CJtNhVmRgmi/2etrR8vJMn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970953; c=relaxed/simple;
	bh=aWiQYGEg2y2EGgR7XhKaODeG7DKNuY8R0pJ3wGri6rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+20YUJO8vwkmGK19GIBIVEjRcqRnQb8ozQby1ZyrN+caJUEV6praK3sKFQvlyOsd8tJb1dlcKdLgdpohdd/nKe9cJromgPFN5U0PCqP3H74pnfXhx+rG2+PblGMiigavmXh/Wxf7buuGqqZv8WzABlMgOhLnpC9adyjizPsu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqch0rhO; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqch0rhO"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec50a5e230so4701561fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 04:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718970949; x=1719575749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyW5+VbIADwYbvLjE/DRg3OiI2Mx9SABmjT69Y7dUKk=;
        b=oqch0rhO3u4u6o/EaulwX73x5xxypsTs7TScaHCGign1oBEOci6osYyG94fG3t8LDX
         BumsSC+/IyhLVz5OpaNN1eBH6fxfRaiCK8Sx8ou6VKyrzhiCcVHeYC97Uo4Vw9SI2BN2
         f653br/CMHQe5AqYNiPjzPJPsnSxOQUhK7MICsGbIiEu2fpBUIsThZdhvSphFPY8FZga
         svXg0sFtKfmiCjzq0J6bQ8JCcRVEP6FXmW45MAAKYYwlXqTC+p/JzuoGjAeU7sgdfqaT
         U5/B2e0xHQ/IwqfZsmt6wHD4CjnBATVN9FpU5VyUedEK0pDhviy7f63I+cKdJ7zXeiXu
         tHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718970949; x=1719575749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyW5+VbIADwYbvLjE/DRg3OiI2Mx9SABmjT69Y7dUKk=;
        b=vHmXUjzzZpJrNdTuTzKml6ixqcngBwgfi8j4GoKftAn/IlnxEyuy8VlLnY/kipBJab
         NHCjDejJnaJXfe1WoCy/JW2itO0cXXGpg6MvJqMQSS4igkSnPf4Cb+mD55B8CqWr1TuK
         fbSnWW4ZqntTWcyvEIa3xtTVgl/fqtkXNXzpt+Vwfz9cVhVLl4kphsIMfKMO+dO78xdC
         WPGxsgWUZI2cyvFnb9h1v5ClLZt+nMk7HsMot2ICHoQAOU9c8drzMoyuc+XiJn3aQZAc
         muNXPvfTnFuDDGiBGaC4JzwzhF9TglO1afTugrWbG7RHfVPVO0oUzDdau2xjeWY9LNjV
         XOXw==
X-Forwarded-Encrypted: i=1; AJvYcCXGpsXEi447vB5eJyGy3VPp0eHUbsoFkyodOxK5RXDBUpe353y97dQVjvE4WgARMCSB2ZGhz800MdpyaPOGzap7wlaOsPppF2F2ir8gubgH7yk=
X-Gm-Message-State: AOJu0YzyxHTUi+jpFL/aCULBopi5rFglXbpXD7EEaB3G8Lq917ufiYnB
	7sMvMKspxjvj2bJnn4HgZy1qAiEon9PAWgeFGT79fgq1ac9T0efMpqk8p6HWnlA=
X-Google-Smtp-Source: AGHT+IEK99mzL+zVK5iwlAts85kqCZbOM80etX+4cRw1BqvCAihCDCG8nvU55FlE1jsMiBzfFG2c3A==
X-Received: by 2002:a05:6512:e98:b0:52c:cb97:ebba with SMTP id 2adb3069b0e04-52ccb97ec44mr6156327e87.24.1718970948984;
        Fri, 21 Jun 2024 04:55:48 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208dcesm60386725e9.31.2024.06.21.04.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:55:48 -0700 (PDT)
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
Subject: [PATCH v3 1/2] mfd: syscon: add of_syscon_register_regmap() API
Date: Fri, 21 Jun 2024 12:55:43 +0100
Message-ID: <20240621115544.1655458-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240621115544.1655458-1-peter.griffin@linaro.org>
References: <20240621115544.1655458-1-peter.griffin@linaro.org>
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
- Move kzalloc allocation outside of spin lock (Arnd)
- Link to v2 https://lore.kernel.org/linux-arm-kernel/20240620112446.1286223-2-peter.griffin@linaro.org/

Changes in v2:
- Keep syscon lock held between checking and adding entry (Krzysztof)
- Link to v1 https://lore.kernel.org/linux-arm-kernel/20240614140421.3172674-2-peter.griffin@linaro.org/
---
 drivers/mfd/syscon.c       | 48 ++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/syscon.h |  8 +++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 7d0e91164cba..33f1e07ab24d 100644
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
+ * device tree node. This regmap will then be returned to client drivers using
+ * the syscon_regmap_lookup_by_phandle() API.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
+{
+	struct syscon *entry, *syscon = NULL;
+	int ret;
+
+	if (!np || !regmap)
+		return -EINVAL;
+
+	syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
+	if (!syscon)
+		return -ENOMEM;
+
+	/* check if syscon entry already exists */
+	spin_lock(&syscon_list_slock);
+
+	list_for_each_entry(entry, &syscon_list, list)
+		if (entry->np == np) {
+			ret = -EEXIST;
+			goto err_unlock;
+		}
+
+	syscon->regmap = regmap;
+	syscon->np = np;
+
+	/* register the regmap in syscon list */
+	list_add_tail(&syscon->list, &syscon_list);
+	spin_unlock(&syscon_list_slock);
+
+	return 0;
+
+err_unlock:
+	spin_unlock(&syscon_list_slock);
+	kfree(syscon);
+	return ret;
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
2.45.2.741.gdbec12cfda-goog

