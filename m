Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5B29C338
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127680; cv=none; b=ULuhsfm8NzoJbuRWMWIcf9YB5YqjZtKHx6e4fskwSgs13l0OpR7wh3qzOcXv5nzZJiTP4AL+L4K/8eBpJc+0X85n8mWaGdEgmJEpxuWfOX//fUVyh3j9+z2qVhV8baZYXX4zy5N3WOzvS/fKel2u2afqFp9iG/e7L4CewZ23WpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127680; c=relaxed/simple;
	bh=Z/VP9qyxz0Ogx+cyT0aY9YmkvjeV15cKSdyDS0qNCn8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h3hKw9Ohr6RQDTwUrNyJFXc6LJXZZU+XlSUxeLJhhCpOCUjou+ELwvBRdDbMoNbxFXgc9y8ofrpE3DXol+5xbG+zCOrnCKHp6j2igFlarXDOvGk28OQpM832RZcYZyJWnV3JXdat1DfO0nebDymmfkLaeTkcRezDLyaqIp7n6/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OhFs47kf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OhFs47kf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-427054641f0so1010854f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 03:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761127676; x=1761732476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJg0GAAknmDdoURqaMYxb4ci3e27SCLBJB5wjnR5uFI=;
        b=OhFs47kf570UzHxQNjH6Do5b+M94Dtkx5GPfEHP9YqvU9++akK5NEqSQg4eUuh6TjK
         pvDFhh56mr4xfVKNJjm8NYHLHCw+/Sj8m/jWpIqDM/h7fOfv4Jk5NZrNpbkpnsiU9g36
         gYez6UZ2B1QlFITmmSDMN5mVLGxpdeN4Onq+NzBRatLJI6BwMPVlMwBvHmpGof+qHDKI
         p+vKZ2tkVVccT/Wa2dwABnqid6Gbrp1q9oRnGd3aFtRkwN8JlGbgKjupZb316pa4vrME
         wpQfz1xwniMtrmWKg09a3FLaweakgQ/BpWRr72ZG8GHPaeVXnMBuIn90h3xBbsSjvT1a
         u7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127676; x=1761732476;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJg0GAAknmDdoURqaMYxb4ci3e27SCLBJB5wjnR5uFI=;
        b=vLdySlSpqHPY+EaEcN9U027QfeynBzUeneyJCsTyU92H98WXLd5aAay1T2CsGxhkZV
         6ioWrlyYrylxPKy2AGmSDZut0NpXiomq2nBxIUdz0/PZVBd5EqFg4dfRB0q4U9yGnKWU
         7WV30tXRtM0pqcfijCGd0cI6Fl7fUxyfyXUfwq+n4yOzAKuDU7Zo1qQ5NrwjRQqDM9nq
         dThW3qHSqWlzETwnvITEMWXpYWL7m1Ntj6hMAmW8F4voqKAgDDF2wQrYv4sXH0tnbjs9
         5B5UyFFoelNyinIIY7wSgbWQfWBYNG5ES5Hwxf9x6NnYc0L/AJ3GxZQRprRhjOIJGybq
         XUMA==
X-Forwarded-Encrypted: i=1; AJvYcCWkTT2ScWcuRtZsQ6C9W0aa93BwK8PWqhK+Bz85po//0BUvnUNUJNX94W0N24g6kZXe/4gPOxfCmP38UoEmGZn+Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8uaY0F/ixmMr17VfryCnbrI5rOHbuEV6oaZ075k7mYEPbyrTO
	KHR2rxipncY2LHCaWblDQnrieOnK0rqM9cYhJZ91YF8es1u8emHBEKmYa/0QlqqNl8biITVMPbV
	GGwxZ
X-Gm-Gg: ASbGnctGCoYgQbfJAjF1j/jzVG6bF2AGFXdNAlgddrG5YvClT/5WHWpROco09caIWbn
	59vH0sJCrc0nrToBugL0ZaNyMdSY1HKXoHWyBUTZjg34XtZ7fMJ29deY9H2jooz8TCjjTyd7VDk
	chNznpqv0AC5tklY/OyTF045Jj0enXnOtfLkU0tZAqywm8aPw1UP7BO2VMqXF4Tymyep1lvjRwQ
	9YFqxLp+6S2MS+yh4+3Rt3y+Kqko2xPkk5SfHMv/d2WS3vZx79OnW8FUx0U1ADWcIbH+Hup/wJG
	FOjnY2RXSQ5G8bPHifahUBm85f9u36NJeYWIZZAA2I+babu4mauPSP0uiN9NkxXEuOpBKNV1WTR
	waWk0zo4YDWQhmq+RA0PTSUOclYxdrNrozGyev5dI4hg1lapaC4+WqDLjG6XtwXMdksd9KBUMXk
	ZqD5K/WmlyNoWx5bqRcfNkk11wRnw=
X-Google-Smtp-Source: AGHT+IEdX75qrN6US6Y5a5un6NzE8Q7BwB9wmhDu2fD1EZuWaGlaPnM2vNiBGgFCMMmy7GueZmz45A==
X-Received: by 2002:a05:6000:290e:b0:426:ff0e:b563 with SMTP id ffacd0b85a97d-4284e52d956mr2329372f8f.3.1761127676222;
        Wed, 22 Oct 2025 03:07:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce56csm24001630f8f.50.2025.10.22.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:07:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251021095426.86549-2-krzysztof.kozlowski@linaro.org>
References: <20251021095426.86549-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Krzysztof Kozlowski's email
Message-Id: <176112767515.50428.16111691709369055810.b4-ty@linaro.org>
Date: Wed, 22 Oct 2025 12:07:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 21 Oct 2025 11:54:25 +0200, Krzysztof Kozlowski wrote:
> Update Krzysztof Kozlowski's email address in mailmap to stay reachable.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Update Krzysztof Kozlowski's email
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

