Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34011C3BF7
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852511; cv=none; b=kQ7t75Y0ffW39T532zNeoBMQsGBLXJxUJmIlJJ9T3KxsNxHILMna2yZGgLuj3fLh6juTgiOhCpKvpEZI8pKTyTgz0qhzPuvsSrbd6jHm8yXFUfNrZTRALAluUGJLo1ZMCtEevwqfA+VyLu0kqG0CNNhRrGCW73BTOq1VwdyoXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852511; c=relaxed/simple;
	bh=SrQ0izSJThSrT/IpzfFEkCObODKK/0BzDV6aFd4HJRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=grFY7qqyVoLcRT8vZI7l3j72JOtJi+38qCon9u64fH1jy4h4etwrzG1r2q6NC/tJS6JoGmckqo0T88Q6/sNSxMG8sEk1X2YZ+st1z47HenWNrlDA3Df2uT0fMUSzqaYiDJ02gQevrm2YQ/Jr1WiIJB1vNl38TQTcO7Bl2mUP3Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWm2hSDM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWm2hSDM"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3c2db014easo898178966b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759852507; x=1760457307; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwn4iJ0kBXeAlbYIX5lfnaPGY5x3TCgAKgWBsfGbbTA=;
        b=CWm2hSDM3JRTPGemHdI8shDXDd03ugwh1jEHL2MqtQEWXEQzV5KuGBvyEazeT9DFul
         OxwK/FgIryZajV16jRWeQrn7/InnYkrb1qsEqeYZUwnMnXijm4caVnitDE0gQHhVMv7f
         d8njaVOelVhtxlhjTKsjk+9zI+CLDjZRxuuS8oeEnwY2+BQVE8F3Oy8Z2Kw/xxkyzRG0
         Tcz61JumUMFVM+14yoL8Scg6aLM7aqIZPyPl3cbD+44wlga3eaTVST1uU/FFNIGAWCQ1
         hCnaM3sD0vEZMVeIb0Kuvhk94rYS9knOnvbFXm5oTaOKZZfxEe6xqERWhm13IwEm55BF
         sxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852507; x=1760457307;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwn4iJ0kBXeAlbYIX5lfnaPGY5x3TCgAKgWBsfGbbTA=;
        b=FRFXMgdVw5Ut4e3gAGcQ1Uw4/4vIwqcys5A1HvCLDq8RkTOVHR+XWtGHS01vgM4Hbr
         AcM1jogxRdJ873hnXZhfGJhUnFERqefSM3Q8clDW6zO6Ypr/C3/67sX9cyWvehr7lQ1S
         CXPsr1UZN6FSUlXcR+Js4aB/5zx88ptnWGPyKqPAutXybW0oU5WkezvTS+OgqUyElfy4
         n5ENgcOExSPjoPbRKMyaSvEspxDguzP3468c9MoORUhB3fIAQw+iH0iDa5rjIPbp9B07
         zrEsdjz5mmrHAGVvJp6snSuPjgniz6GVYJyhGNtpdnEc8ogcaokJqYeGiSt69zUfaIU+
         lFXg==
X-Forwarded-Encrypted: i=1; AJvYcCUqfLS8aTMU1iUevHL1CbSkHTnSuoMoPZBBiCMrjR44j9XJXHBRRbydrVN57jhTNlMqkWbt4K11mMHF0PSunIpMKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZX/yVxWrFQr631BVGOo9j5VYfZkIRUaewrNcq/empXJQrx5P
	ZQm+MNg+AcTFP7Pofxjd9m6A3aSynuWTer4U4VfqPJFnD3KaLTZDxaOW+I7GKaqD82o=
X-Gm-Gg: ASbGncu3wMUDpMWHYbrfivx5NzJ2TocEn+yZ7q3uVWQDXJDZ4ly7kyPmo0wPkOM2Bfa
	T/yr/opWupFNRQNxTgGqdXHNJG8h8cTPocrmsRDjVRfrsgGzcQYrIVdDrw8u/11y+QZ0+hJxbsN
	/DPaJPPZIVuFwMQyiMH052djOirniP3Rlf+Uo2/mQ6sNAsSmhyu+WIefHnuibMATJR/VWQmYioL
	c/u03CYyNS+dpEi1qMzdCScqXB0iHO4F5+gkzKz8A70JeSmjxGtn4fTUKPC25sMxr12r2thcYpx
	q3O8vWEJOnEh+qmdl2y9cIY+s5TTBYjRfQRnr0Q7T3kwk3L4KZbDU/kp/4eowtOhm8KW8RO0sIm
	uENlW8kDmdCwX049C5kNQLHXcSEwif/NUD5LHfCzascp5klD9+xXPQUh+MxrblJGzW0aRuEeXv9
	xpehJoCQSyuwkEZBQiZPR78GudhfSpWRapp56VsN8SOoi5xdYcCiY=
X-Google-Smtp-Source: AGHT+IFMkqhgkZjYTFJJlsb6ohBZEtxooSZT5I4ro08N0+thklTNSC1wFRUbLDiJOSsfJFdfZDi8ng==
X-Received: by 2002:a17:906:7312:b0:b48:44bc:44e7 with SMTP id a640c23a62f3a-b50abfd68b2mr14143566b.48.1759852506937;
        Tue, 07 Oct 2025 08:55:06 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4f7eacdfe6sm225312766b.27.2025.10.07.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:55:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 07 Oct 2025 16:55:04 +0100
Subject: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: add power-domains
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
X-B4-Tracking: v=1; b=H4sIANg35WgC/x2NywqDMBAAf0X23IVoDSn9ldJDHtt0D24kW6tF/
 PcGj8PAzA5KlUnh3u1Q6cvKRRr0lw7i20sm5NQYBjPY3hiHc1mpYiqTZ1FMHwwsiSUrLhpQ/aS
 LZKTtJ6XpNV7RmjGYaJ13twCtO1d68XY+H8/j+APzX4i2gwAAAA==
X-Change-ID: 20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-504b0c57a78b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The DWC3 can be part of a power domain, so we need to allow the
relevant property 'power-domains'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 6d39e50669447917a2cd94dacee5822467eeb36e..3098845a90f342dc29f4343fc0ff5cec009d9629 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -36,6 +36,9 @@ properties:
     minItems: 1
     maxItems: 4
 
+  power-domains:
+    maxItems: 1
+
   ranges: true
 
   '#size-cells':

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-504b0c57a78b

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

