Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030494;
	b=e5p8m340wvkq1IMJ7KSAJI6eaSEUEjWIcb2MQgtFH7xwRFdOUiFKRo0a+iGpg8uo84tt
	 /4Yoe1jcEtUjc2uBKcJGSPy5wSqkugD+3Vsn/fsjXWnsA1v+4dtHp9k3545tc18C19VkX
	 x6t3pf5pi1BlUXAelTj53ASVqNAwoiHTD1HcqKt77w9FDpiiTeqiuVy+TO90ftmvOPp36
	 goOy1knoMYi6w3d4XOKCmeF6PCxCHp3r8BdRuPjtbpFkN8s9hWtxDGlR6DA+q7faub67m
	 xoQppyA8oI6rOPz2McdtM0Mkamw3y5LOBWOBkk5Z3OPL9ZN3ttrnUoQhXtQCbKC57Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=;
	b=G91JJSm0jxny32dOu6gIjZekWvTnwVdbFgasVpY6H4OKADA8evo5sUJBoiOBRmajGtzy
	 ucsb4o84h6bzEQYtUHI7PKlvHpIQq89+J5kSepUYGuU+GeMXsxjp10CvGckUt7GcVkJvL
	 yBDt7s8dXrnJ7DsWvPTGrypbKkC/8Mg9CU7m1cB9hYI318xPUL9LpHNTcn4HgjD1I2XK/
	 bzNPOIWmp3sKZOQb4Xxm34rS3mk0dj7fMtHu9A0qCKNlXbv20Z0uxa4n78E+nS825hWGL
	 CCStWYwZ23zN+Rc9h5WhIaEgX0rYbkkSWzO85hpkr9k2t/O7OHDKkhbBkahGNIcmgOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gy0DTVQr;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668CD60A380F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 16:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 668CD60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Gy0DTVQr
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso490169766b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030492; x=1793635292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=;
        b=Gy0DTVQrLWfIPaQzWTsoxJdmXUaoLO60RxOiIn2NcsjY0qLd/YUHf9FPyp4pku997H
         2oZlIQQxp19q2U/moXXwRMkMqGSKDGYN4XJ7q7zvaUyLgXTcv/I8SDs7HorJ1QJWSXbr
         4vunZikuIuU0uWS8VxTpzmh9sP3DO5N4ExUv46NkvA0lQ4iXBgrq0lXsW/OCNAbBt4Uz
         WFHNdP/wiVtn/206+6E7Krq4EZHOQVspCDYezqamM1H4c7jIsTrLZzP7yRdYJtObc2zw
         3bfEa94JqeBeZIRHwLBTRnBYvr95ZC7rbK7ViuTNIp1pGA0hHSqUKrlSm4Z2Nu9/O3+q
         sxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030492; x=1793635292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=;
        b=EmljqSHU3xILPFOZTC1U+dVyI0F2do/C6MulwYDd6NCdtMO+D69oVEjui8YmbWPqfu
         lPy7/jyisrZ3oL8Zocsq8cFKx/q0l1Lubg0PyCvKsyyKqE0OkbfVfty+uYDF5CsyrFoB
         wOuafl5HLqFVFViIfT2aYANzJqbN15f9yKPVGkfZ4zWGlTODBSVtd53ZSB83S+raaz9b
         EiclGtGyKCYsRhYaapd1fjuGmiaZfOp3N0b43I6krcpRokETtwGtkJ3PvIXNNvUa7z6b
         Y35n53wpu+jKXU0g4NHfxN//Rq/ohWNMqyumTdfg1/j7ndIqpk92qHIvchGp71drQ1rl
         r/yA==
X-Forwarded-Encrypted: i=1; AKwUvBz0ty1OQbHxyjtODD6OC0WqIAwF2i3L+sW2OnBozq92E4Oa4lK561uq/BEQzK0ybPsfBEpAneg5Vf9ge0dzaoFIRA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLUvOKXsfsKH1VI8oaKrG0cVZaZN7VoqiSqkpEcXX1k/AxP9ldA
	LkfG2p1pyaW+QucDlaAgq8g+dKzamUZIZTrWTQVxrS6ZuHxQPpZ7FqA2Mdp1aCmsLoc=
X-Gm-Gg: AYBFou3pZjlvGEmgvtfYWL3+7hxN4HbitULUgUaijtQHEjaLwzJ2KwcDM23o0P+UStb
	Kk0jalmbEVRf0F9srH32iIKzq2++uH0fKc+sNK+PkS+lKV6tG3CEEHRvhx88NUgnxNoyjBQP+H+
	K+qT9xjiebLnqnUvIiGVl0O0ysyrKEwaiWL08TPsBw90j/5qj+0ci3vXQVOALxyWkpjWgxZxGOG
	ADHevE7T/4OvRD3ujIXB8P25w1oWu6J7O5rEZUqUsMlhdesyhjBCPyCZ6jfRv+5Rf1ie7lhMY/V
	04WpimWQSEwBVDm9t3pF5t6dFMKdQA3rbv6jW17C6a+yeQJoQ5EBVM4Kr9lbDd+i9Mo2QwRYQh7
	X0JGGwfNqQs7dpVgiiMdgDHcioQm/sOTJu2A7nJtnSUYGKcXeUHNsjXPRb+OBX/Fzvu3B6R0olo
	sDFcBYgaWNPtOr+5VkLCF/V1fANVJAz/hblnEAoh9q9IXbD63CUNI8a1smV2SYcMEY//rIQXCKt
	ggVVRPX3oyNpkh3HpyB4DVWfSN9xJ6lmb41l1bJVh22oVRDmis0t/0KWKJpS444DVtKKAuuJbRA
	5h0SSs5ura3rrwrb/az71NE/qPvXu+jKdipI
X-Received: by 2002:a17:907:3f1e:b0:c3e:d0ca:d2fd with SMTP id a640c23a62f3a-c46bddaefadmr876184966b.12.1793030492156;
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:28 +0000
Subject: [PATCH 11/15] thermal/drivers/samsung: acpm-tmu: Rename platform
 driver to "exynos-acpm-tmu"
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-11-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1029;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=kKFEY7/HvEq+100xRnR+XskO/ds5n+vISMebLJ4Xmr4=;
 b=ec7B0504Wi6Z8WS8KfhDktthnTx3XbHQeg00S34wCbflTe0KQVBU5L4yBFWkH1RAfbPukMl7S
 +PP33+KjN88BE+Y3NUBrjPmJBAV/M7X3mNPO26BGuX5nceHOnSZjuZL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the platform driver from "gs-tmu" to "exynos-acpm-tmu" to reflect
that the ACPM TMU architecture is shared across Samsung Exynos SoCs
(such as GS101, AutoV920, and Exynos850) rather than being specific to
GS101, matching "exynos-acpm-protocol" in drivers/firmware/samsung/.

Suggested-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 42b338d8d093..2324efcffb84 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -597,7 +597,7 @@ static const struct dev_pm_ops acpm_tmu_pm_ops = {
 
 static struct platform_driver acpm_tmu_driver = {
 	.driver = {
-		.name   = "gs-tmu",
+		.name   = "exynos-acpm-tmu",
 		.pm     = pm_ptr(&acpm_tmu_pm_ops),
 		.of_match_table = acpm_tmu_match,
 	},

-- 
2.56.0.257.gf7497c7d27-goog

