Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB32E6CD6
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852995; cv=none; b=fXiGZqjR4RXPccRIMXkzeCvMNS9EgkHCcpmCuVBVZV6cChXW8VJKamAxPpdPqBRS8+y2nhmHEWGyEjSVCT7M7P+348jBtciiOu3HL4gTo2a/1CaYZTPFKM0bV0SzWssENinzzpZIbD6223bL1Fu6qWt+AKbH4wLEl32TsvmK8zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852995; c=relaxed/simple;
	bh=fJ72ZMhavTt/zW71hZxTnZ2SN+OoyfXQg3BT41sI8Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jqJ4hE629O4lJAF+ccA4bSGCmgOSUPEpiVvGnM85jOLkW/XoGigIxvKQaHX4AqwDg1ZFMTviDfAqhez0fYZksuhJHcW4rrrwDkOOD9nxwSnmjmOqOeuk/1OL8m7Dz8Wp0MccP1rThJXbcQ3FcWemfj5MDH9DKAfxXHaxLVSbzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFCCekN9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFCCekN9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3ee18913c0so1017849266b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759852992; x=1760457792; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cm5Dko9olaR4ZjBSYSeJvT1TaV6qKnd54YvU1t3L9I=;
        b=jFCCekN9RwyDqx0qwWloiB2wwjxnod2enfPpmNxf62IebJoXUXrWni7d1z3/EnGHfy
         aNjUnnfzdXYBXMN24SVO9QzcPUDwdeih3LIjXUTaLo5rLJQyZ9VQml+fPbGzSgoT5Ybd
         loMdf0h4Qra0w/hNiQD++yk8JcJ7wz5QLH7DqqYa9/F+5XzltCrB49IxTZpEzjz9pyDG
         BIoqsvlqBbcvI/GJM/sLpM8IMlgP1FTh7bH075VpkQ2xYaw60YQMBJ2X2YJ7JBqSl/6u
         CUNvszkf+5wJEVfvKbnhLSm202BycDdQPadAoVY4BUgX+4BMlnGVCjNbKk6CqM3paVHe
         Zj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852992; x=1760457792;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Cm5Dko9olaR4ZjBSYSeJvT1TaV6qKnd54YvU1t3L9I=;
        b=M2Is6bS4u2ov5Ez+krHdEgrRebBCXCYafaUZ2EYbQWw7nc6KQ+WKd3TUCFNQ8a1GOG
         N0xf4qVyT/iOgqAAa3xyRidxRP2sx5EIw4HFYpP1tGHSK8djsshOkcQ6vfgibKLhCw+v
         WAhKBKsk0ibDGQtEP01r+6kErBhBBYM2urv2HqVuqSvum1jM8LmaIMK2DpCqcMnABza8
         BwR+V83V0zYaWfX8Y+QuQYIZ+pT5xHfetiy2fnhbGtULjHRp97O+/yu9JIECWSZBJRYx
         abqjmJ6ypCd1euvXeZDoOJs0VZIRJRnvDZHHgzSuSbc/QZ58RJrxsehkDTZmuClMRaf+
         jBhA==
X-Forwarded-Encrypted: i=1; AJvYcCVQbzWfMmXVTfUk73G5nFxtGZjhJpwjtLUeia0qRsJtE4BIFw/3RMyHoZ1p+Qk74LkgiiVr62MjeGD8fhLCmqik/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1IZoGep47ThyS90aGsrNmIhsVixgZYl1yB+3LB6wHrawmshLP
	lBEU+20Vvn/lJOCrrltgApD1pTfYLG50dG7wNndXE7aTQ4PGvTOo0LPRMZGPGoTXx10=
X-Gm-Gg: ASbGnctaI4yj1TcEhTGEXkOsmm0yZQB9PBQNwkeY7DKss2/RAB+V2U7KFBbOwGQz7gH
	xcfl+agi0qDpU0vP3vwyvbqXJQm7AXb9X/o/ECFd13AjQ3d5PDf+c6JEKm5S9r1Gefib3lcpUM9
	8J/wqJb2n8swe8WErhumW3KTWstDNxDSOKi2bQbZbYa1o118S391tHEabDwB6fF2r+5Jzhd/jXh
	KnoDFEW7kyaCMYiEJHBPyT6au7FF3N2nIIwCS9VW/I2ANYuB7D1OU1CXmOPTziZz22KsJT1uyZm
	6aui6exBstyYPmDfmtXi00H6GsBt9kLTJdi3ZPqNjMiGwOj9QS0a64evCL7dWlkNfCyJOhgCJz+
	vJEg0tWo4qbjPUmyT72bixvPPpi9M/mtb4Sq5CUEME4yE4PfChgZDJgDaYBtxCNWfS/jMoRt4BX
	cP7b9SHPpY18r9UZJqzmErOEjuN0GSCOr4S5HKQmBm
X-Google-Smtp-Source: AGHT+IGcHy/Jl0g2LAmEkVEntCtICg9hZqb+cVzIJexCEPogdkyReymHfPrFtWwic4ednSokiuHGag==
X-Received: by 2002:a17:907:807:b0:b41:f729:77b0 with SMTP id a640c23a62f3a-b50aa1869bfmr22271266b.21.1759852991654;
        Tue, 07 Oct 2025 09:03:11 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa637sm1399772566b.12.2025.10.07.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:03:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 Oct 2025 17:03:10 +0100
Subject: [PATCH] dt-bindings: clock: google,gs101-clock: add power-domains
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL055WgC/y2NQQrCQAwAv1JyNpCsqK1fkR7qblyDdVM2oELp3
 13E48xhZgWXquJw7lao8lJXKw1410G8TyULamoMgcKBiU642FsqJntOWhzjbPGB2SzPgtmZ+K/
 2gforD0dKQw8ttlS56ec3uozb9gU0JNMieAAAAA==
X-Change-ID: 20251007-power-domains-clock-google-gs101-clock-3208b1960d98
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The CMU can be part of a power domain, so we need to allow the relevant
property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index caf442ead24bda57e531420d8a7d8de8713032ae..31e106ef913dead9a038b3b6d8b43b950587f6aa 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -46,6 +46,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-clock-google-gs101-clock-3208b1960d98

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

