Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF8D1E0DE8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705098; cv=none; b=OvEwX9p1KAxKO5YUNsneS25LMtZTSxim9ehLsCPrWyNHArREblGmu/XP//ekRsPHQ5ci+d3CQPSjqGK/J7Ar9VhqQv9/ZR/lP3ShQZlroM0Jq4YaIZgPr49B+L4RoDgA36t35dijVjUDasvWRd7dWA21La5p9nL1OWmixIhEMrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705098; c=relaxed/simple;
	bh=HoOWfskOM/L20/Qi5xKqj5oCq9iYQQhysTOwTI0G2Xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwWNMk/xgMzALzahUjanPSDkieru1KjTHs4XaPKfuTKVLrtU6gsaODmPBcRZkxU1ANs3RDtbHMqlp2gMtAUe4s6KBBgxZqQ1P+smk9oCyMv0il646q7wCBeNq+O0CH0I67HzThA8Om4L4fprjrdxmNJt93Ic/SJTJkxHkqURX4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INu+BY+B; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INu+BY+B"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso934152666b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 02:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705094; x=1733309894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jtF9ci8OPnOP4Hi31zRxsQ8dcNSQiS08yT+hSgOwYg=;
        b=INu+BY+BPm2TSfOsOAdv7Ew/mRHGZVbUAopTmZ1DCG1nvN06Qv2gKcoSwJSl73v+Em
         ecytZzjZBivNRAESQcitRPTzK97xhpbExVMBl45ygtUYtklCBpjgapcoxLRKw6Lo10gh
         5Wj5gTjqMyg5bBWFzPhcJ5UHNZDd7lxZiC18e7TdDo6PWcXtCqYLURf/3tljvrB/2/1V
         rV6JpgYRSn02eG5NTTg/SEpcoqvHHUx8E4GaQYmf57nSwabokKoGapRhCkD6/VJU0lhY
         bi24aTXk06uWZLFTw9qwBl58BmeYPs+hMAJOW+qS4Q6mhtTYcLrtXzCyqqWHBOwm3xIb
         0R5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705094; x=1733309894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jtF9ci8OPnOP4Hi31zRxsQ8dcNSQiS08yT+hSgOwYg=;
        b=IO6rlhKwbtX7Q5Q7SvwMR0R8Cfzp2nMfyM/hR0n1THIcM37WeBZm5hybacY/4n3znq
         srIdKxdytToT8Be2oSqbazQIPZcOKX46lwRo0iHl2TAvok840ItLSqf8EDz19MGmP+I0
         orrKsB3VQeYTIl3NrgjkMXTdIXwfrzYNurOtNwgpyACvdlAz9LJDRwxLE/pzmAOh4NcW
         dhgVUgwlnaqpmxo+XL414Vw9bME1PxTrZrWuCYxfRSico6LuCkvmTt4mOToLc/abx81b
         aCtDMQQiyGLGjfXkBA2CqayaZL6+4Snk5QvaO08rpr4xEy569c0DXVXfdbqsaoZZ+dw2
         sPHA==
X-Forwarded-Encrypted: i=1; AJvYcCUpr13bKl5ymevg/MgDFdzd7k/XO5H4c5FWZMMYQ7iU648SvHdcTIBf2AcaFqwnrBQMsU0PCnGEuYRfNqs8R7QsZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEbR/DLwKCDnTOxstbQpwyPPM3tXjTaC/7v9DYMQyxdngXHzz5
	cM1nZdDM7sfhfs4+Lo5y+jM2GXlpdS3cTzfRnggcDs8VHor4mQdYIBRbtgDiFxU=
X-Gm-Gg: ASbGncvXd1QPbH7BcvSPLEL96SeFyqmU2Hacpn6POgNEs1Pl5IGUZuDRkNstZOA7ZOH
	iukJ6Ef5jCGo1D8MDsjqz4X92B79IoppKchZI/eq3D831Q4Ijh1pEmva0wEWnIk/xFBV3zim06b
	KePw2oIqmg24fEFjEEeeP3d5+u+HP5d1wKYk1htj3CDCmbo9cVRXSaXNC2NoxE/CVDgjLzv1W+W
	jaJoqbUE8s7JQGlGs2gnlrKoY2MFUHPuZFmCm6vFJQs+b/TEgieK9lJjFJumUt4myAVcsXcPLYO
	1KPYr5KzC9X07ssF3WyYrGKJDwkTjwRvXA==
X-Google-Smtp-Source: AGHT+IGpI0XPyLOxUc3SxNULKeFDjg8DEK2PQJHajpwT4G6OmiaLmyMslU+q4NFnVHObUoaipseY+w==
X-Received: by 2002:a17:907:7711:b0:aa5:12dc:2e19 with SMTP id a640c23a62f3a-aa58107690fmr187546066b.52.1732705093727;
        Wed, 27 Nov 2024 02:58:13 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:13 +0000
Subject: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101: require
 Type-C properties
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The USB PHY on gs101 needs to be configured based on the orientation of
the connector. For that the DTS needs a link between the phy's port and
a TCPCi, and we'll need to inform the phy driver that it should handle
the orientation (register a handler).

Update the schema to enforce that by requiring the orientation-switch
and port properties (on gs101 only).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 6c17a44718aa..0659fc1ce13e 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -142,6 +142,8 @@ allOf:
 
       required:
         - reg-names
+        - orientation-switch
+        - port
         - pll-supply
         - dvdd-usb20-supply
         - vddh-usb20-supply

-- 
2.47.0.338.g60cca15819-goog

