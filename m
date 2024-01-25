Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD960265
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706191833; cv=none; b=t4+IE2chMdBr2FJXiJ7qLvUk07Y3yNICUI33iZOB2EkXJ9BYbBhzdNHy0c12jF6zaJkKrG+m0Ko6NFflxpLjVnLEUxgXoDr42hlUiP+NwaQOSm7ckdrwyUJ8aXToLZEF1juyhPTfQFZzMz9lLQIEu1qyIZduGf3eF8FcntDDoG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706191833; c=relaxed/simple;
	bh=GFWuoyj6kM7mp555UokZjvMLSAMuQRKEdo1HvImE3Ag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h8ePyxEOYDlgriO13FzwrlRKTI7J+fWT44ElJ76DJQauG/XEHzCTRHQGaqnEgTFv4gxo+fCgCtcykaQ427R8SFevgh5LSdslm2XF1JtwQ2vdc69imJTeuCsPNLMG5S73mjRckDq6PhYEGr19MvMPWclUiggCCYn+rrgUT50t8eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=My6ult1q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="My6ult1q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40ed2333c8fso6771285e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706191830; x=1706796630; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GFWuoyj6kM7mp555UokZjvMLSAMuQRKEdo1HvImE3Ag=;
        b=My6ult1qxuHJC4zQbM+ddki4s3sam6r+Z7V/qGRxai///ckiTozhu8R57mNR+nTd3w
         iEG8uM08ypE+wrOSgNdDAwUg0rqKUqLw7tWvNL/fV2ABQcLtbY+XmevQA/UacWzROHwP
         VvB+OvyiJK5UmrU/lvYkNi0ufqHpWn1rKhUS9Wk8+Yz90egnJ2v5p+SFxeLTKBUz4RpE
         iz+pAHEi+Tw5J/mTdPT0u9miPN0nykAA1KfX75vZnJugVUs1vojIQTyMSNJwVZMpWWJQ
         PcT+uql/bQTkMbEj754Z6iSi2o8JhJy+jB+L36OkS7P3Eo4X/TxdFFXFUvpAoGfMYpMG
         crVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706191830; x=1706796630;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFWuoyj6kM7mp555UokZjvMLSAMuQRKEdo1HvImE3Ag=;
        b=IRcbdH7M1w/6E6GJTKW5KqNrGykH/MfoEFjSZfgG1jDFYBRrfcaarnwQMEvsbWmJWi
         Y3564qRERHkee0EcL+Bn37zt+7t0iK4JMRteDxuQFFP0ilKVwAah7FzFIWqOKxfl7zi+
         EVVZvmrQtq5vQ7wuKghAQsTA7TICJw1mFtL84uW4/Gg2GfWe4iZ1m9yCSbQgrsIw/c5Z
         SEj0zIKaaifeRlL2a0M5SWIYa78ugVG4ETw3QJiZmgg8fV9r89Z2aMwxBsPGsn+OBF2E
         G6Zao6xi4hrmwVDawvMfrkVcd/womCZar0wh4UE8EvDIpPQWkIslZe6nBzBaCIQSgAnn
         tWfw==
X-Gm-Message-State: AOJu0Yw740+vXhXTW3OvE3af1sRmTwWdl+Qy9NoN461CA1Zm4VOzRuk7
	qyUUu+GT2Xp4ucGFcM3lz9hIwXzkCdnG3aNd6XTO/YJf69whJ1Rr59S3Y3/SSYg=
X-Google-Smtp-Source: AGHT+IGRsQ095n/697hTcPYLtlxQazA8W1CfVIDPw5ka1a4U1RywC5HxBmgzKgKf82JR6cjwd/lP8g==
X-Received: by 2002:a05:600c:19c7:b0:40d:5cd2:5027 with SMTP id u7-20020a05600c19c700b0040d5cd25027mr532830wmq.61.1706191829992;
        Thu, 25 Jan 2024 06:10:29 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c450a00b0040d8ff79fd8sm2781090wmo.7.2024.01.25.06.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:10:29 -0800 (PST)
Message-ID: <9a8bf6f17a0f8b4e31a6d59c1adb735823f579aa.camel@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: gs101: sysreg_peric1 needs a
 clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com,  peter.griffin@linaro.org
Cc: kernel-team@android.com, tudor.ambarus@linaro.org,
 willmcvicker@google.com,  daniel.lezcano@linaro.org, tglx@linutronix.de,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Date: Thu, 25 Jan 2024 14:10:28 +0000
In-Reply-To: <20240125140139.3616119-2-andre.draszik@linaro.org>
References: <20240125140139.3616119-1-andre.draszik@linaro.org>
	 <20240125140139.3616119-2-andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

> [PATCH v2] arm64: dts: exynos: gs101: sysreg_peric0 needs a clock

Sorry for copy/paste error in the subject :-(

I've sent an update in https://lore.kernel.org/all/20240125140644.3617587-1=
-andre.draszik@linaro.org/

Cheers,
Andre'


