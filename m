Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF55150993
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715075345; cv=none; b=af5KT1NOs5xfF6II0Dtpp2dq4gzrYL87kwquqrn+N3ahQvl3HW2gl7IVR2lsEgYdq2ovNKokpAE/n5dXkOh0h2ZJIks3kCo7b+EnYKBjFOaogbVVoS1oQaynNtCu6qlLW/PxuqJEVBWfSOlsDbiPBwsJRuE8P/wkD9WSbaoWeLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715075345; c=relaxed/simple;
	bh=lxtT+tCI4jL059QQESghZnrZukScDPtHohLDdzuOYBk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NeVA0Q0QGRP3vGWyp31fHgDAImUk+ffZntG/1x4rctotg4br9rKpMiJ31mYkicjqaGAOYWXsRpE1vBqQU+4ur6PJ0a17iTRoLhSwIifOQXIOP+9jx/czCnpOIF1Duko1+wpic0kDSCk/LdAJEiWgyA8vO9Nr98owfSnKXy7In+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SFaB42SJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SFaB42SJ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59b81d087aso609452666b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 02:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715075342; x=1715680142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Bgg3zxtJYPnqt4NHW+d4WaRnGJUInrGr8+3LGqkJRo=;
        b=SFaB42SJ4ZJqe83LnbntsQDR92mPyFHmciMGVa5r7emtZGLiBkt4Ije/ejct4OhpTm
         e5eq0ngoPxw5nBvIsKnF7RwbgFF2Gdq0eWe+/OcvPtugrXCdLPLfn1hvcsGbSa1gOujw
         aNrGY2LtDi77eWs4aM+l//8mG1Oes6lSwtHFJjyYDSauGIkxZIyUZ5xMzUxXyBisii09
         AGODvaBHucq4vKeHgTwy7MLjFuqB7OXvbdfMSC0TrIOHd5vax9RGJZNHLbAu/o8oypOg
         lUXEpYbjs/Dhcb/4seX1rl35hiLHYEt5NxF+7GdLqa7AmPpKzQNWz2EfDs6ekIdLG/9R
         AWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715075342; x=1715680142;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Bgg3zxtJYPnqt4NHW+d4WaRnGJUInrGr8+3LGqkJRo=;
        b=KkEPGUeTlC70EKLVYl6jioH9O1guwZmkoZAYAxTy6gR/wfcs/WLkecsMs9JnH97mel
         zb11iDQQb0tqfW3hIwqaX2cxEvSG+B1A9Zzbstt33tBluF9uqk2MvGYOEEt/txW6rn9O
         +/rvPGZbG5pOu53S1PwJG+q/9FESY/8nRM7XkSjJpDyGyxyW8XyicnzcWEQoyY/l7fiW
         7YHHtAqRkrDSNEa1LcD3xeObrd2+chOK02mhOMZd6Ry64gdeoPsmljju9+20ApgjdI85
         /UEMuzqnYWkiUffc2uNTHcXdvxoKT0n2RHHfUTbSeiehPUvBt8joM/yH6mw8818+J6D6
         olGA==
X-Forwarded-Encrypted: i=1; AJvYcCWhfWJ1HodvM30gcvfW9HAYkNwf149CsUCu/Ove8K82aANBwizdvqTKjkM5ihXNb4Wo/48AH9TbQg1RWlndkLUOeNPAdKCHJsFNP+Q1OAKgWvU=
X-Gm-Message-State: AOJu0YyQat/XNY4wP6LBUY1NDSzvkApuIyZtE+UFPXcxmuJQGPwCV725
	xV9y7pX4vF1C+0pXXBRGU4hzHVriDs55EdLr3nR8OXPPGZhLHv8ThKdnWa3lTdE=
X-Google-Smtp-Source: AGHT+IFmHeE3lcBLmnxClRQs4AEPEUnXv/IqNkBVg2rMNk4slmqta8jMmXGP+5KJreMBtiic3HfGHg==
X-Received: by 2002:a17:906:b7c2:b0:a58:7c50:84e4 with SMTP id fy2-20020a170906b7c200b00a587c5084e4mr11565763ejb.2.1715075342136;
        Tue, 07 May 2024 02:49:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id gh5-20020a170906e08500b00a59a9ffeea6sm3910824ejb.96.2024.05.07.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 02:49:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
References: <20240507055948.34554-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: samsung: gs101: drop unused HSI2 clock parent
 data
Message-Id: <171507534100.608425.10238086621749823821.b4-ty@linaro.org>
Date: Tue, 07 May 2024 11:49:01 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 07 May 2024 07:59:48 +0200, Krzysztof Kozlowski wrote:
> Drop static const arrays with HSI2 clocks parent data which are not
> referenced by any clock.  This might cause -Werror=unused-const-variable
> warnings.
> 
> 

Applied, thanks!

[1/1] clk: samsung: gs101: drop unused HSI2 clock parent data
      https://git.kernel.org/krzk/linux/c/7c18b0a5aa46cc7e5d3a7ef3f9f8e3aa91bb780f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

