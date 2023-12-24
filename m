Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE4110A38
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDhJ491Z"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so33669266b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432684; x=1704037484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYWVVwNT2dCuI83RazEsoLGBNSqJFygjoBJweO/IYP8=;
        b=iDhJ491Z+QFapHKK/HplwJ8N4NHndEpV1XwGGgidVG9Pykfi8vLn4J0yNRSqusZasG
         ip9y9HNqj4lsuv2bSzgSzrhGpnbn4eTr6AOGWHzbB9SG1ukEfg7MMuPLCdpKZbkKjd7e
         ZIyhE5BtHwchjDX8KFkyS0ya6bd53VL+VDWiAcUhZvGGuQRHo2NZA6Wfa4CpUAgCk/io
         9tCXP4rS1wwN6sGUOuKp7YTO4iIa5CvUQXZPQfLCDB16lM0I4G8w6Bqv4chL0Lat1o7u
         G6s7uXWXtMtR9p3H6GKHkkArmUKAmDGFK7W6co3Z/bR3g2W9IWMyEDGY2U3EP7HejeaM
         RuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432684; x=1704037484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYWVVwNT2dCuI83RazEsoLGBNSqJFygjoBJweO/IYP8=;
        b=ThQMhXI8juXqG9QQE5xS5e1RFlkQW7OrwK9QIIZcTY9coPozmDOJyLqle4tGoUOXcH
         A8gXPVHYqXyVtta3mKMFG2wS4ovK1QJqfBp83JoT4R8sftzUoPu/6Q1g/PzbfuGpoz14
         0PkDcPV6ly1h3PxCTSrumxY+ogy+GaznLrqFD7Ekec0SleGdkpZd2vhQoGdz24pJAxCC
         wR/ND+aKpS1yu0lNyYBdDKLT/aFWShKtBaTg0a6RpN0Z4yHQH6mAvlLoHgueOc6MXfnV
         uTq9mvYDfuK6Xhyh7EzbRfecQLHb9LsfFLZrhZtPV8PwQDHWNfIKXl+ovJcdDD4R6iF0
         26WA==
X-Gm-Message-State: AOJu0YzCA3LKrAp6iGKCCBZ8AoFo9OOEQTkUq/PW1AXwPcUp4pssK6Dy
	+Oe+rbIxCTf9p9bkdOg6T6Uq9e20HPLr2g==
X-Google-Smtp-Source: AGHT+IGNlruZWqXLTaJtVlfHZVC/VuMeP2kusBEjBvlaUUeA0fVFpFIiDFBxGGsHqthqqGICGwy4BA==
X-Received: by 2002:a17:906:295:b0:a26:9642:ab54 with SMTP id 21-20020a170906029500b00a269642ab54mr1220682ejf.117.1703432683825;
        Sun, 24 Dec 2023 07:44:43 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:10 +0100
Subject: [PATCH 11/15] media: s5p-mfc: constify pointers to
 s5p_mfc_cmd_args
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-11-a3b246470fe4@linaro.org>
References: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
In-Reply-To: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MTZFZLeg0VW864VwU7y3amI727wpiwg5E3bmaHSv6cE=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHXEAOncCMIsdC1VaVpZt1JfMturxIK/tTBm
 wFo7Fau2ruJAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhR1xAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PX+wIP/2fT5qxZh4FG5nYcP8WZW+1P0kJCJc5MhL36+cZ393geepj
 Sh6KJ1Zt44VvNfUOltoydyIVjvgXcFeIsubUzoZsDvRBn8PIIyoqGR3Q8FPViPu3sC98bEpvVsT
 gSfOkV6oEPX3LDYYH7IvdmfL1xZfoUTtffGuMZTukoDcpI5+4RHzpuucIgpu18nKWDNmTxmrU7A
 AGRFre5ZRQsQ9650mRbBCs4MN7MpZWOrFYmw+AdqD/m8aYCBzB9vYTdg+MZyXUK459OuZ8qeQph
 4DSo9FuiDpHWeqlx9AzNWEnj5wy3NZnlDCQ5CtpQpIlHSYJZhdvZPBfSvB1IL8GaiXKOSoqXhGb
 yDJMsqM3HRJo/k+WmWWxXK7fA+wqd2OdS2bInwyMgggHxiBC1C45/Vx+oNhVrfqsBAw41AqVztj
 e5s4aTcA3Qzfu1sWmVP30LrdB8UkZjnwaTRgUIe+CWyFjilboh/4ryugE2BuOJiylV8Wr0uGoFI
 Qnvn6vVU+VSg5/q2dsc0HPq64EILzkawT10T8IPQa1atX2lq2hUyEwzQDAZYjXGs0kkijXYtC+h
 drvW1+UCb8GzZbtbBexORSxoYeFjR1OoDncK40IyH/8bLq68/EHyqh3t2whJQBxGfyvGhSSw0AA
 eBG6qyKHKzMN+QCwv7kUGwPBYZ2HvysTHc6vM
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

In few places functions do not modify pointed "struct
s5p_mfc_cmd_args", thus the pointer can point to const data for
additional safety and self-documenting intention of the function.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.h    | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c | 2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.h
index 945d12fdceb7..172c5a63b58e 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd.h
@@ -19,7 +19,7 @@ struct s5p_mfc_cmd_args {
 
 struct s5p_mfc_hw_cmds {
 	int (*cmd_host2risc)(struct s5p_mfc_dev *dev, int cmd,
-				struct s5p_mfc_cmd_args *args);
+			     const struct s5p_mfc_cmd_args *args);
 	int (*sys_init_cmd)(struct s5p_mfc_dev *dev);
 	int (*sleep_cmd)(struct s5p_mfc_dev *dev);
 	int (*wakeup_cmd)(struct s5p_mfc_dev *dev);
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c
index 1fbf7ed5d4cc..82ee6d300c73 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v5.c
@@ -14,7 +14,7 @@
 
 /* This function is used to send a command to the MFC */
 static int s5p_mfc_cmd_host2risc_v5(struct s5p_mfc_dev *dev, int cmd,
-				struct s5p_mfc_cmd_args *args)
+				    const struct s5p_mfc_cmd_args *args)
 {
 	int cur_cmd;
 	unsigned long timeout;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
index 740aa4dfae57..47bc3014b5d8 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
@@ -15,7 +15,7 @@
 #include "s5p_mfc_cmd_v6.h"
 
 static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev *dev, int cmd,
-				struct s5p_mfc_cmd_args *args)
+				    const struct s5p_mfc_cmd_args *args)
 {
 	mfc_debug(2, "Issue the command: %d\n", cmd);
 

-- 
2.34.1

