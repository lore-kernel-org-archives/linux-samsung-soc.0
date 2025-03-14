Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0F2036F3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970408; cv=none; b=H3qYMU2D8PYsFkZOvfi9TNkjc+lRSnGvcnMf3SxLOfYWjyV7rSaTYuePK/k9nP/O5+HktwK68iWB2LVDypYmaXZu2n1jtVBBQngGCXtRAP2uWLZkQJFA1NCu569PUWgRSqKN3kRuHD9h58PPH32WltiDd8rCAU64aCLCQpub1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970408; c=relaxed/simple;
	bh=W7OrtNale60JOsrxsaBAlHsDJ4WH3rrsx+Tnb7U2MME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTTDazBG7KlkMfDOgf9udPa4oKk+HL2ypiG1T0l7ydTLpuR1wOFN83PRD4Y5J5MDP82HsaE8FYkYEMbTqo/wmiIfjiA9kwZ5wQ98SVlY4nWfgZsjxbkquoj6Y9WDPR2IvQ4WD+I2wOc7syz/pN2gaeZi/PM0TFJEdm4YI6/pqwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UND6oMNs; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UND6oMNs"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so4594093a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 09:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741970404; x=1742575204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqlKsxagPbT76Z6CLNAsMWFx/025f7qb7NuOScguaQY=;
        b=UND6oMNsPyx969ds3VEUYTRVcHo0xohPWHSOWKyD0LAMM1xJO+h777IilgNxOefsWl
         qkiPetbmfP3YUrr6nfVezMjIweY97GHkrvNUjLFNPujSx2ucXeOiuhZ3HU9sn+pSWpsf
         R0Ji6fu0WvFFTg0GCx1hY1Dws3CsaJDSEGw/KZvHDZ/BZMrfL06iDH+BTn9YpCjKdekG
         866WO/Oo+iMhfYzlyxv3kRA6uq+J7OAYd90WkBqwUESSMtvf0yjxBJeCvRnwFz5JeUUc
         uyfntCkdEiFIw0RR0fc7cKpnqcaUjXT5dnveLaT10OeG3W4oA51I8N7L1445pq4QvBeW
         cUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970404; x=1742575204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqlKsxagPbT76Z6CLNAsMWFx/025f7qb7NuOScguaQY=;
        b=dXSIWiWBlvhsuRCRBPKv7lDfbYxvziVPm3cWFZdDuP6Mk276c5Zw6Us9EPyitrkiKj
         2qX8+8XUGsY3i5okwHK+7vXgbfYvWkZE0oIzr5rEWcbboEMseKxAPafqIg6ePjK5jHEf
         Pwf9qswYOkr5sGZ7GvdW4lhwGrfdgGvHnXe7WX9SmAVeaHjjl6Y3BWFaLqYEKdAxZ0uZ
         UnREwdPLC9xqHSP//w/3/xTo2Vadz5WNR9E0mnCOF2Xzx8KnoBpkpSSW7kUWiDY2Jb0I
         wkwTC2yRmOALhd3r0/6avvaZx8M18sPnqTFDbUYgtySz3Yv7Tn20k2kvbf6Bm7IUvuKD
         7GRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLzWaYNCtmnq3zdoLWmn9jjw59afq1pM4M9KC2iSuwy2KkWaGVWh7lpDO5+f6+k0AOu2rKjygKcr5Y+aVE1ad76A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+996oA6EkdgDUBB5eIMRMcJJ6mX1/Vo5PCbozSB7x4QchTySw
	bGWQgNn48Al5kDCVfwGR/ad/NnED/HZhIH9vZPxu4IzsTXrX1E8FML7PQeeJeXE=
X-Gm-Gg: ASbGncsh7iOh6BK1reV10JgmBiPLq4xNbIu1lzVzxg0re0ys5rlRuRLMOROxBpVKZEe
	M+w2hBqCrTM7vrpACAF6c6zYG5MMpzTXnfcUHkSKEj9XKBDm7Gd4rc2g+uclYli0fcKLUBKveAm
	w2m2x2GQlcmoq/qZAFE2zJGXwSa8lNrKxx5m7Gfm975vLdtFlVH4vcr7cAy7FPZSRSA5dSCA5BV
	YFV33ZGrMaP5kKmtnsebswSEPUI7ZHpjdDx8nUOc9wiixwxTAftrS8oPmVVuS+hz3hUyZqM4By7
	a2vRoEaVe28N8kH6Gz60zAXmq3zaeCp/6esYN32Bb+XG5h7LF1KZzONodLyoL4zE3BHJcgawK1l
	l0fE0bSj0OAb3es93LB2zQBf+UeAW
X-Google-Smtp-Source: AGHT+IHLsxwF/DHZEPhOyEzlgmcKjsoUUujUnQwnbW8+qgc574E5shkDM/HanOkkYGXBGqTnr36IXw==
X-Received: by 2002:a05:6402:254d:b0:5e6:267c:a6bd with SMTP id 4fb4d7f45d1cf-5e8a051fdf9mr4301988a12.28.1741970404463;
        Fri, 14 Mar 2025 09:40:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968cd8sm2115727a12.18.2025.03.14.09.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:40:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Mar 2025 16:40:03 +0000
Subject: [PATCH 3/3] firmware: exynos-acpm: convert to dev_err_probe() in
 client API
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-acpm-fixes-v1-3-ab03ca8e723f@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and unify error messages by
using its message template.

Convert the remaining dev_err() in acpm_get_by_phandle() to
dev_err_probe().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 48f1e3cacaa709ae703115169df138b659ddae44..03f907a95c6acd66d89cd8af2f52e7c6dadf492a 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -701,12 +701,14 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
 
 	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
 	if (!link) {
-		dev_err(&pdev->dev,
-			"Failed to create device link to consumer %s.\n",
-			dev_name(dev));
+		int ret = -EINVAL;
+
+		dev_err_probe(&pdev->dev, ret,
+			      "Failed to create device link to consumer %s.\n",
+			      dev_name(dev));
 		platform_device_put(pdev);
 		module_put(pdev->dev.driver->owner);
-		return ERR_PTR(-EINVAL);
+		return ERR_PTR(ret);
 	}
 
 	return &acpm->handle;

-- 
2.49.0.rc1.451.g8f38331e32-goog

