Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3FF2F2906
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097307; cv=none; b=tf9O1ZJlqKRdHXNidk3FSkqMJbm7A5X75WKuHBqnCOrHd3qHPPTYUHB/nPhhyfWyM4K+LGE4/wrWxyGb/58RH3umo/SRuP0YNJ1TwftaaxMwxAZqKMpmLAHJ0VfPjq7+SA514rTI+lasdLRQzfJXICSjLcK66UQMVBsFlJkXdHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097307; c=relaxed/simple;
	bh=ou1YbcmDAQuFZIQSBFO3cs4ywO/Xw4Ff3K2ot6JDrmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+CBHmrDzE8bcNrsIDCmWtXOBB0I7JLifrqA+g/PWluLORbOvxcLB70gOHxUfAX71pmA4q0+MKwz8QSNcQqM7i1VnB4ZV4jI74PoZb/J28BH8x3Cd4rKEYFfNhvRNZwqwFHP970mlzAErEl8ucM4m4vBjgfVG/IR+KA+4A3JiTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IC+0ENJG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IC+0ENJG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b7886bee77so4790372f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755097304; x=1755702104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fx9XFYSygafEf4R96ceqLm11HUcCM+e6rJw7J3OQnS8=;
        b=IC+0ENJG99tfIYfJM8DZZ8Ty3oS8+HhgiVa18naSqrg00zGKB/w6WQj/8rrR0gpOm9
         xZGnP2zFWfteCQHXWFG7jkI+WjNDCUvAI+KWoMwRtuv+nJFtza+Hutw0WIzRchrmTXwu
         cMo+LzCua607aoGy/7jpAb9AXj/uhtHvHsteFcjwqC8TkPz1k7Ol7dXwOPP4QzZOa7ry
         PACOrkxRErMkLlTyAx8RIU93dGNLYbPvSEgUrbZxZKaULw9QZQlpY99AjCmkWnxNjMdx
         d17GSNV48f9GstRyQX4+m1xYGcIbjgJF+hk2B+YU5WLzRCyJ2pdfKkRkMn7/9p/zE5Ou
         KRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755097304; x=1755702104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fx9XFYSygafEf4R96ceqLm11HUcCM+e6rJw7J3OQnS8=;
        b=X1aeccPwPDRRtp+Mh9B2fuCq1SAluxDhPVrzHo69+GAq63Z5+ayEnE6aRYwcy1mUnv
         d7OC/++UuwIboHoYik59lXgt+JoOetDUTv0gdLNjBkOLNQBLhl1Y9MvO55Io/QU/z3DO
         JmiLg5vthagqkU0UAO2zbfYU5AEr/kuK7sjH2uPAOBgmHBCNiekSw9kDAyI/M8MiKAda
         OeJPfPuy8RDvd2R5txZSSqmYjRRt/haeQzvOkrOynArE3rO5a5JtMBEDdrh9FgR2gUTm
         RGRdUWjhn3oR+KjxY3pZQ+4mq64qxm6bP8NzntoWo+7T48C7mtwQAEuOGU6A25/0Shl8
         bS8w==
X-Forwarded-Encrypted: i=1; AJvYcCUKoFhC8PjkRHoo6Hy23KUZCiZ8jJxRsDuYk+Hl1RS/12X9xsosXcCKvlq0pn+4E0Tp7vZdqepL5zpE1ouz5MtMOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmmbNLcFPvFu4u//sxwTVIFFf9xMyI1rSh5iBUTq2ATtTtQMgh
	Asnfzt0LwLjbQx6QbLDBYDtX2JngEys5YZ/UwDeGn1yvn4QN1zZCDo7vv65Yaysb9s4=
X-Gm-Gg: ASbGnctMpLcODl5o3TxLrCCcirJFQdLhJsmKGvvHb0H+q1eSQB7+hjCtV6Ic3Xdfq6y
	4fWXc4rYxgJfVzgbPvN0Z3fTk6uNGfH5pErdAyC2WJr2fMjMT/M4sl3kpuTQS66lDKdxKjjPflO
	5FC9ubKV7tpGki++298KFBawVMDlQjsIi/FxBzcQmb2ocIeaA07oIjLD6VZYpHCOEmEbAg4Cb+N
	BTprBwEzcDf1iDJ+JNsx9Npy+BtY78fvye90VbaHjm1Au902VZ9xOjDz/LrOX7XLE0RAytQze72
	vtmTwcdb+DCDIwAvM4L1/l6ub6pUN8ogeC+YIlPLIVJ286R36vMpTPOsdKzOkaFaxELSVO5+PKA
	sKJ83ERayaqgkEuf5qH4m9P4AdeNck++iQeU5OS66essjCgwZf0/W
X-Google-Smtp-Source: AGHT+IHHEppE5c1msSWpvPNGDeJ0L2gbES2G8NQv75tbQblsBVY/pnBdDlsIUFyhes455RLdzsw2Ag==
X-Received: by 2002:a05:6000:430a:b0:3b8:d8cc:dcf3 with SMTP id ffacd0b85a97d-3b917ea1891mr2665904f8f.29.1755097303966;
        Wed, 13 Aug 2025 08:01:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm48402964f8f.42.2025.08.13.08.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:01:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 13 Aug 2025 16:00:46 +0100
Subject: [PATCH v3 1/2] phy: add new phy_notify_state() api
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-phy-notify-pmstate-v3-1-3bda59055dd3@linaro.org>
References: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
In-Reply-To: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=ou1YbcmDAQuFZIQSBFO3cs4ywO/Xw4Ff3K2ot6JDrmM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBonKjTcQVvzkl99cRpsmbJthiLrWXqqpZ2pxhxv
 E6xgE2WypqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaJyo0wAKCRDO6LjWAjRy
 umEtD/9UveN/e7FZ+RSrEZJd+b8j0lGAUqmY+jZ9y05oOB8e3q2cqotrhoIU+LbL6x4ZHG5z5bD
 3JJ2SauGDAapti/Q+7EysYF8Vmhu0+HJqPJRWkAz6dzz9WMZbJ2aSqfUjRFaDpHcbZIJ1apcK+Y
 g/NCg6OwtMMbX5H1lbDCS8MWSukPZktcPe1XQdoeZDD3qFaKFByXjxEpRij+8XPkcvhxe7fKNke
 AKbJ+srnQJ+7gnW/cV01WfCBBo67RbG4TqS+XYEfzGViWHNtdaC9Z8PvTsFBO3IWKYu1XO5jzPG
 yPY1PUwdpSqyozBLT5s/VoHgPtLMBXar106HEAMUsKJ7ca8EPfFsHdCzteIqVmDr5vtY7nidFXQ
 sbK7GeP9izVmlpAJLRrNTsyEdo5qtmCK6bwqkqag2Fjvp30SwdVgEZfGyrUs1TaFIVgWbya+Hn7
 XERWhT+iw3P9oSOnCOnwwOObe/y1m+VswfWshErI/NJAVaZflBcmBVZnOlhdxS7jxTa84VStNOd
 fSnkO0Mpa+/lrw+kmjIffhHmJAd2TRocp7abCIXuHEj6RpoBX+D0OXJXDrGUEWbMu62kSdX4TW9
 DVpEfqNaoFHVjomg2QOWFi2Rc+5uo5NKu+ymiO0FHkkJEST19SRYq9LuKkgmFl9TpK5K/Ybxr3/
 Lb48nF9k7EhW+8A==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add a new phy_notify_state() api that notifies and configures a phy for a
given state transition.

This is intended to be by phy drivers which need to do some runtime
configuration of parameters that can't be handled by phy_calibrate() or
phy_power_{on|off}().

The first usage of this API is in the Samsung UFS phy that needs to issue
some register writes when entering and exiting the hibernate link state.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
 include/linux/phy/phy.h | 19 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 04a5a34e7a950ae94fae915673c25d476fc071c1..60be8af984bf06649ef00e695d0ed4ced597cdb9 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
 }
 EXPORT_SYMBOL_GPL(phy_notify_disconnect);
 
+/**
+ * phy_notify_state() - phy state notification
+ * @phy: the PHY returned by phy_get()
+ * @state: the PHY state
+ *
+ * Notify the PHY of a state transition. Used to notify and
+ * configure the PHY accordingly.
+ *
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_notify_state(struct phy *phy, union phy_notify state)
+{
+	int ret;
+
+	if (!phy || !phy->ops->notify_phystate)
+		return 0;
+
+	mutex_lock(&phy->mutex);
+	ret = phy->ops->notify_phystate(phy, state);
+	mutex_unlock(&phy->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_notify_state);
+
 /**
  * phy_configure() - Changes the phy parameters
  * @phy: the phy returned by phy_get()
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 13add0c2c40721fe9ca3f0350d13c035cd25af45..664d0864c3a5042949cb121e982368fe0a97827f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -53,6 +53,15 @@ enum phy_media {
 	PHY_MEDIA_DAC,
 };
 
+enum phy_ufs_state {
+	PHY_UFS_HIBERN8_ENTER,
+	PHY_UFS_HIBERN8_EXIT,
+};
+
+union phy_notify {
+	enum phy_ufs_state ufs_state;
+};
+
 /**
  * union phy_configure_opts - Opaque generic phy configuration
  *
@@ -83,6 +92,7 @@ union phy_configure_opts {
  * @set_speed: set the speed of the phy (optional)
  * @reset: resetting the phy
  * @calibrate: calibrate the phy
+ * @notify_phystate: notify and configure the phy for a particular state
  * @release: ops to be performed while the consumer relinquishes the PHY
  * @owner: the module owner containing the ops
  */
@@ -132,6 +142,7 @@ struct phy_ops {
 	int	(*connect)(struct phy *phy, int port);
 	int	(*disconnect)(struct phy *phy, int port);
 
+	int	(*notify_phystate)(struct phy *phy, union phy_notify state);
 	void	(*release)(struct phy *phy);
 	struct module *owner;
 };
@@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
 int phy_notify_disconnect(struct phy *phy, int port);
+int phy_notify_state(struct phy *phy, union phy_notify state);
 static inline int phy_get_bus_width(struct phy *phy)
 {
 	return phy->attrs.bus_width;
@@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
 	return -ENOSYS;
 }
 
+static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
 static inline int phy_configure(struct phy *phy,
 				union phy_configure_opts *opts)
 {

-- 
2.51.0.rc0.205.g4a044479a3-goog

