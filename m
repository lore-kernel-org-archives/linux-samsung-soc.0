Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C802F21765E
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741402; cv=none; b=tjdgafG2JMA5Ym+Rgq63G6mQjMVOhO3iSbUbD/+lWk3uSjlZ9Ul5MrQuNLWudVHnrUFTnay+b/jlHEjwSp5vXm7bFlZ8axXrrzwpDj1A2cS0Yb3APIP+fNe81rSL9bQ773+w9YqGKQfyCl9f4dQFZzHt0UW/iHI95BagxgygmdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741402; c=relaxed/simple;
	bh=wV6eR23JkgcbxJIL46tqQ9s/gDpRIqoVfhQkYHZrYN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oPtBchL/whhM7JqIKn1W4VN3hT7JJISV8H29B8SBJa4bKq9nIOVwcUmkugqUHf7OR5Kr0jepn+qpQ5kZqBR85tvm5X6aptH8HVM7TNabMW6pvMfU+xlZXGvPGmnyyfNlZPGxx064Yj6T1zDKJ+pxx4ch9XmLYqPumTvPtSu+A3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cVzwlqda; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cVzwlqda"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a1582c86so3617865e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 02:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741399; x=1734346199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8It1LsERjYk3PRVA4rqnSiz+MggzufbNA8DNofp64o=;
        b=cVzwlqdavc1mXVDFU/EZhVg5U19/mNcg0unlLQ8aDC7BwOECqgIJt7/ard6MQViw8L
         TP6bxf4v9p2eMSJJ06n7/KWbJFXBy2vAuECu3yV3fvuZshagkbDbLbotOHljsSXClH1E
         G+6nRKVaM3vu/xaqCvKj2hyeovJz01ev9uoUtuiUvPzAR9/i/e2c3Ob7HbzyXvrGWzz3
         hqIYeNaYhZvYk93348RRMmCWRh0yNG2dW+U8yMDoUAwuJCCuDdJ3aaLs71j68v4EpKe4
         FaU3iHYB+8KSggDeAnf/DVYTv04A5scFLrjM7/TcjjtEvAXyOwWlpiVTpHYDD5HRnOck
         ytjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741399; x=1734346199;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8It1LsERjYk3PRVA4rqnSiz+MggzufbNA8DNofp64o=;
        b=VZ0oPZ/7LWsSCOBHHejPnZztl8vm5C6k73ubS0JmNx4wGpSxdzff383rFcscC/ike8
         LicoyVC/Wl+cjtd7kj2oJnBgUBfEjawEpumLsyvbpAzu8YvkNmP4WHgYrtiW1xJr3/8L
         fsDITAUukwUskuuS5Qp4ez21mw78m7vqxYM0MYhNJwx/eCnucmQAPfZHta06vuS9ovVd
         x5gQkPiDdJj+XTILSlK6fZH8A3YD46FPwSR5cFyXngGc0RfuLpEC63C0Iz8RnZs+TcwM
         mXNVbWT9CkMIwJT0lTZPFHW9u8/cLvic05G7Gc7vwRourMYaNGBDypQtHRrvGeStirsv
         zNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGjeN+mGK9W9ug9sXpyvuDBNfmzm/5qKR9dmhkp8aRN5jNsFUiOpHUhnTvw9RCO1tGTWzwCvDur4LNqoXHprU3qA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx7y+KihRcd/1tLRpPs6Wim9BvlH71/3l/Jy7ezQcGvW/xLO03
	wpK8rZ09Z7ugcpsa1TmxXXfHuSzYsoo8ByJlTSDcwTGsZ44RBNRs9cA7mO/5utU=
X-Gm-Gg: ASbGncu6SQtPd5WJcSGZzaoAJFPH/bq5I9+r5hvLntrv45ikF2WDCMTpDC0uWQAKBd5
	2MGXeYA450p8ilPkRXF1875OlcQA0aWDcAz/HPxBI9VLBLYxejdFtF4r/1PlZPcHIrIjUud8xgs
	i6k80fww8k0mEaltRA93g2oERsOeR9ab9JuaaWhTf2pjbaPa7fB2hcPta5hF6F57xMFjk/6MQ1J
	d/WB/pk/8CkGZXq9/0pVOq5JWX3RPOOU0ZxDZrgEmIXsaiS2eSg+fEySQMFaFgLpQ==
X-Google-Smtp-Source: AGHT+IE7auGUR+zKlMOrNWx9KLSq3GSb9mPOKLQ7Zp/59A+kyUHzh9pBlXR7eVUa7fJxWz/7WUXXlA==
X-Received: by 2002:a5d:6c6f:0:b0:385:fa20:6583 with SMTP id ffacd0b85a97d-3862b34e3famr3627780f8f.2.1733741399032;
        Mon, 09 Dec 2024 02:49:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434ea1ae415sm80301445e9.33.2024.12.09.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:49:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241204145559.524932-3-igor.belwon@mentallysanemainliners.org>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
 <20241204145559.524932-3-igor.belwon@mentallysanemainliners.org>
Subject: Re: (subset) [PATCH v2 2/2] arm64: dts: exynos990: Add pmu and
 syscon-reboot nodes
Message-Id: <173374139792.46435.12839391873743115498.b4-ty@linaro.org>
Date: Mon, 09 Dec 2024 11:49:57 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 04 Dec 2024 15:55:59 +0100, Igor Belwon wrote:
> Add PMU syscon, and syscon-reboot nodes to the Exynos990 dtsi.
> 
> Reboot of the Exynos990 SoC is handled by setting bit(SWRESET_TRIGGER[1])
> of SWRESET register (PMU + 0x3a00).
> 
> Tested using the "reboot" command.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: exynos990: Add pmu and syscon-reboot nodes
      https://git.kernel.org/krzk/linux/c/d5b3944bec944b40e91cae82583ce11740af6f10

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

