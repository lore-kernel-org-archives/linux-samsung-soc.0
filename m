Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65B412A157
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707206607; cv=none; b=tVCeYq3yNto45w52DqQVTnVPDZMIDQqcTeTmnqL7wjKhMidFpRvOJtB773FylN5ysBm+LlUB3255SievOGjm3O3NZD+mo1DFGqJKiE8zCgthUiZsu7eDdVGyfcLMyQFPEhj28QqeynuVypgkJN+j6BP7p4PFDo3Wnzg0BJ0AxVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707206607; c=relaxed/simple;
	bh=iR7Dp43vLV43jmYtK9RRuY1wh/t+bKfF/SwycneEMrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dywpLalDT8dTNGafEwhxHD0IWxyg76CbWiUXSb11XFHE7TaBOzKreIIauftlqjoS85xqPH2l4UEmkbAH8JN7nJukdcrP1UR+L7zqR50cQN870dhfHKvcAPmADgWv13pPeKl7ahnGs86GMd+c11zD6HnZi8VzF3ijkNU0V2C6mYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XmHCnEb1; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmHCnEb1"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6002317a427so46261087b3.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 00:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707206604; x=1707811404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPtn9t6KngOO4E52t8K9CtsJTT8VzsbSpS4TQtbHZkU=;
        b=XmHCnEb1i6fvc5H4QBt/HZO0ddi9twWLipV2GKIP+XPxGeTcUOvROx5YKAXVHSOpd/
         QlEe77OORC5hdwkrY5ArxukTEtszIAEv5z607LvcVgEda98AMK2jNb4bLUX111KLlHCk
         HYHzag8sa+IIfgAMxyZVGLcQtvfDYMVWj7Wvl7j+VSxyd/kr9qzC8AK4gCd1jm0VTnei
         pE3SkWMkS5vU6z2qO6b3rn2Gk3Fmg3fcvoevbICAjRAaa8qX0HQ88+bdaK5EAzjQnYk7
         e86lSkaT/XzTCjPCcEmKQv0pt5d/gQBJf7W5lH1DEAyIRg3V3J1gFfL3ZU0awGF6abxV
         95Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707206604; x=1707811404;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPtn9t6KngOO4E52t8K9CtsJTT8VzsbSpS4TQtbHZkU=;
        b=etUzPYV1+y4xIn00biS6iX1wVRHIN3EbMPZMx7ijyyvu6lJhDwGkkbv/AcjHYHC0sF
         I0M7Yw+ov4/vzvq8kK7VfxopLWr87TdTZQUQqMJyST6+SV6MSStKhbPher8/PzV2uiBl
         sPGTF9zfC/sIX34eJxbaInE0jJEYEJlCUCi3XuNktq4l08kv5dZ2pHmP9bc5BbF0AFLF
         0SwA76WEXb8clhxN1FNAce6jpDyhcKsmZoWGSn8VEt0aY2NspnzvWjmbL4IQMtHZzysu
         wD07KqZeoa6FDxwrf3IgGrxaYlbE/Hny67iXwqNMsBRY1afCSHZF3K9mJFhlozPYh4gk
         BxLw==
X-Gm-Message-State: AOJu0Yxv6n88EsQSciEP9Hihhn43n9eqqS04lGTyvxlxtRY4JT0dG6Wx
	mSuBxIVRzqwReGGVpO0Wu3QmnPqdU9ZjCsr7evRrx5c8AKggOnUpwb8XKlJnBkXPVlaNBom9XNl
	p
X-Google-Smtp-Source: AGHT+IEH1UpLuRSo1/8SURkuZLiDgqyEq9XxWEL/5IqxnqCKtpwpju0S+5SUvSyjCnYp+14RqJ03ow==
X-Received: by 2002:a5b:951:0:b0:dbe:9f26:2159 with SMTP id x17-20020a5b0951000000b00dbe9f262159mr685500ybq.48.1707206604475;
        Tue, 06 Feb 2024 00:03:24 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXqg8C7PRl8We0vH1TlWO+XUCwTn72sn0WRNI5oDA6wtLQn78BcANmdb1R8IMNVpbFkhR3vxSg122HohS76cXBRVzmcBdWT/RE0gBBS7+u4cecx76l0RP/96pOw8BQKos68JDTKJAnTsbmXzRHf2qJvYKqzwgMAQa/TeQ4gLyiErfVNTT2xI6OiVxbMsnXiiJkmAK1SgsB62xmN0+NRlOaabe0yVZaM9dJKMeUfIs42+/JZOBU6dxVbOQ==
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id l31-20020a25ad5f000000b00dc727104273sm87171ybe.34.2024.02.06.00.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 00:03:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240201140134.4345-1-tomasz.figa@gmail.com>
References: <20240201140134.4345-1-tomasz.figa@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Tomasz from Samsung clock and
 pinctrl entries
Message-Id: <170720660257.7713.7995799928562429624.b4-ty@linaro.org>
Date: Tue, 06 Feb 2024 09:03:22 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Thu, 01 Feb 2024 23:01:34 +0900, Tomasz Figa wrote:
> I have been no longer at Samsung for a long time, the platforms
> that I am knowledgable about (S3C24xx, S3C64xx, Exynos 4) are no longer
> relevant and we have people with better capabilities as maintainers
> already, so let me remove myself. Thanks for the nice collaboration
> everyone!
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Remove Tomasz from Samsung clock and pinctrl entries
      https://git.kernel.org/krzk/linux/c/dde76e324c65969fda35165694b5e982d0033bf7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

