Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD54078CE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Aug 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199880; cv=none; b=NdLJNSKU40KEN3cdpd7NhsCaBEOnXHEHdJ01KdOM1GtVAiYvA11mh95SQw5bcN1+zmGW9nS21BM1pZOkuowJNpnFNasIcVreKDy2Oem13Ql+PeZuZB+7nJb4j6V09T13/jgwUMV2RA6VKqKVKIFaOhFufTZ1LWp5VT2ih0U4+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199880; c=relaxed/simple;
	bh=zBdK1iiFDwTHqOyTQyYg4l3HxFz9CENCyVT51LTKz4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DTV7B7PjGJFxnD2TrYVnRvP7chHrHqLZnPbNEeWLWfRqYafqfHB8TNJPH0AMg3T+lqqeM9vTaAfVTiwN4tU8cebMo16vOvnPbkgF7YrmZBjaGieZv8k8ebutRvC7wTvV+Dvbkm6G8NZ2pfiwfoqUmOD7CXiZnojwUPN5YpLDDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gdHa3F4O; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gdHa3F4O"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a5aad413so53448a91.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Aug 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199878; x=1788804678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=;
        b=gdHa3F4OGPta8Ku4hc7pkSHi+zcYreUvgF2rhRQVSZ47n+ptJttnJS+mb+aFmLwAxo
         18lopdAfAonfJtlyWxoxkDu946+C8uJXa5KLYJ9+nr7+xha1L8pRdYX3R67lcfIrsuvv
         YwvrYs7VeqInldCQQPUFVgFjsAwbCCQLwg8h9qlLBP9fGKXheUvMOKP62KzTQt3vR/o0
         LSO9tQAJFoJwCpSeh2d+JdohwgxHnADaUC+2TwxxJoUfkOv1ZEulGfDAQa/e6+V1ogHh
         KDPvWBaf6Xlx/QMQ7fUcxrYn5oIjynFhw7tv4Z+j3elCHnxLHxAFlJ2c+z3GcIpLXJPR
         oGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199878; x=1788804678;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=;
        b=Y0SmqxPk8bznvS7gk2TLETL5RTH/DliLDeWPStqWv3WDaqhGQOraDjN1EdvEHEGuRN
         8b4KLqTXOFobtC2yv2Z/wk93zmhwnoRnG/cHGXtAWBmO8oPVI0fL2DUPaqoROjkhEaaf
         WuoOynW7usu+JlA6MeKEAcMkHfEK2wKyOqkVCYbX+eWdeXJr3alc+sk4zmtlZMuc4th1
         U9GJ2FE/EsQPw/RK9AQdn385vWdPF2WYALeZ0dU4pj3QTSiT3s7vvx6C1yuXoaz4fbMO
         z+hFBqYrzIb2UEqehdyArA464V8LL/H0NCMn6cmLVscB7jbKXbM4cvoI25V7ZovzYkKE
         k6dA==
X-Forwarded-Encrypted: i=1; AKwUvByncQUF2MFeMRVMBqr4wMOWu4wokdPFa83oEnWzFNY8ri93VA1Sch0jDa6bh4IQ5d/YgRbnPcmhxnhvl3FaFOOBNw==@vger.kernel.org
X-Gm-Message-State: AFuF++klUVbF+g5TARDQUIQXmqPEC6t8SgEMefQ7tY2Xd49qv7HcmNVp
	PGtdMHRnHJ9Bqj4l7Ev9VZ9NdRcjHDsK4QqNU8cQCBYoOzLywJ/hmSosTet7usiilRc=
X-Gm-Gg: AYBFou0XiWVpe3sdFe1QxNN7DspTKjtn7015hTWq9FZiHmA6De9/61WANLRFwUuX4zC
	cDHblncpVLtutPWZp89E7sgh5fLUWqU6bygX0UJLnJJ/vMCjRpO3sz8x14L464Db9Sd6Uz3/j/d
	wT20QWRSEuO+pHfHmMqxddiqTGOPAqEGg6xPtK0PFUywngZqxXkoBbcOaq99elElgwlB0l6htdn
	VsauG1e594ctRaZxPsg5nosabs6k8paspFHf0OQ6YND+xVrBRLrS9p6UEb54ICqKRv0pwMwmJS0
	MVzNEKSYRywKP1hV1N+Mz8FvUsYTsisfi1U/SGxYpTzkqQeq6AUm/YdL3RKuNyBYa3YQS4olOQt
	zPVg6x5OWu77XGcrZBhO1PxGp9cb+bO3Z3RCj85OufgCUxkdAKvz+TaGz2IafwU9rqADeX1XSq3
	AUEUrG/mh2hdhudnjzCsEtVP9COKTllkpabusi7FSaFBBnT35pBsru5u3OiQ==
X-Received: by 2002:a17:90b:4a8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-396d0f69d10mr34762737a91.13.1788199877917;
        Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990baaeec3sm863336a91.0.2026.08.31.11.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, Roger Quadros <rogerq@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
 imx@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
Subject: Re: (subset) [PATCH v3 0/7] ARM: dts: Replace clock-frequency in
 camera sensor nodes
Message-Id: <178819987707.2869653.6455595386601883422.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:17 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Mon, 10 Aug 2026 21:05:57 +0300, Laurent Pinchart wrote:
> This patch series contains the leftovers from "[PATCH v2 00/72] media:
> i2c: Reduce cargo-cult" ([1]). All driver patches have been merged, but
> DT changes for ARM platforms were postponed to the next kernel release
> and ended up being forgotten.
> 
> To refresh everybody's memory, a large number of camera sensor drivers
> directly use the "clock-frequency" property to retrieve the effective or
> desired external clock rate. This is standard behaviour on ACPI
> platforms that don't implement MIPI DisCo for Imaging, but usage of the
> property has leaked to OF-based platforms, due to a combination of
> historical reasons (using "clock-frequency" was initially considered
> right until before the introduction of "assigned-clock-rates") and plain
> cargo-cult.
> 
> [...]

Applied, thanks!

[3/7] ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
      commit: e74a8fe7c2d85e314ead77064ea671b71de44b14
[4/7] ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
      commit: 3da3c1f84d4f1d14d321ffbec742d4027b503827
[5/7] ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node
      commit: e59ab4d7eaed22ba714c57801262a09ac1c32100

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

