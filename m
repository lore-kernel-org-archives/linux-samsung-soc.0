Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40826222563
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191928; cv=none; b=NGEBLkmfXLaVdJbagnAyCT8NPIFj183+YbD2CuoJ+b7PMzcyrKsrTMLnfmvWRYzJIBbJ8bORt+NnS4jv2ZLWLIGO9sZgmuQFFHezI5BvLwacsf5eEv6R8weTv5eGjEAe3owSRzo53fT/QXQzY083vjwhNB1UHZWvcOK38FCv4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191928; c=relaxed/simple;
	bh=DOgwB2o78HqwOMGNZ/JwWJJka3ZJ5jZHlvRUFck92Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3wrbBeUppdAy2e5+Jc25RoDXBR9N2QOfJ58F1+zi9BXbsyWGhZX0boAhiFqcWpXsVuGk4qp24Fkff6C/Xlz8b8tZioSN9MNoBKDDBukxnR1fUmCql6a4hvcVYAkhoCocKkffrLmPJnHNEP7XpVt6ZXSzmIuGW0dHGv6DjOaF34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFfVvc4Q; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFfVvc4Q"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso702312466b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191924; x=1739796724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frAoU9FSbapFrq+HpklqCcJQ3Ks77Q8uuZdWNADgS9o=;
        b=VFfVvc4QLCYP+vuqR3XidDRe+rupwrrB5NJkt3weXOFrSWsLPfF3C30zwNo7WPVdnY
         JxYJ1OZ4E9yFeZY/jpl+CJEB+hqleKBOfa5T7pI3/tjULkGNb1lau5nQS6AKFyjt6vs8
         rbddsjFWo3Cti3pRGgL/Pt0iocoLDnIhth9f213RfZrr6+QGh+CnndugOb9qZAU7XOXj
         PpuRpfuBH1U99NZIljgrIL3ll8xdMXCdwhX27enWc36fZa8qMdZPtPt5LDNT1FklRipz
         6+AeifHvkfC+zTEIst5w1W+9+v6Qlfj44h4KQLJHaioH8MuQjrW+cIrpXyTQlAigQQPK
         mSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191924; x=1739796724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frAoU9FSbapFrq+HpklqCcJQ3Ks77Q8uuZdWNADgS9o=;
        b=vTsraXAXkR193ZMQgp8sicbsHQP5txWiv1757CUyTRacpo69J0DzglTdL3WoCge4l5
         XWQRD4AxcArvlW3JYXf8IW54NeNllmuEjj6hD894/N/Y5n9RQPPIS9hL9xrIXcfZ0eUn
         y6SWhXbTyFyJ5nVIrileHE4A/93+dpVs8rqczaD8ylcroddTNFhSk7pcwF3TzSX19Szb
         YkEYTJXu2FBTz6QlrigBM2d4QAt/Eg2PqW5L0SFXYb8rnMycHxXQVQOVpf4yIeoB1v+O
         ge/zrp0nuFRHKXJ2qSdVJ3v1hOBhXhMv5rNILaSYj5Vg4NSOwGQvtC496A5BSgvAD7FH
         nDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrI3NKVc4Je2XRurM6rZk0aIf5z5KdkrKXQGlGwobrWRyHyXiAeaxAmuucOZlxzKRxVr2V+XCMeKtiD/mVMbrieg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzU+Nbm/geYSDCT3rS6hPpQycuHDNelrZxJovq7TgYZW+7YWM
	RYkCu2UIoh+kwYkFppIyP8Pbwlpecj9pKqC4Xt9szEuEYOiMqC9667LDnzXgn9U=
X-Gm-Gg: ASbGncvkdWcLNUcykrk7VsY48Mw9ikeDio1ZMizjBq9C8qDM91gFqjPsur/SLq5QUpL
	4EDMuqqCehHVdMpo59Dmadkry+Oz1dlFWXD1QXL7ICTN057g+OSpt6IRD43AjAsU3yInuYdt5PG
	dKHoFTv4Xqm553oacYOnvtdm1yBQJ/+MjrfrADr6zjcox0k1AvSnPoeEMWi5kndQs77BGrHeus1
	E7Nb8AJDhXk4Hpbo7vclEVYPNrjultaovNw6Bmsd1P7rhLIJGX2cSVIKsNLxL3bqIlms4eGI2o+
	2aGR9Y98WpKPz9goPzUkEhJfhjJ3lXw/pENxamDK9wRK+9kypngFd8H6u9ZZIqf5zgxZI+2OS/U
	=
X-Google-Smtp-Source: AGHT+IHlPw1KLXMN75TVclRX8S/qE4XVwnFHG0ZCFXVtVKAbnSQdsY2Nvm1erECM0CzNh8K85VHXjg==
X-Received: by 2002:a17:906:4fd6:b0:aab:d7ef:d44 with SMTP id a640c23a62f3a-ab789aecd06mr1234271566b.24.1739191924470;
        Mon, 10 Feb 2025 04:52:04 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:04 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:04 +0000
Subject: [PATCH v2 3/3] arm64: dts: exynos: gs101: add reboot-mode support
 (SYSIP_DAT0)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-3-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

syscon-reboot-mode can be used to indicate the reboot mode for the
bootloader.

While not sufficient for all boot modes, the boot loader does use
SYSIP_DAT0 (PMU + 0x0810) to determine some of the actions it should
take. This change helps it deciding what to do in those cases.

For complete support, we'll also have to write the boot mode to an
NVMEM storage location, but we have no upstream driver for that yet.
Nevertheless, this patch is a step towards full support for the boot
mode.

Note1: Android also uses 'shutdown,thermal' and
shutdown,thermal,battery', but that can not be described in DT as ','
is used to denote vendor prefixes. I've left them out from here for
that reason.

Note2: downstream / bootloader recognizes one more mode: 'dm-verity
device corrupted' with value 0x50, but we can not describe that in DT
using a property name due to the space, so it's been left out from here
as well. This string appears to come from drivers/md/dm-verity-target.c
and should probably be changed there in a follow-up patch, so that it
can be used in reboot-mode nodes like this one here.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 86741994bb7c..d60e6a8e8723 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1411,6 +1411,19 @@ reboot: syscon-reboot {
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */
 			};
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
+				mode-bootloader = <0xfc>;
+				mode-charge = <0x0a>;
+				mode-fastboot = <0xfa>;
+				mode-reboot-ab-update = <0x52>;
+				mode-recovery = <0xff>;
+				mode-rescue = <0xf9>;
+				mode-shutdown-thermal = <0x51>;
+				mode-shutdown-thermal-battery = <0x51>;
+			};
 		};
 
 		pinctrl_gpio_alive: pinctrl@174d0000 {

-- 
2.48.1.502.g6dc24dfdaf-goog

