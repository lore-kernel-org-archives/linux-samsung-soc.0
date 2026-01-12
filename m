Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7D24E4D4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227427; cv=none; b=oXc9tv9g6mTBuXotM1r2jrcbwYEVzcEL45fbMTFfXkE+2j/nGw586iX+t5pTd9dOXVGvWxWNJSzor80R1BDsU1cBUJXi2lmTbAo4jCCQeqoRbqPKRU9ppPSfXOUbmiVfBg2cCxlMKXOrUbhYrwumNwUINU8fhuDfyi3fOENxx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227427; c=relaxed/simple;
	bh=7b3/8jSg0hsC1cvup2K50pItaQVXTR6L3Z1yqQMb+TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fk17wakRXAABCpRAnyjrCtfZ4eKJbtrMA+mqq/jS8/tBXGt6W8C7XcKgv/ZQ39ml94FkxWhnrIqVyagl8UGMD0pe41GCObGtFvQnYE0+V71IgM6flo8ZriDTxdQGHoCkmQQii0eUwHS0PPMNHJ6BlIp+lwUysNu+vR2SBnVFy9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCAdgrLa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCAdgrLa"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc305914so4583053f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227424; x=1768832224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Wlf+Ha8H0Dh4LV6gM62c/dK5IzNxEQc6+77JBG+adg=;
        b=oCAdgrLawZ7h2K2tLHYggVBZuYEXN3A2hDOTmeM3BDofvjn2bFJTL281xilwUAVH7Y
         CKBTOvWr568OItfZQkCvELO5QNNN3vgO8EZRHd5/KiUjT+LmLhb3T8uckzTeLW9vaB4Q
         y42zRbiZ7e8aNCWn7hmw0nsKoVOTxyxhHjrNDJf1RSLfwfkAA6qgKnjPGTDwYKh7iPID
         B47Q1of1p38d6j8pO23CnxRKzsfCkmZE893GumGWshrHfOYN4Eih4eXwmwZW1hJJI/oV
         BrVoWzePSqIw3sYebam6fUzwkDyqCzn8dsptZJDfVLViPFeFy5PGHOQzTZm5sCs25jT8
         T6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227424; x=1768832224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Wlf+Ha8H0Dh4LV6gM62c/dK5IzNxEQc6+77JBG+adg=;
        b=aRnUCY/EacDnfJ3hO662pS87eyVEPZv7DCsgV0JXcvt1WoDOm3Q3wYjuAkGQhz2bTb
         Mh6WHLKeRoqLkx5S9qvYPGiV/EG6Ule7wd9jnReRLsx5EBw6SBB5w+VILDCZjsXeaKG7
         MlEHtja3l5wQrOJfLuJ6ZnXuhiYPVXOyEOGivHkkQclOUdhpYaVzVn55pGEScxnlnnkk
         Wx+//6yBSt2sVLopW3xEwfxfZTVVD+4xNzaYOYmkj+E5ndarCtdO6dWLFsjyMGGRbSxN
         ke1rkwlxd5qyN/jTH0fR+h8cQ9T7FAU4vA7mMGBZ84p7wBAnGQxKzswoCgJ+VYlmhFUU
         4SCg==
X-Forwarded-Encrypted: i=1; AJvYcCV7oOJvyEWJ32zHuTek11rSc5R0XfT808bi+gG+td7kjwCPsW6pk6Wk283y3SbCJf4K900L95y8dsrtcD1tUJq3fA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOYoDMzzTk/mKD8uuUQEH1au1xP1sKPilOrHCehDhiGQW83yW
	4ruc+d+OaLMMLoZkBcErK/375kQbouKISRvLI9hjDx1jyRKbmist/6hBO+x0/ZAngWw=
X-Gm-Gg: AY/fxX5ra/cM93kzeAW3pUR2EMcaGxnOwmK5sstotAJa417dd8jSiGuPlrr0diH8AvT
	2ojFHckWRyLStZKuBDRuLiGFeu/pROIPpCNk/pj6fwkpSfBtv5ZD2Us6stcwzci6y0LWom5cYTa
	byGNIpez8cxtOjD9ImHQtHhuFxBkSsxBZpxxfup4llJQdpU0OlrN0vjxIE6/waCV9bSPHXHzuGa
	k1MV89nkDVY0a/b6dGVS0Aq3hAK0XifpZr5BJ05+R/gS/vObJeSxveKWWQ/t3fBVXKzdiceW+4X
	QIe3YQuxFpXuDSyGRK7QlTWAnGyMz7+7TTpE7yKnb6Afr42RoulMTRAnhA2q6QVWcP37JqqREl2
	IF3geIX4cy0wyByvQtCpOXcSGOf+ewFRBG1qURVNbsJcQlhlUvfzGCwtjmfjJ/9hGNhNs0U0C/H
	YjyOvrMshHf6cl+Br+GSsMl38Him/v5ElWBz3jplT00DA3PSfl4hxpLpg=
X-Google-Smtp-Source: AGHT+IFVR/vjNEYv/FQXYCJiVRI4X2CDCCWrmtGHGFSC/ecZuL4EN6E/j1yU9pK/fy3xfqoqCbgqag==
X-Received: by 2002:a5d:64c8:0:b0:431:32f:3140 with SMTP id ffacd0b85a97d-432c376107dmr21526633f8f.12.1768227423668;
        Mon, 12 Jan 2026 06:17:03 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:17:02 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:16:50 +0000
Subject: [PATCH v2 3/5] dt-bindings: samsung: exynos-sysreg: add gs101 dpu
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-clocks-v2-3-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
In-Reply-To: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=7b3/8jSg0hsC1cvup2K50pItaQVXTR6L3Z1yqQMb+TM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJYZl0VlRqcl5YypTCIBUnftAv7BAYLAp+2v
 WvmYN1nP96JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCWAAKCRDO6LjWAjRy
 uoVKD/9pWR+8ACeFXCJ77W/dlDcR3KY7CwDcsHk0tEOat5gl2BHNChqYlwaNGUIKJhp0vH6IJU7
 H0vPWfPXA7Pr1vLC2NEjfgr87dc+Mdk9lCD9inf0YI25x3F3JEvO52I5cUrnKFuGxeEebzdZGKE
 IPv0+1EgyCG1Z7RQKvGmuEuezyN5u4EKRA3HYgyqFfqWB3RWmJJFGqCIY1Do8Mlsj7Tz8TRmJHA
 Ib9/CBb3zMfJwAGZWPvigrdmIwMcvfNgvaxog+sALJ12cRzPBLhQGkue1ujkOus6jE97sB4pCld
 8IjAPVCl+zmLq5wh+7AwiiWG16QBqhCiNO/KN95F2FPzCmMXI8X9qVjNfiSxKsWLLfh7BG/nbd6
 brrgVG5p+21KcYmIkfZx9WEHMRzKnRLdLrVBHQ8TTUgM1O8XWhXMBwzbjSKdHxysi8YWq1IGavD
 PvWnD920tNRVr4jx0y4pObKTz470tv/OFM/kzQvZjCxIHqB+oydxJiY/8O0+KM+eye8ZGhdX1+F
 f9WT2tP8wDRfsyIupxkfka+MFy3TUk1FAO8kuxv6uofZsswo88mCXarIE+4TORhRZ9k7QBngiJ+
 vIU8Mcu2BBsBE9iREBDssfMnQQZP619lhREWf3d1e5Udnn76sm2mduGGEhXlcNUP90f+Ayp9j7C
 jYVqs9eWQyaJaJQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dedicated compatibles for gs101 dpu sysreg controllers to the
documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8008c7f9888a56f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg
@@ -92,6 +93,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg

-- 
2.52.0.457.g6b5491de43-goog

