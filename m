Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C78A146A8D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905434; cv=none; b=EgttViPDBu4A65x8e8ICpOsQltuLRG3OlxauWH7oE5KlHi6SH+7ZAc2Vjjyeu7oecpNJ+YE9IK5VDl9HV/97yHxY1UnHTR2HrPPyFCGt7BECdGpSujTDt4nMjwTD5dm75cC4IQsdx1rHet5kDYiCY7Vccb4zrnsOOciC/ZO/cOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905434; c=relaxed/simple;
	bh=PMGdNnxS+u6EuMG3EBK442Fl1ePQX3CaF6GlOMeIhVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IedbQWBwG7TOl7Csfx2Hld35omByvai2LLa5m8BNsjd1W+zyxoN6wG01m7S/x3rytrBMmnk+S36N2x8w/AfCkPooJsXfztgQ3LplqcyWPMdb+gvQ7BmgjNRrd7M3isI3VAVJQ2uqmVtXLDoUM1jXihpYRD+VBErVKR5XHsmsVkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+ha/ERu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+ha/ERu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41a5b68ed4fso21757185e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905432; x=1714510232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/GoVzExBpe8QxX9A9OVe1Uavi5SgYLv/AxKVNUl0KE=;
        b=D+ha/ERuZPze70axK+sIkgjvR2RQnq886MFd5toHxCObFk5521BzLv3dedKHxmIBkJ
         5o7Be0dzbDoIKoWL/mvrKwc4Hd9gsrnCmMTn29ossR1F6+TcvRx2w4KG5BGYB/rZRd3s
         +t2N2N2WB3IZpO2mOzIX7I92LUgSN6A/nJ1l7rW8FaEB8qGov03UbjZkpPEyy7q8OA63
         AlVF/xLAuWThWIRtLJo6cCAtAsRGaJP0elhUEqOEvxcaylIPLLqDvKFn/cqUavU4ZF9V
         Zu6BNQam9ZHm8ZyaKA5h5g5XN8f5LB1/gqOJVeCvO0jTcau17xvgCMnQh7zE4+OrIZQT
         yuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905432; x=1714510232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/GoVzExBpe8QxX9A9OVe1Uavi5SgYLv/AxKVNUl0KE=;
        b=KkeFcEPx0PnrB7hs1xch9ZWx33oU/NilLLRDMuUcuzOV/j6Y04hNoeXocgQYHvPEol
         scpwuuClVRx4kqUuGShJY1Q4cadvukLHmgWr0s0q173Vy3EIXaoTOF25sAOODPgeAGuh
         VkSqttaNEYYm0MA+G5+ulO//kI/PSi/wwYWb5Js2fJ29b2w5Smma4KmKlNfVqiQ/3CqV
         9nRedswGye8J783h/jyN9mGfnpudX8pB9EpsVCbYUB+SoUiBq2BLfcPMoMbjQ7PdLiv+
         V5YFon2mVgWjZi1YuLWIyAx8vtTi/agQBxTJAPRQ5XsOTBu6rYEHI2DX73/Qaf/06lsR
         opNg==
X-Forwarded-Encrypted: i=1; AJvYcCWPDSjFrkl6vyy4JXlU77dcR//ZPpBWi0BNsgN7Er+oTdV5hzuNKbTfNEa6/ktTZ/in+r0ohijrfEhlaShd8549uR7CkBzQNDDlywEj7QyXb24=
X-Gm-Message-State: AOJu0Yx0Hm6bstXiSn0rUFatdHfv1D2tzzO8zD+EmF7Ot3b4ydVqscmY
	7Tow41Oh2Qg2nd2P/qowvcf4vuhLhwL60Ty5u3OVOG5UtLTlrfK8xvHfuAGdj48=
X-Google-Smtp-Source: AGHT+IH6z+0zlU25050wMvD0vuxotNnh43coyHQIMqF5YmCpBQNXBCfzRnt18Ll4b9pvC+KY+bIGQA==
X-Received: by 2002:a05:600c:4590:b0:418:f991:713f with SMTP id r16-20020a05600c459000b00418f991713fmr263623wmo.23.1713905431899;
        Tue, 23 Apr 2024 13:50:31 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:31 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 10/14] scsi: ufs: host: ufs-exynos: allow max frequencies up to 267Mhz
Date: Tue, 23 Apr 2024 21:50:02 +0100
Message-ID: <20240423205006.1785138-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Platforms such as Tensor gs101 the pclk frequency is 267Mhz.
Increase PCLK_AVAIL_MAX so we don't fail the frequency check.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Will McVicker <willmcvicker@google.com>
---
 drivers/ufs/host/ufs-exynos.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index acf07cc54684..7acc13914100 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -116,7 +116,7 @@ struct exynos_ufs;
 #define PA_HIBERN8TIME_VAL	0x20
 
 #define PCLK_AVAIL_MIN	70000000
-#define PCLK_AVAIL_MAX	167000000
+#define PCLK_AVAIL_MAX	267000000
 
 struct exynos_ufs_uic_attr {
 	/* TX Attributes */
-- 
2.44.0.769.g3c40516874-goog

