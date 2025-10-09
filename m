Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B511A1E9B3D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023512; cv=none; b=R/GDHAa9Y0bzQttSzkZqZeUFo4+Db1djVWLOVKVZ6lHB606VnE1Qg9DLIvbAOZmPddehxdybWgx/ih/GUnM2bNy/JlzLFJpMUPWodez/0dNAXxt4fSLWyxBAPz2qlFoMC/EebEpsf40XMN0W70GKXnO7AjBMwniuB2Vh/bfAigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023512; c=relaxed/simple;
	bh=pveWC0dGG+QrmADRkCYghiuV6e2N7PQNMtP4GgXIjZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnLHYSNAD+HoG53sszHR+KtBzBOD9yiOwYtXKY3CVoCfhldt5VvY8jPpxNjVD7j9SjXVhD4SpjDrvZ4oKUsDG/HQ7pF0/QGBcHLYzAdRy/ZozePu2FlPAqbeMA/O3ZBQMsoBQ+EtU3Y0dp0ORL8aw7ThjTrV8E0pQUL3GMNS6U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z2p6zsSp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z2p6zsSp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78ead12so193369766b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023507; x=1760628307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIgGfpMab5d5IHvagQ8PqT9KdQ+uz2nglD6fw13G62A=;
        b=Z2p6zsSpQeMb+HUmmfzPT43PfrJslnlMcJyrPDQcpFhcwij6eHJLCOL+3aADB4hioG
         1QSswKRT3SUI7aDSO7bwyuumLQXDWXNcwWCybbhXmj+N98dtlep1epGgwTMGDQIiAaLK
         bl/olTUmndDfiO5f5jAJ4H/TbNG3il6ow0iGkQ/54Mq1Vrc5gOsh7nGJTifatK47fK5P
         XLxJvl/zYCoKAwN1tduWYCjnEljfio503JzhitCFZLy/FmXb4cS6n5be5cIDM39O9RjA
         0tY35QmVtat0G8PjbRnx6U7UuBonTgncLrtC9DEsWBp78xyavSW8LyOEQUX3WvNkHjKH
         +Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023507; x=1760628307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIgGfpMab5d5IHvagQ8PqT9KdQ+uz2nglD6fw13G62A=;
        b=DJt437nC0kfis48qr/bAfu0LG1POn5x7qbb7y7YG+AEVbVmYFQfImMsRxGqsyll68k
         MV7G2CjBw48fuNDlJGoOY2rJI3UbtrjqvTHdzAzQMHn3NtOqOvExMaItr1hSHcdTultA
         U3K4P11gN5MUIC+BkJ+QR+4GeBXc5uwMHb+pi+/IItRrYJ3hboQIvQXxtIztaB46H5/b
         qiiqU58AqfaoSSeOYQ9rB0zM626w8cg85s6bp/QwQUdO7vMvTniFaYWAjsh1JrUNHjHf
         +zu0nW2Ml9m/PwERaBooecJy6U0NToIfzvyx3GwaVwI+d5+tb3Xq+po7aCO2UdT44yPT
         tzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcJ43bBjJ21alCtqr2MlJvubYiEKUHnO0hL/15I29vsD596T+r6xCpk/kazqjxgS+nNqTn8lXvjgRJgfGGPczhQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MBY2T5F/tQTpidd7wdGJbrlCQloNVZZloVeFUOC+muEKLViG
	mUh8TcrEk2MM5cHL+c9hlyBIFTUGBcxs2KtjBOGLLSpQWTOw+DL3eOZ/tAagn1Gwsec=
X-Gm-Gg: ASbGncs786UhJrbncL9alB8rHACo1GoA6U42o8YHuNiYBEVwCes9m1dZ1p3ALQ+9n0V
	uByyKP1a40i7X/NxxIAkgJ4wne5G2FCr/DT07HvNNd7t6YVNhEFn9Fei80VZTJc1U6RRY9cITS6
	EcPLM05wfFjC3uEs/3bH3D3D/6Ogh3Si/uQtoSlzdHzQ2j9VqDTvDZBSG+90+1NRGuOm++krdEk
	0Dti7Tnqv74hDrvi3fM7RyECWuYfpEgYPl0yzCls8JqdiQDU6/1TVYzkPeDqqu4jrxxbQ5uG+D9
	ieNMetwqJgdhjqtgjlho+kb1mcAkN6+ok7lPH37AF2mrnWNWtCH5SOZKS0jJqC411ZJ3+YyjUsU
	KjXDmdaQ0cR8J591nm8djooYxKZ6B6FTXC/OAoiy6FA69QmBECrHVsoha/fjRbmzsnE1AyHmSgE
	fskEXr7i7sew8lDe4QFc05RdLSucbXBClIpHsLvkcm+JbwZ4Eh00A=
X-Google-Smtp-Source: AGHT+IGg04+IzEonQvFpIX4DqWAql+P+1rz1MPHdkVXRbACm/2BjXy8iSlJQRXa1j6vBNQqyTJPeWw==
X-Received: by 2002:a17:906:c14c:b0:b3c:a161:684c with SMTP id a640c23a62f3a-b50aa49025cmr842742566b.2.1760023506601;
        Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:05 +0100
Subject: [PATCH v2 03/10] dt-bindings: soc: samsung: gs101-pmu: allow power
 domains as children
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-3-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The power domains are a property of / implemented in the PMU. As such,
they should be modelled as child nodes of the PMU.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: Ideally, the newly added properties (ranges, etc.) should only be
'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
as they're needed only in that case. As-is, this patch now causes
warnings for existing DTs as they don't specify the new properties (and
they shouldn't need to). Only if DTs are updated to include
power-domains, such an update should also add the new properties.

I've not been able to come up with the correct schema syntax to achieve
that. dependencies, dependentRequired, and dependentSchemas don't seem
to support patterns. Similarly,
  - if:
      required:
        - ...
    then:
      required:
        - ...

doesn't allow patterns in the 'if' block (or I didn't get the syntax
right).
---
 .../bindings/soc/google/google,gs101-pmu.yaml      | 42 +++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
index 209ee2f80d449c3eec568188898b3c6f7ae0ddd4..d18a351b649c0736662e67bb64de46afa01e399a 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
@@ -27,6 +27,14 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
   reboot-mode:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml
     type: object
@@ -50,18 +58,50 @@ properties:
     description:
       Phandle to PMU interrupt generation interface.
 
+patternProperties:
+  "^power-domain@[0-9a-f]+$":
+    type: object
+    description: Child node describing one power domain within the PMU
+
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: google,gs101-pd
+
 required:
   - compatible
   - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
   - google,pmu-intr-gen-syscon
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
     system-controller@17460000 {
         compatible = "google,gs101-pmu", "syscon";
         reg = <0x17460000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
 
         google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
+
+        pd_g3d: power-domain@1e00 {
+            compatible = "google,gs101-pd";
+            reg = <0x1e00 0x80>;
+            #power-domain-cells = <0>;
+            label = "g3d";
+        };
+
+        power-domain@2000 {
+            compatible = "google,gs101-pd";
+            reg = <0x2000 0x80>;
+            #power-domain-cells = <0>;
+            power-domains = <&pd_g3d>;
+            label = "embedded_g3d";
+        };
     };

-- 
2.51.0.710.ga91ca5db03-goog

