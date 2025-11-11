Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A42DFA48
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 19:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762889202; cv=none; b=jE+k0b03A7uO6i30ahg1JBD7gkLmpJX/mFLTwf72JvrXR5PpW9osIbpZJ7vIobcsBPAjcfB4/BDy3G/cfryYfc51pDvwMAxY4PLXZxfKwGLzhdfPY5G52XZeRuHpaoOYbilgv9EpsdvhLcdpQP/cdA2a+60SJxFUn/m8eRgjYpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762889202; c=relaxed/simple;
	bh=ntK/UrJHb73TADpVCn2bgPri20vaZbmZx8YTKPY57c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UycdPAVfTdDgWDZiT9px/DZYO7ENJ1ETVUfia4QP7AgG999gDI+OvNVPH570Ji9yxOqcEm8mDBKTh7LjnPgjFxYuZUUCP2ol8P8Brum3qXcSqSfr2dtCOcXeySzgNuebj8+n74QmF2ZpJJkX5DMjoQxIeOSoVxmOMD/gL1DTDVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XT9e4kA/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XT9e4kA/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297e239baecso11698325ad.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Nov 2025 11:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889200; x=1763494000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOiFmH8IcpAAycagiDhvMebDsaH97fid1dP1cj7j5ro=;
        b=XT9e4kA/hlTvcKys4mxxf6CC7lEqMrIRPqbikPmjxGMyD49AuMB/Yj6sZ8O+6HW0Sf
         PH4vTdS1NqQxWK8RRU5wGJmkcpuSMb4v92p7tm4TybxCf2gHDTAVYEpgprHBvXBFWjmM
         5TSJb8MhS0txT93GDt2y9i4trrIjI5FLnQqTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889200; x=1763494000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOiFmH8IcpAAycagiDhvMebDsaH97fid1dP1cj7j5ro=;
        b=sJc0ZllSJfgPHeDhH9vOLV7eKi8UMH714JjFbfEr0QBuQVI3gjIZsiQm0pLBpQrKrl
         wNM932DXWXHDrhEhtc1Lx5JIOgAcWx6nGYmjnuKCE+IffGQ3OhpXTyZl8k1eWU9kmCFb
         2xcw/+r5uLuEmiPLraf/OslrLa64IwGI7PYkOZyY8j1TTIVFS5QE0ugRZ5C+AwvJ7r9x
         in6/FC8Ueg9IzASINUeB2A4+DJoi206BnZ01y0yT2KirlbFC2rEB+qcfisrTmXJAs5Mu
         icVX4rfCpI4wyxXWq/EBslj4BOIxR+8RGqqdffD4/Kc6O5JFT9eyfvHyF+o2ejAmQ5Q9
         aJlQ==
X-Gm-Message-State: AOJu0Yy7TocQ3Wn/eNF8YYET5HknclzWS0Npci/Wc54HCyb8J280MtdP
	EU2NGzoRG5XUEeEpzWzgpDQAkFp3w9fCAovhlpZfiohG1X92LtW2SA5lApQiHjARuQ==
X-Gm-Gg: ASbGnctRwOQLqLJ6fH9UC/OPGJxOQArheFaBlRDvLRQ4krJneTwZsUJCtObz8/d5rx0
	Sb5lWcLUg1dKyNrhX3xJo82cF8kOBKA+68PRaG/9ROE2AY/OqEnqZB9UQZb4wZDGZNNni3ueyc0
	Y4IX6tDUkk/YykSRmp4y0WeDAQd3mYrH0KXK2PZMhBLnZSwlEGF+CSl07rGfKwSqJvmaS5KznAN
	olMnNIfurIc2snn7v1P8lq1HRoKC2H3pMyWcrm06v2i08q8tVn5YOxR75d9JRWWia7NmVu7IBUP
	h1WAAFJeEHFQHOlU81sLVLaVLBbTblnMW3NaSE7lgDBzX2AfkiVzj+VpG8tJJjY2IUYM0lshHkY
	ajjBOGIKW+5V/9zGIRPxdmrh1fYOQrgBpDyKDkQXWiZ0NPS+r9ImAR4t7UO0CnqDblmCEmWTEk4
	r2NtR8CgO93ufOmxz52VGnOTtAXFfZNZWJpEV8WgG5Nt7bCgXtEfsv+9XP03k=
X-Google-Smtp-Source: AGHT+IExodWlioL1RP371Naq0b/EutoicCgiE5LxahmeztexeT56t42134E6a4LSJf3+oS+yxTk0Jg==
X-Received: by 2002:a17:903:234d:b0:296:5ebe:8fa with SMTP id d9443c01a7336-2984094a5bcmr45666845ad.23.1762889200005;
        Tue, 11 Nov 2025 11:26:40 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:39 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
Date: Tue, 11 Nov 2025 11:22:04 -0800
Message-ID: <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251111192422.4180216-1-dianders@chromium.org>
References: <20251111192422.4180216-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top-level DT bindings useful for Pixel 10 (frankel), Pixel 10 Pro
(blazer), and Pixel 10 Pro XL (mustang).

Since overlays are fairly well-supported these days and the downstream
Pixel bootloader assumes that the SoC is the base overlay and specific
board revisions are overlays, reflect the SoC / board split in the
bindings.

The SoC in the Pixel 10 series has the marketing name of "Tensor
G5". Despite the fact that it sounds very similar to the "Tensor G4",
it's a very different chip. Tensor G4 was, for all intents and
purposes, a Samsung Exynos offshoot whereas Tensor G5 is entirely its
own SoC. This SoC is known internally as "laguna" and canonically
referred to in code as "lga". There are two known revisions of the
SoC: an A0 pre-production variant (ID 0x000500) and a B0 variant (ID
0x000510) used in production. The ID is canonicaly broken up into a
16-bit SoC product ID, a 4-bit major rev, and a 4-bit minor rev.

The dtb for all supported SoC revisions is appended to one of the boot
partitions and the bootloader will look at the device trees and pick
the correct one. The current bootloader uses a downstream
`soc_compatible` node to help it pick the correct device tree. It
looks like this:
  soc_compatible {
    B0 {
      description = "LGA B0";
      product_id = <0x5>;
      major = <0x1>;
      minor = <0x0>;
      pkg_mode = <0x0>;
    };
  };
Note that `pkg_mode` isn't currently part of the ID on the SoC and the
bootloader always assumes 0 for it.

In this patch, put the SoC IDs straight into the compatible. Though
the bootloader doesn't look at the compatible at the moment, this
should be easy to teach the bootloader about.

Boards all know their own platform_id / product_id / stage / major /
minor / variant. For instance, Google Pixel 10 Pro XL MP1 is:
* platform_id (8-bits): 0x07 - frankel/blazer/mustang
* product_id (8-bits):  0x05 - mustang
* stage (4-bits):       0x06 - MP
* major (8-bits):       0x01 - MP 1
* minor (8-bits):       0x00 - MP 1.0
* variant (8-bits):     0x00 - No special variant

When board overlays are packed into the "dtbo" partition, a tool
(`mkdtimg`) extracts a board ID and board rev from the overlay and
stores that as metadata with the overlay. Downstream, the dtso
intended for the Pixel 10 Pro XL MP1 has the following properties at
its top-level:
  board_id = <0x70506>;
  board_rev = <0x010000>;

The use of top-level IDs can probably be used for overlays upstream as
well, but also add the IDs to the compatible string in case it's
useful.

Compatible strings are added for all board revisions known to be
produced based on downstream sources.

A few notes:
* If you look at `/proc/device-tree/compatible` and
  `/proc/device-tree/model` on a running device, that won't
  necessarily be an exact description of the hardware you're running
  on. If the bootloader can't find a device tree that's an exact match
  then it will pick the best match (within reason--it will never pick
  a device tree for a different product--just for different revs of
  the same product).
* There is no merging of the top-level compatible from the SoC and
  board. The compatible string containing IDs for the SoC will not be
  found in the device-tree passed to the OS.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
In the past, attempts to have the SoC as a base device tree and boards
supported as overlays has been NAKed. From a previous discussion [1]
"Nope, boards are not overlays. Boards are DTB." I believe this needs
to be relitigated.

In the previous NAK, I didn't see any links to documentation
explicitly stating that DTBs have to represent boards. It's also
unclear, at least to me, _why_ a DTB would be limited to represent a
"board" nor what the definition of a "board" is.

As at least one stab at why someone might not want an overlay scheme
like this, one could point out that the top-level compatible can be a
bit of a mess. Specifically in this scheme the board "compatible" from
the overlay will fully replace/hide the SoC "compatible" from the base
SoC. If this is truly the main concern, it wouldn't be terribly hard
to add a new semantic (maybe selectable via a new additional
property?) that caused the compatible strings to be merged in a
reasonable way.

Aside from dealing with the compatible string, let's think about what
a "board" is. I will make the argument here that the SoC qualifies as
a "board" and that the main PCB of a phone can be looked at as a
"cape" for this SoC "board". While this may sound like a stretch, I
would invite a reader to propose a definition of "board" that excludes
this. Specifically, it can be noted:
* I have a development board at my desk that is "socketed". That is, I
  can pull the SoC out and put a different one in. I can swap in a
  "rev A0" or a "rev B0" SoC into this socket. Conceivably, I could
  even put a "Tensor G6", G7, G8, or G999 in the socket if it was
  compatible. In this sense, the "SoC" is a standalone thing that can
  be attached to the devboard "cape". The SoC being a standalone thing
  is in the name. It's a "system" on a chip.
* In case the definition of a board somehow needs a PCB involved, I
  can note that on my dev board the CPU socket is soldered onto to a
  CPU daughtercard (a PCB!) that then has a board-to-board connector
  to the main PCB.
* Perhaps one could argue that a dev board like I have describe would
  qualify for this SoC/board overlay scheme but that a normal cell
  phone wouldn't because the SoC isn't removable. Perhaps removability
  is a requirement here? If so, imagine if some company took a
  Raspberry Pi, soldered some components directly onto the "expansion"
  pins, and resold that to consumers. Does this mean they can't use
  overlays?

To me, the above arguments justify why SoC DTBs + "board" overlays
should be accepted. As far as I can tell, there is no downside and
many people who would be made happy with this.

[1] https://lore.kernel.org/all/dbeb28be-1aac-400b-87c1-9764aca3a799@kernel.org/

 .../devicetree/bindings/arm/google.yaml       | 87 +++++++++++++++----
 1 file changed, 68 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index 99961e5282e5..f9f9ea1c8050 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -13,27 +13,18 @@ description: |
   ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
   devices.
 
-  Currently upstream this is devices using "gs101" SoC which is found in Pixel
-  6, Pixel 6 Pro and Pixel 6a.
+  These bindings for older Pixel devices don't use device tree overlays so
+  no separate SoC entry is added. This may change in the future.
 
-  Google have a few different names for the SoC:
-  - Marketing name ("Tensor")
-  - Codename ("Whitechapel")
-  - SoC ID ("gs101")
-  - Die ID ("S5P9845")
-
-  Likewise there are a couple of names for the actual device
-  - Marketing name ("Pixel 6")
-  - Codename ("Oriole")
-
-  Devicetrees should use the lowercased SoC ID and lowercased board codename,
-  e.g. gs101 and gs101-oriole.
+  Newer Pixel devices are expected to have the SoC device tree as the base
+  and specific board device trees as overlays.
 
 properties:
   $nodename:
     const: '/'
   compatible:
     oneOf:
+      # Google Tensor G1 AKA gs101 AKA whitechapel AKA Die ID S5P9845 boards
       - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
@@ -41,13 +32,71 @@ properties:
               - google,gs101-raven
           - const: google,gs101
 
+      # Google Tensor G5 AKA lga (laguna) SoC and boards
+      - description: Tensor G5 SoC (laguna)
+        items:
+          - enum:
+              - google,soc-id-0005-rev-00  # A0
+              - google,soc-id-0005-rev-10  # B0
+          - const: google,lga
+      - description: Google Pixel 10 Board (Frankel)
+        items:
+          - enum:
+              - google,pixel-id-070302-rev-000000  # Proto 0
+              - google,pixel-id-070302-rev-010000  # Proto 1
+              - google,pixel-id-070302-rev-010100  # Proto 1.1
+              - google,pixel-id-070303-rev-010000  # EVT 1
+              - google,pixel-id-070303-rev-010100  # EVT 1.1
+              - google,pixel-id-070303-rev-010101  # EVT 1.1 Wingboard
+              - google,pixel-id-070304-rev-010000  # DVT 1
+              - google,pixel-id-070305-rev-010000  # PVT 1
+              - google,pixel-id-070306-rev-010000  # MP 1
+          - const: google,lga-frankel
+          - const: google,lga
+      - description: Google Pixel 10 Pro Board (Blazer)
+        items:
+          - enum:
+              - google,pixel-id-070402-rev-000000  # Proto 0
+              - google,pixel-id-070402-rev-010000  # Proto 1
+              - google,pixel-id-070402-rev-010100  # Proto 1.1
+              - google,pixel-id-070403-rev-010000  # EVT 1
+              - google,pixel-id-070403-rev-010100  # EVT 1.1
+              - google,pixel-id-070404-rev-010000  # DVT 1
+              - google,pixel-id-070405-rev-010000  # PVT 1
+              - google,pixel-id-070406-rev-010000  # MP 1
+          - const: google,lga-blazer
+          - const: google,lga
+      - description: Google Pixel 10 Pro XL Board (Mustang)
+        items:
+          - enum:
+              - google,pixel-id-070502-rev-000000  # Proto 0
+              - google,pixel-id-070502-rev-010000  # Proto 1
+              - google,pixel-id-070502-rev-010100  # Proto 1.1
+              - google,pixel-id-070502-rev-010101  # Proto 1.1 Wingboard
+              - google,pixel-id-070503-rev-010000  # EVT 1
+              - google,pixel-id-070503-rev-010100  # EVT 1.1
+              - google,pixel-id-070503-rev-010101  # EVT 1.1 Wingboard
+              - google,pixel-id-070504-rev-010000  # DVT 1
+              - google,pixel-id-070505-rev-010000  # PVT 1
+              - google,pixel-id-070506-rev-010000  # MP 1
+          - const: google,lga-mustang
+          - const: google,lga
+
+allOf:
   # Bootloader requires empty ect node to be present
-  ect:
-    type: object
-    additionalProperties: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101
+    then:
+      properties:
+        ect:
+          type: object
+          additionalProperties: false
 
-required:
-  - ect
+      required:
+        - ect
 
 additionalProperties: true
 
-- 
2.51.2.1041.gc1ab5b90ca-goog

