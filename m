Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7ED389DF0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301983; cv=none; b=ZsLCC1eE7DoTO7cSHYh46tvh47PdbJBQKAFDodDEb6oezwEhgjkRBP9wzasGmkdb0VqrLvAScllms6O+zUx5nDA8/UaVZgoAeCRgyjcNDJWZN/pm0QHnBxKS5PSM7s1UzdD2+/baNv99ZZynmQPGgbtZcAHAThFsUgrXEynt1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301983; c=relaxed/simple;
	bh=zdOdJQNPdlZKaryJV0eSRMq15kBV8C8+9A0Oans/k8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpMX9fKDLKeKk8h2LzyuB7AlKdEiV7bq/vEkF9bM5GP0f2wxQ+kmHSc7Xynmd10kcCzDcU97yq/H5y/T6ngSXehPOzre0IePNv5LfZ4HVacny7/9seml2Y+h2olZdZ53rqTpJFd0L7EDJ1+ddLAUceikkVDn8rwKc7UeNUaWXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/aMhIX8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/aMhIX8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so3453676f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 02:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301973; x=1768906773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74ELsg7vhoXLfA9GfHrjCg3jNxskfuERCguyJAcC0EQ=;
        b=Q/aMhIX8/3PdbO/DafUHBhhrXPLkZyDfos9Nyml2vMqUHqmWnpsPoavzNXiLLSDIfg
         NCeiLUWIMQw5TnORkFvf9Cl6+nezppebLyxJLNN4uYKc7wPbTQFqH2RNfBevvaT3vywI
         cunF5fS/AGX6ysSlRF7kFidmxjbT9vZiN865qPrgK56I6noHvMkKQlzWxPhexcbIEZgB
         9jXYe99eaI4+9dT47ohwUUfum0YlCGaljYSCH5dv8KEJTyRuIo8EwR3EyN5sA+4gRULa
         thdPGfQJ7jrEsm6+K8unCOw+hvLBxbkR/vYgdOCGC1bwZzXTuT6pfhgLIdasABYxvInU
         2L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301973; x=1768906773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=74ELsg7vhoXLfA9GfHrjCg3jNxskfuERCguyJAcC0EQ=;
        b=U/Av9e7nfcJ+crpLvhikCeNINStacMDN5tCy3YMLPIKK7+MHxkyxI2Ya5DlMNmmUem
         AFZQYTcToTMMmwS/VA9Hk3morLDp/PwZq51sFRM16yptuVhmAlejcG7XsLV+tnrcpDA2
         QHLzw38ywI3g8kPSQjhDWZzYMWtWD1jVEyzUZu03cyZ2caAehoKeti63T4cwujwCRurI
         4ml6ITEEFbykBnnmbap8x4Wh2B7XGW5NGcQ0a3u/F1aSxS0r9iX32VU2kAENr9+LsXVU
         eI6QsvmkVFjhPyCDwIryaz0Ziq9OfK+K/6Gs5ox6OjG1P0JAws/rqqdWJXp5Eyo0Hdwr
         7J+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHo9388IzabEV0NEx3DUJ4hnWXziB+kuJZtd+8coxPRF/56EZ+K2V41F0GYCxCZ1iPqkQ6idwZHv2Gd11qb0W/0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw57OkwTm6nk+l+hI1QIyMWWWP8En8/tRowuTJjnl8d3ICvsY55
	Q1DLTaYFO6cbBLmx5OWV17BYl3BJoikYc6zV1rwMER+Q8izPuDAiL4gyc6lHlac15+O+jWhrC4d
	bRN00
X-Gm-Gg: AY/fxX672iAcUITPtE4hCrG4b8XiiVEMAvp7WP8ACpvmoiQMlZl0/JNbX6o87ROUobq
	jrXz2CfQIGwEh+7ZjdqMfVuXBBAbPMsesvGgpx7arDnRWES/qVbGnBGS+dZ0t96Bnrw6wofsCmy
	Dt71Nc0y6fKS+L/qK4ymN9Uejyhd3TcuzY2yByPAeMPowrgDBmxKdU5ccMS44HuK7cLg3eIjfGJ
	bgVLdXQ9ZG0Qh98gsWfhN+yhgxAwvPCWdiC6muBvrf3ULG4+NwUumb0PQsuAEwEfkf3weysaYfr
	uJZQBIZClMGXe+p/q0KDPjGPZOwXuryYPZY6tCrnszZgd1zCvsMX6oBvsz2UGJ6u5sZXlMqUANo
	H/SvpK6PPgS6Le0cVxbzjPX7bPMFBK/Nlgp5jvZz+I3hxMSEFUEFAVK4dTOjVzTaNZmNzCLmaSd
	ZU3DRehbRhcg5NA5cyXLw107DbI7kD6rvMP5Q1Dr9mKrM=
X-Google-Smtp-Source: AGHT+IH2JbtL21jIgggvul12eFS//aGQrO5ZAtOVHTe2wEpJpvpWq9B0uugc4X9NenGB+bHx3VYl2w==
X-Received: by 2002:adf:f54f:0:b0:432:e00b:8669 with SMTP id ffacd0b85a97d-432e00b8adamr10557403f8f.18.1768301973374;
        Tue, 13 Jan 2026 02:59:33 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:32 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:59:00 +0000
Subject: [PATCH v3 3/5] dt-bindings: samsung: exynos-sysreg: add gs101 dpu
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-dpu-clocks-v3-3-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=zdOdJQNPdlZKaryJV0eSRMq15kBV8C8+9A0Oans/k8I=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWOP8X+oM5w43jD1skqX2op7mjV09xdPbxHj
 sBrRp1J/XOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljgAKCRDO6LjWAjRy
 ujvRD/49YLewRuYcBVZ+8v+DqIvcqjsd4JOFG+gfylt/oY4oN+0q/Em+TL9AfmFLcGUEUmUiMn4
 P0JghNWmeaHU7gE5oc/9Mka3Ms3aCmP1UOpEnCJgYqt0kC1HA2VPXcIM279BSaNd7pyODhGASDG
 ipamtPTrN8R1zwxwN//IbCsFpEN8IQ6RHSrL7A7iNsASKLbal8C+kzQjTzBmL2m9NG0FaFBBpmU
 LTH6lsuZ6GQBQCkL3w9ciH1f6+EMLNHlJuQudL/wzr9JlPVhzoVs8z0hVj04TgGDEoj/nrQ6bkY
 k4PHlP2RWfBDuY731dV9OyKx6qoQyn7jmRpX8HsAaQEkbjZbQ1lU6CzLchREYdDh4Y6mtCAARxx
 1SRm0wSikmODQp7Cp++FjRVMdGOay2QxMeqRkMQ0mvqn6Z+ZMVR4OVTALnmuitA9XDN2ocd20DE
 1etByCbWGLjQiztV8wZUNaZZrAX4Sf95xu+dHJwKJL87N4uDkoxzyYISTxM2LBGvLU9UPfylgJl
 772El4IyxYtcWqwzf4GLz42DPWKRP6k8/pVmM7nmoug75TMay3KIcYqZDitgupn41IC/3Mj7yN0
 JlmlZM6CREMS60lB8Vf4UZRr2g5xiPeBPtHE/+QCJKD6jH2ioHA2VRVb+ZOWJTguIin2vU1EyB+
 WPgqVUsAISqoyKQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dedicated compatibles for gs101 dpu sysreg controllers to the
documentation.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8008c7f9888a56f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg
@@ -92,6 +93,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg

-- 
2.52.0.457.g6b5491de43-goog

