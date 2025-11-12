Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A7233DEFD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762963576; cv=none; b=fHbZHrtEmPfIGGbGCi23xrKcjk4k05dESGZl8T0ho0YVczIhpnG2HOFN6FQhGcLzVM6VtMA+LK7G6z+XyL36hlnUF2tJqNel1ZV/GUyCoqxlYDp+ray0gvsgHAbSCuonSkETOQcYwYs+XqvSG3BAa4q1BeYpPAwBMlLTIdjOliU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762963576; c=relaxed/simple;
	bh=/DmYL+Sj+FG4hqT/OSvBRhos+Di8zc6kpbnkQ+JHZww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsJPh3BHI9X7OL5stO6hn8efBJYiSm2PBB3tRRgdNUGz2Rp2FTnB6PLP20oRnS/ppvpPzOe4ZTw9ZjNRDgHeesd6XTjLp5gIdaGbYaI36SVyNxAxWkAiALWxBjfXuruAhhSPFSmPFSuHItAQ4Hyww62p93J7l0G9/CFY47ydpHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gYHJODyi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gYHJODyi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so11097705e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762963572; x=1763568372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2s7+BrGGG8vXeljE4273Hpn3eddX5sKox/gHy4ML+U=;
        b=gYHJODyiglh6A5V8J+CA7HNP5Jdx1v/QujrZ+o2HP7c6W2M9V/si4C9DvMde9+dC1O
         8PQLj3FW9qBC2W8F8meZ5RD8kC6wJ5YG1wQ3OWElMJwgGdqI1MIpFsMeLnlFXJ5CZERs
         WbMGK53IGm9cYlgNe95aTP6LPfUR+9rAb/KY6Z6Kvf5oiUzYSe6Sqny+o+px1rxHnSHN
         JtEzYh+uEWVDdVTBTGuBAvDN6SxNfIfzzCTOg0TavNHDWFJ098NuSnyfxyfOH9cCz3bG
         kp3GSyOs5AIcNg8BLU1uVTbKmxoqbI2kE1AbyuP8sbEq2lA7dzkk41Tg9LUz2GmM9iCM
         NCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762963572; x=1763568372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2s7+BrGGG8vXeljE4273Hpn3eddX5sKox/gHy4ML+U=;
        b=Wz92hvazmenscywM10Eo57FDaxt0GaEO73wx+7cwCW9zZh8F0q9xOGLiyuVm13bN/8
         jg7vQZq4zsHVK1EXZNZ+kOw/0OP+FRWl4LLWrZVtqEEmi9f9vj5KJuDwkXCKqd3v4TYF
         Bmrx6uBVlr2EkK+7EbPsj3b5cuVYauKtqz9zhM5wdKnIve+hvA9iKhiEpYP3vafDahen
         UQqhjYdhRnq10d8Yd1yJbvuCqn37WCvSsyGFa6eMC7CE9/+EIbKvpcmTZ8DvwcUYJu1r
         tf9exZPwFz+YSBLQ1Mc9pFlaQDZgviNnxcF/537pOHc96jteTf7jXr11lPLCEIsYRrNN
         ytqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7mDv9Od7dMgnONqAtWUvHJ0TJJmSXQG3qNcIPg4qyVcRlJ2tE4Oqq32bWWyHX1P7jMVSyBjtqWa8/Xjz9w5xKRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsWSGgqo0U4lx47HTC0W79Q0ut2oU0bw8icH8cjGguF5+GbEq1
	0R6lSVTqJc5CHEYcM+rOnjkPZjFTcwbWvPTyp6z1/Rv5qoZhqzACIQGAJc6tvvalK1s=
X-Gm-Gg: ASbGncsYJjJGg/0p1V6S0DUzgYCzx+bGIVNgxrdbpOQF3eUabYr+w7l4t8ebhtjiSFB
	kaS7HDuMhKmX0N9Gf+epQX0evF8nJzaSYUoW7pLMATcEJSz1uArXc+nY3bp1aXCRQ52bv0+SjrM
	k88BLqSx+BmWPtOzOWy9dFhdM3PnCNHbgoZNQ5Qw+8YWVkuZuWlkmmugJD0mtBVGYJ4Q4ZRsGvW
	m2gUNByXjlp/3Qz5X/uAI7bnmRhk1zutjGjUbt83PyIr4XRHwBSFmmi6CU5N+O5hthDcu8C9UnQ
	NxLaHWTrPgNPvUGhc1qge900kxtmSx2mddYr+c1rwxPbYw5wMSwF+ZUByHMRCLwsmIlT+FK69Tw
	gl7eB1H3qpKTn16aP5rr8RkVvOOL3e+UXfgTjVYgw56zLjZb2qc5wID9EXdVEpkKztAwcFjkfnE
	AlH9RvZgbEqMxRs9Ajmcyu86MI5YsXqa0=
X-Google-Smtp-Source: AGHT+IHKHrOdUjXjAels/8ReX0ShDMbuZUygUAhmYWOg3ziJ8hrXgoDI7dWK+HfbhxmbPNnO1otz/Q==
X-Received: by 2002:a05:600c:1391:b0:475:dd89:abc with SMTP id 5b1f17b1804b1-4778707d314mr29493675e9.11.1762963571622;
        Wed, 12 Nov 2025 08:06:11 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e95327sm41226855e9.12.2025.11.12.08.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 08:06:11 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 16:05:58 +0000
Subject: [PATCH v4 1/2] phy: add new phy_notify_state() api
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-phy-notify-pmstate-v4-1-717d78009d15@linaro.org>
References: <20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org>
In-Reply-To: <20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3632;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=/DmYL+Sj+FG4hqT/OSvBRhos+Di8zc6kpbnkQ+JHZww=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFLBwgvMkGPlXQnGj7GfKo4tBFrDS/Q9ImctC2
 Tm2ORZ0t06JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRSwcAAKCRDO6LjWAjRy
 uplzD/9HJ7MXRCGkSUZ6+T7w3qXwm7rq5u5AUn7VCR3X0m0loqgOBNiJTmlvB5ct9KPWV1GSgMG
 6ecW7FV1pj/lOXI8QjLy7GzSWcFwFdBgfSmBsC/7g+Vq/BSthcVJu+rTu8lwnLA7vNAUQyCZAAD
 Xr0Zuh/vCm+lUE9mbW8UOC3AUMIHC1IthE8ITWliWfbKfZcil4deKK9mJIYPQTYhzVGfAxqVMae
 i57tRREepnq0aE8nVL2+gIuaN/qq7VxlpP7AdCCmVtK36dwxDXJe+UpynFUgDT8r8gCOEdDluAv
 mW1taJA8xWQtPfKqaR9qbtm54sOliXFmnq9ImhHxKlItHueJKXrRZmD+2hbs0yQ9D6UB/ZehSZa
 l5f04XagJkdEQXcJtQ9kWO/W0t685SDDvSnk3FP/9Zl00BiCM3syKPo42fAuTAu09fT8rVgCszq
 uyG1IoXKEQotqtBwfe+GsBnC/s8b43IjmOqbAWv3YqjF85hXg65XdUUpOfX2DIhY5uBTcgMzM3W
 zbiXl1CKeujw9qkjzz2T8k7KKEnKtPKlC2FygnJD/2F8HlAgFjySHANjgQC+msNOFNDjZJFizfD
 bIbHSFxsyV1A+RmTeNAY5cJbho4VxgPGWIXY4qreNGZ0yfNAlUouqRMrM+DwKTDbpFUqdItEt7i
 a8aIwMqIhgdpiMA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add a new phy_notify_state() api that notifies and configures a phy for a
given state transition.

This is intended to be used by phy drivers which need to do some runtime
configuration of parameters that can't be handled by phy_calibrate() or
phy_power_{on|off}().

The first usage of this API is in the Samsung UFS phy that needs to issue
some register writes when entering and exiting the hibernate link state.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4
 - Add missing 'used' word (Vinod)
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
2.51.2.1041.gc1ab5b90ca-goog

