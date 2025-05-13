Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A71F584E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124034; cv=none; b=UDdoYBzB4lKWlWod0Ep6KqW7zwiXe5peGeX3P08qYr54zuidWbd0mc4RZpXQuCEhpiDU6oAmjGSWAxGXTUACrQ2siB78+JhcWhag26kzd7R5Hkq61vtqQ7up/xodtvIEIpCNAV08y1CFCPH4Zdui0JZlXuayajRTx/Y1qhSYtSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124034; c=relaxed/simple;
	bh=OMO7uyKqiGXSdbBTRpMsGiPhXfiWRanx24fEA05hC4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sA+9R8JEi04xU0fYnzdXYqmpsPFkBOBA7SY7adC1r/CFBXVabAUuvUTmaIAA1ZeqAGnFbFKERsJUOB8MLWswQVg6wQSv1ApS7YgxmBLxS5nbHQltXCP9L5K0ZcergxSLwbTAaH/hkP+wbY7tMlMQf/BjsI1vcxpHgtJwUiZWf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpxSmPI1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpxSmPI1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441c0d42233so5520965e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747124031; x=1747728831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfD8KA5bfxaU+Q1NTIOmhw+vBh6gQYcxk5fcGmeOrhI=;
        b=mpxSmPI11h3EKfIiLQkaiAISjzIZ8szj+stMXWAYDNeF53nobikOaDUlLF3CkU1po4
         FYBbuCIvt20FF94FRmuSXuwTRggl2TtkQN+scQNPeJocCwJ8gvLZEVY6rcF6OfBLGMkR
         Hl+UCYzU/QAHhXjjSaard7f+AHGsQ0Hsb0sc1gmGcM10OXS2bZJdUnl+KsqFt2/oT+Vg
         V5z1GcxCQSU54G0NR0Hp4J2N7GrxwvC2rbkGqMPAvDANRLFsB0SuWt0RIA54g5xf76Zd
         wCXJ7YiZ7V8iKNiNpLwaKYDkwSAJhlkFM7/Uz4dZpfJspADBvSkqLsW7xC0CKXUXZ3hn
         a3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747124031; x=1747728831;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfD8KA5bfxaU+Q1NTIOmhw+vBh6gQYcxk5fcGmeOrhI=;
        b=dkgaB1oZJrEr8Bvdd5/RmqVNHKmF+Q5BzNWdnqvDARkqT7eoDvgM+3PQxrh7zsSr0r
         5qDPxOYnuDQ1E51kkOl2UtwbkqlXdtDl9fy9qSZ4GIJgMgD39LhaacxrCyB3Ozv0zV0O
         +zz7GWqXRBorqroiaLfsATV7gbGTRA2TsNTXShl0fAB3+vCfm0L7frElgMil/7iPqYz8
         O6a4BHr2molFiJ8eYTkaaq1mVntoNWhAvju1WmtRUuiL91ppycml/0ZQdtskW9zk4vjs
         X8YY/NYV5EVgJurvNj+OFf72f7RAUKrVCVT5mKE/ww0LfW7zUX22PFwzidI20St0NunS
         HZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWuV9nGdPAkuZDZAgcFt9uApDJzV+xb20epsqVlXIuDrnrCtToUKbpIR1A6ajSimsXfoNIiYRHgp3KrWvKVJqAOXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+s9hm5BkhgjjMDIyZ15pXlojuMgH66IgzXAPj5No34IGBFI3q
	LbQ5FPOWji9Itot3svO5ZbQYWEdtWamy+Xvz1C8Urzcj3XF7IcPJ6gsCdf/8e1M=
X-Gm-Gg: ASbGnct0puPc+sNe+YPLYFq4EXn8xkGTJcW8iAmzjxdyl74VMGQ7hTXpcXsKy2Ujagw
	NOvnpr3KLRsARBVlEj0RQ3tcsj6eGELtbKOU9pWQEbsNlWGmuoWEZp0QkiATxmmUsWRMCZNKQGB
	n9XfMXXrWcWNQ5+/nXV/w2VFHlmt7K8teCRGSBGZx0bXO+WAuyYNgw1GuST/aQKOfZti2XIj4Pt
	RPxGd1hiEmRug1/C0uGONfGbSqmWCIAqer3jdYS08kmd+DSNtkJpUnxpoLeKSbr7uq11tC7ArZ0
	xXgzfPrcfOwI5XfLhoXkiguJrlMGYsIimqSDL7bNq11kZn/Z6QSdlWfa0v0sAu7kyuPlea/ERZX
	1/wb+L4tThAGXtmPB4Q==
X-Google-Smtp-Source: AGHT+IHI0BUvRWvY4Y2/8bHQXKFDvKBHupqbi0BQODrVBg+55fcuB5CxUmKYcrieaLRvHUYS/EkBCg==
X-Received: by 2002:a05:600c:3490:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-442d6ddd6a8mr47990065e9.7.1747124030617;
        Tue, 13 May 2025 01:13:50 -0700 (PDT)
Received: from [10.61.0.48] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687bdc0sm155170805e9.39.2025.05.13.01.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 01:13:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
Subject: Re: [PATCH v4 0/5] Fix gs101 CPU hotplug support
Message-Id: <174712402896.10876.6908975403195941350.b4-ty@linaro.org>
Date: Tue, 13 May 2025 10:13:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 06 May 2025 21:57:26 +0100, Peter Griffin wrote:
> As part of an effort to make suspend to RAM functional upstream on
> Pixel 6 I noticed that CPU hotplug leads to a system hang.
> 
> After debugging and comparing with downstream drivers it became clear
> that some extra register writes are required to make CPU hotplug
> functional on these older devices which use a el3mon firmware.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      https://git.kernel.org/krzk/linux/c/0475b0d8a1e0f80a47536dfb19c28dc4bb6adc05
[2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      https://git.kernel.org/krzk/linux/c/83b66cdb5d5b6aa4ed1f085b3b2f917af0c2890b
[3/5] MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      https://git.kernel.org/krzk/linux/c/20adeaca8bc6a084f2610e7c89a8601c9904a0e2
[4/5] arm64: dts: exynos: gs101: add pmu-intr-gen syscon node
      https://git.kernel.org/krzk/linux/c/aaf02428fdd50b818c77644bc0b8a0b282ce8ea4
[5/5] soc: samsung: exynos-pmu: enable CPU hotplug support for gs101
      https://git.kernel.org/krzk/linux/c/598995027b9181ada81789bf01fb8ef30d93c9dc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

