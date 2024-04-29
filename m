Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65338126F0A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714411808; cv=none; b=P16A/PdqIIscPaQVcyQ+zPG6Y3N2FZ4qTQELhmbUEsEImuAInjfdSc5Nd8g9/LAKBdC7MhS7kajItOzlipKMpYf7jN9CZrs9C7e/IiVVDrSViiwtMDiNfGVYPb3hHCYbiowcAKet1zjMOv/xjXUJnwV3e7qyEapsIzCfxNHqey4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714411808; c=relaxed/simple;
	bh=8EHP99e7hsXMLGC4Iayh0RZ2xfvUSAj3zXoCNKf6PWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JStJDHg3W3076inw6MKheK+S2oNVyLewTsqyAcV3CrKTUewYUdJEtA8+Q1MfEM4WfpqwHrKiTC4p+7QA2djcFRvIgMbCURRVw7H+kmf7qqaEInQcRjdc6MZ4JXLgpy0MuBpejPWOldYBT7eZQcyIRTpN7lrJTtdHAmx8dvDMpxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NLXNKRaE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NLXNKRaE"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a58e787130fso369169966b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714411806; x=1715016606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOJClRFltjtPH5SUzDMPzw+EqdHrKO6L7RF0pIQ+iT8=;
        b=NLXNKRaEbADt1NQWC/qPDBnRwOqiMXQsv3Xei0t9zJTsnF8Hmy11TaTjgplfRHPRr5
         BFD3JQkw70Hyo3cZvl9CfQekdOHGM9EVmLhvKtmo4sHuxjf9d3V9Hpae2cLvRDIAZNYH
         imWtij4krSk76JQHVDBo8sZxffdjpUe8vAZET3yXtYcAVTSMPaztvrZSrC3DCRSvC0sO
         Ez4Z7AVo5tmhd3U6gavlkYhcfHQ14FaZOkSmQw9Js2vY7hyKaz7DskZ0jDZ2HNYyGbzg
         k9MS6JWyh2sH8Y6TxGhfGdzqFEBvi3H/rBkI3Bv1/419qYTnxfcOD1tm4io6vRkUAptV
         ISaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714411806; x=1715016606;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOJClRFltjtPH5SUzDMPzw+EqdHrKO6L7RF0pIQ+iT8=;
        b=SU9CVPjVPtGqmp1V8VqheUi+IKWYcjO02XDC+nUbQccp9wD2UPZJbgo/QKhky/SKoM
         ydZbGyFtClwk+i+KB3F6KsWIMp2PQPK/LCRDLx3QnTjJagSzYv0pXVMPNr8olpwgRy/n
         hKW9xuFr11xy7lU3K6o+9x1rXHKTisIywfiO+/gsMsg4jy0+7Bd4woF6kLr9GGhbMbyz
         XjqNOw1QyFpqNf99xl8qAuY9IwmZW32oKO9tmsZMQ+Vl9ulx0rc23ejP7Vaq/i189CcT
         y/icAWWUnwAdtL22/gDm1B1+KqEBKfCjs9xQeD/B81VTTX7mqXuDK3iWeI1HwMkqgMku
         9FFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9I46driNjEZZs2jjAjC6Opfd7yXUdtAHTcwd8IRZozoHAJ0oscUU1hRRjKFBd/W2CpK0xryDENzLfSEnF8W+hXf15JEqVleVrcJVd+xEpRmk=
X-Gm-Message-State: AOJu0YwZsRtAOR/I0+1jdPRjcdynaUeNYOnzWIgrQkZtTDl2dVp2lOtD
	nhikct1ZloedxQcXOrr+Pdka8ghWzEQqX0ufDN0TLis5WApaXfFJWQgqoF6jUuY=
X-Google-Smtp-Source: AGHT+IGvLXAzPiDmB+QWdQvxuqGMBFem9tfjCLoQpPn3fdeA8/2TNd6VA2pHq0l426lZdX/DEEPZhw==
X-Received: by 2002:a17:906:4112:b0:a58:9899:89ab with SMTP id j18-20020a170906411200b00a58989989abmr298215ejk.22.1714411805842;
        Mon, 29 Apr 2024 10:30:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm2770173eje.127.2024.04.29.10.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 10:30:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240429-hsi0-gs101-v3-3-f233be0a2455@linaro.org>
References: <20240429-hsi0-gs101-v3-0-f233be0a2455@linaro.org>
 <20240429-hsi0-gs101-v3-3-f233be0a2455@linaro.org>
Subject: Re: (subset) [PATCH v3 3/3] clk: samsung: gs101: add support for
 cmu_hsi2
Message-Id: <171441180364.306855.10761459860309658442.b4-ty@linaro.org>
Date: Mon, 29 Apr 2024 19:30:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 14:02:19 +0100, André Draszik wrote:
> CMU_HSI2 is the clock management unit used for the hsi2 block.
> HSI stands for High Speed Interface and as such it generates
> clocks for PCIe, UFS and MMC card.
> 
> This patch adds support for the muxes, dividers, and gates in
> cmu_hsi2.
> 
> [...]

Applied, thanks!

[3/3] clk: samsung: gs101: add support for cmu_hsi2
      https://git.kernel.org/krzk/linux/c/093c290084a494844f1650e70755b8912292ee14

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

