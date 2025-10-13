Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EEBE552
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317288; cv=none; b=krTfAw/gZacxVKHiC8QKjJhJaRKgTNs6MpbnqUcnEQnHIvuiupsSp5LEAdp9g/7HW8oRlcJnxDdht4fEipH8zw5PLWv/BarYw+dIbMEJSWVsXacnqL5oFx+qtLSN3aMTiw9dRWPAhZsWHx7tSg5J24C/KMegUv0X9mgkWXVGIy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317288; c=relaxed/simple;
	bh=hCmW5zBZE9uimTQ5vZvzqHkQrWXaCfMbVKZK0Y379fU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NzKCSFnNOa4ubVjTPMNKBtMmgV69fAMNl/ERfaq2ox0E7j40+xvowzpYuXUvXK7kVco7podw9mychMHBQ9d0jnTEX3npHHX8OBcodzCLQv2VXv/CslevjImJcaTnEfoz75ZYkwenoloLlzVoBp5ex9sV+7oTduYB5PSWOa0k4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5PlrC22; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5PlrC22"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-789b93e9971so286433b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317286; x=1760922086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Z1PIUihZ4CoSKz9QE5gP7AidgQI+jfdksvedwdF34=;
        b=Q5PlrC22f2GNThM1tOGYpC17lHt7rz1g87ia4BGWQ4cM7u9y0YJJN83Bgwqq0t8VhC
         eZBHEFu2IPTYUWzvYHaU/pTcXYTmgmjk0TnPoJ41brih2ybDjyBpVSqVniEEKbnmT1ge
         m7igMIfr1Xz0Y/Yczw8OP+C/LggxpSesv5D1b/Cbu0fnfuh+JUVzAhG+oPiw6nJJASt8
         bdNOiXWwEuOYyDx2i9EsgS2KM+tbY5AVHc+IELBUFVSmnUTfUob6i4W2HRa7j8S+mo6U
         26QK4/4Qdf+EXhqYJQfzMcaqljCKwhLu/JcmWDaCubJGcjnwdfbMFaZ6xFk28By4n2UF
         kfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317286; x=1760922086;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6Z1PIUihZ4CoSKz9QE5gP7AidgQI+jfdksvedwdF34=;
        b=XBPCI209PN9woOESj/PN84ilY0LKM13X6YYK9igrWmTdaIEXv7zV/y+QugJobEZd8s
         7z90TnJM5o0B4gLzpRRxy5L04xPNRtGPACNo1NnZPi/En0YPmVayYGVZrIFrLqn2G54h
         XbTtZ4swHbB/LCgOTchMfs/no24igyUe3M7ABVYaeutJ8OMDMxnlUeA7Xi0M9t5PbybJ
         h36L26egz7TXw794enym7av2jpu+Ww5H+Mb1jQdS8Zy0Spo08WS6JaeUI9vkIurK3WYt
         6CX2D9Vmzo/q+KOCewxL5EE6aGsL69xdix8XdPcpUjXDyGsR+bR0cJV6h0GcUTY0O12S
         4T7w==
X-Forwarded-Encrypted: i=1; AJvYcCX+cSIty0bP9yxquJHTYvBcVVuIM2LZdUggOIJP7N/dCVL7c0PwXzSsc/zcXp/WqJKn+FUgTKL4ICRkzkmsqDapzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaW2FtQfqJ00+AyOGA5zh2UMib/+i6Pk6ipMDHzbA5R3YVuViU
	69csIrY2toSUKufJh50l79T0MhAOvB/GbtL5rKYVt4K1lki8trc7Ks39Nw/gnAF8YKo=
X-Gm-Gg: ASbGncsSsq+IWCZu9vufxoyoA/ffbb/OJQb+M74GEPzN+iJkK56tAFSWDQDOzPGPIIh
	mzlk6uykK/7bwu9MUmEM29JRvEda/PGMvoyk7+i9ctDi6/1BKAsHek/T+H5Ma/6sNKVY540w2lG
	i7oBogDLU/g5ZaQJd2TMM5zF5XzfvWLhSiUZmwsPYtw0mHFF5X50C4StjoIhTAkc7G5gcvVemBv
	AcDuaNgo64auBJyXSOaxLeNt9yOu8HEO9Q2Ufr6NcWVv1DLD2X/XbrZIHGQRXVcMbIeQ95i9UUX
	2d0+6yDceDmUelpJDYah/UOH2Ugb6zVv+ITFZZGGiocyV/LrHCpVwdT7X0JtqjbNVo8//nllCDA
	64L4MuHIg9E+PDtE+aCmuOzGzSiYFD/Np0nIrEmGK39S/JLtDCWX4DI2GCRFO
X-Google-Smtp-Source: AGHT+IH4f79PGF3pwTJWa+RZTaKvtY1wF99tutuYa9r5c4lDGKIA1fkdUmCffSl7ZEfXNQxSTp20Eg==
X-Received: by 2002:a05:6a00:39aa:b0:781:1f5e:8bc4 with SMTP id d2e1a72fcca58-79387a281famr10486681b3a.6.1760317286563;
        Sun, 12 Oct 2025 18:01:26 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
References: <20251007-power-domains-clock-google-gs101-clock-v1-1-1ee73c453ba8@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: google,gs101-clock: add
 power-domains
Message-Id: <176031728187.32330.16757640384726154867.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Tue, 07 Oct 2025 17:03:10 +0100, André Draszik wrote:
> The CMU can be part of a power domain, so we need to allow the relevant
> property 'power-domains'.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: google,gs101-clock: add power-domains
      https://git.kernel.org/krzk/linux/c/8c644749ab6e42f51fce82e3325f58ffb70f87b3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

