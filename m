Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB273451BF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918655; cv=none; b=qXshm+ydnb1pBTgs7oI9dnQXxUNu3nUXkGSgDsSSeLTlnfo+BZQNzsC8dEZPeTvXJVoECw2OEb34VSexqo5FZV3KTwfvlJ9Rdez0oFl2Lkwo3nBGEeNELTo2eyU2V/3Gn9gQH5AM+KSIqG3Ldi8jz5MSxzvNY4BfiBl9e9NzCCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918655; c=relaxed/simple;
	bh=SmfR1ZQDKDR/gPIplrtS+9dHdS1dhkdiyMyQwkEDbCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p72CPlKb+hpQ/wVmWVnKWxz8FQb+2fXCaXpskK+tcTIw2J7KhsApwXxagTM99WHsF92p3Or5/0xw1e1yjNNy8cYrLZtFCJoLgjxJqTb6pzJa45Rn/JhJEjQBmNHtP9E/aT3/XGxrhpod6IKvv1LfqOwcxWQf/miQa3k/82mC7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQMJwG96; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQMJwG96"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c479268efso445420a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761918652; x=1762523452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqCRP9/Mbai8FOF4N9IAH1BiG9vM0x9aR5MB26eKXF8=;
        b=MQMJwG96ELbGMo/JAee94yTqJ/4EF/wfHcv9bxpdbYSmw+WkJFubic2yD+qcjX6PTt
         t/Luz7JaXdLwpXehGtR9aso3f76a96aPWq8IRecqldC+zRiH1fgBHzYTxqLNafBq1PMc
         wFCu33Zn1XnfMF0f+2Kf0xoeLNJBivrbeIWquYWHQLXw5LZH2uK0r0cmg7z4IdE4zWJs
         8C3n9qZ0z7jPXS9umWA8SuY4LU/8HXymWmHocyVlFIzdpf8oFce2hLxba/NYLcEH2gOA
         9hiXdYd2Y2DlAlw27MmYYfnMcv/OeaKJnwlUr0KnJUK9qauwINcbBwC5kxiN6LzVF7Ip
         O3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918652; x=1762523452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqCRP9/Mbai8FOF4N9IAH1BiG9vM0x9aR5MB26eKXF8=;
        b=bMBW2xBoykCBUMDl6bGff++in6bvNzW2n7o6ZlCplP3wiCAlHzTVQ/QR+aI+cp+o74
         uTUBksqMl5q7JByS0ucHYtn45lP6VYx91oqNMuvviDIHSJCvnfSjZslVhHQ0pHd9O1Gw
         rkk6MsmWdPRMor3oprpi4/yOY6rsIJDid7KIRzKL5Q8eNR0KFtf9GJp890QfJBvot7Iv
         AX/ld7MGTYIuo4tsCr+IyjlEjQY3BJ8ryoGWO4lkpe3ykG4i0sJuXQHw2HtOSy3TD9a9
         eObGR7qgpUMCdLz2OixsZ3g7zfUSHMhet9CsX8FojBWEyZv/gj0O2hXG8TQJw+Dawk/K
         heiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxLLFveouHyM+gIWuoGWhvtYBoLyYWH3cJ5b7L4RBaw3j6NND3EjHwAg2Tn+2InJYzojMYceBr501rlrjGjed2Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO693B5qVQObadSCGJHBI3hPjyWvggnjsdg8RCVtn5+dCPNtrp
	kejCRJnZbr5Ijve46Zs2XWZChOr9Pxjj+V9BwYg5w3Pccg1Vzfx7nHbR6UlWYm5qdjE=
X-Gm-Gg: ASbGncuVVETJPOntth+8DkJtyh1+ZQLqTfcTo14KMPvgp3ozU9oFiz6aQM2N/m8heJf
	HIFuctfmgmXnw7uVjZHNlJuBlAFqMIXYKSYtBmmEAtX5tlX1mD05X3w4rUFn3dNGzRCN7+66WUx
	Lxi5oA9y6kl4d1nhRGEPDQiwHvaPwDHvseda4F0Yd/vZig9P65TokHXtH1AmsZOq8yiBxIHGWzd
	jvdhhnQUVStIzvqRZsLteMu5GdcEjEj+1CbNOERYUaOMwFM6C0sdgeFofTeJ05cAdGpVrhBQtwN
	pYEojytPOmaFLekYWV1WyyepjuOfRStdEQJRhTvv2is+iBnJgFjaBrBgtTvIrVAHN7oDbL2O4rP
	uRiQcII98K6p3ud1VCAVfUJSj4BvnQAEbKIqnVFIVuYXjjcfXXq+TWl5DqkyF/E6FUmX7MofouP
	oWaFMpmKUYUAY=
X-Google-Smtp-Source: AGHT+IG4ALcuZ2ZkrRAVrLeUPvJuTLghF2aRSPyjEkOrlsMOO2oZQiqthEsk9HuFzyEGo/NHGSB7Vw==
X-Received: by 2002:a05:6402:2812:b0:637:e5dd:ef81 with SMTP id 4fb4d7f45d1cf-640770412e2mr1525778a12.8.1761918652041;
        Fri, 31 Oct 2025 06:50:52 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b438ca4sm1647724a12.29.2025.10.31.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:50:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH fixes] MAINTAINERS: Update Krzysztof Kozlowski's email
Date: Fri, 31 Oct 2025 14:50:39 +0100
Message-ID: <20251031135041.78789-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=SmfR1ZQDKDR/gPIplrtS+9dHdS1dhkdiyMyQwkEDbCI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpBL6xj/1/uZGgWmRCMjhesc0s7ijjyTpdGyik9
 o3dmzeDDMCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQS+sQAKCRDBN2bmhouD
 10xWD/0VNvesF6NpXo8GEMwtCDZGsmu1Ez1bxfGh4Wcx8onnFQYnJNNM0nZS4Wra8wGmIXEs2yw
 ++O7yRYY32m3kWy7wl1tJONc8eJPqu77N1N1J0jeXL4Cz8FHBNH31WAsiSIVY+apYXuoOxs42dP
 kOzCCOelWYKPetbG0HTVRPbUFz4woOj0T4iP7DHfedmRhvm/8hyEnMNlOLa03C5ui0vSu+b/tBw
 Z9qHcDlE+VzHsmLdEPH9Xlin29uUzxZHrbUfEZMJU/TKfF+Zkwch+U1LP9hm+6ba0ac9RWRD9NA
 aqa7RJMb9S4Z3gDXjntdUxKqOwhj/GJaRlfbtR3tkBo5fCwDA3/qDEg49bIefrWNoIddZAC8VLI
 +Gs8ExA/Wfsg/INK6QdWmSK+MHsaVW4o7MMnt5112zF691VElnAGnu1ALJryqz3IDqvy9juiYXr
 kRrKPAt9w6gQ8PTEj5yr2hV1SRIc5PFxNbO+txUTBigl0D4Q0TVxNCJYOh5kSMQCB6/Ly7fF4Qh
 tDKuudpRKh4mic+mjJ/9K+j8+PlO1KszRubCHAMKbfOZ1T0iLvjK42x66Zw2Og3puPRWwAN9x52
 JoK8EpG7tYRyyWk9lpcG8I44Puhr/v/k/8cmmzeuc1m17fRq8s6uOXfcdah9P+nX3W9/b1dsbhv iBSYSdgq8bvnv0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update Krzysztof Kozlowski's email address in mailmap to stay reachable.

Link: https://patch.msgid.link/20251021095426.86549-2-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Patch for current cycle please.

 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index d2edd256b19d..9811c2a979cf 100644
--- a/.mailmap
+++ b/.mailmap
@@ -435,6 +435,7 @@ Krishna Manikandan <quic_mkrishn@quicinc.com> <mkrishn@codeaurora.org>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
 Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@canonical.com>
+Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@linaro.org>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <krzysztof.wilczynski@linux.com>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <kw@linux.com>
 Kshitiz Godara <quic_kgodara@quicinc.com> <kgodara@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..811a89d61b87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16186,7 +16186,7 @@ MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-B:	mailto:krzysztof.kozlowski@linaro.org
+B:	mailto:krzk@kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
 F:	Documentation/devicetree/bindings/memory-controllers/
 F:	drivers/memory/
@@ -21148,7 +21148,7 @@ F:	Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
 F:	drivers/i2c/busses/i2c-qcom-cci.c
 
 QUALCOMM INTERCONNECT BWMON DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
-- 
2.48.1

