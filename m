Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7DB1C84D0
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Oct 2025 08:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759738037; cv=none; b=kqO1ztcQIMaAi+SUYHOsN+wlFjOnCVMwz6l+Fr5GsNAIjxxRxeWym5Bf5XTmtoRyZuG9kV79P4NAaAWHcA1xD+klsqZNh5ZdowDgO1ImfIB/hpFIpJK+cwW9X3KSus8Wwvdgwe4HXhntL69Bcc7eTB2ZPhejAKSfZC2UjAtRStY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759738037; c=relaxed/simple;
	bh=BeDMN8uWVJklyLJj+1L2d060Z8oyIimOZuMRkiyfk5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kEHu+kBhOiZBE3XwGc7LqdGwZNorRt39cA8exaE8cbYHYYfjbLOUjOrbFbii8cCgefvU6ZKPnvvN6ze+CNBG5Nmr/ANnUk6Za0tae2wOovtfI/dD5uyTciFyJVp3FDNoNykRPbiECaH3wUDPvMffPcJ4GfcEeRru0uZLiem1EeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q8EqqQnG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q8EqqQnG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3e44f22f15so679538366b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Oct 2025 01:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759738033; x=1760342833; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qerrj6UX/Z0xW9m5oFGqvhu+d9Lea7yfQjzYQpDbWQ=;
        b=Q8EqqQnGHw2OXBYfLaTWVJdNOT9xt3d34i4puk6Hycq+zg2cwBTRl0NK+1P01Y46cB
         BK7A7FvnHK2J6zKcovlK3DND7OZLXf3UBpGWXtc1vmu4G8y3hTjWPia1hAZBCA4WARS2
         SHHaBJStjAcM+TCVw9Qn0t3jWulHCx3rEjr173r6+lIUUdxnWtqdDguE0senQaBY+h5V
         0D6IKhlLgw864dKilPn00R9ANuIqfN58Yctn24poQ8aEdSHvJ0uGx8nLJpygmAd+wOIr
         WlwCL0PmvXuan6ef9Jxg0x9CF46ImmnyaUdTQZL2RZc/o6NkrCg1PQK+VCWm0KQgn2w0
         g6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759738033; x=1760342833;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qerrj6UX/Z0xW9m5oFGqvhu+d9Lea7yfQjzYQpDbWQ=;
        b=wwGBid98BrIFeU0U6TS3HlFx+zohYPucSRTgY7u8sYj11SZrBGSKdwfhLH7vuljEFc
         kqSzBHm7fmMNJgQEhnlWWjIRAeCwYMcwkP6pb0wZqjUKoiNMr1udwLc5xNBi/SxyWaUK
         ewF8gsIDA9PbHDdUnOZFuR2ccHp6aPSUNryVIHMIsszQ1XBB0uvRNRIN+t/YJ5qh9Ydf
         5Vql9JiyNJiH1qbUBzhm/XcSG6KSacEQl3/fmduoTWldm4gwHEqDHTdBA2v/h7w7h/qk
         CSnGqnDFIgJwg4qeC3SXtzSlhHHo7tGm1XXThApn8Szp75nzyfNb2nxw6wvIOR6bwLXB
         oYQA==
X-Forwarded-Encrypted: i=1; AJvYcCUzCgJV6kcm2tGU+bTkh2n0nuMu7TblSgQaqUukjjWk+CCb+Tn2SsNzLE8IL4JPGzTj3xso7nRN1nF5pARt8QU6yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7Vz3bcoNFhzrKWtnoz4FcfgOa3LqTw3nbWSroSrch20+OlAQ
	2LVRVlwoFi0yOGDfsdjqTP42RPmVdvNcsrrZ3xVSuBd9HEGj270EA4DKCmVWudyu1NM=
X-Gm-Gg: ASbGncv7QT8IUZ+oLyBO8Z2tw3tkOvEmy67HYdFtsdFxvIZ1Q/xcgitDBdB3UOxmbzW
	vUDCPv64Ua2zVia5Ug/ZJXdZC74A5t/LiRC877vfxf98s6mbgDQyliI9IdCBp2tsvYQGM9V0C9m
	Rl7I6F9OZrcLYKtnvFMF6oA7aiaZs7zmUOVUhnI9Kqy3dRiX/TDUWhPBvzDEok7f0hqg/QgpLD9
	XjdyWiA7tSimJSNDxn0MUTFPAqWrJW7jlvrWRRA/xjqezlGGJp6Z1NeRe43qh6Fp8CaP9xu+heX
	Oe/YtaZ+71D5X7aFAuIsqrRgk+o07XYkduSjs6y4Rx8mEQJ3pDmJQkt6gtpW/rKPOXJflU9yoEI
	mDeuAWChUM6X8ptGq8fMI9f60ShGcZ9RaGFgaX1u/VBZsBFpJBXxwAVNK0uA32pE2nrw1ODi4Iu
	QRFCejiPlGee3XTRFnTsGZF8QvwGItbKLkBOX7ToPc
X-Google-Smtp-Source: AGHT+IHPnvEx2+1A8spGyxDZCYqGJPXGgpZv7W3X/UPXBelvQzXyrYlDdDiI9fhuch4s1Ysd9y+b0A==
X-Received: by 2002:a17:907:86ab:b0:b47:c1d9:51c9 with SMTP id a640c23a62f3a-b49c3f7d31emr1499754266b.62.1759738033192;
        Mon, 06 Oct 2025 01:07:13 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4f1d1sm1073772766b.71.2025.10.06.01.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 01:07:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 09:07:12 +0100
Subject: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK9442gC/x3MwQqDMAwA0F+RnA00Za2wXxEPbc006Ko0bCjiv
 6/s+C7vAuUirPBsLij8FZUtV1DbQJpDnhhlrAZrrCNjPE5KhvCjEff5xLQuKO8Y1pATo7ccH9x
 5Gp2DOuyFX3L893647x9CN6EgbQAAAA==
X-Change-ID: 20251006-gs101-usb-phy-clk-imbalance-62eb4e761d55
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
inverse of clk_bulk_prepare_enable() while it should have of course
used clk_bulk_disable_unprepare(). This means incorrect reference
counts to the CMU driver remain.

Update the code accordingly.

Fixes: f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)")
CC: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index a88ba95bdc8f539dd8d908960ee2079905688622..1c8bf80119f11e2cd2f07c829986908c150688ac 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1823,7 +1823,7 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 		phy_drd->orientation = orientation;
 	}
 
-	clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251006-gs101-usb-phy-clk-imbalance-62eb4e761d55

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

