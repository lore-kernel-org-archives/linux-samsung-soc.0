Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F6FF4FA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727362; cv=none; b=qUtLOqviUTke+t7XCHFrTc4Z1r7ODWKaQTUmCKR4TRS6jNcx/c4q4k1Ay7VQMN5EAAPK0bogLk+EDw/kOYVMC5H/wK0EbLanEtmyJubcpkPLBVr+mv5svaT3NBaXO8TiuRvw32wym7uB2DZ0N29C04h1yOcSZcTZ1bcdWa2k7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727362; c=relaxed/simple;
	bh=CVJsmgxavod5vW/XmANPcXXcBuMVTgl2hshMIAup3VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Hq9ThVKRnNmum52rIJolf5yfyZw4JADwHZrejes64xj3K66XGQldKvL0Z4gnz4kK1LiUC1YngVZwwh8Nioe1johAb5k6c2ZMrV/yU+3c3cP+WK4yuF3Ng0/T+X9LNg8G2b3OF3mGhzbze9hkbt0U95nIQJ0sUtomj1l9bl8/lnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRaTPEp+; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRaTPEp+"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-65a26c220b6so223018a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Feb 2026 04:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770727358; x=1771332158; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4PaNzsG4CVMOxWuwLS+sVgkhMu+9HTz+VMHIXKiHZ4=;
        b=mRaTPEp+6fVnekQ0IiZ4T79vKYQJd9Qmonlhb3WvTZQvJBlt0fp6lqxc9tx/sveI+Z
         6w68uKsgBJJft6xsGqnZF/uHIgw2uDuQQlqejfBtrscS7+W8PcR3mCBLVN4UEvSfP3TP
         jdQb0hQOgaRE2Z4zoWrDMmm2nuVxR9o7xABSbAGl17BS/gJGc7GVzTAlfDYWt8DFg5+R
         ZSmmZe+4BNM/QAJA2h8uED6HOgDoE2VczdhE3pSMxgDsHsM7qq9xAfaPPfikAYXn5MYn
         gQxcDQb2eV9MEH1bnGSPLz3LKGlzssTIHNTk62o4kjFkr8yfD9PAjB0vMX9KhXanuS8M
         ZFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770727358; x=1771332158;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4PaNzsG4CVMOxWuwLS+sVgkhMu+9HTz+VMHIXKiHZ4=;
        b=ZF4TJhttcLGOyRpNW8EOYj1N7qGp0OpUuDmB9zU2Ca50RhxAjLjBTxQ0YBPMPBPGvp
         e+0l4RDWKK8cr3pbrpXAQzN4T/Q4hNYrwQIbLL3lEi6MWMtJi9Lu8J6Pmn9uuBzxvTxs
         MKwpPCRKPMhRpHoDbD4CWcQ8hR04QpfF+XPNxLJaQeZ/u6+aOWxizJYm9HKUVqmQlThx
         wyoMT11YbuMs4o3DrCWeHRAOZUlnUAW+kXxnEHL+75BNFC9bR3z8wB6SE9/2LqWn9eQ3
         9VcqaASFtio/gGMnQZprbIx39wGi8PIAlWhaOpit8Z0vqZo4VlqD5G6Vw8RPXLm0BJpR
         YL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU02sYaa32w8cYNlaNpsWTkfpeEPjnYo22SkOrYS4eznouf9iyQ3EQnxWrfjGUnaPI7KEHbzgVHEafQhvU/QsJwfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8rVCaDoJg3Ynh1J6459BXHLBFlnxwEn470F39UQhfob7Rd/Y
	1zt7rhvuik4ACvEk4AJY3z5dnyImfEVi5iPo1MJ4Zccv4AixYs23l+8CDgPs8r8L/js=
X-Gm-Gg: AZuq6aLqoZdh3Uv8SpPrmic+yrN/vBPH3rOtzl8CUR3iAMpiedrQmDSfcK0soYk1Y/g
	2s7N71RdNFwNL72ANUfdOGTm1vob9tyGjYNLBWBHokM1LKuUSGtCb8y0GEZJ3Tytj5fylj4CX4b
	b8ThEH3wEGsVPCMjyM+O0Tgtnz/vXmaMyPkfo1BY9CJWMS1QDetuZgRrCtoNdRo4rUK1d9bwdzg
	57ghicVX1DWGVXuuB5+JjplxZefIdMka/I9Tt4CGm0O7iKQzO1yesqYIbIdztI3C8ZCfL1vO8tm
	fFnGrgncDNonJmvE0gGH/WmSNujdL44O/7WWdLjknxjnqc0YxT4MpMAJK4JVGQY75yrXAmdSTvX
	0cH6Xg3hoFv/qjDAg3F2UtdnVhAXuPiP12z2Eg9VBJCcPaPQEkeR5rGBmkieJEU5elpbMHoomWn
	1QCCtO/283WkOhABSzlAi0G9wnjpCOrgDj8d7r7DXc87Edu9U6G3+cdiUjWG+qdCK57TtTq7m3f
	09L+xDfGtahvD7kyA==
X-Received: by 2002:a17:907:c23:b0:b8d:bf4d:7463 with SMTP id a640c23a62f3a-b8edf378331mr970231466b.31.1770727357750;
        Tue, 10 Feb 2026 04:42:37 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ef25388dcsm440823366b.54.2026.02.10.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:42:37 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 10 Feb 2026 12:42:32 +0000
Subject: [PATCH v8] dt-bindings: firmware: google,gs101-acpm-ipc: add
 S2MPG11 secondary PMIC
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-s2mpg1x-regulators-v8-1-c429d709c0e0@linaro.org>
X-B4-Tracking: v=1; b=H4sIALgni2kC/23SS27DIBAG4KtErEs1PMwjq96j6gJscJBSO4XES
 hX57h2nTevKLH/EfCNmuJEScgqF7Hc3ksOUShoHDOZpR9qDG/pAU4eZcOANKBC08PdTz640h/5
 ydOcxF6qdZK0R1jofCRaecojpekdf3zAfUsF7n/ceE1tOH5yscROjQLGV0RKitC68HNPg8vg85
 p4s3sTXhqoaHA0PIoYYO6442xji12Cs/qxJLIbxVnltAzRmY8iVwaBqSDSsbG3QXHXSu43R/Bm
 c66rRoAEtSC8UeLQ2hnoYChg0VUOhYXCcXnXMR9ttDL0yOK8aGg3hWbRGsIhz/WfM34vP4eOCn
 +j8s/15/gJQ0lR2YgIAAA==
X-Change-ID: 20250603-s2mpg1x-regulators-7a41c8399abf
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
as a sub-PMIC.

The interface for both is the ACPM firmware protocol, so update the
binding to allow the relevant node and update the example here to
describe the connection for both PMICs.

Since we have two PMICs here, but can not use the 'reg' property (as
the addressing is based on software, i.e. the ACPM firmware), the node
names reflect that with their respective suffix. The existing 'pmic'
therefore becomes deprecated in favour of 'pmic-1'.

While at it, update the example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
This is the last patch to be applied from the original series. Ideally
it should be applied on top of commit 914809c666d6 ("Samsung S2MPG10
regulator and S2MPG11 PMIC drivers") from
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/
or any child thereof due to patch context. That commit exists in
linux-next.

Original cover letter below:

This series extends the existing S2MPG10 PMIC driver to add support for
the regulators, and adds new S2MPG11 core and regulator drivers.

--- dependency note ---
This series must be applied in-order, due to the regulator drivers
depending on headers & definitions added by the bindings and core
drivers.

Due to patch context, there are dependencies on previous Samsung MFD
patches, hence this series is against current for-mfd-next.

While these patches compile, regulator probe will only be successful
with my deferrable regulators patches from
https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
(already in linux-next).

I think patches up to and including mfd changes could go via the MFD
tree, and regulator patches using an immutable branch via the regulator
tree on top.
--- end ---

The patches are kept together in one series, due to S2MPG11 and its
regulators being very similar to S2MPG10.

The Samsung S2MPG11 PMIC is a Power Management IC for mobile
applications with buck converters, various LDOs, power meters, and
additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
a main/sub configuration as the sub-PMIC and both are used on the
Google Pixel 6 and 6 Pro (oriole / raven).

A DT update for Oriole / Raven to enable these is required which I will
send out separately.

Cheers,
Andre'
---
Changes in v8:
- resend patch 7 only with updated commit message, as all others are
  merged already
- Link to v7: https://lore.kernel.org/r/20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org

Changes in v7:
- rebase against for-mfd-next
- add 'domain_suffix' to s2mpg11_irq_chip_pmic (patch 9)
- Link to v6: https://lore.kernel.org/r/20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org

Changes in v6:
- merge patch 21 into 15 (Bartosz)
- merge 'con-id' handling into patch 15
- collect tags
- Link to v5: https://lore.kernel.org/r/20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org

Changes in v5:
- rebase against mfd/sec alarm IRQ rework
  https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org/
- switch to async probe for mfd
- Mark: one MFD cell per PMIC, not per PMIC rail - drop or update
        related patches
  - making the series runtime depend on
    https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
- new patch:
  - mfd: sec: s2mpg10: reorder regulators for better probe performance
- collect tags
- Link to v4: https://lore.kernel.org/r/20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org

Changes in v4:
- Krzysztof:
  - s2mpg10-regulator.yaml: move additionalProperties to after allOf
  - s2mpg10-regulator.yaml: use $defs, not definitions
  - split samsung,s2mpg10-pmic.yaml and samsung,s2mpg11-pmic.yaml
  - add full example for samsung,s2mpg10-pmic.yaml and 11
  - acpm binding: commit message update
  - acpm binding: pmic -> pmic-1, pmic2 -> pmic-2
- ensure binding file names match bindings
- fix typos in s2mpg11-regulator.yaml description text
- collect tags
- Link to v3: https://lore.kernel.org/r/20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org

Changes in v3:
- Krzysztof:
  - split s2mpg10 core binding into separate file
  - drop PCTRLSEL values that can be described using standard
    properties, and update remaining macro names (self)
  - drop maxItems:1 where not needed (Krzysztof)
  - samsung,ext-control-gpios -> enable-gpios
- fix LDO20M_EN pin name -> VLDO20M_EN
- move all binding patternProperties to top-level
- one (driver) instance per actual rail, not per rail type (LDO or
  buck)
- new macro REGULATOR_LINEAR_VRANGE() (patch 10)
- address some (pre-existing) checkpatch warnings
- various updates to regulator driver (patch 16 & 19).See footer there
- more descriptive commit messages
- Link to v2: https://lore.kernel.org/r/20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org

Changes in v2:
- s2mpg11 also exposes additional GPIOs, update all relevant commit
  messages (nevertheless, GPIOs are out of scope in this series)
- fix some commit message typos: s2mp1 -> s2mpg1
- patch2: drop | (literal style mark) from samsung,ext-control-gpios
- patch5: add | to vinb*-supply description for better formatting
- patch13: update ::of_parse_cb assignment
- patch15: drop duplicated ::of_parse_cb assignment
- Link to v1: https://lore.kernel.org/r/20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org
---
v4:
- Krzysztof:
  - update commit message / subject
  - pmic -> pmic-1, pmic2 -> pmic-2
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..e68f9c3ca5e2619bacc0c8d843ec4984c0947fd8 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -37,6 +37,7 @@ properties:
     maxItems: 1
 
   pmic:
+    deprecated: true
     description: Child node describing the main PMIC.
     type: object
     additionalProperties: true
@@ -45,6 +46,24 @@ properties:
       compatible:
         const: samsung,s2mpg10-pmic
 
+  pmic-1:
+    description: Child node describing the main PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
+  pmic-2:
+    description: Child node describing the sub PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg11-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -62,7 +81,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
@@ -70,10 +91,12 @@ examples:
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
-        pmic {
+        pmic-1 {
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
+            vinl3m-supply = <&buck8m>;
+
             regulators {
                 ldo1m {
                     regulator-name = "vdd_ldo1";
@@ -82,7 +105,13 @@ examples:
                     regulator-always-on;
                 };
 
-                // ...
+                ldo20m {
+                    regulator-name = "vdd_dmics";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN2>;
+                };
 
                 buck8m {
                     regulator-name = "vdd_mif";
@@ -93,4 +122,21 @@ examples:
                 };
             };
         };
+
+        pmic-2 {
+            compatible = "samsung,s2mpg11-pmic";
+            interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+
+            vinl1s-supply = <&buck8m>;
+            vinl2s-supply = <&buck6s>;
+
+            regulators {
+                buckd {
+                    regulator-name = "vcc_ufs";
+                    regulator-ramp-delay = <6250>;
+                    enable-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+                    samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+                };
+            };
+        };
     };

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20250603-s2mpg1x-regulators-7a41c8399abf

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

