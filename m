Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648336;
	b=iXk3FR7gHjc9ay7lEToaPc6cPMJ+6fO9Bhl1BxeGBO169nBqL5S+MpCL8jVJ5Jt9qeVF
	 Q7Ur+lQHqJDeQD7/35kGG3qvPWhBDvPyyfzFmHbyw6anrUgZjBpGZZXvb3dr1cVEOz1eX
	 OcGVkQt4UhdCBj3hkgvJ6GJbezVB7PB4oHt3zmZFiQrRZJTqhd2mUd5B1z8FnCPcsbofA
	 7vWS50xkXcfjObfnLSDaaSq1aJOxI1A4YccN562QiYz5iTQq9QFMyewVxj5NjIsFTwPD3
	 1nVWLK5o0T8TNwC2ipTE/880dje14RxgJbm/RcheavX61izi4CuBvd6mD7r03/rwNiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
	b=pauQgZ2h1grvVsAZBUPPAgehPxtyA+bf17LedRnnMOjEwlcOUw+VEvnrHc33Cr1BeAQk
	 k6Z/B10Fcekj3CoCLRHsUuUIN86pw1SpHM302h6D4ptvRM7wZa2wRhETeFtS9TOfM3h+C
	 wq190j5bIoor8yb5aW7z1uy5gSQEGmQ7pxjLeclZA9UNMFYPbIO9syyMgn/kznfy8WTSj
	 6lSdd8A4wDsbLcjqwgGWZpw22HftpC5GqE6uezgVB0wQ/f/ENJ6J2qw7JLvahkpIPXGwj
	 PapU8iYpjZHf1VyVrwK+WKBpvLhtqfZb8Ayifk1aFilKsVPweDLma1WHPGHWm/PrrEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McxzsOeT;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF5606A325
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Oct 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BF5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McxzsOeT
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso16181125e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2026 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648334; x=1793253134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=McxzsOeT3cRyR+H5WlkOR7UuGaGOBUj789iuYYSuvRyZzLlSdZ0le6nFZawvb9e8Tb
         RiqIy1kp/CaQrJvB2P625l8OvYF5b5GRfDyHRJjahSiPONQO2mmh3SY/FDDxX67/cgHw
         KPmjZM2OAngJsLs9zzOddztXf/fE9L1bruF4j4Z0FVX4q0b+481YBG1c+qimh2dvtC3M
         vbOmXia9B0ku91ru6TCdb7LKd5iYpVSYQz2bJMecUiSd22rzi9hq51m9ndtR42VYFJPR
         r+DNnDZM1L5mEEBRuahLHzyWkEoqyu7aU91kbum8/JsVwXg9W7VWCaL4jKuAUhhlyFiw
         7LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648334; x=1793253134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=aK+/P5jf/oUs7qRSbcxoKpiHJbF7yRL3lKAd+EWIi5eaF/WVExyRTbRSIgg7SCeIS+
         m5tsBIll6lfYaqb326G621JZWOtX5jaR95T8zil0+oGnUNHBNC/1qFYKoKN+QRWJe1BG
         VYTkW+ytumTM2+oKbFaszjCjqDKuFt2p/mL2PXr+hKuwYQpS6iL+E1oA7BpLC9hnSD3N
         WdXkxtjDZveRdSVavhVJzSurTbzhbDUwEI1TNlkUEpRAHyu07C5OpkmJ8TJ9pmd1rK5h
         FxvnUF4PbDiNnzRolVrsObN2IroR6nDwAthqDwOOiCnK9pjx0Ms5jyM1msqA7JHzMsLS
         MiQQ==
X-Gm-Message-State: AFq9FYIf4bPACdCtsyyOptmj8hvx3j44ZEAFImq6grkGQLRyuQ6KBdKv
	ap0aJ5EH5rSB1KpAih1JbFWmExyEubiqofEwjBPBKN5Une8FqvTHR6h+
X-Gm-Gg: AYBFou37WzHE9wOaU0tA9Fsspf3W/WSpiTk2AoQC62/+t0Q6hockMPpSrcH11JLlwbc
	btHQWEtpU1SWmKKt3NYCjGLqHMNGRuY2GPLqTTVAvnI7BQ0VhPC02Xgi1N6q4N3OVvOoK3Snhtw
	g5PvXYLBtM4oVrBObrN6gFQEC9QL5ynqXSKHRduzB/seFls6ugOPu1j8Dew3wBZFW1rX3LXxEuS
	jnjSzzna+rPx+Wmv3k3TtCwGq4cOk7O44i4q4E1NNIq4CUlRGO+6JQLUXjkYUoAvhKSN8AX2Qb0
	hQhIseSK++OI7EXSN/Y421POz7mSUL5fBUMfa48UWO+f23wgx+9hTK7RdzOaANNP+7bXhFzHURo
	rXcLhiDjK31t0fsUNdNBBPTaQwYaCbFmJ/CT4u+IcXZ2buNj7SiPSkXNmYgHyG990XEydTtd/d6
	TODPMtCBHe4qy+Sizz6ZAaKXVY1KwB5cD0FvUGeb2p+z92baSh/DFluMgj/7grhT/jqgJvTYUby
	iE7nuzf7zLgVkVr8dYcczmZX2FhrAphc3RfpvxBeVOFs4KPN/dlfSPPtre9LNHEpIo8L3UQmW5h
	LoF8aGidPc4CnkZVfoTjzMw3XhQUUJcTKPhLRyrmKMJ/u7ieGJmXv6Zb/H6KRni6wrQOAwzBHqE
	ly42Zbedhnl6QqGTWf1EfHPt9bgXx6Mo4lnA0CAlJSowW7qye3AtudAyQtYenHH5yFfnEgBMY2/
	dbuWgxeJJL/MBcO2fHwyeQCnIiZA==
X-Received: by 2002:a05:600c:1f95:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1fdd19dddmr91581465e9.30.1792648334182;
        Wed, 21 Oct 2026 22:52:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:13 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:07 +0200
Message-ID: <20261022055208.17746-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)

