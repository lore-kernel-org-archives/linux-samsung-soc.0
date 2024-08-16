Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B4C7DA64;
	Fri, 16 Aug 2024 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794680; cv=none; b=NOBtpkjKQXEofo+gq22ouuQp9KmPxl2rb6E2CawvrpkLJv8RhUQKKBwYHSH9495XTst05wgeJGwalaJVKn4RMYjojXu2htDbXuOK4tXZxb1Z6/JPvcGXHIIueZB/ruwJALDLuTJeocoJXOOafZRaJbbDT+8NOWdw1q/BByJ/xfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794680; c=relaxed/simple;
	bh=iV+M9xizwvmZx1O7iSf9l6DHKdHcEZAQiXWFY1PnmrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWoLWklBLzMpnBheyLJn5y2dbl4XnT9vMv32s9q8jd0nE7Pkpz7CZTl/jyVfypTOxUT2ntpRJYSwH/PZItKR0cbl84Dw+0mOeKuRAVq8WbReGZjy+rgNMZFrpdFKrYh/cmTJwcmkSoBrYRPocxhMX9W2gGX7Gss6R750X9CiNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4DkXusH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4DkXusH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso16935285e9.3;
        Fri, 16 Aug 2024 00:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723794677; x=1724399477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyOu5xh1aD+Hvn+LnU8RfXLmSimiRmcKh0k9fq9YE00=;
        b=l4DkXusHSX17Lyp9r9b7sVxeP0r+Qqx63XnQ3YglQyXyiw95TT17wiHh3t03gM7tbL
         DwiA56p0WphRqG/HkdPYbMZw/iIH8tKbhz4YVVtKz5w6WtzHvNCg9rXfiG5hmWuV94TA
         wL619iiOXIADDYTtxtQo1i9EXWyDDWqkgzOfAtF71oA4UaIo8CdNtIP0yZklOT35OIqs
         9e2WSFtK7L6fiLYP8eA4I0urPF8Iv36Kex9EE3H5BqTRh8K5TTB9wd3yGc/FB5OsAV3w
         PQBSXAqVabkYNc5Fk5wONH5tCYWmZf0f6lXoOc4wTWIpgFSRY99v1ChtX4hKCGCf5jrE
         ER+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794677; x=1724399477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyOu5xh1aD+Hvn+LnU8RfXLmSimiRmcKh0k9fq9YE00=;
        b=bgi/TQP3BvTdoM52Mre8Dx0LwOOa3Bungudzn/tGQR4JjNwaP9Hou4pWZkIbFzBsKh
         R0GGxJEWcCYR9XBcWPqiIpn7weBDY6IWPdgHaK9rMwyEKfin+cR3xh2ayP9H4+9malhr
         LieTxf5JINfNTvtA5Uygyh7Xw8JquLK5FVUEJkm3Iup7p7qAihPBV7Sno2oswiEmY6Uz
         Q/w8azG3C1ZFbBDAkll/+VyyyQIghB+YyHo+YZDVBHbwvKCMSOvL89LsPOs/lOWazEkZ
         YSG6SVnQx4BeABzKqaWq+HGv/A/afUVBdrIgVXXzG5GjXtu2vgWqi2UtA8L3ATC53Y45
         81VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMw+kz7VvNt10l99xNcskuPZPya3naBOsBpUrs7KJdVUEvkcNxEPS7qLuZZDgOvQeTJZGxH6sJtjdobcuw536ZhYNeMiVk/1s3gUa61JWHAkcKD9lz0aOmJnLJcLyz+UkbCj0NT5F66EwwRW/ZIzlAB0twbmmEXJ7Dputv6cnGYThGRPhwr7avzIyPJQ==
X-Gm-Message-State: AOJu0YwtH3F+2XD4GJeAD2AdBJaqDlcdxH3tae2d92y4a55/aZ0xU50M
	1nn3dWXo/oB8aoPEC2qJF6SrVeuruqm40Su4DAnPRjSkKlEE1bSdYssMIZVs
X-Google-Smtp-Source: AGHT+IHywpP31x3vB3Q29gUAbKdQEV2oUwRHXp0YJ5LMoyXhgaFv5T2z+t1ZD3jER6jPEg2htLbhLA==
X-Received: by 2002:a5d:69cc:0:b0:368:3782:c2b3 with SMTP id ffacd0b85a97d-3719464ddbfmr1430804f8f.29.1723794676676;
        Fri, 16 Aug 2024 00:51:16 -0700 (PDT)
Received: from tablet.my.domain ([37.30.8.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm3026201f8f.52.2024.08.16.00.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:51:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 16 Aug 2024 09:50:58 +0200
Subject: [PATCH RESEND v2 1/6] ASoC: dt-bindings: midas-audio: Declare
 required properties for GPIO jack det
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-midas-audio-tab3-v2-1-48ee7f2293b3@gmail.com>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
In-Reply-To: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=iV+M9xizwvmZx1O7iSf9l6DHKdHcEZAQiXWFY1PnmrY=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmvwTmEGjYoH5a0h0jF9Zer/NMFym7Mqel3/LMQ
 CmbFgGA8K6JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZr8E5gAKCRCzu/ihE6BR
 aKa3D/9D6JLWduoKlwrIuFmu2456p9viU5lFCbPcV+Nx1skh9KCVTHUG1/x8xKGd/Zmo6oJW6ev
 XFiez92qBEXk5+EgEXapAQLGEy1xhcCYBDUZ3jg3sCzEBhXHBcr0TZa5zy6nlIWYobX3RQjHQVA
 pSHpWyZMNZ5vYZPVVJ7mSnZvb8D0ruSOa+5+Ytpo1V9n0lukB3zqLP5BiAatnPh0drKNRqaHLAA
 GDEC4OpV3NkO6oYbsPvb8lUzaEtoKtN49VbRyBwUzQ7sSyKY/v3RhYniuMj7iwVgI3p+5DXy1bL
 r6/7RvcvbtUEe0uarpBtjFac1z3/FCenJxcQItjX+uQe0tru5xgUMBxPlk3LiRQZpN+VvwyUar+
 cs8H9eniyOOgVCkc7gJju7fhKregPwV67MKxes5FPlJRKclNrh45wkK01nb2HWqAUQz7UGjj3UY
 SmIXhbsSFC1A1gFEcsKVHnVcpAd+UhgNlVStyQSQxxEciICxQjk+HxHj9Sg0KInMa5JeN4VzWf3
 4lZa5yM5jWyr1In365tP3q54i89vcRgnzhLNorh3Ab8u6q3YB/HXLgpdyGnY49iFXLBc62LM7tA
 nSY7JItBJVDowVs1Q8bhxqeLq5NMXG1dTRmtfJAEuP8rzkwe8qFFHm5xn6TSZolFO0BQ2E6HtGD
 AOJEIGsdx1zGFsQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

GPIO jack detection requires an IIO channel and the detection threshold
to work. Explicitly declare the requirement in DT schema.

Fixes: 0a590ecc672a ("ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Use anyOf instead of oneOf in headset-detect-gpios/headset-key-gpios
  if: statement
---
 .../bindings/sound/samsung,midas-audio.yaml        | 29 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 69ddfd4afdcd..5483421a6fd3 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -9,9 +9,6 @@ title: Samsung Midas audio complex with WM1811 codec
 maintainers:
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
-allOf:
-  - $ref: sound-card-common.yaml#
-
 properties:
   compatible:
     const: samsung,midas-audio
@@ -102,6 +99,32 @@ required:
   - mic-bias-supply
   - submic-bias-supply
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
+  - if:
+      anyOf:
+        - required: [ headset-detect-gpios ]
+        - required: [ headset-key-gpios ]
+    then:
+      required:
+        - io-channels
+        - io-channel-names
+
+  - if:
+      required:
+        - headset-detect-gpios
+    then:
+      required:
+        - samsung,headset-4pole-threshold-microvolt
+
+  - if:
+      required:
+        - headset-key-gpios
+    then:
+      required:
+        - samsung,headset-button-threshold-microvolt
+
 unevaluatedProperties: false
 
 examples:

-- 
2.46.0

