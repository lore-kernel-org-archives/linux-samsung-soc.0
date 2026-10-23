Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799686;
	b=LkHEi+9cK1gv07nUdHExv6VK0cRNJWPLBhCiJ0J65oDDPx1ghvPK3i9NBdVCsCEQcQjR
	 vWspW+3F70DM64U9jJyi3d4pepVaUteGSDoFEdn/FBz9hWbBrZ6YnlRmaE6rOdmWXNXmX
	 v8u4RL02lY3maMm+QIVn5LBTID0A7lK7zZGyXVqoR+KdsUVsvfOEhZOi+4U5XFla9cmE4
	 vxcS7PXaq8cl86ZOr2AShpiChHsIymg4Mk7gf8aaO6f92eDKWhCjlTd87BZsQUGMyXYOk
	 XKvTFSMCLWeQHJwgTz3RyDM/UEh90OLDPekMHFl7WIrbImhi0z642dH6IelIfTE3ZDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mTvncITSrmjlfT0ndh2hw1OrlpimSBkCjP2VnMZnln0=;
	b=QeEFi+3/85d/V0oOa4Qc0d/mwqT0tBBWTYya3+wFz7cLr9saHqAdATkKLCn8Tsu+ZLiQ
	 XvJMp0gMIS+ppyhVptOlhFfGKV81I5S2IcnoPvFPCm96tQqkuKXC8Tki/1rnz3SMAK6Ai
	 h30aQvEF53no8epSnTWIyS3C6URO2mn9RUeozMBRYy+U3eAgyuPqg2pPZt5EGzTYquIBo
	 OLab5d9XI/H+TztRa8yFUfoAe8MbOxRwzgaS0QVkSzqozBggFq2dPKVskmIKK5fSEeAfa
	 0LsXbcTsRLNsNaxEksexwCD0eyekR1buhk/CDUwjI2oc9G1uz9+40nUlzq0rb9wewSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="i/9op5ma";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022FD606A331
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 23:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022FD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i/9op5ma
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso2350344eec.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 16:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799685; x=1793404485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTvncITSrmjlfT0ndh2hw1OrlpimSBkCjP2VnMZnln0=;
        b=i/9op5maoWDccqAPC7T9ZrktAF8gSQmXqzeS5XAX25JC9j4dl52SlatN7qTOj7sqxg
         /xtbCpCd7vVrtRx99MV6qwM5DyDfjZ34V7K0r2bBuF9RwnLdkPpTEXcOgVcybbOLKpK4
         Dh94uTR9e+y7JD8Lq2XLMEde5EHkLUzMarhL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799685; x=1793404485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mTvncITSrmjlfT0ndh2hw1OrlpimSBkCjP2VnMZnln0=;
        b=CDHCca0GMiCyWVOgn6x1L9S/pLsidLlEUPDzmoRwH4T5puOa4BZFHtTWLUp39IviNo
         WKOx8uG4DuuZGCB4prtpgEmX2JhxFnJn1Pcdynxs/zqIQjx2UJu37JacnYasN8rrSml+
         PDuCK3du8i6VMPa6bWix0FtkARJdCXUAq0KovFv6JgfwnrMntSH6/eCY0Y43NBFsBvSU
         udcBRaQJ2+mMExCdDyTBvuFLBLICjjLgMLC2MPPBISPEO12Cu5P1SdZhigCtIXmmFQrl
         aeOQ4xfRIhxK30YM76wfkWW3LYMrm4m42y3VEoRTOjpvDVkCgZ5SrNZQYS7jT5JcJpd1
         AYpg==
X-Forwarded-Encrypted: i=1; AKwUvBwF10ufLAMoG8ZfrdMMr47t4zkR7fXnpqieNRwlsjEgLD4Po8THkhlGSMj6mxVbYLWOPtVUWznYGiAuZyZvPZ58mA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIzKyhMq/QJLvnDyWcvwqbs2lTCy3wkMJEjerYop+x3cfnn04mz
	HPISliY3z0mJDqFZ5kEBidouPpUdeCY82NKI6AqB+NNub9qGrXY4qwRnOTPWt+xd3w==
X-Gm-Gg: AYBFou1FTxs61NK0lfuofxzI0k9H6wR2jxZVPTfR7V9kSlsdUFjOCTzUTljZ+hno4Ev
	KFBusYMeVBvAHsyiNKtKCCIfJJzo3+/uDQhmePOuECKT3O5PsZd70goEF+L05vvIhg46sDPWVDB
	cDp7KrI3GgZNg9krHf6ZAvlsXL+AHqYJOLM9k62/77NTA90a/vRemltW7hdnK5or3Gnp0U6vCiG
	vS4T3rmxXbSwB8BDMK9EapEa9xBGC6wG6rG21HohPPSd+9nYWxs+1ADYQCGTa/MglDbo/RH4+g/
	/qOGu2a148Cs4ZegArtxH2uJWLsP8CHSHfnjjtFQ0vVbTwSvn5MqGaVCa0Z4rXtwrwGFUhmkITP
	qldxfko+1PJwYS4yufqzvtRxX4ExmTCZaTlWj8ouUoBjxQYCHv0+QXoEKQxJD3SK6JMu9R0EOUX
	k9GfNKhTqOqq7r4j0S35rcdnYOb+tZ9h6p4N6vAw0bFW27NVV9xiKTGaUL7DhVAC0dGnRRBNU7n
	Qe0oAhysp9rLIU1grNWqI8aKcx01FRhCMbQw1FXr31RIfr3bw2ADgehkCEjob2Q4lHAi4XQXYv1
	UZTgMO0Ip3T3DeT8I4PtBI3BzfDc452JUkaBFKc/
X-Received: by 2002:a05:693c:4153:10b0:369:21a:dce0 with SMTP id 5a478bee46e88-369e847a667mr1124175eec.6.1792799684880;
        Fri, 23 Oct 2026 16:54:44 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
Date: Fri, 23 Oct 2026 16:52:20 -0700
Message-ID: <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023235408.3063350-1-dianders@chromium.org>
References: <20261023235408.3063350-1-dianders@chromium.org>
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

Introduce bindings for the MailBox Array IP block present in Laguna
SoCs (AKA "lga", AKA "Google Tensor G5").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Rename binding file to google,lga-mailbox-array.yaml.
- Drop generic "google,mailbox-array" fallback compatible.
- Add "google,tx-payload-words" property for queue-mode TX message size.
- Remove unused labels in DT example.

 .../mailbox/google,lga-mailbox-array.yaml     | 226 ++++++++++++++++++
 1 file changed, 226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml b/Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
new file mode 100644
index 000000000000..f265993fe71d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
@@ -0,0 +1,226 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Google LLC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/google,lga-mailbox-array.yaml#
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
+     memory, updates its internal state, and rings the host doorbell. The
+     client can keep writing more messages as long as the circular queue isn't
+     full. The client gets an interrupt when the host Acks a doorbell and can
+     tell how many doorbells still haven't been Acked.
+
+  Conventions will be supported with a small number of properties specified
+  for each mailbox.
+
+properties:
+  compatible:
+    const: google,lga-mailbox-array
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
+      google,tx-payload-words:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 256
+        default: 0
+        description:
+          For queue-mode only, the number of 32-bit words in each message we
+          send to the remote processor. If not specified, this is assumed to
+          be 0. This is only for queue mode where we need to divide up the
+          message buffer into chunks.
+
+      google,mba-queue-mode:
+        type: boolean
+        description:
+          The remote processor is expecting the shared memory to be treated
+          as a circular queue and that there may be several outstanding
+          messages at once. Only usable on instances with counted doorbell
+          interrupts.
+
+    dependencies:
+      google,tx-payload-words: ['google,mba-queue-mode']
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
+      mailbox-array@5240000 {
+        compatible = "google,lga-mailbox-array";
+        reg = <0x0 0x05240000 0x0 0x00010000>,
+              <0x0 0x05250000 0x0 0x00010000>;
+        ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        mailbox@0 {
+          reg = <0x0000 0x1000>;
+          interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+          #mbox-cells = <0>;
+
+          google,tx-payload-words = <4>;
+          google,mba-queue-mode;
+        };
+
+        mailbox@1000 {
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
2.56.0.257.gf7497c7d27-goog

