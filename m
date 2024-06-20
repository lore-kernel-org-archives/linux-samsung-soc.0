Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A11AB8E2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718882694; cv=none; b=L1dYT5/Or/0oP+T+2sPxjL5mntAgBTn/1RXmcSTEZF6Yvce3GXoWFKXj9sOXFQp4XGUMFTrAQkx2uV0zwhDKbkHIdqBILFdlcKkzd7wGNtp3/kzFo6lf8kZtkwQrUTPdD9gUwUVt89KIUPZCkjRZUm5rQkTUGhL8MNjVaIZNB/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718882694; c=relaxed/simple;
	bh=tW3+FRmdT+LhW6+/gh7jWAg5hDYyMsWs2xc2h3wzP84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQN9f0I9LRO3oEigD4fd3GEc7g3mocVPmpViwFd6DhMSb1zNSZkXW7s4sLWfG67nqsH+MQZiC0oriZHnnMQnXEuBNLJGLdmb71fl4iJ5Hmt1dOthtEjbqwScPmpaQuCmcfl9kWzwkVL9A7zysPGcgtcQy80Pf0Dh/ZdiVcgyTTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCCfvIGI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCCfvIGI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-421d32fda86so9744575e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 04:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718882691; x=1719487491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=987jsaZOwPOhpdxKZBmiiodJXPiBJ4LwBLho6zc60+8=;
        b=SCCfvIGI2xhYTyAGXPhXUywuAwrZgW3fKqO+fj7AwlSeDPalDg7AfQvPdxm/8eLHg0
         Tf0fDDJ0Pu//tOH7Z4w0lH1sbbERiy3i5tpn4Iy0C1IHKcep5ldA843nxeTGysDsC3+5
         9KorXIyXQV8bumGMWioNdzN22vH3AXmMBNP+hFwvQmglJGIK22Rvr9KDo0zs4SikQbao
         eBnmcsK84yMZHoFU7A2mIiJckAGTLWhBHq5/dxvEczAEWZ5DFpMyVAwhzU053W2x4ego
         buB9y457Huxiq1wUdVVSkhwkhp+cxDOWrNE17dPi8tK4Dg/30wFus/Vej/AMwf2u4Ecn
         v42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718882691; x=1719487491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=987jsaZOwPOhpdxKZBmiiodJXPiBJ4LwBLho6zc60+8=;
        b=JNquNloVzeIeP8ZT3T5fuNIBJ7AGDIsSx7gMSVD2trvgQO4nWfSZ+EPXCVJfrNsJXL
         ClwiKObOxqbBcm9P3Jw6fL4jCjhroR1KRNiooItwxiXbQQMHFsX3/0b0iOOyAjwE3wCf
         QZwEDQudQ9HrDsz+uev7QBswHsPD6kYsSlRhosVlSUrcDms+/Jk8jbbW3doE8MvqteEM
         qWG3Ugxma6im/ZVwDhOw0aB0eQ4gHxEWcXOaUy8kgcQCtBonXSDd5Q3wI9k/lIdm/oaJ
         tjlXhUt/Y0PVlzbsRpUzJdxONTK6hdCXQFikyPX7neUztRYt7H2hqlLQbH1pIOAWlzD8
         IZDg==
X-Forwarded-Encrypted: i=1; AJvYcCUvo8u9oTmPE7Ot3SZ2nNIGuzYonSQLF4x/EZqaB3EvjdnHvI0I3ekJBqijLFSl44HE2T5uGILnD6qsUJO1sVynpS87jwU+sFUMehNHdzfjYcI=
X-Gm-Message-State: AOJu0YwWA7rDgjNEbJSrzg/RaCk4IP7qg2xNdfld8I60XfeIx7Yp8IZc
	nrgbgl4jAyyHdPOhLwXskz8neXp0DSUtqbfEsgP38uJjKqzHT0Pubuosnx+a2nE=
X-Google-Smtp-Source: AGHT+IEWYOFclmv+Dob4SK4leA35bYz4CV1ZSG93H0XX8NLBeMikAyl8HGO+4UJqtWZ0FffKI/BoJg==
X-Received: by 2002:a05:600c:4b27:b0:423:b5f9:203f with SMTP id 5b1f17b1804b1-42475079466mr46049795e9.5.1718882690982;
        Thu, 20 Jun 2024 04:24:50 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3647bf3092csm2025371f8f.97.2024.06.20.04.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:24:50 -0700 (PDT)
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
Subject: [PATCH v2 1/2] mfd: syscon: add of_syscon_register_regmap() API
Date: Thu, 20 Jun 2024 12:24:45 +0100
Message-ID: <20240620112446.1286223-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240620112446.1286223-1-peter.griffin@linaro.org>
References: <20240620112446.1286223-1-peter.griffin@linaro.org>
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
Changes in v2:
- Keep syscon lock held between checking and adding entry (Krzysztof)
- Link to v1 https://lore.kernel.org/linux-arm-kernel/20240614140421.3172674-2-peter.griffin@linaro.org/
---
 drivers/mfd/syscon.c       | 54 ++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/syscon.h |  8 ++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 7d0e91164cba..75379e089b6b 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -192,6 +192,60 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
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
+	int ret;
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
+	if (syscon) {
+		ret = -EEXIST;
+		goto err_unlock;
+	}
+
+	syscon = kzalloc(sizeof(*syscon), GFP_KERNEL);
+	if (!syscon) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
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
2.45.2.627.g7a2c4fd464-goog

