Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A94778E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2024 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710357119; cv=none; b=Dklg0ry16OlR420cJzRBIqjhStUhF5idbfTLUAic0BA+ibboT1GrL6HqSwo3QsGSEXDB4GhFo16DiuyM3RIAXg5r/7uj4+EaB8/lrUWBwWz4Do70y35Og5LJCqN/FUvRbXnWJroF+H64Ug38mXQGisLxm6oc6tQMR55A2/uBmw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710357119; c=relaxed/simple;
	bh=xAZsAKH1ye0/03jXaOVbVO12tdFhb/vpC7941EDR4ew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GSkItSP80vO7/O8nQYIqW5i6iQv3vGI7hE17An1IcwwrIqU1KXTtPIpLFJNt6HqDFqOq8y1IqMSzwnNCjrbjmKUryAwb4skclfaqSazg0TtIad+cwXLxUrvkqkazTqdqLK/CvAR69tIVhGJ7GqoYGDD04Q2fo4MF58obF0ctRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXQcDHWH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXQcDHWH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4132a5b38fbso1375115e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2024 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710357116; x=1710961916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/xj0UR1xz5ufUD59KROFNvtGcq3lEyrCKjuyydwu4E=;
        b=iXQcDHWHsIg7eJVF/bJhsM4HKDbuyNm8bNieT3VGBlxxztrjDvqAZN7WyHGZYJlQuX
         Z3lmhUMGMBVCed/IO1yptdN2a64zw7Ch+7mfBSbv7jM3X0c7Z1MjsXipT98fASX59Gjv
         8VDyYElmzeO0DFRUMbtuD1Q5t2zTz+XA3bKSTbbcGwUNnYQJHQEdKXLhyCUzImqq1zIa
         DLGu+nQBaTU7OCwb8L7aO7hecGumzGqrR2YyNgMQSw53SuFxCKK5nHYU1KaP61BWpIJX
         TgDW0eKol+LbzwYOGeAz6/ijAwL9a1DRbXM8mBbWGGQN8Hu5eJY0dsmNz9EDGZfl4fb+
         KB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710357116; x=1710961916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/xj0UR1xz5ufUD59KROFNvtGcq3lEyrCKjuyydwu4E=;
        b=VYOr4th3gYy/8ffivD81rz61N7k6jF6zZ87LeNmlwulmLc0E3qUAqXcUoBDRjKM43h
         x239fuB3jmQ0yNMVYAVdJakcWV0NlgKUIWUl8sDwCZzqBbAmrs1uRLjtRUTOqOccALVF
         lQV+Ij38NmPkJ06BKa7SpzrFXcY/xStpACAh5nkv2MsnHP2EUjh9iHYaKnxdwUGyRXXW
         +USsvqgboigwqxZHTU6+mouCpcQ30OmO4OoouGV5DVkVEvDKmyP0HzteAg0pREAimMby
         aI+eTlJzjIXq6t2CEROp/wYIC8z/3cQ4VrLegkDyWpooHVaGvOGvi10KpvwYD89OnCF5
         WX9w==
X-Forwarded-Encrypted: i=1; AJvYcCXj0a4yzsZjn+G8qvtHmQxPhXmHjucUvcy5ac3HnG7BAXLsst3fWzQBmTYyFwvgA9tpEVbH8sqnxZSwlDqWVY+zENC+l+fZ6Iv2zQPCSgOIv/w=
X-Gm-Message-State: AOJu0YyGIzs7bNE+hI/tJuhtQ83KL90Q5bYhnE4H9EqP+oxGIhsCYQFD
	hLa/nJqQrvadGIxI0TUSyCpeiJyyFH55yMr2yJ+3dxgKYU8MHURi4sxHeqdv/ZBaDSFxP+ReeEz
	6
X-Google-Smtp-Source: AGHT+IH2VT0d1ByDtOpBoLQo3BzOVY7nQo6ZUdI4WEGi/17EtI0Mk+fyuv0nHewFDS7fu99kUObjTw==
X-Received: by 2002:a05:600c:4f0c:b0:413:1ad1:78e9 with SMTP id l12-20020a05600c4f0c00b004131ad178e9mr651714wmq.7.1710357115709;
        Wed, 13 Mar 2024 12:11:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c348200b00413ee7993f3sm990512wmq.40.2024.03.13.12.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 12:11:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: samsung: s5pv210: align onenand node name with bindings
Date: Wed, 13 Mar 2024 20:11:47 +0100
Message-Id: <20240313191148.21792-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings expect NAND controllers to match certain pattern:

  s5pv210-fascinate4g.dtb: onenand@b0600000: $nodename:0: 'onenand@b0600000' does not match '^nand-controller(@.*)?'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210.dtsi b/arch/arm/boot/dts/samsung/s5pv210.dtsi
index ed560c9a3aa1..23459430410f 100644
--- a/arch/arm/boot/dts/samsung/s5pv210.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210.dtsi
@@ -72,7 +72,7 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
-		onenand: onenand@b0600000 {
+		onenand: nand-controller@b0600000 {
 			compatible = "samsung,s5pv210-onenand";
 			reg = <0xb0600000 0x2000>,
 				<0xb0000000 0x20000>,
-- 
2.34.1

