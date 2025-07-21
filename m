Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C7C218ADC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753065989; cv=none; b=Th5zTsWS0KbRyxaaXEKK5Qe4/wl9DdKFqe831hf90Uq0XW8D/Q3U/C5IVySKQzCPuU251q6zf+mNXqlgGwzWtSkXaY1ZxXndCAYnEBHDtUhKlLQcx5l9vSBP1oADV2SBPBWxn9yTeqIpe56MWMUvRR92xuoNdL6nTRIPShZBbL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753065989; c=relaxed/simple;
	bh=2ptprntB66CAO/0c3A6MgoY0FoCICFGYRkMMclbHSfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=B6q1LaQDhwilWSnL3gPvrH5eWRyUFXPmS8QT/0TE82H6vYKVaVDeZsCB9f0Hx/crZUGrEXSzGOd2P9ihzHq6EzcafI5iu16NUfsJl3xX5CqwN8DwsFsIgepaqOV3Mq3BVpm7GowBctvSK/9eaOuiChbusGgkcS5l/eR+0zMkAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TA6PKCqU; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TA6PKCqU"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250721024614epoutp03495304a7778813abbec1dbf2f53bc09f~UJDcfaLuo2247822478epoutp03l
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 02:46:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250721024614epoutp03495304a7778813abbec1dbf2f53bc09f~UJDcfaLuo2247822478epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065974;
	bh=CpNmhokPwuwTpBn4wsN8PkNB3GZ70idsqXpWNdIFNhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TA6PKCqU5xBPBNpEHgcfDryRLFZEh/Pksi7SNitjJ2BxVKhGIgC2xlhL/ajwEAgwc
	 XYvieIaHdguWrTML3Vt8pRlZgYEBAQoFZrjLgeejO7EeJ3J8PWojM796COOfFCUsPB
	 9njO65FHI2g1ITaq0StMqP6uVmeskZfjAeHGAiIA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p3746a1cce420efac6e5ab7540be0e46fd~UJDb6tTZg2776827768epcas2p39;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.98]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bllC84q0rz6B9mH; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b~UJDahuYAm1461114611epcas2p1i;
	Mon, 21 Jul 2025 02:46:12 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip219c09e9d567601a3aba9e4dd34546308~UJDadbf4Z1051310513epsmtip2T;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 9/9] ASoC: dt-bindings: sound: exynosauto: add PCM frontend
 nodes for ABOX generic
Date: Mon, 21 Jul 2025 11:30:52 +0900
Message-Id: <20250721023052.3586000-10-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b@epcas2p1.samsung.com>

This patch extends the Exynos Automotive ABOX generic device tree bindings
to support PCM playback and capture frontend nodes.

Each PCM device node describes an audio stream interface handled by the
ABOX DSP. These nodes include properties for stream ID, IRQ, ADSP core
assignment, buffer limits, and stream category (deep_buffer or compress).

The bindings use patternProperties to match playback and capture nodes
as children of the abox_generic controller.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../bindings/sound/samsung,exynosauto.yaml    | 126 +++++++++++++++++-
 1 file changed, 123 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
index 3a7b5be627ee..e477550afc7c 100644
--- a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
@@ -28,6 +28,14 @@ properties:
   compatible:
     const: samsung,abox_generic
 
+  status:
+    enum: [ okay, disabled ]
+    description: DTS node enablement state
+
+  $nodename:
+    pattern: "^abox_generic$"
+    description: Node name must be 'abox_generic'
+
   samsung,num-pcm-playback:
     description: Maximum number of PCM playback instances (ALSA PCM devices).
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -42,7 +50,7 @@ properties:
 
   '#address-cells':
     description: Required for child nodes that may declare address space.
-    const: 2
+    const: 1
 
   '#size-cells':
     description: Required for child nodes that may declare address space.
@@ -55,6 +63,10 @@ properties:
       compatible:
         const: samsung,abox_ipc_generic
 
+      status:
+        enum: [ okay, disabled ]
+        description: DTS node enablement state
+
       samsung,num-irq:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: Number of IRQ channels supported for IPC routing.
@@ -65,13 +77,92 @@ properties:
 
     additionalProperties: false
 
+patternProperties:
+  "^abox_pcm_(playback|capture)@[0-9a-f]+$":
+    type: object
+    description: |
+      ABOX PCM playback or capture frontend device node. These nodes define
+      individual PCM streams used by the audio subsystem, and are children of
+      the abox_generic controller. Each node describes a PCM stream ID, IRQ line,
+      ADSP core allocation, and stream-specific parameters.
+
+    properties:
+      compatible:
+        enum:
+          - samsung,abox-pcm-playback
+          - samsung,abox-pcm-capture
+        description: Compatible string for PCM playback or capture device.
+
+      reg:
+        maxItems: 1
+        description: Offset for pointer register (pp_pointer_offset) used for communication with ADSP.
+
+      reg-names:
+        const: pp_pointer_offset
+
+      samsung,id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Unique ID per PCM Device, separated by stream type (playback or capture).
+          Must be less than samsung,num-of-pcm_playback or samsung,num-of-pcm_capture
+          defined in the abox_generic node.
+
+      samsung,irq_id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Software IRQ ID assigned in the control domain. Represents the software interrupt
+          line used by the ADSP to communicate with this PCM device.
+
+      samsung,allocate-adsp:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Index of the ADSP core that this PCM device is allocated to. Indicates on which core
+          the stream is handled.
+
+      sound-name-prefix:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: |
+          Prefix name for ALSA DAI interface. Helps to namespace controls and routing.
+
+      samsung,category:
+        enum: [deep_buffer, compress]
+        description: |
+          Type of the PCM stream. Can be either 'deep_buffer' for normal PCM playback/capture,
+          or 'compress' for compressed offload streams.
+
+      samsung,buffer_bytes_max:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Maximum size (in bytes) of the DMA buffer allocated for this PCM device.
+
+      '#sound-dai-cells':
+        const: 0
+        description: Must be 0. Required by ALSA SoC bindings.
+
+      status:
+        enum: [ okay, disabled ]
+        description: Device node enablement status. Set to "okay" to activate the node.
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - samsung,id
+      - samsung,irq_id
+      - samsung,allocate-adsp
+      - samsung,category
+      - samsung,buffer_bytes_max
+      - '#sound-dai-cells'
+
+    additionalProperties: true
+
 required:
   - compatible
   - samsung,num-pcm-playback
   - samsung,num-pcm-capture
   - samsung,num-i2s-dummy-backend
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -81,7 +172,7 @@ examples:
       samsung,num-pcm-capture = <32>;
       samsung,num-i2s-dummy-backend = <5>;
       status = "disabled";
-      #address-cells = <2>;
+      #address-cells = <1>;
       #size-cells = <1>;
 
       abox_ipc_generic {
@@ -89,4 +180,33 @@ examples:
         samsung,num-irq = <64>;
         status = "disabled";
       };
+
+      abox_pcm_playback@3fd0000 {
+        compatible = "samsung,abox-pcm-playback";
+        samsung,id = <0>;
+        samsung,irq_id = <0>;
+        samsung,allocate-adsp = <0>;
+        reg = <0x3fd0000 0x10>;
+        reg-names = "pp_pointer_offset";
+        #sound-dai-cells = <0>;
+        sound-name-prefix = "ABOX";
+        samsung,category = "deep_buffer";
+        samsung,buffer_bytes_max = <0x24000>;
+        status = "disabled";
+      };
+
+      abox_pcm_capture@3fd0400 {
+        compatible = "samsung,abox-pcm-capture";
+        samsung,id = <0>;
+        samsung,irq_id = <32>;
+        samsung,allocate-adsp = <0>;
+        reg = <0x3fd0400 0x10>;
+        reg-names = "pp_pointer_offset";
+        #sound-dai-cells = <0>;
+        sound-name-prefix = "ABOX";
+        samsung,category = "deep_buffer";
+        samsung,buffer_bytes_max = <0x24000>;
+        status = "disabled";
+      };
     };
+
-- 
2.25.1

