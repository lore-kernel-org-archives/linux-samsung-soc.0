Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E8641D62A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067890; cv=none; b=nF0yNSfovNniTwcxuiL1EP0GUpiI488M6CU2Ifm0wUCyqkX4X6AzjadaUfYY3pqZ+Ybcj5ZYu8CnAM4iJPZ79hVBdB+3f8mXSd/rPMPpHOUtYtpLXX6xMsO6qLiuZOh6x8ON46SsSjfxeKVB329318nkzR4iqgVmE17iLwqrtlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067890; c=relaxed/simple;
	bh=yfVlUKAddl4kTtUsempt+7UPHqLSqNbbJXlNW55TxBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWvBgqHYY7uYdqreEW+n0ABboibRp2ptceRU8sIg3I/5jM9yo50BZAJfsgWfylmselB6SM2+kX2lnjFwFDY3XhbcZs+1BqvJtE0XGBaD2YrNpX9GZ0dC7B9sCO/VHrN7Zj6Qq+24lTCnixK2ukrLvJRWEjJx8OGYFChrDW3+Kbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L8L5wLDe; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L8L5wLDe"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-388b404ea89so1406095a91.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784067888; x=1784672688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iLHxmEFEAAhUWHFz+6vyD9YF+Shz/3zBH9jPJj0HIOA=;
        b=L8L5wLDeLUYvsVUmRDerH0FJrE1XxxrPe53QjPmhYEvjkDSH0lTYwGmR0Rf2/R/J3t
         G73E5dM6YWKF1JtB05QgvraMvv0fOH+jmjvE83qSfZROpl0DCsBi/4vFLK9+74sPc9FN
         +R4GmTRiy7sfxPQo9cwTEOl0qWlmlEpNVLVYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067888; x=1784672688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iLHxmEFEAAhUWHFz+6vyD9YF+Shz/3zBH9jPJj0HIOA=;
        b=mkB6K7cOuo0gz0HkN4VCIMxDI9xzwP2hpA2et5gPFdWw1STJJYy2bGBq5QF+DEoMm/
         M95RhN4q0zHwcf8jb64SxqYY8MjTSy9dktmFhlok+V2X4F+5zoDtkis2dmfLWB3KXRok
         UJaMpSYBstar/cvYdWQGC9txJ0TFtMgCBxKIdnVKwwvhkmsvbSgeQqETT2yFrJ5jaEYi
         hhyY5TtTLsRmwveIFCyhPhOAprEZK6LShDSg5Jf+22W+WB1uoDjIsz44QglH5boGLhs6
         yu36ZVjh3m3jEl/siaj4Tj8eYpT2DJnatkV1yqmozNAWfzo57Iyhg5tfVWAXxFGsDGIi
         XdXg==
X-Forwarded-Encrypted: i=1; AHgh+RoSg7BYdIgPKezsAvNy5sCUg5PLX7mMvsV91OWjtCW4ewmCFL+axEbrv6s1Pj1/LTJiqGHhM12q28D8kyu27UyVng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSGFmKHxHUXsDNNwYVGO2vSTQAO2xcguqL9vD8iDOJo19n2zf
	o5dNiTcfSV7jiQNWsbDIekgYHUHfHrhURWQRopfFAz0V+TIU8s+Wuon781IKfAtARg==
X-Gm-Gg: AfdE7cn/PB4ysOxraV/U9u68+q839eatZ8sSlLE1jJwZcPx3flbwlWKVB4NGjnnnT2B
	Ex2H6NpXR4wzXYnJGX2ptDl4bJcDH+wbKIv6WX08zuGVIYqx3MfgkNmaFTPw09sLF4J4gPRt6bd
	+WR40B5fyk+E68j52TRssoFKeIgBoapuW36pbVSbz9b8TtO9zUUHjH9Xdi1BaDE02D5nuT8tY3f
	zs//Vz1WQeiPUattHmUdrhdTp6ffvz7yyLBcfG2td09FLAgusit+VOE+ntlrzd8Fg/ogPMw4VBy
	uHxMoXUy1QnheHa/pPDFTLHGnSjdMUW0lPB/oV8Hl802Buwt+2jqeim8FaLEMWj1EMnA022UFQ1
	esIo2pzOnV9mxB3Nkb8DuxP8VVe394e93Tqw4RGkrNGUCbO+MqxBY5SsthY7s2/TmiO+HOPuRZh
	Aj0vm5qgeChPD/eHjE93Oo+dMkOslv8mbE10CxvIwd7IjTXwJHL05tqmFnaQ0NoXmzDmUGsA==
X-Received: by 2002:a17:90b:2401:b0:38d:9eda:fa04 with SMTP id 98e67ed59e1d1-38d9edafc8emr12968752a91.2.1784067888503;
        Tue, 14 Jul 2026 15:24:48 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:32cb:eed4:7c:dc87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm76540741eec.9.2026.07.14.15.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:24:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
Date: Tue, 14 Jul 2026 15:21:45 -0700
Message-ID: <20260714152138.6.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260714222338.2965707-1-dianders@chromium.org>
References: <20260714222338.2965707-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce bindings for the MailBox Array IP block present in Laguna
SoCs (AKA "lga", AKA "Google Tensor G5").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../bindings/mailbox/google,mba.yaml          | 216 ++++++++++++++++++
 1 file changed, 216 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,mba.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/google,mba.yaml b/Documentation/devicetree/bindings/mailbox/google,mba.yaml
new file mode 100644
index 000000000000..6c4505a369e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,mba.yaml
@@ -0,0 +1,216 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/google,mba.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Google MailBox Array
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+description: |
+  The Google MailBox Array (MBA) is an IP block in Google-designed SoCs
+  starting in Laguna (AKA "lga", AKA Google Tensor G5). In a typical SoC
+  that includes this IP block, there are a number of instances of the MBA
+  controller with each instance having slightly different hardware
+  parameters and intended for communication with a different remote
+  processor.
+
+  An MBA instance has a "host" that is defined as the processor "providing"
+  a "service". This is typically not the main Application Processor (AP) but
+  is instead some specialized co-processor in the SoC like the Central Power
+  Manager (CPM). A processor (like the AP) talking to the "host" of the MBA
+  is a "client" of the MBA. A given MBA instance only ever has one host, but
+  it may have several clients. For instance, the CPM (an MBA "host") may need
+  to send/receive mailbox messages not just from the AP but from other
+  processors in the SoC and each of these other processors can be "clients"
+  of the same MBA.
+
+  The "host" of an MBA instance has full access to everything in the MBA
+  instance. It can access its own private set of "host" MBA registers, the
+  "global" MBA registers (if they exist), and all of the "client" MBA
+  registers.
+
+  A "client" of an MBA instance has access to the "global" MBA registers (if
+  they exist) and one or more sets of "client" MBA registers.
+
+  These bindings are focused on describing the MBA from the point of view of
+  a single client.
+
+  As per above, a client may have access to several sets of MBA "client"
+  registers. Each set of "client" registers represents a logical mailbox
+  "channel". However, because each channel may have different configuration
+  parameters and a mailbox "channel" in typical usage means one of a number
+  of identical channels, each channel in a Google MailBox Array is typically
+  referred to as a full "mailbox" and the whole collection of mailboxes as
+  the "mailbox array".
+
+  Mailboxes in an MBA instance have these features:
+  * 1 to 256 32-bit words of shared memory.
+  * The ability for the client to ring the main doorbell of the host and be
+    notified when the host Acks the doorbell.
+  * The ability for the host to ring the main doorbell of the client and be
+    notified when the client Acks the doorbell.
+
+  Some mailboxes may also have the ability to have counted doorbells. This
+  means that the receiver of the doorbell can tell how many times it rung.
+  This is intended for implementing "queued" mailboxes. See below.
+
+  The MBA hardware doesn't have any specific directionality. That is to
+  say, both the host and the client have full read and write access to
+  their shared memory. All mailbox instances have doorbells going both from
+  the client to the host as well as the host to the client.
+
+  The mailboxes can only be used for communication if the host and client
+  both agree on conventions. These conventions are described in the
+  device tree as they describe how the remote firmware is expecting to
+  communicate.
+
+  Current known in-use conventions:
+  1. An RX mailbox with payloads that are of a well-defined size.
+     On mailboxes of this type, the host is the only one to write shared
+     memory. After placing a fixed-size message in shared memory, it rings
+     the main doorbell of the client. The client reads the message and Acks
+     the doorbell.
+  2. A TX mailbox with payloads that could vary in size.
+     On mailboxes of this type, the mailbox client is the only one to write
+     shared memory. The client always writes a payload to the start of shared
+     memory and rings the main host doorbell. The client then looks for the
+     host to Ack the doorbell. The clients of the mailbox have ways to know
+     the size of any given message.
+  3. A half-duplex TX/RX mailbox. This is a mailbox that can switch between
+     convention #1 and #2 above. Since both sides write data to the start of
+     shared memory, the two sides must have some convention to know whose
+     turn it is to send a message.
+  4. A "queued" RX mailbox with a payload of a well-defined size.
+     This type of mailbox is only possible if the MBA instance can count
+     doorbells. On mailboxes of this type, the host is the only one to write
+     shared memory. When the client doorbell rings, the client reads a
+     fixed-size from the next "slot" in shared memory and then updates its
+     internal state. The shared memory is treated as a circular queue.
+  5. A "queued" TX mailbox with a payload of a well-defined size.
+     This type of mailbox is only possible if the MBA instance can count
+     doorbells. On mailboxes of this type, the mailbox client is the only one
+     to write shared memory. The shared memory is treated as a circular queue.
+     The client writes a fixed-sized payload to the next "slot" in the shared
+     memory (where the slot size is determined by the client's first transfer),
+     updates its internal state, and rings the host doorbell. The client can
+     keep writing more messages as long as the circular queue isn't full. The
+     client gets an interrupt when the host Acks a doorbell and can tell how
+     many doorbells still haven't been Acked.
+
+  Conventions will be supported with a small number of properties specified
+  for each mailbox.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - google,lga-mailbox-array
+      - const: google,mailbox-array
+
+  reg:
+    minItems: 1
+    items:
+      - description: Host registers (not accessible to client)
+      - description: Global registers (not present on newer IP blocks)
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^mailbox@[0-9a-f]+$":
+    type: object
+    description:
+      Each sub-node is a single-channel mailbox.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      "#mbox-cells":
+        const: 0
+
+      google,rx-payload-words:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 256
+        default: 0
+        description:
+          The number of 32-bit words in each mailbox message from the remote
+          processor. May be 0 for doorbell-only. If not specified this is
+          assumed to be 0.
+
+      google,mba-queue-mode:
+        type: boolean
+        description:
+          The remote processor is expecting the shared memory to be treated
+          as a circular queue and that there may be several outstanding
+          messages at once. Only usable on instances with counted doorbell
+          interrupts.
+
+    required:
+      - reg
+      - interrupts
+      - "#mbox-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - ranges
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      cpm_ap_ns_mba: mailbox-array@5240000 {
+        compatible = "google,lga-mailbox-array", "google,mailbox-array";
+        reg = <0x0 0x05240000 0x0 0x00010000>,
+              <0x0 0x05250000 0x0 0x00010000>;
+        ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        cpm_ap_ns_req_mba_client_0: mailbox@0 {
+          reg = <0x0000 0x1000>;
+          interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+          #mbox-cells = <0>;
+
+          google,mba-queue-mode;
+        };
+
+        cpm_ap_ns_resp_mba_client_1: mailbox@1000 {
+          reg = <0x1000 0x1000>;
+          interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+          #mbox-cells = <0>;
+
+          google,rx-payload-words = <4>;
+          google,mba-queue-mode;
+        };
+      };
+    };
+
+...
-- 
2.55.0.141.g00534a21ce-goog

