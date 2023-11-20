Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50950C61D99
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Nov 2023 21:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbjKTVVm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Nov 2023 16:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232136AbjKTVVZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:25 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2674FE3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 13:21:21 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40a48775c58so21341985e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 13:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515279; x=1701120079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGbaQ0HPCBmwnLgBXIo+1TiPclTwFAe7Vfce3B7czes=;
        b=NvVOVKMwdqnuggrWZyqrxgYoKOm65YfA4b6qfGaAnMRw1FBIo9aUBnVoKc/veiWivv
         rhCBLZN1EBZcNV8JrNj2SrUkQu8Fv0y2zfhy8G/hgTfZ3/dOegYKy6GIvJbVExkOcRi0
         ihCButLFWzy6p8Ykh0itPPDMs/p7zfCGOXdq+3B1Rqy4QnCOLQVJq/gueUr0CtYFmTL8
         1S1LAv0Dbm+pOR2jQwMcRkgN6Vmr1uAHTAxHF1SAbYpQkFGl6a8WPcUANiW9qfF4h8cL
         /4BcmP2AtFqSCmIqTsCkFXHoSOlQ+ITxxjyVSiooqdsfZqBdEqei0C859nSSSshVE6uf
         QTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515279; x=1701120079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGbaQ0HPCBmwnLgBXIo+1TiPclTwFAe7Vfce3B7czes=;
        b=iGmS7yL+M59VAupTdCZFc0gfUTbPtCdmBiZhXJEPhTZU5N47QgYhgRiyd+M48A9wbc
         unrsH9id8WltbKmkM+1zY56NKbJXaKydHEAoQRru/3NvHq9Mibn0QW6xPnIIdEKORYoX
         its+JZvEQynSA+5etRIOJ1oFFAoCmHwQ1larO3etUF7LQAD8OASFGoy24BFp3y7/RYez
         1cpSy/rCOsbMRKvB2v52mORMXtbteiCX20eYKcCERUbJ5vx6+u/BwgYI5UAlDowcKozt
         wXcofOKt8rYdDKkMb27VrWIc763eJu1AJvTMUVPJ37t5ZdsNbVSGJdSwrH0CxTi6iSjx
         5vSA==
X-Gm-Message-State: AOJu0YzXIEcSatYuFp5wM55uhrpWiDMECoHWa7JCMYaIzp1paJ9wDH2d
        pC3xbjfZfL60SD+oY2mMbnkleQ==
X-Google-Smtp-Source: AGHT+IH602lqzhrrd5ihv9nkycuna2+sAG626bnATZiwyxXwpH3DfNnEo9fr+SzZKcNrL/DjF/2qUw==
X-Received: by 2002:a05:600c:4f04:b0:409:101e:235a with SMTP id l4-20020a05600c4f0400b00409101e235amr6149430wmq.28.1700515279671;
        Mon, 20 Nov 2023 13:21:19 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:19 -0800 (PST)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, cw00.choi@samsung.com,
        alim.akhtar@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v4 09/19] dt-bindings: serial: samsung: Make samsung,uart-fifosize required property
Date:   Mon, 20 Nov 2023 21:20:27 +0000
Message-ID: <20231120212037.911774-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Specifying samsung,uart-fifosize in both DT and driver static data is error
prone and relies on driver probe order and dt aliases to be correct.

Additionally on many Exynos platforms these are (USI) universal serial
interfaces which can be uart, spi or i2c, so it can change per board.

For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
required property. For these platforms fifosize now *only* comes from DT.

It is hoped other Exynos platforms will also switch over time.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index ccc3626779d9..22a1edadc4fe 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -133,6 +133,23 @@ allOf:
             - const: uart
             - const: clk_uart_baud0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-uart
+              - samsung,exynosautov9-uart
+    then:
+      properties:
+        samsung,uart-fifosize:
+          description: The fifo size supported by the UART channel.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [16, 64, 256]
+
+      required:
+       - samsung,uart-fifosize
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0.rc1.413.gea7ed67945-goog

